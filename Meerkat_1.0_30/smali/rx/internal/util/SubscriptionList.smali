.class public final Lrx/internal/util/SubscriptionList;
.super Ljava/lang/Object;
.source "SubscriptionList.java"

# interfaces
.implements Lrx/Subscription;


# instance fields
.field private final lock:Ljava/util/concurrent/locks/ReentrantLock;

.field private subscriptions:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lrx/Subscription;",
            ">;"
        }
    .end annotation
.end field

.field private volatile unsubscribed:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 40
    return-void
.end method

.method public constructor <init>(Lrx/Subscription;)V
    .locals 1
    .param p1, "s"    # Lrx/Subscription;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 47
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/LinkedList;

    .line 48
    iget-object v0, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 49
    return-void
.end method

.method public varargs constructor <init>([Lrx/Subscription;)V
    .locals 2
    .param p1, "subscriptions"    # [Lrx/Subscription;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 43
    new-instance v0, Ljava/util/LinkedList;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/LinkedList;

    .line 44
    return-void
.end method

.method private static unsubscribeFromAll(Ljava/util/Collection;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lrx/Subscription;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 133
    .local p0, "subscriptions":Ljava/util/Collection;, "Ljava/util/Collection<Lrx/Subscription;>;"
    if-nez p0, :cond_0

    .line 148
    :goto_0
    return-void

    .line 136
    :cond_0
    const/4 v1, 0x0

    .line 137
    .local v1, "es":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lrx/Subscription;

    .line 139
    .local v3, "s":Lrx/Subscription;
    :try_start_0
    invoke-interface {v3}, Lrx/Subscription;->unsubscribe()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 140
    :catch_0
    move-exception v0

    .line 141
    .local v0, "e":Ljava/lang/Throwable;
    if-nez v1, :cond_1

    .line 142
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "es":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 144
    .restart local v1    # "es":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :cond_1
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 147
    .end local v0    # "e":Ljava/lang/Throwable;
    .end local v3    # "s":Lrx/Subscription;
    :cond_2
    invoke-static {v1}, Lrx/exceptions/Exceptions;->throwIfAny(Ljava/util/List;)V

    goto :goto_0
.end method


# virtual methods
.method public add(Lrx/Subscription;)V
    .locals 3
    .param p1, "s"    # Lrx/Subscription;

    .prologue
    .line 65
    invoke-interface {p1}, Lrx/Subscription;->isUnsubscribed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 86
    :goto_0
    return-void

    .line 68
    :cond_0
    iget-boolean v1, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z

    if-nez v1, :cond_3

    .line 69
    iget-object v1, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 71
    :try_start_0
    iget-boolean v1, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z

    if-nez v1, :cond_2

    .line 72
    iget-object v0, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/LinkedList;

    .line 73
    .local v0, "subs":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lrx/Subscription;>;"
    if-nez v0, :cond_1

    .line 74
    new-instance v0, Ljava/util/LinkedList;

    .end local v0    # "subs":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lrx/Subscription;>;"
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 75
    .restart local v0    # "subs":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lrx/Subscription;>;"
    iput-object v0, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/LinkedList;

    .line 77
    :cond_1
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    iget-object v1, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_0

    .end local v0    # "subs":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lrx/Subscription;>;"
    :cond_2
    iget-object v1, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 85
    :cond_3
    invoke-interface {p1}, Lrx/Subscription;->unsubscribe()V

    goto :goto_0

    .line 81
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v1
.end method

.method public clear()V
    .locals 3

    .prologue
    .line 151
    iget-boolean v1, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z

    if-nez v1, :cond_0

    .line 153
    iget-object v1, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 155
    :try_start_0
    iget-object v0, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/LinkedList;

    .line 156
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lrx/Subscription;>;"
    const/4 v1, 0x0

    iput-object v1, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/LinkedList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 158
    iget-object v1, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 160
    invoke-static {v0}, Lrx/internal/util/SubscriptionList;->unsubscribeFromAll(Ljava/util/Collection;)V

    .line 162
    .end local v0    # "list":Ljava/util/List;, "Ljava/util/List<Lrx/Subscription;>;"
    :cond_0
    return-void

    .line 158
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v1
.end method

.method public hasSubscriptions()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 168
    iget-boolean v1, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z

    if-nez v1, :cond_1

    .line 169
    iget-object v1, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 171
    :try_start_0
    iget-boolean v1, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/LinkedList;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    .line 173
    :cond_0
    iget-object v1, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 176
    :cond_1
    return v0

    .line 173
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method public isUnsubscribed()Z
    .locals 1

    .prologue
    .line 53
    iget-boolean v0, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z

    return v0
.end method

.method public remove(Lrx/Subscription;)V
    .locals 4
    .param p1, "s"    # Lrx/Subscription;

    .prologue
    .line 89
    iget-boolean v2, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z

    if-nez v2, :cond_1

    .line 90
    const/4 v1, 0x0

    .line 91
    .local v1, "unsubscribe":Z
    iget-object v2, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 93
    :try_start_0
    iget-object v0, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/LinkedList;

    .line 94
    .local v0, "subs":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lrx/Subscription;>;"
    iget-boolean v2, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    if-nez v0, :cond_2

    .line 99
    :cond_0
    iget-object v2, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 106
    .end local v0    # "subs":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lrx/Subscription;>;"
    .end local v1    # "unsubscribe":Z
    :cond_1
    :goto_0
    return-void

    .line 97
    .restart local v0    # "subs":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lrx/Subscription;>;"
    .restart local v1    # "unsubscribe":Z
    :cond_2
    :try_start_1
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    .line 99
    iget-object v2, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 101
    if-eqz v1, :cond_1

    .line 103
    invoke-interface {p1}, Lrx/Subscription;->unsubscribe()V

    goto :goto_0

    .line 99
    .end local v0    # "subs":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lrx/Subscription;>;"
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v2
.end method

.method public unsubscribe()V
    .locals 3

    .prologue
    .line 114
    iget-boolean v1, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z

    if-nez v1, :cond_0

    .line 116
    iget-object v1, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 118
    :try_start_0
    iget-boolean v1, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 125
    iget-object v1, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 130
    :cond_0
    :goto_0
    return-void

    .line 121
    :cond_1
    const/4 v1, 0x1

    :try_start_1
    iput-boolean v1, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z

    .line 122
    iget-object v0, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/LinkedList;

    .line 123
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lrx/Subscription;>;"
    const/4 v1, 0x0

    iput-object v1, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/LinkedList;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 125
    iget-object v1, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 128
    invoke-static {v0}, Lrx/internal/util/SubscriptionList;->unsubscribeFromAll(Ljava/util/Collection;)V

    goto :goto_0

    .line 125
    .end local v0    # "list":Ljava/util/List;, "Ljava/util/List<Lrx/Subscription;>;"
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lrx/internal/util/SubscriptionList;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v1
.end method
