.class Lcom/mixpanel/android/mpmetrics/MixpanelAPI$SupportedUpdatesListener;
.super Ljava/lang/Object;
.source "MixpanelAPI.java"

# interfaces
.implements Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UpdatesListener;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SupportedUpdatesListener"
.end annotation


# instance fields
.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private final mListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;


# direct methods
.method private constructor <init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)V
    .locals 1

    .prologue
    .line 1661
    iput-object p1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$SupportedUpdatesListener;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1690
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$SupportedUpdatesListener;->mListeners:Ljava/util/Set;

    .line 1691
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$SupportedUpdatesListener;->mExecutor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method synthetic constructor <init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;Lcom/mixpanel/android/mpmetrics/MixpanelAPI$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
    .param p2, "x1"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI$1;

    .prologue
    .line 1661
    invoke-direct {p0, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$SupportedUpdatesListener;-><init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)V

    return-void
.end method


# virtual methods
.method public declared-synchronized addOnMixpanelUpdatesReceivedListener(Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;

    .prologue
    .line 1669
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$SupportedUpdatesListener;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mDecideMessages:Lcom/mixpanel/android/mpmetrics/DecideMessages;
    invoke-static {v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$500(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/DecideMessages;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/DecideMessages;->hasUpdatesAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1670
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$SupportedUpdatesListener;->onNewResults()V

    .line 1673
    :cond_0
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$SupportedUpdatesListener;->mListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1674
    monitor-exit p0

    return-void

    .line 1669
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onNewResults()V
    .locals 1

    .prologue
    .line 1664
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$SupportedUpdatesListener;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v0, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1665
    return-void
.end method

.method public declared-synchronized removeOnMixpanelUpdatesReceivedListener(Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;

    .prologue
    .line 1678
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$SupportedUpdatesListener;->mListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1679
    monitor-exit p0

    return-void

    .line 1678
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized run()V
    .locals 3

    .prologue
    .line 1685
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$SupportedUpdatesListener;->mListeners:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;

    .line 1686
    .local v0, "listener":Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;
    invoke-interface {v0}, Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;->onMixpanelUpdatesReceived()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 1685
    .end local v0    # "listener":Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 1688
    :cond_0
    monitor-exit p0

    return-void
.end method
