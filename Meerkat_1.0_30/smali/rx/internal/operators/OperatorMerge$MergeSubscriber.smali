.class final Lrx/internal/operators/OperatorMerge$MergeSubscriber;
.super Lrx/Subscriber;
.source "OperatorMerge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorMerge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MergeSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/Subscriber",
        "<",
        "Lrx/Observable",
        "<+TT;>;>;"
    }
.end annotation


# instance fields
.field final DRAIN_ACTION:Lrx/functions/Func1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/functions/Func1",
            "<",
            "Lrx/internal/operators/OperatorMerge$InnerSubscriber",
            "<TT;>;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field final actual:Lrx/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field private volatile childrenSubscribers:Lrx/internal/util/SubscriptionIndexedRingBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/util/SubscriptionIndexedRingBuffer",
            "<",
            "Lrx/internal/operators/OperatorMerge$InnerSubscriber",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field private completed:Z

.field private final delayErrors:Z

.field private emitLock:Z

.field private exceptions:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field lastDrainedIndex:I

.field private final mergeProducer:Lrx/internal/operators/OperatorMerge$MergeProducer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorMerge$MergeProducer",
            "<TT;>;"
        }
    .end annotation
.end field

.field private missedEmitting:I

.field final on:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite",
            "<TT;>;"
        }
    .end annotation
.end field

.field private volatile scalarValueQueue:Lrx/internal/util/RxRingBuffer;

.field private wip:I


# direct methods
.method public constructor <init>(Lrx/Subscriber;Z)V
    .locals 2
    .param p2, "delayErrors"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;Z)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    .local p1, "actual":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    const/4 v1, 0x0

    .line 153
    invoke-direct {p0, p1}, Lrx/Subscriber;-><init>(Lrx/Subscriber;)V

    .line 121
    invoke-static {}, Lrx/internal/operators/NotificationLite;->instance()Lrx/internal/operators/NotificationLite;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->on:Lrx/internal/operators/NotificationLite;

    .line 131
    const/4 v0, 0x0

    iput-object v0, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->scalarValueQueue:Lrx/internal/util/RxRingBuffer;

    .line 134
    iput v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->missedEmitting:I

    .line 135
    iput-boolean v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->emitLock:Z

    .line 362
    iput v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->lastDrainedIndex:I

    .line 408
    new-instance v0, Lrx/internal/operators/OperatorMerge$MergeSubscriber$1;

    invoke-direct {v0, p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber$1;-><init>(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)V

    iput-object v0, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->DRAIN_ACTION:Lrx/functions/Func1;

    .line 154
    iput-object p1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->actual:Lrx/Subscriber;

    .line 155
    new-instance v0, Lrx/internal/operators/OperatorMerge$MergeProducer;

    invoke-direct {v0, p0}, Lrx/internal/operators/OperatorMerge$MergeProducer;-><init>(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)V

    iput-object v0, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->mergeProducer:Lrx/internal/operators/OperatorMerge$MergeProducer;

    .line 156
    iput-boolean p2, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->delayErrors:Z

    .line 158
    invoke-virtual {p1, p0}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 159
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->mergeProducer:Lrx/internal/operators/OperatorMerge$MergeProducer;

    invoke-virtual {p1, v0}, Lrx/Subscriber;->setProducer(Lrx/Producer;)V

    .line 160
    return-void
.end method

.method static synthetic access$1000(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)Z
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    .prologue
    .line 120
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->getEmitLock()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1100(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)Z
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    .prologue
    .line 120
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->releaseEmitLock()Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)Lrx/internal/operators/OperatorMerge$MergeProducer;
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    .prologue
    .line 120
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->mergeProducer:Lrx/internal/operators/OperatorMerge$MergeProducer;

    return-object v0
.end method

.method static synthetic access$500(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)Z
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    .prologue
    .line 120
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->drainQueuesIfNeeded()Z

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)I
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    .prologue
    .line 120
    iget v0, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->wip:I

    return v0
.end method

.method static synthetic access$700(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)Lrx/internal/util/RxRingBuffer;
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    .prologue
    .line 120
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->scalarValueQueue:Lrx/internal/util/RxRingBuffer;

    return-object v0
.end method

.method static synthetic access$800(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)V
    .locals 0
    .param p0, "x0"    # Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    .prologue
    .line 120
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->drainAndComplete()V

    return-void
.end method

.method static synthetic access$900(Lrx/internal/operators/OperatorMerge$MergeSubscriber;Ljava/lang/Throwable;Z)V
    .locals 0
    .param p0, "x0"    # Lrx/internal/operators/OperatorMerge$MergeSubscriber;
    .param p1, "x1"    # Ljava/lang/Throwable;
    .param p2, "x2"    # Z

    .prologue
    .line 120
    invoke-direct {p0, p1, p2}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->innerError(Ljava/lang/Throwable;Z)V

    return-void
.end method

.method private drainAndComplete()V
    .locals 6

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 491
    const/4 v1, 0x1

    .line 492
    .local v1, "moreToDrain":Z
    :goto_0
    if-eqz v1, :cond_1

    .line 493
    monitor-enter p0

    .line 494
    const/4 v5, 0x0

    :try_start_0
    iput v5, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->missedEmitting:I

    .line 495
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 496
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->drainScalarValueQueue()I

    .line 497
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->drainChildrenQueues()V

    .line 498
    monitor-enter p0

    .line 499
    :try_start_1
    iget v5, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->missedEmitting:I

    if-lez v5, :cond_0

    move v1, v3

    .line 500
    :goto_1
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 495
    :catchall_1
    move-exception v3

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v3

    :cond_0
    move v1, v4

    .line 499
    goto :goto_1

    .line 502
    :cond_1
    iget-object v2, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->scalarValueQueue:Lrx/internal/util/RxRingBuffer;

    .line 503
    .local v2, "svq":Lrx/internal/util/RxRingBuffer;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lrx/internal/util/RxRingBuffer;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 504
    :cond_2
    iget-boolean v4, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->delayErrors:Z

    if-eqz v4, :cond_7

    .line 505
    const/4 v0, 0x0

    .line 506
    .local v0, "es":Ljava/util/Queue;, "Ljava/util/Queue<Ljava/lang/Throwable;>;"
    monitor-enter p0

    .line 507
    :try_start_3
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->exceptions:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 508
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 509
    if-eqz v0, :cond_6

    .line 510
    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 511
    iget-object v3, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->actual:Lrx/Subscriber;

    invoke-virtual {v3}, Lrx/Subscriber;->onCompleted()V

    .line 524
    .end local v0    # "es":Ljava/util/Queue;, "Ljava/util/Queue<Ljava/lang/Throwable;>;"
    :cond_3
    :goto_2
    return-void

    .line 508
    .restart local v0    # "es":Ljava/util/Queue;, "Ljava/util/Queue<Ljava/lang/Throwable;>;"
    :catchall_2
    move-exception v3

    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw v3

    .line 512
    :cond_4
    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v4

    if-ne v4, v3, :cond_5

    .line 513
    iget-object v4, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->actual:Lrx/Subscriber;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Throwable;

    invoke-virtual {v4, v3}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_2

    .line 515
    :cond_5
    iget-object v3, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->actual:Lrx/Subscriber;

    new-instance v4, Lrx/exceptions/CompositeException;

    invoke-direct {v4, v0}, Lrx/exceptions/CompositeException;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v3, v4}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_2

    .line 518
    :cond_6
    iget-object v3, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->actual:Lrx/Subscriber;

    invoke-virtual {v3}, Lrx/Subscriber;->onCompleted()V

    goto :goto_2

    .line 521
    .end local v0    # "es":Ljava/util/Queue;, "Ljava/util/Queue<Ljava/lang/Throwable;>;"
    :cond_7
    iget-object v3, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->actual:Lrx/Subscriber;

    invoke-virtual {v3}, Lrx/Subscriber;->onCompleted()V

    goto :goto_2
.end method

.method private drainChildrenQueues()V
    .locals 3

    .prologue
    .line 368
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->childrenSubscribers:Lrx/internal/util/SubscriptionIndexedRingBuffer;

    if-eqz v0, :cond_0

    .line 369
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->childrenSubscribers:Lrx/internal/util/SubscriptionIndexedRingBuffer;

    iget-object v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->DRAIN_ACTION:Lrx/functions/Func1;

    iget v2, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->lastDrainedIndex:I

    invoke-virtual {v0, v1, v2}, Lrx/internal/util/SubscriptionIndexedRingBuffer;->forEach(Lrx/functions/Func1;I)I

    move-result v0

    iput v0, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->lastDrainedIndex:I

    .line 371
    :cond_0
    return-void
.end method

.method private drainQueuesIfNeeded()Z
    .locals 4

    .prologue
    .line 339
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    :cond_0
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->getEmitLock()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 340
    const/4 v0, 0x0

    .line 343
    .local v0, "emitted":I
    :try_start_0
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->drainScalarValueQueue()I

    move-result v0

    .line 344
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->drainChildrenQueues()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 346
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->releaseEmitLock()Z

    move-result v1

    .line 349
    .local v1, "moreToDrain":Z
    if-lez v0, :cond_1

    .line 350
    int-to-long v2, v0

    invoke-virtual {p0, v2, v3}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->request(J)V

    .line 352
    :cond_1
    if-nez v1, :cond_0

    .line 353
    const/4 v2, 0x1

    .line 357
    .end local v0    # "emitted":I
    .end local v1    # "moreToDrain":Z
    :goto_0
    return v2

    .line 346
    .restart local v0    # "emitted":I
    :catchall_0
    move-exception v2

    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->releaseEmitLock()Z

    move-result v1

    .restart local v1    # "moreToDrain":Z
    throw v2

    .line 357
    .end local v0    # "emitted":I
    .end local v1    # "moreToDrain":Z
    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private drainScalarValueQueue()I
    .locals 12

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    const-wide/16 v10, 0x0

    .line 377
    iget-object v3, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->scalarValueQueue:Lrx/internal/util/RxRingBuffer;

    .line 378
    .local v3, "svq":Lrx/internal/util/RxRingBuffer;
    if-eqz v3, :cond_4

    .line 379
    iget-object v8, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->mergeProducer:Lrx/internal/operators/OperatorMerge$MergeProducer;

    # getter for: Lrx/internal/operators/OperatorMerge$MergeProducer;->requested:J
    invoke-static {v8}, Lrx/internal/operators/OperatorMerge$MergeProducer;->access$100(Lrx/internal/operators/OperatorMerge$MergeProducer;)J

    move-result-wide v4

    .line 380
    .local v4, "r":J
    const/4 v0, 0x0

    .line 381
    .local v0, "emittedWhileDraining":I
    cmp-long v8, v4, v10

    if-gez v8, :cond_0

    .line 383
    const/4 v2, 0x0

    .line 384
    :goto_0
    invoke-virtual {v3}, Lrx/internal/util/RxRingBuffer;->poll()Ljava/lang/Object;

    move-result-object v2

    .local v2, "o":Ljava/lang/Object;
    if-eqz v2, :cond_2

    .line 385
    iget-object v8, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->on:Lrx/internal/operators/NotificationLite;

    iget-object v9, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->actual:Lrx/Subscriber;

    invoke-virtual {v8, v9, v2}, Lrx/internal/operators/NotificationLite;->accept(Lrx/Observer;Ljava/lang/Object;)Z

    .line 386
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 388
    .end local v2    # "o":Ljava/lang/Object;
    :cond_0
    cmp-long v8, v4, v10

    if-lez v8, :cond_2

    .line 390
    move-wide v6, v4

    .line 391
    .local v6, "toEmit":J
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    int-to-long v8, v1

    cmp-long v8, v8, v6

    if-gez v8, :cond_1

    .line 392
    invoke-virtual {v3}, Lrx/internal/util/RxRingBuffer;->poll()Ljava/lang/Object;

    move-result-object v2

    .line 393
    .restart local v2    # "o":Ljava/lang/Object;
    if-nez v2, :cond_3

    .line 401
    .end local v2    # "o":Ljava/lang/Object;
    :cond_1
    sget-object v8, Lrx/internal/operators/OperatorMerge$MergeProducer;->REQUESTED:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    iget-object v9, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->mergeProducer:Lrx/internal/operators/OperatorMerge$MergeProducer;

    neg-int v10, v0

    int-to-long v10, v10

    invoke-virtual {v8, v9, v10, v11}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndAdd(Ljava/lang/Object;J)J

    .line 405
    .end local v0    # "emittedWhileDraining":I
    .end local v1    # "i":I
    .end local v4    # "r":J
    .end local v6    # "toEmit":J
    :cond_2
    :goto_2
    return v0

    .line 396
    .restart local v0    # "emittedWhileDraining":I
    .restart local v1    # "i":I
    .restart local v2    # "o":Ljava/lang/Object;
    .restart local v4    # "r":J
    .restart local v6    # "toEmit":J
    :cond_3
    iget-object v8, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->on:Lrx/internal/operators/NotificationLite;

    iget-object v9, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->actual:Lrx/Subscriber;

    invoke-virtual {v8, v9, v2}, Lrx/internal/operators/NotificationLite;->accept(Lrx/Observer;Ljava/lang/Object;)Z

    .line 397
    add-int/lit8 v0, v0, 0x1

    .line 391
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 405
    .end local v0    # "emittedWhileDraining":I
    .end local v1    # "i":I
    .end local v2    # "o":Ljava/lang/Object;
    .end local v4    # "r":J
    .end local v6    # "toEmit":J
    :cond_4
    const/4 v0, 0x0

    goto :goto_2
.end method

.method private declared-synchronized getEmitLock()Z
    .locals 3

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 327
    monitor-enter p0

    :try_start_0
    iget-boolean v2, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->emitLock:Z

    if-eqz v2, :cond_0

    .line 328
    iget v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->missedEmitting:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->missedEmitting:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 333
    :goto_0
    monitor-exit p0

    return v0

    .line 331
    :cond_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->emitLock:Z

    .line 332
    const/4 v0, 0x0

    iput v0, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->missedEmitting:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v0, v1

    .line 333
    goto :goto_0

    .line 327
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private getOrCreateScalarValueQueue()Lrx/internal/util/RxRingBuffer;
    .locals 1

    .prologue
    .line 309
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->scalarValueQueue:Lrx/internal/util/RxRingBuffer;

    .line 310
    .local v0, "svq":Lrx/internal/util/RxRingBuffer;
    if-nez v0, :cond_0

    .line 311
    invoke-static {}, Lrx/internal/util/RxRingBuffer;->getSpscInstance()Lrx/internal/util/RxRingBuffer;

    move-result-object v0

    .line 312
    iput-object v0, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->scalarValueQueue:Lrx/internal/util/RxRingBuffer;

    .line 314
    :cond_0
    return-object v0
.end method

.method private handleNewSource(Lrx/Observable;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 190
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    .local p1, "t":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    iget-object v2, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->childrenSubscribers:Lrx/internal/util/SubscriptionIndexedRingBuffer;

    if-nez v2, :cond_0

    .line 192
    new-instance v2, Lrx/internal/util/SubscriptionIndexedRingBuffer;

    invoke-direct {v2}, Lrx/internal/util/SubscriptionIndexedRingBuffer;-><init>()V

    iput-object v2, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->childrenSubscribers:Lrx/internal/util/SubscriptionIndexedRingBuffer;

    .line 193
    iget-object v2, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->childrenSubscribers:Lrx/internal/util/SubscriptionIndexedRingBuffer;

    invoke-virtual {p0, v2}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->add(Lrx/Subscription;)V

    .line 195
    :cond_0
    const/4 v1, 0x0

    .line 197
    .local v1, "producerIfNeeded":Lrx/internal/operators/OperatorMerge$MergeProducer;, "Lrx/internal/operators/OperatorMerge$MergeProducer<TT;>;"
    iget-object v2, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->mergeProducer:Lrx/internal/operators/OperatorMerge$MergeProducer;

    # getter for: Lrx/internal/operators/OperatorMerge$MergeProducer;->requested:J
    invoke-static {v2}, Lrx/internal/operators/OperatorMerge$MergeProducer;->access$100(Lrx/internal/operators/OperatorMerge$MergeProducer;)J

    move-result-wide v2

    const-wide v4, 0x7fffffffffffffffL

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1

    .line 211
    iget-object v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->mergeProducer:Lrx/internal/operators/OperatorMerge$MergeProducer;

    .line 213
    :cond_1
    new-instance v0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;

    invoke-direct {v0, p0, v1}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;-><init>(Lrx/internal/operators/OperatorMerge$MergeSubscriber;Lrx/internal/operators/OperatorMerge$MergeProducer;)V

    .line 214
    .local v0, "i":Lrx/internal/operators/OperatorMerge$InnerSubscriber;, "Lrx/internal/operators/OperatorMerge$InnerSubscriber<TT;>;"
    iget-object v2, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->childrenSubscribers:Lrx/internal/util/SubscriptionIndexedRingBuffer;

    invoke-virtual {v2, v0}, Lrx/internal/util/SubscriptionIndexedRingBuffer;->add(Lrx/Subscription;)I

    move-result v2

    iput v2, v0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->sindex:I

    .line 215
    invoke-virtual {p1, v0}, Lrx/Observable;->unsafeSubscribe(Lrx/Subscriber;)Lrx/Subscription;

    .line 216
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->isUnsubscribed()Z

    move-result v2

    if-nez v2, :cond_2

    .line 217
    const-wide/16 v2, 0x1

    invoke-virtual {p0, v2, v3}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->request(J)V

    .line 219
    :cond_2
    return-void
.end method

.method private handleScalarSynchronousObservable(Lrx/internal/util/ScalarSynchronousObservable;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/util/ScalarSynchronousObservable",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 240
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    .local p1, "t":Lrx/internal/util/ScalarSynchronousObservable;, "Lrx/internal/util/ScalarSynchronousObservable<+TT;>;"
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->mergeProducer:Lrx/internal/operators/OperatorMerge$MergeProducer;

    # getter for: Lrx/internal/operators/OperatorMerge$MergeProducer;->requested:J
    invoke-static {v0}, Lrx/internal/operators/OperatorMerge$MergeProducer;->access$100(Lrx/internal/operators/OperatorMerge$MergeProducer;)J

    move-result-wide v0

    const-wide v2, 0x7fffffffffffffffL

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 241
    invoke-direct {p0, p1}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->handleScalarSynchronousObservableWithoutRequestLimits(Lrx/internal/util/ScalarSynchronousObservable;)V

    .line 245
    :goto_0
    return-void

    .line 243
    :cond_0
    invoke-direct {p0, p1}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->handleScalarSynchronousObservableWithRequestLimits(Lrx/internal/util/ScalarSynchronousObservable;)V

    goto :goto_0
.end method

.method private handleScalarSynchronousObservableWithRequestLimits(Lrx/internal/util/ScalarSynchronousObservable;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/util/ScalarSynchronousObservable",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 272
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    .local p1, "t":Lrx/internal/util/ScalarSynchronousObservable;, "Lrx/internal/util/ScalarSynchronousObservable<+TT;>;"
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->getEmitLock()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 273
    const/4 v1, 0x0

    .line 275
    .local v1, "emitted":Z
    const/4 v2, 0x0

    .line 277
    .local v2, "isReturn":Z
    :try_start_0
    iget-object v6, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->mergeProducer:Lrx/internal/operators/OperatorMerge$MergeProducer;

    # getter for: Lrx/internal/operators/OperatorMerge$MergeProducer;->requested:J
    invoke-static {v6}, Lrx/internal/operators/OperatorMerge$MergeProducer;->access$100(Lrx/internal/operators/OperatorMerge$MergeProducer;)J

    move-result-wide v4

    .line 278
    .local v4, "r":J
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-lez v6, :cond_0

    .line 279
    const/4 v1, 0x1

    .line 280
    iget-object v6, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->actual:Lrx/Subscriber;

    invoke-virtual {p1}, Lrx/internal/util/ScalarSynchronousObservable;->get()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 281
    sget-object v6, Lrx/internal/operators/OperatorMerge$MergeProducer;->REQUESTED:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    iget-object v7, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->mergeProducer:Lrx/internal/operators/OperatorMerge$MergeProducer;

    invoke-virtual {v6, v7}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->decrementAndGet(Ljava/lang/Object;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 283
    const/4 v2, 0x1

    .line 286
    :cond_0
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->releaseEmitLock()Z

    move-result v3

    .line 288
    .local v3, "moreToDrain":Z
    if-eqz v3, :cond_1

    .line 289
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->drainQueuesIfNeeded()Z

    .line 291
    :cond_1
    if-eqz v1, :cond_2

    .line 292
    const-wide/16 v6, 0x1

    invoke-virtual {p0, v6, v7}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->request(J)V

    .line 294
    :cond_2
    if-eqz v2, :cond_3

    .line 306
    .end local v1    # "emitted":Z
    .end local v2    # "isReturn":Z
    .end local v3    # "moreToDrain":Z
    .end local v4    # "r":J
    :goto_0
    return-void

    .line 286
    .restart local v1    # "emitted":Z
    .restart local v2    # "isReturn":Z
    :catchall_0
    move-exception v6

    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->releaseEmitLock()Z

    move-result v3

    .restart local v3    # "moreToDrain":Z
    throw v6

    .line 302
    .end local v1    # "emitted":Z
    .end local v2    # "isReturn":Z
    .end local v3    # "moreToDrain":Z
    :cond_3
    :try_start_1
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->getOrCreateScalarValueQueue()Lrx/internal/util/RxRingBuffer;

    move-result-object v6

    invoke-virtual {p1}, Lrx/internal/util/ScalarSynchronousObservable;->get()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Lrx/internal/util/RxRingBuffer;->onNext(Ljava/lang/Object;)V
    :try_end_1
    .catch Lrx/exceptions/MissingBackpressureException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 303
    :catch_0
    move-exception v0

    .line 304
    .local v0, "e":Lrx/exceptions/MissingBackpressureException;
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private handleScalarSynchronousObservableWithoutRequestLimits(Lrx/internal/util/ScalarSynchronousObservable;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/util/ScalarSynchronousObservable",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 248
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    .local p1, "t":Lrx/internal/util/ScalarSynchronousObservable;, "Lrx/internal/util/ScalarSynchronousObservable<+TT;>;"
    invoke-virtual {p1}, Lrx/internal/util/ScalarSynchronousObservable;->get()Ljava/lang/Object;

    move-result-object v2

    .line 249
    .local v2, "value":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->getEmitLock()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 252
    :try_start_0
    iget-object v3, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->actual:Lrx/Subscriber;

    invoke-virtual {v3, v2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 254
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->releaseEmitLock()Z

    move-result v1

    .line 256
    .local v1, "moreToDrain":Z
    if-eqz v1, :cond_0

    .line 257
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->drainQueuesIfNeeded()Z

    .line 259
    :cond_0
    const-wide/16 v4, 0x1

    invoke-virtual {p0, v4, v5}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->request(J)V

    .line 267
    .end local v1    # "moreToDrain":Z
    :goto_0
    return-void

    .line 254
    :catchall_0
    move-exception v3

    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->releaseEmitLock()Z

    move-result v1

    .restart local v1    # "moreToDrain":Z
    throw v3

    .line 263
    .end local v1    # "moreToDrain":Z
    :cond_1
    :try_start_1
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->getOrCreateScalarValueQueue()Lrx/internal/util/RxRingBuffer;

    move-result-object v3

    invoke-virtual {v3, v2}, Lrx/internal/util/RxRingBuffer;->onNext(Ljava/lang/Object;)V
    :try_end_1
    .catch Lrx/exceptions/MissingBackpressureException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 264
    :catch_0
    move-exception v0

    .line 265
    .local v0, "e":Lrx/exceptions/MissingBackpressureException;
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private innerError(Ljava/lang/Throwable;Z)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Throwable;
    .param p2, "parent"    # Z

    .prologue
    .line 437
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    iget-boolean v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->delayErrors:Z

    if-eqz v1, :cond_6

    .line 438
    monitor-enter p0

    .line 439
    :try_start_0
    iget-object v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->exceptions:Ljava/util/concurrent/ConcurrentLinkedQueue;

    if-nez v1, :cond_0

    .line 440
    new-instance v1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->exceptions:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 442
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 443
    iget-object v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->exceptions:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 444
    const/4 v0, 0x0

    .line 445
    .local v0, "sendOnComplete":Z
    monitor-enter p0

    .line 446
    if-nez p2, :cond_1

    .line 447
    :try_start_1
    iget v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->wip:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->wip:I

    .line 449
    :cond_1
    iget v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->wip:I

    if-nez v1, :cond_2

    iget-boolean v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->completed:Z

    if-nez v1, :cond_3

    :cond_2
    iget v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->wip:I

    if-gez v1, :cond_4

    .line 450
    :cond_3
    const/4 v0, 0x1

    .line 452
    :cond_4
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 453
    if-eqz v0, :cond_5

    .line 454
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->drainAndComplete()V

    .line 459
    .end local v0    # "sendOnComplete":Z
    :cond_5
    :goto_0
    return-void

    .line 442
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 452
    .restart local v0    # "sendOnComplete":Z
    :catchall_1
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v1

    .line 457
    .end local v0    # "sendOnComplete":Z
    :cond_6
    iget-object v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->actual:Lrx/Subscriber;

    invoke-virtual {v1, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private declared-synchronized releaseEmitLock()Z
    .locals 2

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    const/4 v0, 0x0

    .line 318
    monitor-enter p0

    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->emitLock:Z

    .line 319
    iget v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->missedEmitting:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 322
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 318
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method completeInner(Lrx/internal/operators/OperatorMerge$InnerSubscriber;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorMerge$InnerSubscriber",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 477
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    .local p1, "s":Lrx/internal/operators/OperatorMerge$InnerSubscriber;, "Lrx/internal/operators/OperatorMerge$InnerSubscriber<TT;>;"
    const/4 v0, 0x0

    .line 478
    .local v0, "sendOnComplete":Z
    monitor-enter p0

    .line 479
    :try_start_0
    iget v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->wip:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->wip:I

    .line 480
    iget v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->wip:I

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->completed:Z

    if-eqz v1, :cond_0

    .line 481
    const/4 v0, 0x1

    .line 483
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 484
    iget-object v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->childrenSubscribers:Lrx/internal/util/SubscriptionIndexedRingBuffer;

    iget v2, p1, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->sindex:I

    invoke-virtual {v1, v2}, Lrx/internal/util/SubscriptionIndexedRingBuffer;->remove(I)V

    .line 485
    if-eqz v0, :cond_1

    .line 486
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->drainAndComplete()V

    .line 488
    :cond_1
    return-void

    .line 483
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public onCompleted()V
    .locals 2

    .prologue
    .line 463
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    const/4 v0, 0x0

    .line 464
    .local v0, "c":Z
    monitor-enter p0

    .line 465
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->completed:Z

    .line 466
    iget v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->wip:I

    if-nez v1, :cond_0

    .line 467
    const/4 v0, 0x1

    .line 469
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 470
    if-eqz v0, :cond_1

    .line 472
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->drainAndComplete()V

    .line 474
    :cond_1
    return-void

    .line 469
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    const/4 v1, 0x1

    .line 430
    iget-boolean v0, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->completed:Z

    if-nez v0, :cond_0

    .line 431
    iput-boolean v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->completed:Z

    .line 432
    invoke-direct {p0, p1, v1}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->innerError(Ljava/lang/Throwable;Z)V

    .line 434
    :cond_0
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 120
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    check-cast p1, Lrx/Observable;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->onNext(Lrx/Observable;)V

    return-void
.end method

.method public onNext(Lrx/Observable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 174
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    .local p1, "t":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    instance-of v1, p1, Lrx/internal/util/ScalarSynchronousObservable;

    if-eqz v1, :cond_1

    move-object v0, p1

    .line 175
    check-cast v0, Lrx/internal/util/ScalarSynchronousObservable;

    .line 176
    .local v0, "t2":Lrx/internal/util/ScalarSynchronousObservable;, "Lrx/internal/util/ScalarSynchronousObservable<+TT;>;"
    invoke-direct {p0, v0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->handleScalarSynchronousObservable(Lrx/internal/util/ScalarSynchronousObservable;)V

    .line 187
    .end local v0    # "t2":Lrx/internal/util/ScalarSynchronousObservable;, "Lrx/internal/util/ScalarSynchronousObservable<+TT;>;"
    :cond_0
    :goto_0
    return-void

    .line 178
    :cond_1
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->isUnsubscribed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 181
    monitor-enter p0

    .line 183
    :try_start_0
    iget v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->wip:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->wip:I

    .line 184
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 185
    invoke-direct {p0, p1}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->handleNewSource(Lrx/Observable;)V

    goto :goto_0

    .line 184
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 166
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    sget v0, Lrx/internal/util/RxRingBuffer;->SIZE:I

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->request(J)V

    .line 167
    return-void
.end method
