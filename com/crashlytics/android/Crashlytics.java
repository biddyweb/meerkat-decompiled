package com.crashlytics.android;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.widget.ScrollView;
import android.widget.TextView;
import com.crashlytics.android.answers.Answers;
import com.crashlytics.android.beta.Beta;
import com.crashlytics.android.internal.CrashEventDataProvider;
import com.crashlytics.android.internal.models.SessionEventData;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Kit;
import io.fabric.sdk.android.KitGroup;
import io.fabric.sdk.android.Logger;
import io.fabric.sdk.android.services.common.ApiKey;
import io.fabric.sdk.android.services.common.CommonUtils;
import io.fabric.sdk.android.services.common.Crash.FatalException;
import io.fabric.sdk.android.services.common.Crash.LoggedException;
import io.fabric.sdk.android.services.common.ExecutorUtils;
import io.fabric.sdk.android.services.common.IdManager;
import io.fabric.sdk.android.services.concurrency.DependsOn;
import io.fabric.sdk.android.services.concurrency.Priority;
import io.fabric.sdk.android.services.concurrency.PriorityCallable;
import io.fabric.sdk.android.services.concurrency.Task;
import io.fabric.sdk.android.services.concurrency.UnmetDependencyException;
import io.fabric.sdk.android.services.network.DefaultHttpRequestFactory;
import io.fabric.sdk.android.services.network.HttpMethod;
import io.fabric.sdk.android.services.network.HttpRequest;
import io.fabric.sdk.android.services.network.HttpRequestFactory;
import io.fabric.sdk.android.services.persistence.FileStoreImpl;
import io.fabric.sdk.android.services.persistence.PreferenceStore;
import io.fabric.sdk.android.services.persistence.PreferenceStoreImpl;
import io.fabric.sdk.android.services.settings.AppSettingsData;
import io.fabric.sdk.android.services.settings.FeaturesSettingsData;
import io.fabric.sdk.android.services.settings.PromptSettingsData;
import io.fabric.sdk.android.services.settings.SessionSettingsData;
import io.fabric.sdk.android.services.settings.Settings;
import io.fabric.sdk.android.services.settings.Settings.SettingsAccess;
import io.fabric.sdk.android.services.settings.SettingsData;
import java.io.File;
import java.net.URL;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import javax.net.ssl.HttpsURLConnection;

@DependsOn({"Lcom/crashlytics/android/internal/CrashEventDataProvider;"})
public class Crashlytics extends Kit<Void>
  implements KitGroup
{
  static final float CLS_DEFAULT_PROCESS_DELAY = 1.0F;
  static final String COLLECT_CUSTOM_KEYS = "com.crashlytics.CollectCustomKeys";
  static final String COLLECT_CUSTOM_LOGS = "com.crashlytics.CollectCustomLogs";
  static final String CRASHLYTICS_API_ENDPOINT = "com.crashlytics.ApiEndpoint";
  static final String CRASHLYTICS_REQUIRE_BUILD_ID = "com.crashlytics.RequireBuildId";
  static final boolean CRASHLYTICS_REQUIRE_BUILD_ID_DEFAULT = true;
  static final int DEFAULT_MAIN_HANDLER_TIMEOUT_SEC = 4;
  private static final String INITIALIZATION_MARKER_FILE_NAME = "initialization_marker";
  static final int MAX_ATTRIBUTES = 64;
  static final int MAX_ATTRIBUTE_SIZE = 1024;
  private static final String PREF_ALWAYS_SEND_REPORTS_KEY = "always_send_reports_opt_in";
  private static final boolean SHOULD_PROMPT_BEFORE_SENDING_REPORTS_DEFAULT = false;
  public static final String TAG = "Fabric";
  private final ConcurrentHashMap<String, String> attributes = new ConcurrentHashMap();
  private String buildId;
  private float delay;
  private boolean disabled;
  private CrashlyticsExecutorServiceWrapper executorServiceWrapper;
  private CrashEventDataProvider externalCrashEventDataProvider;
  private CrashlyticsUncaughtExceptionHandler handler;
  private HttpRequestFactory httpRequestFactory;
  private File initializationMarkerFile;
  private String installerPackageName;
  private final Collection<Kit<Boolean>> kits;
  private CrashlyticsListener listener;
  private String packageName;
  private final PinningInfoProvider pinningInfo;
  private final long startTime = System.currentTimeMillis();
  private String userEmail = null;
  private String userId = null;
  private String userName = null;
  private String versionCode;
  private String versionName;

  public Crashlytics()
  {
    this(1.0F, null, null, false);
  }

  Crashlytics(float paramFloat, CrashlyticsListener paramCrashlyticsListener, PinningInfoProvider paramPinningInfoProvider, boolean paramBoolean)
  {
    this(paramFloat, paramCrashlyticsListener, paramPinningInfoProvider, paramBoolean, ExecutorUtils.buildSingleThreadExecutorService("Crashlytics Exception Handler"));
  }

  Crashlytics(float paramFloat, CrashlyticsListener paramCrashlyticsListener, PinningInfoProvider paramPinningInfoProvider, boolean paramBoolean, ExecutorService paramExecutorService)
  {
    this.delay = paramFloat;
    this.listener = paramCrashlyticsListener;
    this.pinningInfo = paramPinningInfoProvider;
    this.disabled = paramBoolean;
    this.executorServiceWrapper = new CrashlyticsExecutorServiceWrapper(paramExecutorService);
    Kit[] arrayOfKit = new Kit[2];
    arrayOfKit[0] = new Answers();
    arrayOfKit[1] = new Beta();
    this.kits = Collections.unmodifiableCollection(Arrays.asList(arrayOfKit));
  }

  private int dipsToPixels(float paramFloat, int paramInt)
  {
    return (int)(paramFloat * paramInt);
  }

  private static void doLog(int paramInt, String paramString1, String paramString2)
  {
    if (isDisabled());
    Crashlytics localCrashlytics;
    do
    {
      return;
      localCrashlytics = getInstance();
    }
    while (!ensureFabricWithCalled("prior to logging messages.", localCrashlytics));
    long l = System.currentTimeMillis() - localCrashlytics.startTime;
    localCrashlytics.handler.writeToLog(l, formatLogMessage(paramInt, paramString1, paramString2));
  }

  private static boolean ensureFabricWithCalled(String paramString, Crashlytics paramCrashlytics)
  {
    if ((paramCrashlytics == null) || (paramCrashlytics.handler == null))
    {
      Fabric.getLogger().e("Fabric", "Crashlytics must be initialized by calling Fabric.with(Context) " + paramString, null);
      return false;
    }
    return true;
  }

  private void finishInitSynchronously()
  {
    PriorityCallable local1 = new PriorityCallable()
    {
      public Void call()
        throws Exception
      {
        return Crashlytics.this.doInBackground();
      }

      public Priority getPriority()
      {
        return Priority.IMMEDIATE;
      }
    };
    Iterator localIterator = getDependencies().iterator();
    while (localIterator.hasNext())
      local1.addDependency((Task)localIterator.next());
    Future localFuture = getFabric().getExecutorService().submit(local1);
    Fabric.getLogger().d("Fabric", "Crashlytics detected incomplete initialization on previous app launch. Will initialize synchronously.");
    try
    {
      localFuture.get(4L, TimeUnit.SECONDS);
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      Fabric.getLogger().e("Fabric", "Crashlytics was interrupted during initialization.", localInterruptedException);
      return;
    }
    catch (ExecutionException localExecutionException)
    {
      Fabric.getLogger().e("Fabric", "Problem encountered during Crashlytics initialization.", localExecutionException);
      return;
    }
    catch (TimeoutException localTimeoutException)
    {
      Fabric.getLogger().e("Fabric", "Crashlytics timed out during initialization.", localTimeoutException);
    }
  }

  private static String formatLogMessage(int paramInt, String paramString1, String paramString2)
  {
    return CommonUtils.logPriorityToString(paramInt) + "/" + paramString1 + " " + paramString2;
  }

  public static Crashlytics getInstance()
  {
    try
    {
      Crashlytics localCrashlytics = (Crashlytics)Fabric.getKit(Crashlytics.class);
      return localCrashlytics;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      Fabric.getLogger().e("Fabric", "Crashlytics must be initialized by calling Fabric.with(Context) prior to calling Crashlytics.getInstance()", null);
      throw localIllegalStateException;
    }
  }

  public static PinningInfoProvider getPinningInfoProvider()
  {
    if (!isDisabled())
      return getInstance().pinningInfo;
    return null;
  }

  private boolean getSendDecisionFromUser(final Activity paramActivity, final PromptSettingsData paramPromptSettingsData)
  {
    final DialogStringResolver localDialogStringResolver = new DialogStringResolver(paramActivity, paramPromptSettingsData);
    final OptInLatch localOptInLatch = new OptInLatch(null);
    paramActivity.runOnUiThread(new Runnable()
    {
      public void run()
      {
        AlertDialog.Builder localBuilder = new AlertDialog.Builder(paramActivity);
        DialogInterface.OnClickListener local1 = new DialogInterface.OnClickListener()
        {
          public void onClick(DialogInterface paramAnonymous2DialogInterface, int paramAnonymous2Int)
          {
            Crashlytics.7.this.val$latch.setOptIn(true);
            paramAnonymous2DialogInterface.dismiss();
          }
        };
        float f = paramActivity.getResources().getDisplayMetrics().density;
        int i = Crashlytics.this.dipsToPixels(f, 5);
        TextView localTextView = new TextView(paramActivity);
        localTextView.setAutoLinkMask(15);
        localTextView.setText(localDialogStringResolver.getMessage());
        localTextView.setTextAppearance(paramActivity, 16973892);
        localTextView.setPadding(i, i, i, i);
        localTextView.setFocusable(false);
        ScrollView localScrollView = new ScrollView(paramActivity);
        localScrollView.setPadding(Crashlytics.this.dipsToPixels(f, 14), Crashlytics.this.dipsToPixels(f, 2), Crashlytics.this.dipsToPixels(f, 10), Crashlytics.this.dipsToPixels(f, 12));
        localScrollView.addView(localTextView);
        localBuilder.setView(localScrollView).setTitle(localDialogStringResolver.getTitle()).setCancelable(false).setNeutralButton(localDialogStringResolver.getSendButtonTitle(), local1);
        if (paramPromptSettingsData.showCancelButton)
        {
          DialogInterface.OnClickListener local2 = new DialogInterface.OnClickListener()
          {
            public void onClick(DialogInterface paramAnonymous2DialogInterface, int paramAnonymous2Int)
            {
              Crashlytics.7.this.val$latch.setOptIn(false);
              paramAnonymous2DialogInterface.dismiss();
            }
          };
          localBuilder.setNegativeButton(localDialogStringResolver.getCancelButtonTitle(), local2);
        }
        if (paramPromptSettingsData.showAlwaysSendButton)
        {
          DialogInterface.OnClickListener local3 = new DialogInterface.OnClickListener()
          {
            public void onClick(DialogInterface paramAnonymous2DialogInterface, int paramAnonymous2Int)
            {
              Crashlytics.this.setShouldSendUserReportsWithoutPrompting(true);
              Crashlytics.7.this.val$latch.setOptIn(true);
              paramAnonymous2DialogInterface.dismiss();
            }
          };
          localBuilder.setPositiveButton(localDialogStringResolver.getAlwaysSendButtonTitle(), local3);
        }
        localBuilder.show();
      }
    });
    Fabric.getLogger().d("Fabric", "Waiting for user opt-in.");
    localOptInLatch.await();
    return localOptInLatch.getOptIn();
  }

  private static boolean isDisabled()
  {
    Crashlytics localCrashlytics = getInstance();
    return (localCrashlytics == null) || (localCrashlytics.disabled);
  }

  private boolean isRequiringBuildId(Context paramContext)
  {
    return CommonUtils.getBooleanResourceValue(paramContext, "com.crashlytics.RequireBuildId", true);
  }

  public static void log(int paramInt, String paramString1, String paramString2)
  {
    doLog(paramInt, paramString1, paramString2);
    Fabric.getLogger().log(paramInt, "" + paramString1, "" + paramString2, true);
  }

  public static void log(String paramString)
  {
    doLog(3, "Fabric", paramString);
  }

  public static void logException(Throwable paramThrowable)
  {
    if (isDisabled());
    Crashlytics localCrashlytics;
    do
    {
      return;
      localCrashlytics = getInstance();
    }
    while (!ensureFabricWithCalled("prior to logging exceptions.", localCrashlytics));
    if (paramThrowable == null)
    {
      Fabric.getLogger().log(5, "Fabric", "Crashlytics is ignoring a request to log a null exception.");
      return;
    }
    localCrashlytics.handler.writeNonFatalException(Thread.currentThread(), paramThrowable);
  }

  static void recordFatalExceptionEvent(String paramString)
  {
    Answers localAnswers = (Answers)Fabric.getKit(Answers.class);
    if (localAnswers != null)
      localAnswers.onException(new Crash.FatalException(paramString));
  }

  static void recordLoggedExceptionEvent(String paramString)
  {
    Answers localAnswers = (Answers)Fabric.getKit(Answers.class);
    if (localAnswers != null)
      localAnswers.onException(new Crash.LoggedException(paramString));
  }

  private static String sanitizeAttribute(String paramString)
  {
    if (paramString != null)
    {
      paramString = paramString.trim();
      if (paramString.length() > 1024)
        paramString = paramString.substring(0, 1024);
    }
    return paramString;
  }

  private void setAndValidateKitProperties(Context paramContext, String paramString)
  {
    CrashlyticsPinningInfoProvider localCrashlyticsPinningInfoProvider;
    if (this.pinningInfo != null)
      localCrashlyticsPinningInfoProvider = new CrashlyticsPinningInfoProvider(this.pinningInfo);
    while (true)
    {
      this.httpRequestFactory = new DefaultHttpRequestFactory(Fabric.getLogger());
      this.httpRequestFactory.setPinningInfoProvider(localCrashlyticsPinningInfoProvider);
      try
      {
        this.packageName = paramContext.getPackageName();
        this.installerPackageName = getIdManager().getInstallerPackageName();
        Fabric.getLogger().d("Fabric", "Installer package name is: " + this.installerPackageName);
        PackageInfo localPackageInfo = paramContext.getPackageManager().getPackageInfo(this.packageName, 0);
        this.versionCode = Integer.toString(localPackageInfo.versionCode);
        if (localPackageInfo.versionName == null);
        for (String str = "0.0"; ; str = localPackageInfo.versionName)
        {
          this.versionName = str;
          this.buildId = CommonUtils.resolveBuildId(paramContext);
          getIdManager().getBluetoothMacAddress();
          getBuildIdValidator(this.buildId, isRequiringBuildId(paramContext)).validate(paramString, this.packageName);
          return;
          localCrashlyticsPinningInfoProvider = null;
          break;
        }
      }
      catch (Exception localException)
      {
        while (true)
          Fabric.getLogger().e("Fabric", "Error setting up app properties", localException);
      }
    }
  }

  public static void setBool(String paramString, boolean paramBoolean)
  {
    setString(paramString, Boolean.toString(paramBoolean));
  }

  public static void setDouble(String paramString, double paramDouble)
  {
    setString(paramString, Double.toString(paramDouble));
  }

  public static void setFloat(String paramString, float paramFloat)
  {
    setString(paramString, Float.toString(paramFloat));
  }

  public static void setInt(String paramString, int paramInt)
  {
    setString(paramString, Integer.toString(paramInt));
  }

  public static void setLong(String paramString, long paramLong)
  {
    setString(paramString, Long.toString(paramLong));
  }

  @Deprecated
  public static void setPinningInfoProvider(PinningInfoProvider paramPinningInfoProvider)
  {
    Fabric.getLogger().w("Fabric", "Use of Crashlytics.setPinningInfoProvider is deprecated");
  }

  public static void setString(String paramString1, String paramString2)
  {
    if (isDisabled())
      return;
    if (paramString1 == null)
    {
      if ((getInstance().getContext() != null) && (CommonUtils.isAppDebuggable(getInstance().getContext())))
        throw new IllegalArgumentException("Custom attribute key must not be null.");
      Fabric.getLogger().e("Fabric", "Attempting to set custom attribute with null key, ignoring.", null);
      return;
    }
    String str1 = sanitizeAttribute(paramString1);
    if ((getInstance().attributes.size() < 64) || (getInstance().attributes.containsKey(str1)))
    {
      if (paramString2 == null);
      for (String str2 = ""; ; str2 = sanitizeAttribute(paramString2))
      {
        getInstance().attributes.put(str1, str2);
        return;
      }
    }
    Fabric.getLogger().d("Fabric", "Exceeded maximum number of custom attributes (64)");
  }

  public static void setUserEmail(String paramString)
  {
    if (isDisabled())
      return;
    getInstance().userEmail = sanitizeAttribute(paramString);
  }

  public static void setUserIdentifier(String paramString)
  {
    if (isDisabled())
      return;
    getInstance().userId = sanitizeAttribute(paramString);
  }

  public static void setUserName(String paramString)
  {
    if (isDisabled())
      return;
    getInstance().userName = sanitizeAttribute(paramString);
  }

  boolean canSendWithUserApproval()
  {
    return ((Boolean)Settings.getInstance().withSettings(new Settings.SettingsAccess()
    {
      public Boolean usingSettings(SettingsData paramAnonymousSettingsData)
      {
        boolean bool = true;
        Activity localActivity = Crashlytics.this.getFabric().getCurrentActivity();
        if ((localActivity != null) && (!localActivity.isFinishing()) && (Crashlytics.this.shouldPromptUserBeforeSendingCrashReports()))
          bool = Crashlytics.this.getSendDecisionFromUser(localActivity, paramAnonymousSettingsData.promptData);
        return Boolean.valueOf(bool);
      }
    }
    , Boolean.valueOf(true))).booleanValue();
  }

  public void crash()
  {
    new CrashTest().indexOutOfBounds();
  }

  boolean didPreviousInitializationComplete()
  {
    return ((Boolean)this.executorServiceWrapper.executeSyncLoggingException(new Callable()
    {
      public Boolean call()
        throws Exception
      {
        return Boolean.valueOf(Crashlytics.this.initializationMarkerFile.exists());
      }
    })).booleanValue();
  }

  protected Void doInBackground()
  {
    markInitializationStarted();
    this.handler.cleanInvalidTempFiles();
    int i = 1;
    try
    {
      SettingsData localSettingsData = Settings.getInstance().awaitSettingsData();
      if (localSettingsData == null)
      {
        Fabric.getLogger().w("Fabric", "Received null settings, skipping initialization!");
        return null;
      }
      if (localSettingsData.featuresData.collectReports)
      {
        i = 0;
        this.handler.finalizeSessions();
        CreateReportSpiCall localCreateReportSpiCall = getCreateReportSpiCall(localSettingsData);
        i = 0;
        if (localCreateReportSpiCall != null)
          new ReportUploader(localCreateReportSpiCall).uploadReports(this.delay);
      }
      else if (i == 0);
    }
    catch (Exception localException1)
    {
    }
    finally
    {
      markInitializationComplete();
    }
  }

  Map<String, String> getAttributes()
  {
    return Collections.unmodifiableMap(this.attributes);
  }

  String getBuildId()
  {
    return this.buildId;
  }

  BuildIdValidator getBuildIdValidator(String paramString, boolean paramBoolean)
  {
    return new BuildIdValidator(paramString, paramBoolean);
  }

  CreateReportSpiCall getCreateReportSpiCall(SettingsData paramSettingsData)
  {
    if (paramSettingsData != null)
      return new DefaultCreateReportSpiCall(this, getOverridenSpiEndpoint(), paramSettingsData.appData.reportsUrl, this.httpRequestFactory);
    return null;
  }

  @Deprecated
  public boolean getDebugMode()
  {
    Fabric.getLogger().w("Fabric", "Use of Crashlytics.getDebugMode is deprecated.");
    getFabric();
    return Fabric.isDebuggable();
  }

  SessionEventData getExternalCrashEventData()
  {
    CrashEventDataProvider localCrashEventDataProvider = this.externalCrashEventDataProvider;
    SessionEventData localSessionEventData = null;
    if (localCrashEventDataProvider != null)
      localSessionEventData = this.externalCrashEventDataProvider.getCrashEventData();
    return localSessionEventData;
  }

  CrashlyticsUncaughtExceptionHandler getHandler()
  {
    return this.handler;
  }

  public String getIdentifier()
  {
    return "com.crashlytics.sdk.android:crashlytics";
  }

  String getInstallerPackageName()
  {
    return this.installerPackageName;
  }

  public Collection<? extends Kit> getKits()
  {
    return this.kits;
  }

  String getOverridenSpiEndpoint()
  {
    return CommonUtils.getStringsFileValue(getInstance().getContext(), "com.crashlytics.ApiEndpoint");
  }

  String getPackageName()
  {
    return this.packageName;
  }

  File getSdkDirectory()
  {
    return new FileStoreImpl(this).getFilesDir();
  }

  SessionSettingsData getSessionSettingsData()
  {
    SettingsData localSettingsData = Settings.getInstance().awaitSettingsData();
    if (localSettingsData == null)
      return null;
    return localSettingsData.sessionData;
  }

  String getUserEmail()
  {
    if (getIdManager().canCollectUserIds())
      return this.userEmail;
    return null;
  }

  String getUserIdentifier()
  {
    if (getIdManager().canCollectUserIds())
      return this.userId;
    return null;
  }

  String getUserName()
  {
    if (getIdManager().canCollectUserIds())
      return this.userName;
    return null;
  }

  public String getVersion()
  {
    return "2.2.2.37";
  }

  String getVersionCode()
  {
    return this.versionCode;
  }

  String getVersionName()
  {
    return this.versionName;
  }

  boolean internalVerifyPinning(URL paramURL)
  {
    PinningInfoProvider localPinningInfoProvider = getPinningInfoProvider();
    boolean bool = false;
    if (localPinningInfoProvider != null)
    {
      HttpRequest localHttpRequest = this.httpRequestFactory.buildHttpRequest(HttpMethod.GET, paramURL.toString());
      ((HttpsURLConnection)localHttpRequest.getConnection()).setInstanceFollowRedirects(false);
      localHttpRequest.code();
      bool = true;
    }
    return bool;
  }

  void markInitializationComplete()
  {
    this.executorServiceWrapper.executeAsync(new Callable()
    {
      public Boolean call()
        throws Exception
      {
        try
        {
          boolean bool = Crashlytics.this.initializationMarkerFile.delete();
          Fabric.getLogger().d("Fabric", "Initialization marker file removed: " + bool);
          Boolean localBoolean = Boolean.valueOf(bool);
          return localBoolean;
        }
        catch (Exception localException)
        {
          Fabric.getLogger().e("Fabric", "Problem encountered deleting Crashlytics initialization marker.", localException);
        }
        return Boolean.valueOf(false);
      }
    });
  }

  void markInitializationStarted()
  {
    this.executorServiceWrapper.executeSyncLoggingException(new Callable()
    {
      public Void call()
        throws Exception
      {
        Crashlytics.this.initializationMarkerFile.createNewFile();
        Fabric.getLogger().d("Fabric", "Initialization marker file created.");
        return null;
      }
    });
  }

  protected boolean onPreExecute()
  {
    return onPreExecute(super.getContext());
  }

  boolean onPreExecute(Context paramContext)
  {
    if (this.disabled)
      return false;
    String str = new ApiKey().getValue(paramContext);
    if (str == null)
      return false;
    Fabric.getLogger().i("Fabric", "Initializing Crashlytics " + getVersion());
    this.initializationMarkerFile = new File(getSdkDirectory(), "initialization_marker");
    boolean bool = false;
    try
    {
      setAndValidateKitProperties(paramContext, str);
      try
      {
        SessionDataWriter localSessionDataWriter = new SessionDataWriter(getContext(), this.buildId, getPackageName());
        Fabric.getLogger().d("Fabric", "Installing exception handler...");
        this.handler = new CrashlyticsUncaughtExceptionHandler(Thread.getDefaultUncaughtExceptionHandler(), this.listener, this.executorServiceWrapper, getIdManager(), localSessionDataWriter, this);
        bool = didPreviousInitializationComplete();
        this.handler.ensureOpenSessionExists();
        Thread.setDefaultUncaughtExceptionHandler(this.handler);
        Fabric.getLogger().d("Fabric", "Successfully installed exception handler.");
        if ((bool) && (CommonUtils.canTryConnection(paramContext)))
        {
          finishInitSynchronously();
          return false;
        }
      }
      catch (Exception localException2)
      {
        while (true)
          Fabric.getLogger().e("Fabric", "There was a problem installing the exception handler.", localException2);
      }
    }
    catch (CrashlyticsMissingDependencyException localCrashlyticsMissingDependencyException)
    {
      throw new UnmetDependencyException(localCrashlyticsMissingDependencyException);
      return true;
    }
    catch (Exception localException1)
    {
      Fabric.getLogger().e("Fabric", "Crashlytics was not started due to an exception during initialization", localException1);
    }
    return false;
  }

  @Deprecated
  public void setDebugMode(boolean paramBoolean)
  {
    Fabric.getLogger().w("Fabric", "Use of Crashlytics.setDebugMode is deprecated.");
  }

  void setExternalCrashEventDataProvider(CrashEventDataProvider paramCrashEventDataProvider)
  {
    this.externalCrashEventDataProvider = paramCrashEventDataProvider;
  }

  @Deprecated
  public void setListener(CrashlyticsListener paramCrashlyticsListener)
  {
    try
    {
      Fabric.getLogger().w("Fabric", "Use of Crashlytics.setListener is deprecated.");
      if (paramCrashlyticsListener == null)
        throw new IllegalArgumentException("listener must not be null.");
    }
    finally
    {
    }
    this.listener = paramCrashlyticsListener;
  }

  @SuppressLint({"CommitPrefEdits"})
  void setShouldSendUserReportsWithoutPrompting(boolean paramBoolean)
  {
    PreferenceStoreImpl localPreferenceStoreImpl = new PreferenceStoreImpl(this);
    localPreferenceStoreImpl.save(localPreferenceStoreImpl.edit().putBoolean("always_send_reports_opt_in", paramBoolean));
  }

  boolean shouldPromptUserBeforeSendingCrashReports()
  {
    return ((Boolean)Settings.getInstance().withSettings(new Settings.SettingsAccess()
    {
      public Boolean usingSettings(SettingsData paramAnonymousSettingsData)
      {
        if (paramAnonymousSettingsData.featuresData.promptEnabled)
        {
          boolean bool1 = Crashlytics.this.shouldSendReportsWithoutPrompting();
          boolean bool2 = false;
          if (!bool1)
            bool2 = true;
          return Boolean.valueOf(bool2);
        }
        return Boolean.valueOf(false);
      }
    }
    , Boolean.valueOf(false))).booleanValue();
  }

  boolean shouldSendReportsWithoutPrompting()
  {
    return new PreferenceStoreImpl(this).get().getBoolean("always_send_reports_opt_in", false);
  }

  public boolean verifyPinning(URL paramURL)
  {
    try
    {
      boolean bool = internalVerifyPinning(paramURL);
      return bool;
    }
    catch (Exception localException)
    {
      Fabric.getLogger().e("Fabric", "Could not verify SSL pinning", localException);
    }
    return false;
  }

  public static class Builder
  {
    private float delay = -1.0F;
    private boolean disabled = false;
    private CrashlyticsListener listener;
    private PinningInfoProvider pinningInfoProvider;

    public Crashlytics build()
    {
      if (this.delay < 0.0F)
        this.delay = 1.0F;
      return new Crashlytics(this.delay, this.listener, this.pinningInfoProvider, this.disabled);
    }

    public Builder delay(float paramFloat)
    {
      if (paramFloat <= 0.0F)
        throw new IllegalArgumentException("delay must be greater than 0");
      if (this.delay > 0.0F)
        throw new IllegalStateException("delay already set.");
      this.delay = paramFloat;
      return this;
    }

    public Builder disabled(boolean paramBoolean)
    {
      this.disabled = paramBoolean;
      return this;
    }

    public Builder listener(CrashlyticsListener paramCrashlyticsListener)
    {
      if (paramCrashlyticsListener == null)
        throw new IllegalArgumentException("listener must not be null.");
      if (this.listener != null)
        throw new IllegalStateException("listener already set.");
      this.listener = paramCrashlyticsListener;
      return this;
    }

    @Deprecated
    public Builder pinningInfo(PinningInfoProvider paramPinningInfoProvider)
    {
      if (paramPinningInfoProvider == null)
        throw new IllegalArgumentException("pinningInfoProvider must not be null.");
      if (this.pinningInfoProvider != null)
        throw new IllegalStateException("pinningInfoProvider already set.");
      this.pinningInfoProvider = paramPinningInfoProvider;
      return this;
    }
  }

  private class OptInLatch
  {
    private final CountDownLatch latch = new CountDownLatch(1);
    private boolean send = false;

    private OptInLatch()
    {
    }

    void await()
    {
      try
      {
        this.latch.await();
        return;
      }
      catch (InterruptedException localInterruptedException)
      {
      }
    }

    boolean getOptIn()
    {
      return this.send;
    }

    void setOptIn(boolean paramBoolean)
    {
      this.send = paramBoolean;
      this.latch.countDown();
    }
  }
}