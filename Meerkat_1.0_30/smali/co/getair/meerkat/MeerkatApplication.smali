.class public Lco/getair/meerkat/MeerkatApplication;
.super Landroid/app/Application;
.source "MeerkatApplication.java"


# static fields
.field private static final APPLICATION_CLASS_NAME:Ljava/lang/String; = "MeerkatApplication"

.field private static final MIXPANEL_TOKEN:Ljava/lang/String; = "f0935fb131ceafacf72df9498b930edd"


# instance fields
.field global_tracker:Lcom/google/android/gms/analytics/Tracker;

.field private mixpanelAPI:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput-object v0, p0, Lco/getair/meerkat/MeerkatApplication;->global_tracker:Lcom/google/android/gms/analytics/Tracker;

    return-void
.end method

.method public static getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    const-string v0, "MeerkatApplication"

    return-object v0
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 0
    .param p1, "base"    # Landroid/content/Context;

    .prologue
    .line 36
    invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V

    .line 38
    invoke-static {p0}, Landroid/support/multidex/MultiDex;->install(Landroid/content/Context;)V

    .line 39
    return-void
.end method

.method public getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lco/getair/meerkat/MeerkatApplication;->mixpanelAPI:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    return-object v0
.end method

.method declared-synchronized getTracker()Lcom/google/android/gms/analytics/Tracker;
    .locals 3

    .prologue
    .line 83
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lco/getair/meerkat/MeerkatApplication;->global_tracker:Lcom/google/android/gms/analytics/Tracker;

    if-nez v2, :cond_0

    .line 85
    invoke-static {p0}, Lcom/google/android/gms/analytics/GoogleAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/analytics/GoogleAnalytics;

    move-result-object v0

    .line 86
    .local v0, "analytics":Lcom/google/android/gms/analytics/GoogleAnalytics;
    const/high16 v2, 0x7f070000

    invoke-virtual {v0, v2}, Lcom/google/android/gms/analytics/GoogleAnalytics;->newTracker(I)Lcom/google/android/gms/analytics/Tracker;

    move-result-object v1

    .line 87
    .local v1, "t":Lcom/google/android/gms/analytics/Tracker;
    iput-object v1, p0, Lco/getair/meerkat/MeerkatApplication;->global_tracker:Lcom/google/android/gms/analytics/Tracker;

    .line 90
    .end local v0    # "analytics":Lcom/google/android/gms/analytics/GoogleAnalytics;
    .end local v1    # "t":Lcom/google/android/gms/analytics/Tracker;
    :cond_0
    iget-object v2, p0, Lco/getair/meerkat/MeerkatApplication;->global_tracker:Lcom/google/android/gms/analytics/Tracker;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v2

    .line 83
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public onCreate()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 43
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 45
    new-instance v4, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    invoke-direct {v4, p0}, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4}, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->build()Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;

    move-result-object v2

    .line 46
    .local v2, "config":Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/nostra13/universalimageloader/core/ImageLoader;->init(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;)V

    .line 48
    new-instance v1, Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    const-string v4, "vbCVlT5uFMl7OmtnMtCX4PQlQ"

    const-string v5, "sREWXEkAVUfGQ0IxSQxtSigfYKH5oTRKHFFV2qWwbG7sudF6Uq"

    invoke-direct {v1, v4, v5}, Lcom/twitter/sdk/android/core/TwitterAuthConfig;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .local v1, "authConfig":Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    const/4 v4, 0x2

    new-array v4, v4, [Lio/fabric/sdk/android/Kit;

    new-instance v5, Lcom/twitter/sdk/android/Twitter;

    invoke-direct {v5, v1}, Lcom/twitter/sdk/android/Twitter;-><init>(Lcom/twitter/sdk/android/core/TwitterAuthConfig;)V

    aput-object v5, v4, v6

    new-instance v5, Lcom/crashlytics/android/Crashlytics;

    invoke-direct {v5}, Lcom/crashlytics/android/Crashlytics;-><init>()V

    aput-object v5, v4, v7

    invoke-static {p0, v4}, Lio/fabric/sdk/android/Fabric;->with(Landroid/content/Context;[Lio/fabric/sdk/android/Kit;)Lio/fabric/sdk/android/Fabric;

    .line 54
    invoke-virtual {p0}, Lco/getair/meerkat/MeerkatApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const-string v5, "f0935fb131ceafacf72df9498b930edd"

    invoke-static {v4, v5}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->getInstance(Landroid/content/Context;Ljava/lang/String;)Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v4

    iput-object v4, p0, Lco/getair/meerkat/MeerkatApplication;->mixpanelAPI:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    .line 56
    const-string v4, "8667f584a82f0821297dbce9d7ca2f8e"

    invoke-static {p0, v4}, Lcom/instabug/library/Instabug;->initialize(Landroid/app/Application;Ljava/lang/String;)Lcom/instabug/library/Instabug;

    move-result-object v4

    sget-object v5, Lcom/instabug/library/Instabug$IBGInvocationEvent;->IBGInvocationEventTwoFingersSwipeLeft:Lcom/instabug/library/Instabug$IBGInvocationEvent;

    .line 57
    invoke-virtual {v4, v5}, Lcom/instabug/library/Instabug;->setInvocationEvent(Lcom/instabug/library/Instabug$IBGInvocationEvent;)Lcom/instabug/library/Instabug;

    move-result-object v4

    sget-object v5, Lcom/instabug/library/Instabug$GestureMode;->TwoFingersSwipeLeft:Lcom/instabug/library/Instabug$GestureMode;

    .line 58
    invoke-virtual {v4, v5}, Lcom/instabug/library/Instabug;->setGestureInvocationMode(Lcom/instabug/library/Instabug$GestureMode;)Lcom/instabug/library/Instabug;

    move-result-object v4

    .line 59
    invoke-virtual {v4, v6}, Lcom/instabug/library/Instabug;->setIsTrackingCrashes(Z)Lcom/instabug/library/Instabug;

    move-result-object v4

    .line 60
    invoke-virtual {v4, v6}, Lcom/instabug/library/Instabug;->setWillShowStartAlert(Z)Lcom/instabug/library/Instabug;

    move-result-object v4

    .line 61
    invoke-virtual {v4, v6}, Lcom/instabug/library/Instabug;->setWillShowTutorialAlert(Z)Lcom/instabug/library/Instabug;

    move-result-object v4

    .line 62
    invoke-virtual {v4, v7}, Lcom/instabug/library/Instabug;->setCommentIsRequired(Z)Lcom/instabug/library/Instabug;

    .line 64
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v0

    .line 65
    .local v0, "applicationFacade":Lco/getair/meerkat/facades/ApplicationFacade;
    invoke-virtual {p0}, Lco/getair/meerkat/MeerkatApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v0, v4}, Lco/getair/meerkat/facades/ApplicationFacade;->startup(Landroid/content/Context;)V

    .line 68
    :try_start_0
    invoke-static {}, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->getInstance()Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;

    move-result-object v4

    const-wide/16 v6, 0x1000

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v4, p0, v5}, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->init(Landroid/content/Context;Ljava/lang/Long;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    :goto_0
    return-void

    .line 69
    :catch_0
    move-exception v3

    .line 70
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
