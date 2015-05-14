.class Lcom/twitter/sdk/android/core/internal/scribe/ScribeHandler;
.super Lio/fabric/sdk/android/services/events/EventsHandler;
.source "ScribeHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/fabric/sdk/android/services/events/EventsHandler",
        "<",
        "Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Lio/fabric/sdk/android/services/events/EventsStrategy;Lio/fabric/sdk/android/services/events/EventsFilesManager;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "filesManager"    # Lio/fabric/sdk/android/services/events/EventsFilesManager;
    .param p4, "executorService"    # Ljava/util/concurrent/ScheduledExecutorService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lio/fabric/sdk/android/services/events/EventsStrategy",
            "<",
            "Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;",
            ">;",
            "Lio/fabric/sdk/android/services/events/EventsFilesManager;",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ")V"
        }
    .end annotation

    .prologue
    .line 16
    .local p2, "strategy":Lio/fabric/sdk/android/services/events/EventsStrategy;, "Lio/fabric/sdk/android/services/events/EventsStrategy<Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Lio/fabric/sdk/android/services/events/EventsHandler;-><init>(Landroid/content/Context;Lio/fabric/sdk/android/services/events/EventsStrategy;Lio/fabric/sdk/android/services/events/EventsFilesManager;Ljava/util/concurrent/ScheduledExecutorService;)V

    .line 17
    return-void
.end method


# virtual methods
.method protected getDisabledEventsStrategy()Lio/fabric/sdk/android/services/events/EventsStrategy;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/fabric/sdk/android/services/events/EventsStrategy",
            "<",
            "Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 35
    new-instance v0, Lio/fabric/sdk/android/services/events/DisabledEventsStrategy;

    invoke-direct {v0}, Lio/fabric/sdk/android/services/events/DisabledEventsStrategy;-><init>()V

    return-object v0
.end method

.method public scribe(Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;

    .prologue
    .line 23
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeHandler;->recordEventAsync(Ljava/lang/Object;Z)V

    .line 24
    return-void
.end method

.method public scribeAndFlush(Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;

    .prologue
    .line 30
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeHandler;->recordEventAsync(Ljava/lang/Object;Z)V

    .line 31
    return-void
.end method
