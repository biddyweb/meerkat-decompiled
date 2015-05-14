.class public final Lrx/internal/util/SubscriptionRandomList;
.super Ljava/lang/Object;
.source "SubscriptionRandomList.java"

# interfaces
.implements Lrx/Subscription;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lrx/Subscription;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/Subscription;"
    }
.end annotation


# instance fields
.field private subscriptions:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<TT;>;"
        }
    .end annotation
.end field

.field private unsubscribed:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    .local p0, "this":Lrx/internal/util/SubscriptionRandomList;, "Lrx/internal/util/SubscriptionRandomList<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput-boolean v0, p0, Lrx/internal/util/SubscriptionRandomList;->unsubscribed:Z

    .line 40
    return-void
.end method

.method public varargs constructor <init>([Lrx/Subscription;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lrx/internal/util/SubscriptionRandomList;, "Lrx/internal/util/SubscriptionRandomList<TT;>;"
    .local p1, "subscriptions":[Lrx/Subscription;, "[TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput-boolean v0, p0, Lrx/internal/util/SubscriptionRandomList;->unsubscribed:Z

    .line 43
    new-instance v0, Ljava/util/HashSet;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lrx/internal/util/SubscriptionRandomList;->subscriptions:Ljava/util/Set;

    .line 44
    return-void
.end method

.method private static unsubscribeFromAll(Ljava/util/Collection;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lrx/Subscription;",
            ">(",
            "Ljava/util/Collection",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 144
    .local p0, "subscriptions":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    if-nez p0, :cond_0

    .line 159
    :goto_0
    return-void

    .line 147
    :cond_0
    const/4 v1, 0x0

    .line 148
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

    .line 150
    .local v3, "s":Lrx/Subscription;, "TT;"
    :try_start_0
    invoke-interface {v3}, Lrx/Subscription;->unsubscribe()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 151
    :catch_0
    move-exception v0

    .line 152
    .local v0, "e":Ljava/lang/Throwable;
    if-nez v1, :cond_1

    .line 153
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "es":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 155
    .restart local v1    # "es":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :cond_1
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 158
    .end local v0    # "e":Ljava/lang/Throwable;
    .end local v3    # "s":Lrx/Subscription;, "TT;"
    :cond_2
    invoke-static {v1}, Lrx/exceptions/Exceptions;->throwIfAny(Ljava/util/List;)V

    goto :goto_0
.end method


# virtual methods
.method public add(Lrx/Subscription;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 60
    .local p0, "this":Lrx/internal/util/SubscriptionRandomList;, "Lrx/internal/util/SubscriptionRandomList<TT;>;"
    .local p1, "s":Lrx/Subscription;, "TT;"
    const/4 v0, 0x0

    .line 61
    .local v0, "unsubscribe":Lrx/Subscription;
    monitor-enter p0

    .line 62
    :try_start_0
    iget-boolean v1, p0, Lrx/internal/util/SubscriptionRandomList;->unsubscribed:Z

    if-eqz v1, :cond_1

    .line 63
    move-object v0, p1

    .line 70
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    if-eqz v0, :cond_0

    .line 73
    invoke-interface {v0}, Lrx/Subscription;->unsubscribe()V

    .line 75
    :cond_0
    return-void

    .line 65
    :cond_1
    :try_start_1
    iget-object v1, p0, Lrx/internal/util/SubscriptionRandomList;->subscriptions:Ljava/util/Set;

    if-nez v1, :cond_2

    .line 66
    new-instance v1, Ljava/util/HashSet;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(I)V

    iput-object v1, p0, Lrx/internal/util/SubscriptionRandomList;->subscriptions:Ljava/util/Set;

    .line 68
    :cond_2
    iget-object v1, p0, Lrx/internal/util/SubscriptionRandomList;->subscriptions:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 70
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public clear()V
    .locals 2

    .prologue
    .line 103
    .local p0, "this":Lrx/internal/util/SubscriptionRandomList;, "Lrx/internal/util/SubscriptionRandomList<TT;>;"
    const/4 v0, 0x0

    .line 104
    .local v0, "unsubscribe":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    monitor-enter p0

    .line 105
    :try_start_0
    iget-boolean v1, p0, Lrx/internal/util/SubscriptionRandomList;->unsubscribed:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lrx/internal/util/SubscriptionRandomList;->subscriptions:Ljava/util/Set;

    if-nez v1, :cond_1

    .line 106
    :cond_0
    monitor-exit p0

    .line 113
    :goto_0
    return-void

    .line 108
    :cond_1
    iget-object v0, p0, Lrx/internal/util/SubscriptionRandomList;->subscriptions:Ljava/util/Set;

    .line 109
    const/4 v1, 0x0

    iput-object v1, p0, Lrx/internal/util/SubscriptionRandomList;->subscriptions:Ljava/util/Set;

    .line 111
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    invoke-static {v0}, Lrx/internal/util/SubscriptionRandomList;->unsubscribeFromAll(Ljava/util/Collection;)V

    goto :goto_0

    .line 111
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public forEach(Lrx/functions/Action1;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action1",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, "this":Lrx/internal/util/SubscriptionRandomList;, "Lrx/internal/util/SubscriptionRandomList<TT;>;"
    .local p1, "action":Lrx/functions/Action1;, "Lrx/functions/Action1<TT;>;"
    const/4 v4, 0x0

    .line 117
    .local v4, "ss":[Lrx/Subscription;, "[TT;"
    monitor-enter p0

    .line 118
    :try_start_0
    iget-boolean v6, p0, Lrx/internal/util/SubscriptionRandomList;->unsubscribed:Z

    if-nez v6, :cond_0

    iget-object v6, p0, Lrx/internal/util/SubscriptionRandomList;->subscriptions:Ljava/util/Set;

    if-nez v6, :cond_2

    .line 119
    :cond_0
    monitor-exit p0

    .line 126
    :cond_1
    return-void

    .line 121
    :cond_2
    iget-object v6, p0, Lrx/internal/util/SubscriptionRandomList;->subscriptions:Ljava/util/Set;

    invoke-interface {v6, v4}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, [Lrx/Subscription;

    move-object v4, v0

    .line 122
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 123
    move-object v1, v4

    .local v1, "arr$":[Lrx/Subscription;
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v5, v1, v2

    .line 124
    .local v5, "t":Lrx/Subscription;, "TT;"
    invoke-interface {p1, v5}, Lrx/functions/Action1;->call(Ljava/lang/Object;)V

    .line 123
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 122
    .end local v1    # "arr$":[Lrx/Subscription;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v5    # "t":Lrx/Subscription;, "TT;"
    :catchall_0
    move-exception v6

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v6
.end method

.method public declared-synchronized isUnsubscribed()Z
    .locals 1

    .prologue
    .line 48
    .local p0, "this":Lrx/internal/util/SubscriptionRandomList;, "Lrx/internal/util/SubscriptionRandomList<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lrx/internal/util/SubscriptionRandomList;->unsubscribed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public remove(Lrx/Subscription;)V
    .locals 2
    .param p1, "s"    # Lrx/Subscription;

    .prologue
    .line 84
    .local p0, "this":Lrx/internal/util/SubscriptionRandomList;, "Lrx/internal/util/SubscriptionRandomList<TT;>;"
    const/4 v0, 0x0

    .line 85
    .local v0, "unsubscribe":Z
    monitor-enter p0

    .line 86
    :try_start_0
    iget-boolean v1, p0, Lrx/internal/util/SubscriptionRandomList;->unsubscribed:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lrx/internal/util/SubscriptionRandomList;->subscriptions:Ljava/util/Set;

    if-nez v1, :cond_2

    .line 87
    :cond_0
    monitor-exit p0

    .line 95
    :cond_1
    :goto_0
    return-void

    .line 89
    :cond_2
    iget-object v1, p0, Lrx/internal/util/SubscriptionRandomList;->subscriptions:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 90
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    if-eqz v0, :cond_1

    .line 93
    invoke-interface {p1}, Lrx/Subscription;->unsubscribe()V

    goto :goto_0

    .line 90
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public unsubscribe()V
    .locals 2

    .prologue
    .line 130
    .local p0, "this":Lrx/internal/util/SubscriptionRandomList;, "Lrx/internal/util/SubscriptionRandomList<TT;>;"
    const/4 v0, 0x0

    .line 131
    .local v0, "unsubscribe":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    monitor-enter p0

    .line 132
    :try_start_0
    iget-boolean v1, p0, Lrx/internal/util/SubscriptionRandomList;->unsubscribed:Z

    if-eqz v1, :cond_0

    .line 133
    monitor-exit p0

    .line 141
    :goto_0
    return-void

    .line 135
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lrx/internal/util/SubscriptionRandomList;->unsubscribed:Z

    .line 136
    iget-object v0, p0, Lrx/internal/util/SubscriptionRandomList;->subscriptions:Ljava/util/Set;

    .line 137
    const/4 v1, 0x0

    iput-object v1, p0, Lrx/internal/util/SubscriptionRandomList;->subscriptions:Ljava/util/Set;

    .line 138
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 140
    invoke-static {v0}, Lrx/internal/util/SubscriptionRandomList;->unsubscribeFromAll(Ljava/util/Collection;)V

    goto :goto_0

    .line 138
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
