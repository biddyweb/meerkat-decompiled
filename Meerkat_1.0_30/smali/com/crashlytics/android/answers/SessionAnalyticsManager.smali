.class Lcom/crashlytics/android/answers/SessionAnalyticsManager;
.super Ljava/lang/Object;
.source "SessionAnalyticsManager.java"


# static fields
.field private static final EXECUTOR_SERVICE:Ljava/lang/String; = "Crashlytics SAM"

.field static final ON_CRASH_ERROR_MSG:Ljava/lang/String; = "onCrash called from main thread!!!"


# instance fields
.field final eventsHandler:Lcom/crashlytics/android/answers/SessionEventsHandler;

.field final metadata:Lcom/crashlytics/android/answers/SessionEventMetadata;


# direct methods
.method constructor <init>(Lcom/crashlytics/android/answers/SessionEventMetadata;Lcom/crashlytics/android/answers/SessionEventsHandler;)V
    .locals 0
    .param p1, "metadata"    # Lcom/crashlytics/android/answers/SessionEventMetadata;
    .param p2, "eventsHandler"    # Lcom/crashlytics/android/answers/SessionEventsHandler;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->metadata:Lcom/crashlytics/android/answers/SessionEventMetadata;

    .line 38
    iput-object p2, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->eventsHandler:Lcom/crashlytics/android/answers/SessionEventsHandler;

    .line 39
    return-void
.end method

.method public static build(Landroid/content/Context;Lcom/crashlytics/android/answers/SessionEventMetadata;Lcom/crashlytics/android/answers/SessionAnalyticsFilesManager;Lio/fabric/sdk/android/services/network/HttpRequestFactory;)Lcom/crashlytics/android/answers/SessionAnalyticsManager;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "metadata"    # Lcom/crashlytics/android/answers/SessionEventMetadata;
    .param p2, "filesManager"    # Lcom/crashlytics/android/answers/SessionAnalyticsFilesManager;
    .param p3, "httpRequestFactory"    # Lio/fabric/sdk/android/services/network/HttpRequestFactory;

    .prologue
    .line 27
    const-string v3, "Crashlytics SAM"

    invoke-static {v3}, Lio/fabric/sdk/android/services/common/ExecutorUtils;->buildSingleThreadScheduledExecutorService(Ljava/lang/String;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    .line 29
    .local v1, "executor":Ljava/util/concurrent/ScheduledExecutorService;
    new-instance v2, Lcom/crashlytics/android/answers/EnabledSessionAnalyticsManagerStrategy;

    invoke-direct {v2, p0, v1, p2, p3}, Lcom/crashlytics/android/answers/EnabledSessionAnalyticsManagerStrategy;-><init>(Landroid/content/Context;Ljava/util/concurrent/ScheduledExecutorService;Lcom/crashlytics/android/answers/SessionAnalyticsFilesManager;Lio/fabric/sdk/android/services/network/HttpRequestFactory;)V

    .line 31
    .local v2, "strategy":Lio/fabric/sdk/android/services/events/EventsStrategy;, "Lio/fabric/sdk/android/services/events/EventsStrategy<Lcom/crashlytics/android/answers/SessionEvent;>;"
    new-instance v0, Lcom/crashlytics/android/answers/SessionEventsHandler;

    invoke-direct {v0, p0, v2, p2, v1}, Lcom/crashlytics/android/answers/SessionEventsHandler;-><init>(Landroid/content/Context;Lio/fabric/sdk/android/services/events/EventsStrategy;Lcom/crashlytics/android/answers/SessionAnalyticsFilesManager;Ljava/util/concurrent/ScheduledExecutorService;)V

    .line 33
    .local v0, "eventsHandler":Lcom/crashlytics/android/answers/SessionEventsHandler;
    new-instance v3, Lcom/crashlytics/android/answers/SessionAnalyticsManager;

    invoke-direct {v3, p1, v0}, Lcom/crashlytics/android/answers/SessionAnalyticsManager;-><init>(Lcom/crashlytics/android/answers/SessionEventMetadata;Lcom/crashlytics/android/answers/SessionEventsHandler;)V

    return-object v3
.end method


# virtual methods
.method public disable()V
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->eventsHandler:Lcom/crashlytics/android/answers/SessionEventsHandler;

    invoke-virtual {v0}, Lcom/crashlytics/android/answers/SessionEventsHandler;->disable()V

    .line 115
    return-void
.end method

.method public onCrash(Ljava/lang/String;)V
    .locals 2
    .param p1, "sessionId"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 49
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "onCrash called from main thread!!!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->eventsHandler:Lcom/crashlytics/android/answers/SessionEventsHandler;

    iget-object v1, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->metadata:Lcom/crashlytics/android/answers/SessionEventMetadata;

    invoke-static {v1, p1}, Lcom/crashlytics/android/answers/SessionEvent;->buildCrashEvent(Lcom/crashlytics/android/answers/SessionEventMetadata;Ljava/lang/String;)Lcom/crashlytics/android/answers/SessionEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/crashlytics/android/answers/SessionEventsHandler;->recordEventSync(Ljava/lang/Object;)V

    .line 56
    return-void
.end method

.method public onCreate(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 72
    iget-object v0, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->eventsHandler:Lcom/crashlytics/android/answers/SessionEventsHandler;

    iget-object v1, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->metadata:Lcom/crashlytics/android/answers/SessionEventMetadata;

    sget-object v2, Lcom/crashlytics/android/answers/SessionEvent$Type;->CREATE:Lcom/crashlytics/android/answers/SessionEvent$Type;

    invoke-static {v1, v2, p1}, Lcom/crashlytics/android/answers/SessionEvent;->buildActivityLifecycleEvent(Lcom/crashlytics/android/answers/SessionEventMetadata;Lcom/crashlytics/android/answers/SessionEvent$Type;Landroid/app/Activity;)Lcom/crashlytics/android/answers/SessionEvent;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/crashlytics/android/answers/SessionEventsHandler;->recordEventAsync(Ljava/lang/Object;Z)V

    .line 74
    return-void
.end method

.method public onCustom(Ljava/lang/String;Ljava/util/Map;)V
    .locals 3
    .param p1, "customType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p2, "customAttributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->eventsHandler:Lcom/crashlytics/android/answers/SessionEventsHandler;

    iget-object v1, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->metadata:Lcom/crashlytics/android/answers/SessionEventMetadata;

    invoke-static {v1, p1, p2}, Lcom/crashlytics/android/answers/SessionEvent;->buildCustomEvent(Lcom/crashlytics/android/answers/SessionEventMetadata;Ljava/lang/String;Ljava/util/Map;)Lcom/crashlytics/android/answers/SessionEvent;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/crashlytics/android/answers/SessionEventsHandler;->recordEventAsync(Ljava/lang/Object;Z)V

    .line 65
    return-void
.end method

.method public onDestroy(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->eventsHandler:Lcom/crashlytics/android/answers/SessionEventsHandler;

    iget-object v1, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->metadata:Lcom/crashlytics/android/answers/SessionEventMetadata;

    sget-object v2, Lcom/crashlytics/android/answers/SessionEvent$Type;->DESTROY:Lcom/crashlytics/android/answers/SessionEvent$Type;

    invoke-static {v1, v2, p1}, Lcom/crashlytics/android/answers/SessionEvent;->buildActivityLifecycleEvent(Lcom/crashlytics/android/answers/SessionEventMetadata;Lcom/crashlytics/android/answers/SessionEvent$Type;Landroid/app/Activity;)Lcom/crashlytics/android/answers/SessionEvent;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/crashlytics/android/answers/SessionEventsHandler;->recordEventAsync(Ljava/lang/Object;Z)V

    .line 79
    return-void
.end method

.method public onError(Ljava/lang/String;)V
    .locals 3
    .param p1, "sessionId"    # Ljava/lang/String;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->eventsHandler:Lcom/crashlytics/android/answers/SessionEventsHandler;

    iget-object v1, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->metadata:Lcom/crashlytics/android/answers/SessionEventMetadata;

    invoke-static {v1, p1}, Lcom/crashlytics/android/answers/SessionEvent;->buildErrorEvent(Lcom/crashlytics/android/answers/SessionEventMetadata;Ljava/lang/String;)Lcom/crashlytics/android/answers/SessionEvent;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/crashlytics/android/answers/SessionEventsHandler;->recordEventAsync(Ljava/lang/Object;Z)V

    .line 60
    return-void
.end method

.method public onInstall()V
    .locals 3

    .prologue
    .line 68
    iget-object v0, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->eventsHandler:Lcom/crashlytics/android/answers/SessionEventsHandler;

    iget-object v1, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->metadata:Lcom/crashlytics/android/answers/SessionEventMetadata;

    invoke-static {v1}, Lcom/crashlytics/android/answers/SessionEvent;->buildInstallEvent(Lcom/crashlytics/android/answers/SessionEventMetadata;)Lcom/crashlytics/android/answers/SessionEvent;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/crashlytics/android/answers/SessionEventsHandler;->recordEventAsync(Ljava/lang/Object;Z)V

    .line 69
    return-void
.end method

.method public onPause(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 82
    iget-object v0, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->eventsHandler:Lcom/crashlytics/android/answers/SessionEventsHandler;

    iget-object v1, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->metadata:Lcom/crashlytics/android/answers/SessionEventMetadata;

    sget-object v2, Lcom/crashlytics/android/answers/SessionEvent$Type;->PAUSE:Lcom/crashlytics/android/answers/SessionEvent$Type;

    invoke-static {v1, v2, p1}, Lcom/crashlytics/android/answers/SessionEvent;->buildActivityLifecycleEvent(Lcom/crashlytics/android/answers/SessionEventMetadata;Lcom/crashlytics/android/answers/SessionEvent$Type;Landroid/app/Activity;)Lcom/crashlytics/android/answers/SessionEvent;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/crashlytics/android/answers/SessionEventsHandler;->recordEventAsync(Ljava/lang/Object;Z)V

    .line 84
    return-void
.end method

.method public onResume(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 87
    iget-object v0, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->eventsHandler:Lcom/crashlytics/android/answers/SessionEventsHandler;

    iget-object v1, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->metadata:Lcom/crashlytics/android/answers/SessionEventMetadata;

    sget-object v2, Lcom/crashlytics/android/answers/SessionEvent$Type;->RESUME:Lcom/crashlytics/android/answers/SessionEvent$Type;

    invoke-static {v1, v2, p1}, Lcom/crashlytics/android/answers/SessionEvent;->buildActivityLifecycleEvent(Lcom/crashlytics/android/answers/SessionEventMetadata;Lcom/crashlytics/android/answers/SessionEvent$Type;Landroid/app/Activity;)Lcom/crashlytics/android/answers/SessionEvent;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/crashlytics/android/answers/SessionEventsHandler;->recordEventAsync(Ljava/lang/Object;Z)V

    .line 89
    return-void
.end method

.method public onSaveInstanceState(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->eventsHandler:Lcom/crashlytics/android/answers/SessionEventsHandler;

    iget-object v1, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->metadata:Lcom/crashlytics/android/answers/SessionEventMetadata;

    sget-object v2, Lcom/crashlytics/android/answers/SessionEvent$Type;->SAVE_INSTANCE_STATE:Lcom/crashlytics/android/answers/SessionEvent$Type;

    invoke-static {v1, v2, p1}, Lcom/crashlytics/android/answers/SessionEvent;->buildActivityLifecycleEvent(Lcom/crashlytics/android/answers/SessionEventMetadata;Lcom/crashlytics/android/answers/SessionEvent$Type;Landroid/app/Activity;)Lcom/crashlytics/android/answers/SessionEvent;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/crashlytics/android/answers/SessionEventsHandler;->recordEventAsync(Ljava/lang/Object;Z)V

    .line 94
    return-void
.end method

.method public onStart(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 97
    iget-object v0, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->eventsHandler:Lcom/crashlytics/android/answers/SessionEventsHandler;

    iget-object v1, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->metadata:Lcom/crashlytics/android/answers/SessionEventMetadata;

    sget-object v2, Lcom/crashlytics/android/answers/SessionEvent$Type;->START:Lcom/crashlytics/android/answers/SessionEvent$Type;

    invoke-static {v1, v2, p1}, Lcom/crashlytics/android/answers/SessionEvent;->buildActivityLifecycleEvent(Lcom/crashlytics/android/answers/SessionEventMetadata;Lcom/crashlytics/android/answers/SessionEvent$Type;Landroid/app/Activity;)Lcom/crashlytics/android/answers/SessionEvent;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/crashlytics/android/answers/SessionEventsHandler;->recordEventAsync(Ljava/lang/Object;Z)V

    .line 99
    return-void
.end method

.method public onStop(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 102
    iget-object v0, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->eventsHandler:Lcom/crashlytics/android/answers/SessionEventsHandler;

    iget-object v1, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->metadata:Lcom/crashlytics/android/answers/SessionEventMetadata;

    sget-object v2, Lcom/crashlytics/android/answers/SessionEvent$Type;->STOP:Lcom/crashlytics/android/answers/SessionEvent$Type;

    invoke-static {v1, v2, p1}, Lcom/crashlytics/android/answers/SessionEvent;->buildActivityLifecycleEvent(Lcom/crashlytics/android/answers/SessionEventMetadata;Lcom/crashlytics/android/answers/SessionEvent$Type;Landroid/app/Activity;)Lcom/crashlytics/android/answers/SessionEvent;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/crashlytics/android/answers/SessionEventsHandler;->recordEventAsync(Ljava/lang/Object;Z)V

    .line 104
    return-void
.end method

.method public setAnalyticsSettingsData(Lio/fabric/sdk/android/services/settings/AnalyticsSettingsData;Ljava/lang/String;)V
    .locals 1
    .param p1, "analyticsSettingsData"    # Lio/fabric/sdk/android/services/settings/AnalyticsSettingsData;
    .param p2, "protocolAndHostOverride"    # Ljava/lang/String;

    .prologue
    .line 110
    iget-object v0, p0, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->eventsHandler:Lcom/crashlytics/android/answers/SessionEventsHandler;

    invoke-virtual {v0, p1, p2}, Lcom/crashlytics/android/answers/SessionEventsHandler;->setAnalyticsSettingsData(Lio/fabric/sdk/android/services/settings/AnalyticsSettingsData;Ljava/lang/String;)V

    .line 111
    return-void
.end method
