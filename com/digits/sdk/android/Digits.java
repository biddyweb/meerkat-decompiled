package com.digits.sdk.android;

import android.annotation.TargetApi;
import com.twitter.sdk.android.core.PersistedSessionManager;
import com.twitter.sdk.android.core.SessionManager;
import com.twitter.sdk.android.core.internal.SessionMonitor;
import com.twitter.sdk.android.core.internal.scribe.DefaultScribeClient;
import com.twitter.sdk.android.core.internal.scribe.EventNamespace;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Kit;
import io.fabric.sdk.android.services.concurrency.DependsOn;
import io.fabric.sdk.android.services.persistence.PreferenceStoreImpl;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;

@DependsOn({"Lcom/twitter/sdk/android/core/TwitterCore;"})
public class Digits extends Kit<Void>
{
  private static final String KIT_SCRIBE_NAME = "Digits";
  static final String PREF_KEY_ACTIVE_SESSION = "active_session";
  static final String PREF_KEY_SESSION = "session";
  public static final String TAG = "Digits";
  private ActivityClassManager activityClassManager;
  private volatile ContactsClient contactsClient;
  private volatile DigitsClient digitsClient;
  DefaultScribeClient scribeClient;
  private SessionManager<DigitsSession> sessionManager;
  private SessionMonitor<DigitsSession> sessionMonitor;
  private int themeResId;

  public static void authenticate(AuthCallback paramAuthCallback)
  {
    authenticate(paramAuthCallback, 0);
  }

  public static void authenticate(AuthCallback paramAuthCallback, int paramInt)
  {
    getInstance().setTheme(paramInt);
    getInstance().getDigitsClient().startSignUp(paramAuthCallback);
  }

  private void createContactsClient()
  {
    try
    {
      if (this.contactsClient == null)
        this.contactsClient = new ContactsClient();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  private void createDigitsClient()
  {
    try
    {
      if (this.digitsClient == null)
        this.digitsClient = new DigitsClient();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public static Digits getInstance()
  {
    return (Digits)Fabric.getKit(Digits.class);
  }

  public static SessionManager<DigitsSession> getSessionManager()
  {
    return getInstance().sessionManager;
  }

  private void setUpScribing()
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(this.sessionManager);
    this.scribeClient = new DefaultScribeClient(this, "Digits", localArrayList, getIdManager());
  }

  protected void createActivityClassManager()
  {
    this.activityClassManager = new ActivityClassManagerFactory().createActivityClassManager(getContext(), this.themeResId);
  }

  protected Void doInBackground()
  {
    this.sessionManager.getActiveSession();
    createDigitsClient();
    createContactsClient();
    setUpScribing();
    this.sessionMonitor.triggerVerificationIfNecessary();
    this.sessionMonitor.monitorActivityLifecycle(getFabric().getActivityLifecycleManager());
    return null;
  }

  protected ActivityClassManager getActivityClassManager()
  {
    if (this.activityClassManager == null)
      createActivityClassManager();
    return this.activityClassManager;
  }

  public ContactsClient getContactsClient()
  {
    if (this.contactsClient == null)
      createContactsClient();
    return this.contactsClient;
  }

  DigitsClient getDigitsClient()
  {
    if (this.digitsClient == null)
      createDigitsClient();
    return this.digitsClient;
  }

  protected ExecutorService getExecutorService()
  {
    return getFabric().getExecutorService();
  }

  public String getIdentifier()
  {
    return "com.digits.sdk.android:digits";
  }

  @TargetApi(21)
  int getTheme()
  {
    if (this.themeResId != 0)
      return this.themeResId;
    return R.style.Digits_default;
  }

  public String getVersion()
  {
    return "1.3.0.37";
  }

  protected boolean onPreExecute()
  {
    this.sessionManager = new PersistedSessionManager(new PreferenceStoreImpl(this), new DigitsSession.Serializer(), "active_session", "session");
    this.sessionMonitor = new SessionMonitor(this.sessionManager, getExecutorService());
    return super.onPreExecute();
  }

  protected void scribe(EventNamespace[] paramArrayOfEventNamespace)
  {
    if (this.scribeClient != null)
      this.scribeClient.scribeSyndicatedSdkImpressionEvents(paramArrayOfEventNamespace);
  }

  protected void setTheme(int paramInt)
  {
    this.themeResId = paramInt;
    createActivityClassManager();
  }
}