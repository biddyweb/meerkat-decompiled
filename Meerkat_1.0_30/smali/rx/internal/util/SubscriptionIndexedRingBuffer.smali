.class public final Lrx/internal/util/SubscriptionIndexedRingBuffer;
.super Ljava/lang/Object;
.source "SubscriptionIndexedRingBuffer.java"

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


# static fields
.field private static final UNSUBSCRIBE:Lrx/functions/Func1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/functions/Func1",
            "<",
            "Lrx/Subscription;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final UNSUBSCRIBED:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater",
            "<",
            "Lrx/internal/util/SubscriptionIndexedRingBuffer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private volatile subscriptions:Lrx/internal/util/IndexedRingBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/util/IndexedRingBuffer",
            "<TT;>;"
        }
    .end annotation
.end field

.field private volatile unsubscribed:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 34
    const-class v0, Lrx/internal/util/SubscriptionIndexedRingBuffer;

    const-string v1, "unsubscribed"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->UNSUBSCRIBED:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 143
    new-instance v0, Lrx/internal/util/SubscriptionIndexedRingBuffer$1;

    invoke-direct {v0}, Lrx/internal/util/SubscriptionIndexedRingBuffer$1;-><init>()V

    sput-object v0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->UNSUBSCRIBE:Lrx/functions/Func1;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    .local p0, "this":Lrx/internal/util/SubscriptionIndexedRingBuffer;, "Lrx/internal/util/SubscriptionIndexedRingBuffer<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    invoke-static {}, Lrx/internal/util/IndexedRingBuffer;->getInstance()Lrx/internal/util/IndexedRingBuffer;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->subscriptions:Lrx/internal/util/IndexedRingBuffer;

    .line 32
    const/4 v0, 0x0

    iput v0, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->unsubscribed:I

    .line 37
    return-void
.end method

.method public varargs constructor <init>([Lrx/Subscription;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lrx/internal/util/SubscriptionIndexedRingBuffer;, "Lrx/internal/util/SubscriptionIndexedRingBuffer<TT;>;"
    .local p1, "subscriptions":[Lrx/Subscription;, "[TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    invoke-static {}, Lrx/internal/util/IndexedRingBuffer;->getInstance()Lrx/internal/util/IndexedRingBuffer;

    move-result-object v4

    iput-object v4, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->subscriptions:Lrx/internal/util/IndexedRingBuffer;

    .line 32
    const/4 v4, 0x0

    iput v4, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->unsubscribed:I

    .line 40
    move-object v0, p1

    .local v0, "arr$":[Lrx/Subscription;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 41
    .local v3, "t":Lrx/Subscription;, "TT;"
    iget-object v4, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->subscriptions:Lrx/internal/util/IndexedRingBuffer;

    invoke-virtual {v4, v3}, Lrx/internal/util/IndexedRingBuffer;->add(Ljava/lang/Object;)I

    .line 40
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 43
    .end local v3    # "t":Lrx/Subscription;, "TT;"
    :cond_0
    return-void
.end method

.method private static unsubscribeFromAll(Lrx/internal/util/IndexedRingBuffer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/util/IndexedRingBuffer",
            "<+",
            "Lrx/Subscription;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 135
    .local p0, "subscriptions":Lrx/internal/util/IndexedRingBuffer;, "Lrx/internal/util/IndexedRingBuffer<+Lrx/Subscription;>;"
    if-nez p0, :cond_0

    .line 141
    :goto_0
    return-void

    .line 140
    :cond_0
    sget-object v0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->UNSUBSCRIBE:Lrx/functions/Func1;

    invoke-virtual {p0, v0}, Lrx/internal/util/IndexedRingBuffer;->forEach(Lrx/functions/Func1;)I

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized add(Lrx/Subscription;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .local p0, "this":Lrx/internal/util/SubscriptionIndexedRingBuffer;, "Lrx/internal/util/SubscriptionIndexedRingBuffer<TT;>;"
    .local p1, "s":Lrx/Subscription;, "TT;"
    const/4 v2, 0x1

    .line 62
    monitor-enter p0

    :try_start_0
    iget v1, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->unsubscribed:I

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->subscriptions:Lrx/internal/util/IndexedRingBuffer;

    if-nez v1, :cond_2

    .line 63
    :cond_0
    invoke-interface {p1}, Lrx/Subscription;->unsubscribe()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    const/4 v0, -0x1

    .line 71
    :cond_1
    :goto_0
    monitor-exit p0

    return v0

    .line 66
    :cond_2
    :try_start_1
    iget-object v1, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->subscriptions:Lrx/internal/util/IndexedRingBuffer;

    invoke-virtual {v1, p1}, Lrx/internal/util/IndexedRingBuffer;->add(Ljava/lang/Object;)I

    move-result v0

    .line 68
    .local v0, "n":I
    iget v1, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->unsubscribed:I

    if-ne v1, v2, :cond_1

    .line 69
    invoke-interface {p1}, Lrx/Subscription;->unsubscribe()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 62
    .end local v0    # "n":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public forEach(Lrx/functions/Func1;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func1",
            "<TT;",
            "Ljava/lang/Boolean;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 118
    .local p0, "this":Lrx/internal/util/SubscriptionIndexedRingBuffer;, "Lrx/internal/util/SubscriptionIndexedRingBuffer<TT;>;"
    .local p1, "action":Lrx/functions/Func1;, "Lrx/functions/Func1<TT;Ljava/lang/Boolean;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lrx/internal/util/SubscriptionIndexedRingBuffer;->forEach(Lrx/functions/Func1;I)I

    move-result v0

    return v0
.end method

.method public declared-synchronized forEach(Lrx/functions/Func1;I)I
    .locals 2
    .param p2, "startIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func1",
            "<TT;",
            "Ljava/lang/Boolean;",
            ">;I)I"
        }
    .end annotation

    .prologue
    .line 128
    .local p0, "this":Lrx/internal/util/SubscriptionIndexedRingBuffer;, "Lrx/internal/util/SubscriptionIndexedRingBuffer<TT;>;"
    .local p1, "action":Lrx/functions/Func1;, "Lrx/functions/Func1<TT;Ljava/lang/Boolean;>;"
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->unsubscribed:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->subscriptions:Lrx/internal/util/IndexedRingBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_1

    .line 129
    :cond_0
    const/4 v0, 0x0

    .line 131
    :goto_0
    monitor-exit p0

    return v0

    :cond_1
    :try_start_1
    iget-object v0, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->subscriptions:Lrx/internal/util/IndexedRingBuffer;

    invoke-virtual {v0, p1, p2}, Lrx/internal/util/IndexedRingBuffer;->forEach(Lrx/functions/Func1;I)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_0

    .line 128
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isUnsubscribed()Z
    .locals 2

    .prologue
    .local p0, "this":Lrx/internal/util/SubscriptionIndexedRingBuffer;, "Lrx/internal/util/SubscriptionIndexedRingBuffer<TT;>;"
    const/4 v0, 0x1

    .line 47
    iget v1, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->unsubscribed:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public remove(I)V
    .locals 3
    .param p1, "n"    # I

    .prologue
    .line 81
    .local p0, "this":Lrx/internal/util/SubscriptionIndexedRingBuffer;, "Lrx/internal/util/SubscriptionIndexedRingBuffer<TT;>;"
    iget v1, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->unsubscribed:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->subscriptions:Lrx/internal/util/IndexedRingBuffer;

    if-eqz v1, :cond_0

    if-gez p1, :cond_1

    .line 91
    :cond_0
    :goto_0
    return-void

    .line 84
    :cond_1
    iget-object v1, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->subscriptions:Lrx/internal/util/IndexedRingBuffer;

    invoke-virtual {v1, p1}, Lrx/internal/util/IndexedRingBuffer;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/Subscription;

    .line 85
    .local v0, "t":Lrx/Subscription;
    if-eqz v0, :cond_0

    .line 87
    if-eqz v0, :cond_0

    .line 88
    invoke-interface {v0}, Lrx/Subscription;->unsubscribe()V

    goto :goto_0
.end method

.method public removeSilently(I)V
    .locals 2
    .param p1, "n"    # I

    .prologue
    .line 99
    .local p0, "this":Lrx/internal/util/SubscriptionIndexedRingBuffer;, "Lrx/internal/util/SubscriptionIndexedRingBuffer<TT;>;"
    iget v0, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->unsubscribed:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->subscriptions:Lrx/internal/util/IndexedRingBuffer;

    if-eqz v0, :cond_0

    if-gez p1, :cond_1

    .line 103
    :cond_0
    :goto_0
    return-void

    .line 102
    :cond_1
    iget-object v0, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->subscriptions:Lrx/internal/util/IndexedRingBuffer;

    invoke-virtual {v0, p1}, Lrx/internal/util/IndexedRingBuffer;->remove(I)Ljava/lang/Object;

    goto :goto_0
.end method

.method public unsubscribe()V
    .locals 4

    .prologue
    .line 107
    .local p0, "this":Lrx/internal/util/SubscriptionIndexedRingBuffer;, "Lrx/internal/util/SubscriptionIndexedRingBuffer<TT;>;"
    sget-object v1, Lrx/internal/util/SubscriptionIndexedRingBuffer;->UNSUBSCRIBED:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, p0, v2, v3}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->subscriptions:Lrx/internal/util/IndexedRingBuffer;

    if-eqz v1, :cond_0

    .line 109
    iget-object v1, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->subscriptions:Lrx/internal/util/IndexedRingBuffer;

    invoke-static {v1}, Lrx/internal/util/SubscriptionIndexedRingBuffer;->unsubscribeFromAll(Lrx/internal/util/IndexedRingBuffer;)V

    .line 111
    iget-object v0, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->subscriptions:Lrx/internal/util/IndexedRingBuffer;

    .line 112
    .local v0, "s":Lrx/internal/util/IndexedRingBuffer;, "Lrx/internal/util/IndexedRingBuffer<TT;>;"
    const/4 v1, 0x0

    iput-object v1, p0, Lrx/internal/util/SubscriptionIndexedRingBuffer;->subscriptions:Lrx/internal/util/IndexedRingBuffer;

    .line 113
    invoke-virtual {v0}, Lrx/internal/util/IndexedRingBuffer;->unsubscribe()V

    .line 115
    .end local v0    # "s":Lrx/internal/util/IndexedRingBuffer;, "Lrx/internal/util/IndexedRingBuffer<TT;>;"
    :cond_0
    return-void
.end method
