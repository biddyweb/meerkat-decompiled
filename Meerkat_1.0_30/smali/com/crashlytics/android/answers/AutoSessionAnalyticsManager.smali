.class Lcom/crashlytics/android/answers/AutoSessionAnalyticsManager;
.super Lcom/crashlytics/android/answers/SessionAnalyticsManager;
.source "AutoSessionAnalyticsManager.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xe
.end annotation


# static fields
.field private static final EXECUTOR_SERVICE:Ljava/lang/String; = "Crashlytics Trace Manager"


# instance fields
.field private final activityLifecycleCallbacks:Landroid/app/Application$ActivityLifecycleCallbacks;

.field private final application:Landroid/app/Application;


# direct methods
.method constructor <init>(Lcom/crashlytics/android/answers/SessionEventMetadata;Lcom/crashlytics/android/answers/SessionEventsHandler;Landroid/app/Application;)V
    .locals 2
    .param p1, "metadata"    # Lcom/crashlytics/android/answers/SessionEventMetadata;
    .param p2, "eventsHandler"    # Lcom/crashlytics/android/answers/SessionEventsHandler;
    .param p3, "application"    # Landroid/app/Application;

    .prologue
    .line 76
    invoke-direct {p0, p1, p2}, Lcom/crashlytics/android/answers/SessionAnalyticsManager;-><init>(Lcom/crashlytics/android/answers/SessionEventMetadata;Lcom/crashlytics/android/answers/SessionEventsHandler;)V

    .line 24
    new-instance v0, Lcom/crashlytics/android/answers/AutoSessionAnalyticsManager$1;

    invoke-direct {v0, p0}, Lcom/crashlytics/android/answers/AutoSessionAnalyticsManager$1;-><init>(Lcom/crashlytics/android/answers/AutoSessionAnalyticsManager;)V

    iput-object v0, p0, Lcom/crashlytics/android/answers/AutoSessionAnalyticsManager;->activityLifecycleCallbacks:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 77
    iput-object p3, p0, Lcom/crashlytics/android/answers/AutoSessionAnalyticsManager;->application:Landroid/app/Application;

    .line 78
    invoke-static {}, Lcom/crashlytics/android/answers/Answers;->getInstance()Lcom/crashlytics/android/answers/Answers;

    move-result-object v0

    invoke-virtual {v0}, Lcom/crashlytics/android/answers/Answers;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Registering activity lifecycle callbacks for session analytics."

    invoke-static {v0, v1}, Lio/fabric/sdk/android/services/common/CommonUtils;->logControlled(Landroid/content/Context;Ljava/lang/String;)V

    .line 80
    iget-object v0, p0, Lcom/crashlytics/android/answers/AutoSessionAnalyticsManager;->activityLifecycleCallbacks:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {p3, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 81
    return-void
.end method

.method public static build(Landroid/app/Application;Lcom/crashlytics/android/answers/SessionEventMetadata;Lcom/crashlytics/android/answers/SessionAnalyticsFilesManager;Lio/fabric/sdk/android/services/network/HttpRequestFactory;)Lcom/crashlytics/android/answers/AutoSessionAnalyticsManager;
    .locals 4
    .param p0, "application"    # Landroid/app/Application;
    .param p1, "metadata"    # Lcom/crashlytics/android/answers/SessionEventMetadata;
    .param p2, "filesManager"    # Lcom/crashlytics/android/answers/SessionAnalyticsFilesManager;
    .param p3, "httpRequestFactory"    # Lio/fabric/sdk/android/services/network/HttpRequestFactory;

    .prologue
    .line 65
    const-string v3, "Crashlytics Trace Manager"

    invoke-static {v3}, Lio/fabric/sdk/android/services/common/ExecutorUtils;->buildSingleThreadScheduledExecutorService(Ljava/lang/String;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    .line 67
    .local v1, "executor":Ljava/util/concurrent/ScheduledExecutorService;
    new-instance v2, Lcom/crashlytics/android/answers/EnabledSessionAnalyticsManagerStrategy;

    invoke-direct {v2, p0, v1, p2, p3}, Lcom/crashlytics/android/answers/EnabledSessionAnalyticsManagerStrategy;-><init>(Landroid/content/Context;Ljava/util/concurrent/ScheduledExecutorService;Lcom/crashlytics/android/answers/SessionAnalyticsFilesManager;Lio/fabric/sdk/android/services/network/HttpRequestFactory;)V

    .line 69
    .local v2, "strategy":Lio/fabric/sdk/android/services/events/EventsStrategy;, "Lio/fabric/sdk/android/services/events/EventsStrategy<Lcom/crashlytics/android/answers/SessionEvent;>;"
    new-instance v0, Lcom/crashlytics/android/answers/SessionEventsHandler;

    invoke-direct {v0, p0, v2, p2, v1}, Lcom/crashlytics/android/answers/SessionEventsHandler;-><init>(Landroid/content/Context;Lio/fabric/sdk/android/services/events/EventsStrategy;Lcom/crashlytics/android/answers/SessionAnalyticsFilesManager;Ljava/util/concurrent/ScheduledExecutorService;)V

    .line 71
    .local v0, "eventsHandler":Lcom/crashlytics/android/answers/SessionEventsHandler;
    new-instance v3, Lcom/crashlytics/android/answers/AutoSessionAnalyticsManager;

    invoke-direct {v3, p1, v0, p0}, Lcom/crashlytics/android/answers/AutoSessionAnalyticsManager;-><init>(Lcom/crashlytics/android/answers/SessionEventMetadata;Lcom/crashlytics/android/answers/SessionEventsHandler;Landroid/app/Application;)V

    return-object v3
.end method


# virtual methods
.method public disable()V
    .locals 2

    .prologue
    .line 85
    invoke-static {}, Lcom/crashlytics/android/answers/Answers;->getInstance()Lcom/crashlytics/android/answers/Answers;

    move-result-object v0

    invoke-virtual {v0}, Lcom/crashlytics/android/answers/Answers;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Unregistering activity lifecycle callbacks for session analytics"

    invoke-static {v0, v1}, Lio/fabric/sdk/android/services/common/CommonUtils;->logControlled(Landroid/content/Context;Ljava/lang/String;)V

    .line 87
    iget-object v0, p0, Lcom/crashlytics/android/answers/AutoSessionAnalyticsManager;->application:Landroid/app/Application;

    iget-object v1, p0, Lcom/crashlytics/android/answers/AutoSessionAnalyticsManager;->activityLifecycleCallbacks:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {v0, v1}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 88
    invoke-super {p0}, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->disable()V

    .line 89
    return-void
.end method
