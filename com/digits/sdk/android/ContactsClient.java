package com.digits.sdk.android;

import android.content.Context;
import android.content.Intent;
import com.twitter.sdk.android.core.AuthenticatedClient;
import com.twitter.sdk.android.core.SessionManager;
import com.twitter.sdk.android.core.TwitterCore;
import com.twitter.sdk.android.core.internal.TwitterApi;
import retrofit.RestAdapter;
import retrofit.RestAdapter.Builder;
import retrofit.client.Response;
import retrofit.http.Body;
import retrofit.http.GET;
import retrofit.http.POST;
import retrofit.http.Query;

public class ContactsClient
{
  public static final int MAX_PAGE_SIZE = 100;
  private ActivityClassManagerFactory activityClassManagerFactory;
  private ContactsService contactsService;
  private final ContactsPreferenceManager prefManager;
  private final TwitterCore twitterCore;

  ContactsClient()
  {
    this(TwitterCore.getInstance(), new ContactsPreferenceManager(), new ActivityClassManagerFactory(), null);
  }

  ContactsClient(TwitterCore paramTwitterCore, ContactsPreferenceManager paramContactsPreferenceManager, ActivityClassManagerFactory paramActivityClassManagerFactory, ContactsService paramContactsService)
  {
    if (paramTwitterCore == null)
      throw new IllegalArgumentException("twitter must not be null");
    if (paramContactsPreferenceManager == null)
      throw new IllegalArgumentException("preference manager must not be null");
    if (paramActivityClassManagerFactory == null)
      throw new IllegalArgumentException("activityClassManagerFactory must not be null");
    this.twitterCore = paramTwitterCore;
    this.prefManager = paramContactsPreferenceManager;
    this.activityClassManagerFactory = paramActivityClassManagerFactory;
    this.contactsService = paramContactsService;
  }

  private ContactsService getContactsService()
  {
    if (this.contactsService != null)
      return this.contactsService;
    this.contactsService = ((ContactsService)new RestAdapter.Builder().setEndpoint(new TwitterApi().getBaseHostUrl()).setClient(new AuthenticatedClient(this.twitterCore.getAuthConfig(), Digits.getSessionManager().getActiveSession(), this.twitterCore.getSSLSocketFactory())).build().create(ContactsService.class));
    return this.contactsService;
  }

  private void startContactsActivity(Context paramContext, int paramInt)
  {
    Intent localIntent = new Intent(paramContext, this.activityClassManagerFactory.createActivityClassManager(paramContext, paramInt).getContactsActivity());
    localIntent.putExtra("THEME_RESOURCE_ID", paramInt);
    localIntent.setFlags(268435456);
    paramContext.startActivity(localIntent);
  }

  private void startContactsService(Context paramContext)
  {
    paramContext.startService(new Intent(paramContext, ContactsUploadService.class));
  }

  public void deleteAllUploadedContacts(ContactsCallback<Response> paramContactsCallback)
  {
    getContactsService().deleteAll(paramContactsCallback);
  }

  public boolean hasUserGrantedPermission()
  {
    return this.prefManager.hasContactImportPermissionGranted();
  }

  public void lookupContactMatches(String paramString, Integer paramInteger, ContactsCallback<Contacts> paramContactsCallback)
  {
    if ((paramInteger == null) || (paramInteger.intValue() < 1) || (paramInteger.intValue() > 100))
    {
      getContactsService().usersAndUploadedBy(paramString, null, paramContactsCallback);
      return;
    }
    getContactsService().usersAndUploadedBy(paramString, paramInteger, paramContactsCallback);
  }

  public void startContactsUpload()
  {
    startContactsUpload(R.style.Digits_default);
  }

  public void startContactsUpload(int paramInt)
  {
    startContactsUpload(this.twitterCore.getContext(), paramInt);
  }

  protected void startContactsUpload(Context paramContext, int paramInt)
  {
    if (!hasUserGrantedPermission())
    {
      startContactsActivity(paramContext, paramInt);
      return;
    }
    startContactsService(paramContext);
  }

  UploadResponse uploadContacts(Vcards paramVcards)
  {
    return getContactsService().upload(paramVcards);
  }

  static abstract interface ContactsService
  {
    @POST("/1.1/contacts/destroy/all.json")
    public abstract void deleteAll(ContactsCallback<Response> paramContactsCallback);

    @POST("/1.1/contacts/upload.json")
    public abstract UploadResponse upload(@Body Vcards paramVcards);

    @GET("/1.1/contacts/users_and_uploaded_by.json")
    public abstract void usersAndUploadedBy(@Query("next_cursor") String paramString, @Query("count") Integer paramInteger, ContactsCallback<Contacts> paramContactsCallback);
  }
}