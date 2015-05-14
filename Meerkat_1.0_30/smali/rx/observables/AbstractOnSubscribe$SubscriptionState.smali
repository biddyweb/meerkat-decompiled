.class public final Lrx/observables/AbstractOnSubscribe$SubscriptionState;
.super Ljava/lang/Object;
.source "AbstractOnSubscribe.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/observables/AbstractOnSubscribe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SubscriptionState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "S:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private calls:J

.field private hasCompleted:Z

.field private hasOnNext:Z

.field private final inUse:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final parent:Lrx/observables/AbstractOnSubscribe;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/observables/AbstractOnSubscribe",
            "<TT;TS;>;"
        }
    .end annotation
.end field

.field private phase:I

.field private final requestCount:Ljava/util/concurrent/atomic/AtomicLong;

.field private final state:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field

.field private stopRequested:Z

.field private final subscriber:Lrx/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field private theException:Ljava/lang/Throwable;

.field private theValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lrx/observables/AbstractOnSubscribe;Lrx/Subscriber;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/observables/AbstractOnSubscribe",
            "<TT;TS;>;",
            "Lrx/Subscriber",
            "<-TT;>;TS;)V"
        }
    .end annotation

    .prologue
    .line 407
    .local p0, "this":Lrx/observables/AbstractOnSubscribe$SubscriptionState;, "Lrx/observables/AbstractOnSubscribe$SubscriptionState<TT;TS;>;"
    .local p1, "parent":Lrx/observables/AbstractOnSubscribe;, "Lrx/observables/AbstractOnSubscribe<TT;TS;>;"
    .local p2, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    .local p3, "state":Ljava/lang/Object;, "TS;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 408
    iput-object p1, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->parent:Lrx/observables/AbstractOnSubscribe;

    .line 409
    iput-object p2, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->subscriber:Lrx/Subscriber;

    .line 410
    iput-object p3, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->state:Ljava/lang/Object;

    .line 411
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->requestCount:Ljava/util/concurrent/atomic/AtomicLong;

    .line 412
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->inUse:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 413
    return-void
.end method

.method synthetic constructor <init>(Lrx/observables/AbstractOnSubscribe;Lrx/Subscriber;Ljava/lang/Object;Lrx/observables/AbstractOnSubscribe$1;)V
    .locals 0
    .param p1, "x0"    # Lrx/observables/AbstractOnSubscribe;
    .param p2, "x1"    # Lrx/Subscriber;
    .param p3, "x2"    # Ljava/lang/Object;
    .param p4, "x3"    # Lrx/observables/AbstractOnSubscribe$1;

    .prologue
    .line 394
    .local p0, "this":Lrx/observables/AbstractOnSubscribe$SubscriptionState;, "Lrx/observables/AbstractOnSubscribe$SubscriptionState<TT;TS;>;"
    invoke-direct {p0, p1, p2, p3}, Lrx/observables/AbstractOnSubscribe$SubscriptionState;-><init>(Lrx/observables/AbstractOnSubscribe;Lrx/Subscriber;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$400(Lrx/observables/AbstractOnSubscribe$SubscriptionState;)Lrx/Subscriber;
    .locals 1
    .param p0, "x0"    # Lrx/observables/AbstractOnSubscribe$SubscriptionState;

    .prologue
    .line 394
    iget-object v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->subscriber:Lrx/Subscriber;

    return-object v0
.end method

.method static synthetic access$500(Lrx/observables/AbstractOnSubscribe$SubscriptionState;)Ljava/util/concurrent/atomic/AtomicLong;
    .locals 1
    .param p0, "x0"    # Lrx/observables/AbstractOnSubscribe$SubscriptionState;

    .prologue
    .line 394
    iget-object v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->requestCount:Ljava/util/concurrent/atomic/AtomicLong;

    return-object v0
.end method

.method static synthetic access$600(Lrx/observables/AbstractOnSubscribe$SubscriptionState;)Lrx/observables/AbstractOnSubscribe;
    .locals 1
    .param p0, "x0"    # Lrx/observables/AbstractOnSubscribe$SubscriptionState;

    .prologue
    .line 394
    iget-object v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->parent:Lrx/observables/AbstractOnSubscribe;

    return-object v0
.end method

.method static synthetic access$708(Lrx/observables/AbstractOnSubscribe$SubscriptionState;)J
    .locals 4
    .param p0, "x0"    # Lrx/observables/AbstractOnSubscribe$SubscriptionState;

    .prologue
    .line 394
    iget-wide v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->calls:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->calls:J

    return-wide v0
.end method


# virtual methods
.method protected accept()Z
    .locals 8

    .prologue
    .local p0, "this":Lrx/observables/AbstractOnSubscribe$SubscriptionState;, "Lrx/observables/AbstractOnSubscribe$SubscriptionState<TT;TS;>;"
    const/4 v6, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 527
    iget-boolean v5, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->hasOnNext:Z

    if-eqz v5, :cond_0

    .line 528
    iget-object v2, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->theValue:Ljava/lang/Object;

    .line 529
    .local v2, "value":Ljava/lang/Object;, "TT;"
    iput-object v6, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->theValue:Ljava/lang/Object;

    .line 530
    iput-boolean v4, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->hasOnNext:Z

    .line 533
    :try_start_0
    iget-object v5, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->subscriber:Lrx/Subscriber;

    invoke-virtual {v5, v2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 546
    .end local v2    # "value":Ljava/lang/Object;, "TT;"
    :cond_0
    iget-boolean v5, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->hasCompleted:Z

    if-eqz v5, :cond_3

    .line 547
    iget-object v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->theException:Ljava/lang/Throwable;

    .line 548
    .local v0, "e":Ljava/lang/Throwable;
    iput-object v6, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->theException:Ljava/lang/Throwable;

    .line 550
    if-eqz v0, :cond_2

    .line 551
    iget-object v4, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->subscriber:Lrx/Subscriber;

    invoke-virtual {v4, v0}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 557
    .end local v0    # "e":Ljava/lang/Throwable;
    :goto_0
    return v3

    .line 534
    .restart local v2    # "value":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v1

    .line 535
    .local v1, "t":Ljava/lang/Throwable;
    iput-boolean v3, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->hasCompleted:Z

    .line 536
    iget-object v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->theException:Ljava/lang/Throwable;

    .line 537
    .restart local v0    # "e":Ljava/lang/Throwable;
    iput-object v6, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->theException:Ljava/lang/Throwable;

    .line 538
    if-nez v0, :cond_1

    .line 539
    iget-object v4, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->subscriber:Lrx/Subscriber;

    invoke-virtual {v4, v1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 541
    :cond_1
    iget-object v5, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->subscriber:Lrx/Subscriber;

    new-instance v6, Lrx/exceptions/CompositeException;

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Throwable;

    aput-object v1, v7, v4

    aput-object v0, v7, v3

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v6, v4}, Lrx/exceptions/CompositeException;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v5, v6}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 553
    .end local v1    # "t":Ljava/lang/Throwable;
    .end local v2    # "value":Ljava/lang/Object;, "TT;"
    :cond_2
    iget-object v4, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->subscriber:Lrx/Subscriber;

    invoke-virtual {v4}, Lrx/Subscriber;->onCompleted()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_3
    move v3, v4

    .line 557
    goto :goto_0
.end method

.method public advancePhase()V
    .locals 1

    .prologue
    .line 443
    .local p0, "this":Lrx/observables/AbstractOnSubscribe$SubscriptionState;, "Lrx/observables/AbstractOnSubscribe$SubscriptionState<TT;TS;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->advancePhaseBy(I)V

    .line 444
    return-void
.end method

.method public advancePhaseBy(I)V
    .locals 1
    .param p1, "amount"    # I

    .prologue
    .line 452
    .local p0, "this":Lrx/observables/AbstractOnSubscribe$SubscriptionState;, "Lrx/observables/AbstractOnSubscribe$SubscriptionState<TT;TS;>;"
    iget v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->phase:I

    add-int/2addr v0, p1

    iput v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->phase:I

    .line 453
    return-void
.end method

.method public calls()J
    .locals 2

    .prologue
    .line 460
    .local p0, "this":Lrx/observables/AbstractOnSubscribe$SubscriptionState;, "Lrx/observables/AbstractOnSubscribe$SubscriptionState<TT;TS;>;"
    iget-wide v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->calls:J

    return-wide v0
.end method

.method protected free()V
    .locals 3

    .prologue
    .line 597
    .local p0, "this":Lrx/observables/AbstractOnSubscribe$SubscriptionState;, "Lrx/observables/AbstractOnSubscribe$SubscriptionState<TT;TS;>;"
    iget-object v1, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->inUse:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    .line 598
    .local v0, "i":I
    if-gtz v0, :cond_1

    .line 604
    :cond_0
    :goto_0
    return-void

    .line 601
    :cond_1
    iget-object v1, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->inUse:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v1

    if-nez v1, :cond_0

    .line 602
    iget-object v1, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->parent:Lrx/observables/AbstractOnSubscribe;

    iget-object v2, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->state:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lrx/observables/AbstractOnSubscribe;->onTerminated(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onCompleted()V
    .locals 3

    .prologue
    .line 508
    .local p0, "this":Lrx/observables/AbstractOnSubscribe$SubscriptionState;, "Lrx/observables/AbstractOnSubscribe$SubscriptionState<TT;TS;>;"
    iget-boolean v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->hasCompleted:Z

    if-eqz v0, :cond_0

    .line 509
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already terminated"

    iget-object v2, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->theException:Ljava/lang/Throwable;

    invoke-direct {v0, v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 511
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->hasCompleted:Z

    .line 512
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 490
    .local p0, "this":Lrx/observables/AbstractOnSubscribe$SubscriptionState;, "Lrx/observables/AbstractOnSubscribe$SubscriptionState<TT;TS;>;"
    if-nez p1, :cond_0

    .line 491
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "e != null required"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 493
    :cond_0
    iget-boolean v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->hasCompleted:Z

    if-eqz v0, :cond_1

    .line 494
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already terminated"

    iget-object v2, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->theException:Ljava/lang/Throwable;

    invoke-direct {v0, v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 496
    :cond_1
    iput-object p1, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->theException:Ljava/lang/Throwable;

    .line 497
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->hasCompleted:Z

    .line 498
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 471
    .local p0, "this":Lrx/observables/AbstractOnSubscribe$SubscriptionState;, "Lrx/observables/AbstractOnSubscribe$SubscriptionState<TT;TS;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->hasOnNext:Z

    if-eqz v0, :cond_0

    .line 472
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "onNext not consumed yet!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 474
    :cond_0
    iget-boolean v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->hasCompleted:Z

    if-eqz v0, :cond_1

    .line 475
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already terminated"

    iget-object v2, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->theException:Ljava/lang/Throwable;

    invoke-direct {v0, v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 477
    :cond_1
    iput-object p1, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->theValue:Ljava/lang/Object;

    .line 478
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->hasOnNext:Z

    .line 479
    return-void
.end method

.method public phase()I
    .locals 1

    .prologue
    .line 427
    .local p0, "this":Lrx/observables/AbstractOnSubscribe$SubscriptionState;, "Lrx/observables/AbstractOnSubscribe$SubscriptionState<TT;TS;>;"
    iget v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->phase:I

    return v0
.end method

.method public phase(I)V
    .locals 0
    .param p1, "newPhase"    # I

    .prologue
    .line 436
    .local p0, "this":Lrx/observables/AbstractOnSubscribe$SubscriptionState;, "Lrx/observables/AbstractOnSubscribe$SubscriptionState<TT;TS;>;"
    iput p1, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->phase:I

    .line 437
    return-void
.end method

.method public state()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TS;"
        }
    .end annotation

    .prologue
    .line 420
    .local p0, "this":Lrx/observables/AbstractOnSubscribe$SubscriptionState;, "Lrx/observables/AbstractOnSubscribe$SubscriptionState<TT;TS;>;"
    iget-object v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->state:Ljava/lang/Object;

    return-object v0
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 518
    .local p0, "this":Lrx/observables/AbstractOnSubscribe$SubscriptionState;, "Lrx/observables/AbstractOnSubscribe$SubscriptionState<TT;TS;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->stopRequested:Z

    .line 519
    return-void
.end method

.method protected stopRequested()Z
    .locals 1

    .prologue
    .line 571
    .local p0, "this":Lrx/observables/AbstractOnSubscribe$SubscriptionState;, "Lrx/observables/AbstractOnSubscribe$SubscriptionState<TT;TS;>;"
    iget-boolean v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->stopRequested:Z

    return v0
.end method

.method protected terminate()V
    .locals 3

    .prologue
    .line 612
    .local p0, "this":Lrx/observables/AbstractOnSubscribe$SubscriptionState;, "Lrx/observables/AbstractOnSubscribe$SubscriptionState<TT;TS;>;"
    :cond_0
    iget-object v1, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->inUse:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    .line 613
    .local v0, "i":I
    if-gtz v0, :cond_1

    .line 621
    :goto_0
    return-void

    .line 616
    :cond_1
    iget-object v1, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->inUse:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 617
    iget-object v1, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->parent:Lrx/observables/AbstractOnSubscribe;

    iget-object v2, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->state:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lrx/observables/AbstractOnSubscribe;->onTerminated(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method protected use()Z
    .locals 4

    .prologue
    .local p0, "this":Lrx/observables/AbstractOnSubscribe$SubscriptionState;, "Lrx/observables/AbstractOnSubscribe$SubscriptionState<TT;TS;>;"
    const/4 v1, 0x1

    .line 583
    iget-object v2, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->inUse:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    .line 584
    .local v0, "i":I
    if-nez v0, :cond_1

    .line 585
    const/4 v1, 0x0

    .line 588
    :cond_0
    return v1

    .line 587
    :cond_1
    if-ne v0, v1, :cond_2

    iget-object v2, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->inUse:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v3, 0x2

    invoke-virtual {v2, v1, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v2

    if-nez v2, :cond_0

    .line 590
    :cond_2
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "This is not reentrant nor threadsafe!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected verify()Z
    .locals 1

    .prologue
    .line 566
    .local p0, "this":Lrx/observables/AbstractOnSubscribe$SubscriptionState;, "Lrx/observables/AbstractOnSubscribe$SubscriptionState<TT;TS;>;"
    iget-boolean v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->hasOnNext:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->hasCompleted:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lrx/observables/AbstractOnSubscribe$SubscriptionState;->stopRequested:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
