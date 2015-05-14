package com.instabug.library;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.opengl.GLSurfaceView;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.Display;
import android.view.View;
import android.view.WindowManager;
import com.google.android.gms.maps.GoogleMap;
import com.instabug.library.dialog.d.a;
import com.instabug.library.invoker.a.d;
import com.instabug.library.util.InstabugLogger;
import com.instabug.library.util.g;
import java.io.File;
import org.json.JSONException;
import org.json.JSONObject;

public class Instabug
{
  public static final String ARGS_PRIMARY_COLOR = "PRIMARY_COLOR";
  public static final String ARGS_SECONDARY_COLOR = "SECONDARY_COLOR";
  public static boolean DEBUG = false;
  public static final int INSTABUG_FEEDBACK_BUG = 1;
  public static final int INSTABUG_FEEDBACK_FEEDBACK = 2;
  private static Instabug INSTANCE;
  public static final int INVOCATION_NONE = 0;
  public static final int INVOCATION_OVERFLOW = 2;
  public static final int INVOCATION_SHAKE = 1;
  public static final String SDK_LEVEL = "SDK Level ";
  public static final String SDK_VERSION = "1.3.2";
  private h mDelegate;
  private a mInternalDelegate;

  Instabug(h paramh)
  {
    this.mDelegate = paramh;
    this.mInternalDelegate = new a();
  }

  private static String getAppTokenFromMetadata(Bundle paramBundle)
  {
    boolean bool = paramBundle.getBoolean("com.instabug.ProductionMode", true);
    if (paramBundle.containsKey("com.instabug.AppToken"))
      return paramBundle.getString("com.instabug.AppToken");
    if ((bool) && (paramBundle.containsKey("com.instabug.ProductionAppToken")))
      return paramBundle.getString("com.instabug.ProductionAppToken");
    if (paramBundle.containsKey("com.instabug.DevelopmentAppToken"))
      return paramBundle.getString("com.instabug.DevelopmentAppToken");
    return null;
  }

  public static Instabug getInstance()
  {
    if (INSTANCE == null)
      throw new IllegalStateException("You must call Instabug.initialize() in your Application class first");
    return INSTANCE;
  }

  public static Instabug initialize(Application paramApplication, String paramString)
  {
    a.a("Initializing Instabug SDK");
    if (paramString == null)
    {
      Log.w("com.instabug.library", "Instabug application token couldn't be retrieved, please make sure you're initialize(Context,String) with a non-null token");
      throw new IllegalStateException("Instabug application token not found");
    }
    Instabug localInstabug = new Instabug(new h(paramApplication, new com.instabug.library.internal.module.a(paramApplication), paramString));
    INSTANCE = localInstabug;
    return localInstabug;
  }

  public static Instabug initialize(Context paramContext)
  {
    a.a("Initializing Instabug SDK");
    if (INSTANCE != null)
      throw new IllegalStateException("SDK Already Initialized. Please use Instabug.getInstance() calls after Instabug.initialize()");
    new g();
    String str = getAppTokenFromMetadata(g.a(paramContext));
    if (str == null)
    {
      Log.w("com.instabug.library", "Instabug application token couldn't be retrieved, please make sure you're initialize(Context,String) with a non-null token");
      throw new IllegalStateException("Instabug application token not found");
    }
    Instabug localInstabug = new Instabug(new h((Application)paramContext, new com.instabug.library.internal.module.a((Application)paramContext), str));
    INSTANCE = localInstabug;
    return localInstabug;
  }

  public void activityDestroyed(Activity paramActivity)
  {
    this.mDelegate.c(paramActivity);
  }

  public void activityPaused(Activity paramActivity)
  {
    this.mDelegate.b(paramActivity);
  }

  public void addMapView(View paramView, GoogleMap paramGoogleMap)
  {
    this.mDelegate.a(paramView, paramGoogleMap);
    this.mDelegate.s().F().append("\naddMapView();");
  }

  public Instabug attachFileAtLocation(String paramString)
  {
    this.mDelegate.b(paramString);
    this.mDelegate.s().F().append("\nattachFileAtLocation();");
    return this;
  }

  public void clearLog()
  {
    InstabugLogger.clear();
    this.mDelegate.s().F().append("\nclearLog();");
  }

  public void displayFeedbackDialog()
  {
    this.mDelegate.i();
    this.mDelegate.s().F().append("\ndisplayFeedbackDialog();");
  }

  public Instabug enableEmailField(boolean paramBoolean1, boolean paramBoolean2)
  {
    this.mDelegate.a(paramBoolean1, paramBoolean2);
    this.mDelegate.s().F().append("\nenableEmailField(").append(paramBoolean1).append(", ").append(paramBoolean2).append(");");
    return this;
  }

  public String getAnnotationActivityTitle()
  {
    return this.mDelegate.s().B();
  }

  String getAttachmentPath()
  {
    return this.mDelegate.p();
  }

  public String getCommentHint()
  {
    return this.mDelegate.s().v();
  }

  public String getCommentRequiredError()
  {
    return this.mDelegate.s().u();
  }

  public Activity getCurrentActivity()
  {
    return this.mDelegate.q();
  }

  public String getDefaultEmail()
  {
    return this.mDelegate.s().x();
  }

  public Dialog getDialog()
  {
    return this.mDelegate.j();
  }

  public String getEmailHint()
  {
    return this.mDelegate.s().w();
  }

  public d.a getFeedbackPopupColors()
  {
    return this.mDelegate.v();
  }

  public String getFeedbackQuestion()
  {
    return this.mDelegate.s().v();
  }

  public GestureMode getGestureMode()
  {
    return this.mDelegate.a();
  }

  public String getIncorrectEmailError()
  {
    return this.mDelegate.s().t();
  }

  public boolean getMode()
  {
    return false;
  }

  public String getPleaseWaitMessage()
  {
    return this.mDelegate.r();
  }

  public String getPostBugReportMessage()
  {
    return this.mDelegate.s().c;
  }

  public String getPostFeedbackMessage()
  {
    return this.mDelegate.s().b;
  }

  public x getSettingsBundle()
  {
    return this.mDelegate.s();
  }

  public String getUserData()
  {
    return this.mDelegate.m();
  }

  public boolean hasAttachment()
  {
    return this.mDelegate.l();
  }

  a iG()
  {
    return this.mInternalDelegate;
  }

  public void invoke()
  {
    this.mDelegate.f();
    this.mDelegate.s().F().append("\ninvoke();");
  }

  public void invokeBugReporter()
  {
    this.mDelegate.g();
    this.mDelegate.s().F().append("\ninvokeBugReporter();");
  }

  public void invokeFeedbackProcess()
  {
    this.mDelegate.f();
    this.mDelegate.s().F().append("\ninvokeFeedbackProcess();");
  }

  public void invokeFeedbackProcess(int paramInt)
  {
    this.mDelegate.s().F().append("\ninvokeFeedbackProcess(").append(paramInt).append(");");
    switch (paramInt)
    {
    default:
      invoke();
      return;
    case 1:
      invokeBugReporter();
      return;
    case 2:
    }
    invokeFeedbackSender();
  }

  public void invokeFeedbackSender()
  {
    this.mDelegate.h();
    this.mDelegate.s().F().append("\ninvokeFeedbackSender();");
  }

  public void invokeFeedbackSenderViaEmail()
  {
    this.mDelegate.h();
    this.mDelegate.s().F().append("\ninvokeFeedbackSenderViaEmail();");
  }

  public boolean isAutomaticallyDetectingColors()
  {
    return this.mDelegate.s().E();
  }

  public boolean isCommentRequired()
  {
    return this.mDelegate.s().y();
  }

  boolean isCrashReportingEnabled()
  {
    return this.mDelegate.s().m();
  }

  public boolean isEmailEnabled()
  {
    return this.mDelegate.s().A();
  }

  public boolean isEmailRequired()
  {
    return this.mDelegate.s().z();
  }

  public boolean isEnableOverflowMenuItem()
  {
    return this.mDelegate.s().C();
  }

  public boolean isShowIntroDialog()
  {
    return this.mDelegate.o();
  }

  public boolean isShowPostFeedbackToast()
  {
    return this.mDelegate.s().D();
  }

  public boolean isTrackingUserSteps()
  {
    return this.mDelegate.n();
  }

  public void log(String paramString)
  {
    InstabugLogger.log(paramString);
    this.mDelegate.s().F().append("\nlog();");
  }

  public void onDestroy(Activity paramActivity)
  {
    this.mDelegate.c(paramActivity);
  }

  public void onPause(Activity paramActivity)
  {
    this.mDelegate.b(paramActivity);
  }

  public void onResume(Activity paramActivity)
  {
    this.mDelegate.a(paramActivity);
  }

  public void reportBug(Bitmap paramBitmap, String paramString1, String paramString2, Instabug.b paramb)
  {
    this.mDelegate.a(paramBitmap, paramString1, paramString2, paramb);
    this.mDelegate.s().F().append("\nreportBug(...);");
  }

  public void reportCaughtException(Exception paramException)
  {
    this.mDelegate.s().F().append("\nreportCaughtException(...);");
    reportException(paramException);
  }

  public void reportException(Throwable paramThrowable)
  {
    this.mDelegate.s().F().append("\nreportException(...);");
    this.mDelegate.a(paramThrowable);
  }

  public Instabug resetFileAttachment()
  {
    this.mDelegate.k();
    this.mDelegate.s().F().append("\nresetFileAttachment();");
    return this;
  }

  public void sendFeedback(String paramString1, String paramString2, Instabug.b paramb)
  {
    this.mDelegate.a(paramString1, paramString2, paramb);
    this.mDelegate.s().F().append("\nsendFeedback(...);");
  }

  public void setActivity(Activity paramActivity)
  {
    this.mDelegate.a(paramActivity);
  }

  public Instabug setAnnotationActivityClass(Class paramClass)
  {
    h.a(paramClass);
    this.mDelegate.s().F().append("\nsetAnnotationActivityClass(").append(paramClass.getClass().getCanonicalName()).append(");");
    return this;
  }

  public Instabug setBugHeaderText(String paramString)
  {
    this.mDelegate.s().n()[0] = paramString;
    this.mDelegate.s().F().append("\nsetBugHeaderText(").append(paramString).append(");");
    return this;
  }

  public Instabug setCommentFieldHint(String paramString)
  {
    this.mDelegate.f(paramString);
    this.mDelegate.s().F().append("\nsetCommentFieldHint(").append(paramString).append(");");
    return this;
  }

  public Instabug setCommentIsRequired(boolean paramBoolean)
  {
    this.mDelegate.b(paramBoolean);
    this.mDelegate.s().F().append("\nsetCommentIsRequired(").append(paramBoolean).append(");");
    return this;
  }

  public Instabug setCommentPlaceholder(String paramString)
  {
    this.mDelegate.f(paramString);
    this.mDelegate.s().F().append("\nsetCommentPlaceHolder(").append(paramString).append(");");
    return this;
  }

  public Instabug setCommentRequired(boolean paramBoolean)
  {
    setCommentIsRequired(paramBoolean);
    this.mDelegate.s().F().append("\nsetCommentRequired(").append(paramBoolean).append(");");
    return this;
  }

  public Instabug setCommentRequired(boolean paramBoolean, String paramString)
  {
    this.mDelegate.b(paramBoolean);
    this.mDelegate.a(paramString);
    this.mDelegate.s().F().append("\nsetCommentRequired(").append(paramBoolean).append(", ").append(paramString).append(");");
    return this;
  }

  public Instabug setCrashReportingEnabled(boolean paramBoolean)
  {
    this.mDelegate.s().F().append("\nsetCrashReportingEnabled(").append(paramBoolean).append(");");
    return setIsTrackingCrashes(paramBoolean);
  }

  public Instabug setDebugEnabled(boolean paramBoolean)
  {
    DEBUG = paramBoolean;
    this.mDelegate.s().F().append("setDebugEnabled(").append(paramBoolean).append(");");
    return this;
  }

  public Instabug setDefaultEmail(String paramString)
  {
    this.mDelegate.d(paramString);
    this.mDelegate.s().F().append("\nsetDefaultEmail();");
    return this;
  }

  public Instabug setDefaultInvocationMode(Instabug.IBGInvocationMode paramIBGInvocationMode)
  {
    this.mDelegate.a(paramIBGInvocationMode);
    this.mDelegate.s().F().append("\nsetDefaultInvocationMode(").append(paramIBGInvocationMode.toString()).append(");");
    return this;
  }

  public void setDialog(Dialog paramDialog)
  {
    this.mDelegate.a(paramDialog);
  }

  public Instabug setEmailFieldHint(String paramString)
  {
    this.mDelegate.e(paramString);
    this.mDelegate.s().F().append("\nsetEmailFieldHint(").append(paramString).append(");");
    return this;
  }

  public Instabug setEmailIsRequired(boolean paramBoolean)
  {
    this.mDelegate.f(paramBoolean);
    this.mDelegate.s().F().append("\nsetEmailIsRequired(").append(paramBoolean).append(");");
    return this;
  }

  public Instabug setEmailPlaceholder(String paramString)
  {
    this.mDelegate.e(paramString);
    this.mDelegate.s().F().append("\nsetEmailPlaceholder(").append(paramString).append(");");
    return this;
  }

  public Instabug setEnableOverflowMenuItem(boolean paramBoolean)
  {
    this.mDelegate.d(paramBoolean);
    this.mDelegate.s().F().append("\nsetEnabledOverflowMenuItem(" + paramBoolean + ");");
    return this;
  }

  public Instabug setFeedbackHeaderText(String paramString)
  {
    this.mDelegate.s().n()[1] = paramString;
    this.mDelegate.s().F().append("\nsetFeedbackHeaderText(").append(paramString).append(");");
    return this;
  }

  public Instabug setFeedbackPopupColors(int paramInt1, int paramInt2, int paramInt3)
  {
    this.mDelegate.a(paramInt1, paramInt2, paramInt3);
    this.mDelegate.s().F().append("\nsetFeedbackPopupColors(").append(paramInt1).append(", ").append(paramInt2).append(", ").append(paramInt3).append(");");
    return this;
  }

  public Instabug setFeedbackQuestion(String paramString)
  {
    setCommentPlaceholder(paramString);
    this.mDelegate.s().F().append("\nsetFeedbackQuestion(").append(paramString).append(");");
    return this;
  }

  public Instabug setFloatingButtonBackColor(int paramInt)
  {
    h localh = this.mDelegate;
    if (localh.b == null)
    {
      localh.b = new a.d();
      localh.a.a(localh.b);
    }
    localh.b.b = paramInt;
    return this;
  }

  public Instabug setFloatingButtonEdge(Instabug.IBGFloatingButtonEdge paramIBGFloatingButtonEdge)
  {
    h localh = this.mDelegate;
    if (localh.b == null)
    {
      localh.b = new a.d();
      localh.a.a(localh.b);
    }
    localh.b.c = paramIBGFloatingButtonEdge;
    return this;
  }

  public Instabug setFloatingButtonForeColor(int paramInt)
  {
    h localh = this.mDelegate;
    if (localh.b == null)
    {
      localh.b = new a.d();
      localh.a.a(localh.b);
    }
    localh.b.a = paramInt;
    return this;
  }

  public Instabug setFloatingButtonOffsetFromTop(int paramInt)
  {
    h localh = this.mDelegate;
    if (localh.b == null)
    {
      localh.b = new a.d();
      localh.a.a(localh.b);
    }
    localh.b.d = paramInt;
    return this;
  }

  public void setGLSurfaceView(GLSurfaceView paramGLSurfaceView)
  {
    this.mDelegate.a(paramGLSurfaceView);
    this.mDelegate.s().F().append("\nsetGLSurfaceView();");
  }

  public Instabug setGestureInvocationMode(GestureMode paramGestureMode)
  {
    this.mDelegate.a(paramGestureMode);
    this.mDelegate.s().F().append("\nsetGestureInvocationMode(").append(paramGestureMode.toString()).append(");");
    return this;
  }

  public Instabug setInvalidCommentAlertText(String paramString)
  {
    this.mDelegate.a(paramString);
    this.mDelegate.s().F().append("\nsetInvalidCommentAlertText(").append(paramString).append(");");
    return this;
  }

  public Instabug setInvalidEmailMessage(String paramString)
  {
    this.mDelegate.s().g(paramString);
    this.mDelegate.s().F().append("\nsetInvalidEmailMessage();");
    return this;
  }

  public Instabug setInvocationEvent(int paramInt)
  {
    h localh = this.mDelegate;
    if ((paramInt & 0x2) > 0)
      localh.d(true);
    if ((paramInt & 0x1) > 0)
      localh.a(IBGInvocationEvent.IBGInvocationEventShake);
    this.mDelegate.s().F().append("\nsetInvocationEvent(").append(paramInt).append(");");
    return this;
  }

  public Instabug setInvocationEvent(IBGInvocationEvent paramIBGInvocationEvent)
  {
    this.mDelegate.a(paramIBGInvocationEvent);
    this.mDelegate.s().F().append("\nsetInvocationEvent(").append(paramIBGInvocationEvent.toString()).append(");");
    return this;
  }

  public Instabug setIsTrackingCrashes(boolean paramBoolean)
  {
    this.mDelegate.s().d(paramBoolean);
    this.mDelegate.s().F().append("\nsetIsTrackingCrashes(").append(paramBoolean).append(");");
    return this;
  }

  public Instabug setIsTrackingUserSteps(boolean paramBoolean)
  {
    this.mDelegate.c(paramBoolean);
    this.mDelegate.s().F().append("\nsetIsTrackingUserSteps(").append(paramBoolean).append(");");
    return this;
  }

  public Instabug setPostBugReportMessage(String paramString)
  {
    this.mDelegate.h(paramString);
    this.mDelegate.s().F().append("\nsetPostBugReportMessage(").append(paramString).append(");");
    return this;
  }

  public Instabug setPostFeedbackMessage(String paramString)
  {
    this.mDelegate.g(paramString);
    this.mDelegate.s().F().append("\nsetPostFeedbackMessage(").append(paramString).append(");");
    return this;
  }

  public Instabug setPreReportRunnable(Runnable paramRunnable)
  {
    this.mDelegate.s().F().append("\nsetPreReportRunnable();");
    return setPreSendingRunnable(paramRunnable);
  }

  public Instabug setPreSendingRunnable(Runnable paramRunnable)
  {
    this.mDelegate.s().a(paramRunnable);
    this.mDelegate.s().F().append("\nsetPreSendingRunnable();");
    return this;
  }

  public Instabug setPromptColors(int paramInt1, int paramInt2)
  {
    this.mDelegate.a(paramInt1, paramInt2);
    this.mDelegate.s().F().append("\nsetPromptColors(").append(paramInt1).append(",").append(paramInt2).append(");");
    return this;
  }

  public Instabug setSDKColorResources(int paramInt1, int paramInt2)
  {
    setSdkStyleColors(-3355444, this.mDelegate.t().getResources().getColor(paramInt1), this.mDelegate.t().getResources().getColor(paramInt2), this.mDelegate.t().getResources().getColor(paramInt1), this.mDelegate.t().getResources().getColor(paramInt2));
    this.mDelegate.s().F().append("setSDKColorResources(").append(paramInt1).append(", ").append(paramInt2).append(");");
    return this;
  }

  public Instabug setSDKColors(int paramInt1, int paramInt2)
  {
    setSdkStyleColors(-3355444, paramInt1, paramInt2, paramInt1, paramInt2);
    this.mDelegate.s().F().append("\nsetSDKColors(").append(paramInt1).append(", ").append(paramInt2).append(");");
    return this;
  }

  public Instabug setSdkStyle(Drawable paramDrawable1, Drawable paramDrawable2, int paramInt1, Drawable paramDrawable3, int paramInt2)
  {
    this.mDelegate.a(paramDrawable1, paramDrawable2, paramInt1, paramDrawable3, paramInt2);
    this.mDelegate.s().F().append("\nsetSdkStyle();");
    return this;
  }

  public Instabug setSdkStyleColors(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    this.mDelegate.a(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5);
    this.mDelegate.s().F().append("\nsetSdkStyleColors();");
    return this;
  }

  public Instabug setSdkThemingMode(Instabug.SdkThemingMode paramSdkThemingMode, Instabug.SdkThemeSource paramSdkThemeSource)
  {
    this.mDelegate.a(paramSdkThemingMode, paramSdkThemeSource);
    this.mDelegate.s().F().append("\nsetSdkThemingMode ").append(paramSdkThemingMode.toString()).append(", ").append(paramSdkThemeSource.toString());
    return this;
  }

  public Instabug setShakingThreshold(float paramFloat)
  {
    this.mDelegate.a(paramFloat);
    this.mDelegate.s().F().append("\nsetShakingThreshold(").append(paramFloat).append(");");
    return this;
  }

  public Instabug setShowIntroDialog(boolean paramBoolean)
  {
    this.mDelegate.a(paramBoolean);
    this.mDelegate.s().F().append("\nsetShowIntroDialog(").append(paramBoolean).append(");");
    return this;
  }

  public Instabug setShowIntroDialog(boolean paramBoolean, Class paramClass)
  {
    this.mDelegate.a(paramBoolean, paramClass);
    this.mDelegate.s().F().append("\nsetShowIntroDialog(").append(paramBoolean).append(", Activity);");
    return this;
  }

  public Instabug setShowPostFeedbackToast(boolean paramBoolean)
  {
    this.mDelegate.s().F().append("\nsetShowPostFeedbackToast(").append(paramBoolean).append(");");
    return setWillShowFeedbackSentAlert(paramBoolean);
  }

  public Instabug setShowTutorial(boolean paramBoolean)
  {
    this.mDelegate.s().F().append("\nsetShowTutorial(").append(paramBoolean).append(");");
    return setWillShowTutorialAlert(paramBoolean);
  }

  public Instabug setSubmitButtonText(String paramString)
  {
    this.mDelegate.i(paramString);
    this.mDelegate.s().F().append("\nsetSubmitButtonText(").append(paramString).append(");");
    return this;
  }

  public Instabug setTrackUserSteps(boolean paramBoolean)
  {
    this.mDelegate.s().F().append("\nsetTrackUserSteps(").append(paramBoolean).append(");");
    return setIsTrackingUserSteps(paramBoolean);
  }

  public Instabug setUserData(String paramString)
  {
    this.mDelegate.c(paramString);
    this.mDelegate.s().F().append("\nsetUserData(...);");
    return this;
  }

  public Instabug setWillShowEmailField(boolean paramBoolean)
  {
    this.mDelegate.e(paramBoolean);
    this.mDelegate.s().F().append("\nsetWillShowEmailField(").append(paramBoolean).append(");");
    return this;
  }

  public Instabug setWillShowFeedbackSentAlert(boolean paramBoolean)
  {
    this.mDelegate.s().g(paramBoolean);
    this.mDelegate.s().F().append("\nsetWillShowFeedbackSentAlert(").append(paramBoolean).append(");");
    return this;
  }

  public Instabug setWillShowStartAlert(boolean paramBoolean)
  {
    this.mDelegate.a(paramBoolean);
    this.mDelegate.s().F().append("\nsetWillShowStartAlert(").append(paramBoolean).append(");");
    return this;
  }

  public Instabug setWillShowStartAlert(boolean paramBoolean, Class paramClass)
  {
    this.mDelegate.a(paramBoolean, paramClass);
    this.mDelegate.s().F().append("\nsetWillShowStartAlert(").append(paramBoolean).append(", Activity);");
    return this;
  }

  public Instabug setWillShowTutorialAlert(boolean paramBoolean)
  {
    this.mDelegate.s().e(paramBoolean);
    this.mDelegate.s().F().append("\nsetShowTutorial(" + paramBoolean + ");");
    return this;
  }

  public void showAnimatedTutorial(Activity paramActivity)
  {
    h localh = this.mDelegate;
    new Handler().postDelayed(new o(localh, paramActivity), 750L);
    this.mDelegate.s().F().append("\nshowAnimatedTutorial();");
  }

  public void showDiscoveryDialog()
  {
    this.mDelegate.e();
    this.mDelegate.s().F().append("\nshowDiscoveryDialog();");
  }

  public void showStartAlert()
  {
    this.mDelegate.e();
    this.mDelegate.s().F().append("\nshowStartAlert();");
  }

  public void startAnnotationActivity(File paramFile)
  {
    this.mDelegate.a(paramFile);
    this.mDelegate.s().F().append("\nstartAnnotationActivity(File);");
  }

  public void terminate()
  {
    this.mDelegate.s().F().append("\nterminate();");
  }

  public void viewTapped(View paramView)
  {
    this.mDelegate.a(paramView);
    this.mDelegate.s().F().append("\nviewTapped(View);");
  }

  public Bitmap viewToBitmap(View paramView)
  {
    Bitmap localBitmap = Bitmap.createBitmap(paramView.getWidth(), paramView.getHeight(), Bitmap.Config.RGB_565);
    paramView.draw(new Canvas(localBitmap));
    this.mDelegate.s().F().append("\nviewToBitmap();");
    return localBitmap;
  }

  public static enum GestureMode
  {
    static
    {
      GestureMode[] arrayOfGestureMode = new GestureMode[2];
      arrayOfGestureMode[0] = NONE;
      arrayOfGestureMode[1] = TwoFingersSwipeLeft;
    }
  }

  public static enum IBGInvocationEvent
  {
    static
    {
      IBGInvocationEventFloatingButton = new IBGInvocationEvent("IBGInvocationEventFloatingButton", 3);
      IBGInvocationEvent[] arrayOfIBGInvocationEvent = new IBGInvocationEvent[4];
      arrayOfIBGInvocationEvent[0] = IBGInvocationEventNone;
      arrayOfIBGInvocationEvent[1] = IBGInvocationEventShake;
      arrayOfIBGInvocationEvent[2] = IBGInvocationEventTwoFingersSwipeLeft;
      arrayOfIBGInvocationEvent[3] = IBGInvocationEventFloatingButton;
    }
  }

  public class a
  {
    public a()
    {
    }

    private static void a(int paramInt, Throwable paramThrowable, String paramString)
    {
      if (!Instabug.DEBUG)
        return;
      if (paramThrowable == null);
      while (true)
      {
        Log.println(paramInt, "com.instabug.library", paramString);
        return;
        if (paramString == null)
          paramString = paramThrowable.getMessage();
        paramString = String.format("%1$s\n%2$s", new Object[] { paramString, Log.getStackTraceString(paramThrowable) });
      }
    }

    public static void a(Activity paramActivity)
    {
      ComponentName localComponentName;
      PackageManager localPackageManager;
      if (paramActivity != null)
      {
        a(3, null, "Unlocking orientation for activity " + paramActivity.toString());
        localComponentName = new ComponentName(paramActivity, paramActivity.getClass());
        localPackageManager = paramActivity.getPackageManager();
      }
      try
      {
        paramActivity.setRequestedOrientation(localPackageManager.getActivityInfo(localComponentName, 128).screenOrientation);
        return;
      }
      catch (PackageManager.NameNotFoundException localNameNotFoundException)
      {
        localNameNotFoundException.printStackTrace();
        paramActivity.setRequestedOrientation(-1);
        return;
      }
      catch (Exception localException)
      {
        paramActivity.setRequestedOrientation(-1);
      }
    }

    public static void a(String paramString)
    {
      a(3, null, paramString);
    }

    public static void a(String paramString, Throwable paramThrowable)
    {
      a(6, paramThrowable, paramString);
    }

    public static void a(Throwable paramThrowable)
    {
      a(6, paramThrowable, null);
    }

    public static JSONObject b(Throwable paramThrowable)
    {
      JSONObject localJSONObject = new JSONObject();
      try
      {
        localJSONObject.put("name", paramThrowable.getClass().getName());
        StackTraceElement[] arrayOfStackTraceElement = paramThrowable.getStackTrace();
        StackTraceElement localStackTraceElement = null;
        if (arrayOfStackTraceElement != null)
        {
          int i = paramThrowable.getStackTrace().length;
          localStackTraceElement = null;
          if (i > 0)
            localStackTraceElement = paramThrowable.getStackTrace()[0];
        }
        if ((localStackTraceElement != null) && (localStackTraceElement.getFileName() != null))
          localJSONObject.put("location", localStackTraceElement.getFileName() + ":" + localStackTraceElement.getLineNumber());
        while (true)
        {
          localJSONObject.put("exception", paramThrowable.toString());
          if (paramThrowable.getMessage() != null)
            localJSONObject.put("message", paramThrowable.getMessage());
          localJSONObject.put("stackTrace", Log.getStackTraceString(paramThrowable));
          if (paramThrowable.getCause() == null)
            break;
          localJSONObject.put("cause", b(paramThrowable.getCause()));
          return localJSONObject;
          a(5, null, "Incomplete crash stacktrace, if you're using Proguard, add the following line to your configuration file to have file name and line number in your crash report:");
          a(5, null, "-keepattributes SourceFile,LineNumberTable");
        }
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
      }
      return localJSONObject;
    }

    public static void b(Activity paramActivity)
    {
      a(3, null, "Locking orientation for activity " + paramActivity.toString());
      switch (paramActivity.getResources().getConfiguration().orientation)
      {
      default:
        return;
      case 1:
        if (Build.VERSION.SDK_INT < 8)
        {
          paramActivity.setRequestedOrientation(1);
          return;
        }
        int j = paramActivity.getWindowManager().getDefaultDisplay().getRotation();
        if ((j == 1) || (j == 2))
        {
          paramActivity.setRequestedOrientation(9);
          return;
        }
        paramActivity.setRequestedOrientation(1);
        return;
      case 2:
      }
      if (Build.VERSION.SDK_INT < 8)
      {
        paramActivity.setRequestedOrientation(0);
        return;
      }
      int i = paramActivity.getWindowManager().getDefaultDisplay().getRotation();
      if ((i == 0) || (i == 1))
      {
        paramActivity.setRequestedOrientation(0);
        return;
      }
      paramActivity.setRequestedOrientation(8);
    }

    public static void b(String paramString)
    {
      a(4, null, paramString);
    }

    public static void c(String paramString)
    {
      a(5, null, paramString);
    }

    public static void d(String paramString)
    {
      a(6, null, paramString);
    }
  }
}