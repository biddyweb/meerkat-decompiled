.class final Lrx/internal/operators/OperatorMerge$InnerSubscriber;
.super Lrx/Subscriber;
.source "OperatorMerge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorMerge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "InnerSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/Subscriber",
        "<TT;>;"
    }
.end annotation


# static fields
.field static final ONCE_TERMINATED:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater",
            "<",
            "Lrx/internal/operators/OperatorMerge$InnerSubscriber;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final parentSubscriber:Lrx/internal/operators/OperatorMerge$MergeSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorMerge$MergeSubscriber",
            "<TT;>;"
        }
    .end annotation
.end field

.field final producer:Lrx/internal/operators/OperatorMerge$MergeProducer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorMerge$MergeProducer",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final q:Lrx/internal/util/RxRingBuffer;

.field public sindex:I

.field volatile terminated:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 573
    const-class v0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;

    const-string v1, "terminated"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->ONCE_TERMINATED:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-void
.end method

.method public constructor <init>(Lrx/internal/operators/OperatorMerge$MergeSubscriber;Lrx/internal/operators/OperatorMerge$MergeProducer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorMerge$MergeSubscriber",
            "<TT;>;",
            "Lrx/internal/operators/OperatorMerge$MergeProducer",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 577
    .local p0, "this":Lrx/internal/operators/OperatorMerge$InnerSubscriber;, "Lrx/internal/operators/OperatorMerge$InnerSubscriber<TT;>;"
    .local p1, "parent":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    .local p2, "producer":Lrx/internal/operators/OperatorMerge$MergeProducer;, "Lrx/internal/operators/OperatorMerge$MergeProducer<TT;>;"
    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    .line 575
    invoke-static {}, Lrx/internal/util/RxRingBuffer;->getSpscInstance()Lrx/internal/util/RxRingBuffer;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->q:Lrx/internal/util/RxRingBuffer;

    .line 578
    iput-object p1, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->parentSubscriber:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    .line 579
    iput-object p2, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->producer:Lrx/internal/operators/OperatorMerge$MergeProducer;

    .line 580
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->q:Lrx/internal/util/RxRingBuffer;

    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->add(Lrx/Subscription;)V

    .line 581
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->q:Lrx/internal/util/RxRingBuffer;

    invoke-virtual {v0}, Lrx/internal/util/RxRingBuffer;->capacity()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->request(J)V

    .line 582
    return-void
.end method

.method static synthetic access$200(Lrx/internal/operators/OperatorMerge$InnerSubscriber;)Lrx/internal/util/RxRingBuffer;
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorMerge$InnerSubscriber;

    .prologue
    .line 565
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->q:Lrx/internal/util/RxRingBuffer;

    return-object v0
.end method

.method static synthetic access$400(Lrx/internal/operators/OperatorMerge$InnerSubscriber;)I
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorMerge$InnerSubscriber;

    .prologue
    .line 565
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->drainQueue()I

    move-result v0

    return v0
.end method

.method private drainAll()I
    .locals 5

    .prologue
    .line 758
    .local p0, "this":Lrx/internal/operators/OperatorMerge$InnerSubscriber;, "Lrx/internal/operators/OperatorMerge$InnerSubscriber<TT;>;"
    const/4 v1, 0x0

    .line 761
    .local v1, "emitted":I
    :cond_0
    :goto_0
    iget-object v3, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->q:Lrx/internal/util/RxRingBuffer;

    invoke-virtual {v3}, Lrx/internal/util/RxRingBuffer;->poll()Ljava/lang/Object;

    move-result-object v2

    .local v2, "o":Ljava/lang/Object;
    if-eqz v2, :cond_2

    .line 762
    iget-object v3, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->q:Lrx/internal/util/RxRingBuffer;

    invoke-virtual {v3, v2}, Lrx/internal/util/RxRingBuffer;->isCompleted(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 763
    iget-object v3, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->parentSubscriber:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    invoke-virtual {v3, p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->completeInner(Lrx/internal/operators/OperatorMerge$InnerSubscriber;)V

    goto :goto_0

    .line 766
    :cond_1
    :try_start_0
    iget-object v3, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->q:Lrx/internal/util/RxRingBuffer;

    iget-object v4, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->parentSubscriber:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    iget-object v4, v4, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->actual:Lrx/Subscriber;

    invoke-virtual {v3, v2, v4}, Lrx/internal/util/RxRingBuffer;->accept(Ljava/lang/Object;Lrx/Observer;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-nez v3, :cond_0

    .line 767
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 769
    :catch_0
    move-exception v0

    .line 771
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0, v2}, Lrx/exceptions/OnErrorThrowable;->addValueAsLastCause(Ljava/lang/Throwable;Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v3

    invoke-virtual {p0, v3}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 775
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_2
    return v1
.end method

.method private drainQueue()I
    .locals 1

    .prologue
    .line 779
    .local p0, "this":Lrx/internal/operators/OperatorMerge$InnerSubscriber;, "Lrx/internal/operators/OperatorMerge$InnerSubscriber<TT;>;"
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->producer:Lrx/internal/operators/OperatorMerge$MergeProducer;

    if-eqz v0, :cond_0

    .line 780
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->drainRequested()I

    move-result v0

    .line 782
    :goto_0
    return v0

    :cond_0
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->drainAll()I

    move-result v0

    goto :goto_0
.end method

.method private drainRequested()I
    .locals 10

    .prologue
    .line 729
    .local p0, "this":Lrx/internal/operators/OperatorMerge$InnerSubscriber;, "Lrx/internal/operators/OperatorMerge$InnerSubscriber<TT;>;"
    const/4 v1, 0x0

    .line 731
    .local v1, "emitted":I
    iget-object v6, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->producer:Lrx/internal/operators/OperatorMerge$MergeProducer;

    # getter for: Lrx/internal/operators/OperatorMerge$MergeProducer;->requested:J
    invoke-static {v6}, Lrx/internal/operators/OperatorMerge$MergeProducer;->access$100(Lrx/internal/operators/OperatorMerge$MergeProducer;)J

    move-result-wide v4

    .line 733
    .local v4, "toEmit":J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    int-to-long v6, v2

    cmp-long v6, v6, v4

    if-gez v6, :cond_0

    .line 734
    iget-object v6, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->q:Lrx/internal/util/RxRingBuffer;

    invoke-virtual {v6}, Lrx/internal/util/RxRingBuffer;->poll()Ljava/lang/Object;

    move-result-object v3

    .line 735
    .local v3, "o":Ljava/lang/Object;
    if-nez v3, :cond_1

    .line 753
    .end local v3    # "o":Ljava/lang/Object;
    :cond_0
    sget-object v6, Lrx/internal/operators/OperatorMerge$MergeProducer;->REQUESTED:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    iget-object v7, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->producer:Lrx/internal/operators/OperatorMerge$MergeProducer;

    neg-int v8, v1

    int-to-long v8, v8

    invoke-virtual {v6, v7, v8, v9}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndAdd(Ljava/lang/Object;J)J

    .line 754
    return v1

    .line 738
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_1
    iget-object v6, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->q:Lrx/internal/util/RxRingBuffer;

    invoke-virtual {v6, v3}, Lrx/internal/util/RxRingBuffer;->isCompleted(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 739
    iget-object v6, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->parentSubscriber:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    invoke-virtual {v6, p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->completeInner(Lrx/internal/operators/OperatorMerge$InnerSubscriber;)V

    .line 733
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 742
    :cond_3
    :try_start_0
    iget-object v6, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->q:Lrx/internal/util/RxRingBuffer;

    iget-object v7, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->parentSubscriber:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    iget-object v7, v7, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->actual:Lrx/Subscriber;

    invoke-virtual {v6, v3, v7}, Lrx/internal/util/RxRingBuffer;->accept(Ljava/lang/Object;Lrx/Observer;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-nez v6, :cond_2

    .line 743
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 745
    :catch_0
    move-exception v0

    .line 747
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0, v3}, Lrx/exceptions/OnErrorThrowable;->addValueAsLastCause(Ljava/lang/Throwable;Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v6

    invoke-virtual {p0, v6}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private emit(Ljava/lang/Object;Z)V
    .locals 12
    .param p2, "complete"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorMerge$InnerSubscriber;, "Lrx/internal/operators/OperatorMerge$InnerSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const-wide/16 v10, 0x1

    const-wide/16 v8, 0x0

    .line 609
    const/4 v0, 0x0

    .line 610
    .local v0, "drain":Z
    const/4 v4, 0x1

    .line 648
    .local v4, "enqueue":Z
    iget-object v5, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->parentSubscriber:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    # invokes: Lrx/internal/operators/OperatorMerge$MergeSubscriber;->getEmitLock()Z
    invoke-static {v5}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->access$1000(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 649
    const-wide/16 v2, 0x0

    .line 650
    .local v2, "emitted":J
    const/4 v4, 0x0

    .line 653
    :try_start_0
    invoke-direct {p0}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->drainQueue()I

    move-result v5

    int-to-long v6, v5

    add-long/2addr v2, v6

    .line 655
    iget-object v5, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->producer:Lrx/internal/operators/OperatorMerge$MergeProducer;

    if-nez v5, :cond_4

    .line 657
    if-eqz p2, :cond_3

    .line 658
    iget-object v5, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->parentSubscriber:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    invoke-virtual {v5, p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->completeInner(Lrx/internal/operators/OperatorMerge$InnerSubscriber;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 690
    :goto_0
    iget-object v5, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->parentSubscriber:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    # invokes: Lrx/internal/operators/OperatorMerge$MergeSubscriber;->releaseEmitLock()Z
    invoke-static {v5}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->access$1100(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)Z

    move-result v0

    .line 693
    cmp-long v5, v2, v8

    if-lez v5, :cond_0

    .line 694
    invoke-virtual {p0, v2, v3}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->request(J)V

    .line 697
    .end local v2    # "emitted":J
    :cond_0
    if-eqz v4, :cond_1

    .line 698
    invoke-direct {p0, p1, p2}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->enqueue(Ljava/lang/Object;Z)V

    .line 699
    const/4 v0, 0x1

    .line 701
    :cond_1
    if-eqz v0, :cond_2

    .line 712
    iget-object v5, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->parentSubscriber:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    # invokes: Lrx/internal/operators/OperatorMerge$MergeSubscriber;->drainQueuesIfNeeded()Z
    invoke-static {v5}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->access$500(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)Z

    .line 714
    :cond_2
    return-void

    .line 661
    .restart local v2    # "emitted":J
    :cond_3
    :try_start_1
    iget-object v5, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->parentSubscriber:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    iget-object v5, v5, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->actual:Lrx/Subscriber;

    invoke-virtual {v5, p1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 666
    :goto_1
    add-long/2addr v2, v10

    goto :goto_0

    .line 662
    :catch_0
    move-exception v1

    .line 664
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_2
    invoke-static {v1, p1}, Lrx/exceptions/OnErrorThrowable;->addValueAsLastCause(Ljava/lang/Throwable;Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v5

    invoke-virtual {p0, v5}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->onError(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 690
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_0
    move-exception v5

    iget-object v6, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->parentSubscriber:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    # invokes: Lrx/internal/operators/OperatorMerge$MergeSubscriber;->releaseEmitLock()Z
    invoke-static {v6}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->access$1100(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)Z

    move-result v0

    throw v5

    .line 671
    :cond_4
    :try_start_3
    iget-object v5, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->producer:Lrx/internal/operators/OperatorMerge$MergeProducer;

    # getter for: Lrx/internal/operators/OperatorMerge$MergeProducer;->requested:J
    invoke-static {v5}, Lrx/internal/operators/OperatorMerge$MergeProducer;->access$100(Lrx/internal/operators/OperatorMerge$MergeProducer;)J

    move-result-wide v6

    cmp-long v5, v6, v8

    if-lez v5, :cond_6

    iget-object v5, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->q:Lrx/internal/util/RxRingBuffer;

    invoke-virtual {v5}, Lrx/internal/util/RxRingBuffer;->count()I

    move-result v5

    if-nez v5, :cond_6

    .line 672
    if-eqz p2, :cond_5

    .line 673
    iget-object v5, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->parentSubscriber:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    invoke-virtual {v5, p0}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->completeInner(Lrx/internal/operators/OperatorMerge$InnerSubscriber;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 676
    :cond_5
    :try_start_4
    iget-object v5, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->parentSubscriber:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    iget-object v5, v5, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->actual:Lrx/Subscriber;

    invoke-virtual {v5, p1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 681
    :goto_2
    add-long/2addr v2, v10

    .line 682
    :try_start_5
    sget-object v5, Lrx/internal/operators/OperatorMerge$MergeProducer;->REQUESTED:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    iget-object v6, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->producer:Lrx/internal/operators/OperatorMerge$MergeProducer;

    invoke-virtual {v5, v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->decrementAndGet(Ljava/lang/Object;)J

    goto :goto_0

    .line 677
    :catch_1
    move-exception v1

    .line 679
    .restart local v1    # "e":Ljava/lang/Throwable;
    invoke-static {v1, p1}, Lrx/exceptions/OnErrorThrowable;->addValueAsLastCause(Ljava/lang/Throwable;Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v5

    invoke-virtual {p0, v5}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->onError(Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2

    .line 686
    .end local v1    # "e":Ljava/lang/Throwable;
    :cond_6
    const/4 v4, 0x1

    goto :goto_0
.end method

.method private enqueue(Ljava/lang/Object;Z)V
    .locals 2
    .param p2, "complete"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)V"
        }
    .end annotation

    .prologue
    .line 718
    .local p0, "this":Lrx/internal/operators/OperatorMerge$InnerSubscriber;, "Lrx/internal/operators/OperatorMerge$InnerSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    if-eqz p2, :cond_0

    .line 719
    :try_start_0
    iget-object v1, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->q:Lrx/internal/util/RxRingBuffer;

    invoke-virtual {v1}, Lrx/internal/util/RxRingBuffer;->onCompleted()V

    .line 726
    :goto_0
    return-void

    .line 721
    :cond_0
    iget-object v1, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->q:Lrx/internal/util/RxRingBuffer;

    invoke-virtual {v1, p1}, Lrx/internal/util/RxRingBuffer;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catch Lrx/exceptions/MissingBackpressureException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 723
    :catch_0
    move-exception v0

    .line 724
    .local v0, "e":Lrx/exceptions/MissingBackpressureException;
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public onCompleted()V
    .locals 3

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorMerge$InnerSubscriber;, "Lrx/internal/operators/OperatorMerge$InnerSubscriber<TT;>;"
    const/4 v2, 0x1

    .line 599
    sget-object v0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->ONCE_TERMINATED:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 600
    const/4 v0, 0x0

    invoke-direct {p0, v0, v2}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->emit(Ljava/lang/Object;Z)V

    .line 602
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorMerge$InnerSubscriber;, "Lrx/internal/operators/OperatorMerge$InnerSubscriber<TT;>;"
    const/4 v2, 0x0

    .line 592
    sget-object v0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->ONCE_TERMINATED:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v2, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 593
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->parentSubscriber:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    # invokes: Lrx/internal/operators/OperatorMerge$MergeSubscriber;->innerError(Ljava/lang/Throwable;Z)V
    invoke-static {v0, p1, v2}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->access$900(Lrx/internal/operators/OperatorMerge$MergeSubscriber;Ljava/lang/Throwable;Z)V

    .line 595
    :cond_0
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 586
    .local p0, "this":Lrx/internal/operators/OperatorMerge$InnerSubscriber;, "Lrx/internal/operators/OperatorMerge$InnerSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->emit(Ljava/lang/Object;Z)V

    .line 587
    return-void
.end method

.method public requestMore(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 605
    .local p0, "this":Lrx/internal/operators/OperatorMerge$InnerSubscriber;, "Lrx/internal/operators/OperatorMerge$InnerSubscriber<TT;>;"
    invoke-virtual {p0, p1, p2}, Lrx/internal/operators/OperatorMerge$InnerSubscriber;->request(J)V

    .line 606
    return-void
.end method
