package com.digits.sdk.android;

import android.app.IntentService;
import android.content.Intent;
import android.database.Cursor;
import com.digits.sdk.android.concurrent.DigitsRetryPolicy;
import com.digits.sdk.android.concurrent.RetryExecutor;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

public class ContactsUploadService extends IntentService
{
  private static final String THREAD_NAME = "UPLOAD_WORKER";
  private static final int TIMEOUT_IN_SECONDS = 300;
  public static final String UPLOAD_COMPLETE = "com.digits.sdk.android.UPLOAD_COMPLETE";
  public static final String UPLOAD_COMPLETE_EXTRA = "com.digits.sdk.android.UPLOAD_COMPLETE_EXTRA";
  public static final String UPLOAD_FAILED = "com.digits.sdk.android.UPLOAD_FAILED";
  private ContactsClient contactsClient;
  private RetryExecutor executor;
  private ContactsHelper helper;
  private ContactsPreferenceManager prefManager;

  public ContactsUploadService()
  {
    super("UPLOAD_WORKER");
    init(Digits.getInstance().getContactsClient(), new ContactsHelper(this), new ContactsPreferenceManager(), new RetryExecutor(2, new DigitsRetryPolicy(1)));
  }

  ContactsUploadService(ContactsClient paramContactsClient, ContactsHelper paramContactsHelper, ContactsPreferenceManager paramContactsPreferenceManager, RetryExecutor paramRetryExecutor)
  {
    super("UPLOAD_WORKER");
    init(paramContactsClient, paramContactsHelper, paramContactsPreferenceManager, paramRetryExecutor);
  }

  private void init(ContactsClient paramContactsClient, ContactsHelper paramContactsHelper, ContactsPreferenceManager paramContactsPreferenceManager, RetryExecutor paramRetryExecutor)
  {
    this.contactsClient = paramContactsClient;
    this.helper = paramContactsHelper;
    this.prefManager = paramContactsPreferenceManager;
    this.executor = paramRetryExecutor;
    setIntentRedelivery(true);
  }

  List<String> getAllCards()
  {
    Cursor localCursor = null;
    try
    {
      localCursor = this.helper.getContactsCursor();
      List localList = this.helper.createContactList(localCursor);
      return localList;
    }
    finally
    {
      if (localCursor != null)
        localCursor.close();
    }
  }

  int getNumberOfPages(int paramInt)
  {
    return (-1 + (paramInt + 100)) / 100;
  }

  protected void onHandleIntent(Intent paramIntent)
  {
    this.prefManager.setContactImportPermissionGranted();
    try
    {
      List localList = getAllCards();
      i = localList.size();
      int j = getNumberOfPages(i);
      localAtomicInteger = new AtomicInteger(0);
      for (int k = 0; k < j; k++)
      {
        int m = k * 100;
        final Vcards localVcards = new Vcards(localList.subList(m, Math.min(i, m + 100)));
        this.executor.execute(new Runnable()
        {
          public void run()
          {
            ContactsUploadService.this.contactsClient.uploadContacts(localVcards);
            localAtomicInteger.addAndGet(localVcards.vcards.size());
          }
        });
      }
      this.executor.shutdown();
      if (!this.executor.awaitTermination(300L, TimeUnit.SECONDS))
      {
        this.executor.shutdownNow();
        sendFailureBroadcast();
        return;
      }
      if (localAtomicInteger.get() == 0)
      {
        sendFailureBroadcast();
        return;
      }
    }
    catch (InterruptedException localInterruptedException)
    {
      int i;
      final AtomicInteger localAtomicInteger;
      sendFailureBroadcast();
      return;
      this.prefManager.setContactsReadTimestamp(System.currentTimeMillis());
      this.prefManager.setContactsUploaded(localAtomicInteger.get());
      sendSuccessBroadcast(new ContactsUploadResult(localAtomicInteger.get(), i));
      return;
    }
    catch (Exception localException)
    {
      sendFailureBroadcast();
    }
  }

  void sendFailureBroadcast()
  {
    sendBroadcast(new Intent("com.digits.sdk.android.UPLOAD_FAILED"));
  }

  void sendSuccessBroadcast(ContactsUploadResult paramContactsUploadResult)
  {
    Intent localIntent = new Intent("com.digits.sdk.android.UPLOAD_COMPLETE");
    localIntent.putExtra("com.digits.sdk.android.UPLOAD_COMPLETE_EXTRA", paramContactsUploadResult);
    sendBroadcast(localIntent);
  }
}