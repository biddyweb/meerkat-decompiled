.class final Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;
.super Ljava/lang/Object;
.source "OnSubscribeFromIterable.java"

# interfaces
.implements Lrx/Producer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OnSubscribeFromIterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "IterableProducer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/Producer;"
    }
.end annotation


# static fields
.field private static final REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicLongFieldUpdater",
            "<",
            "Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final it:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<+TT;>;"
        }
    .end annotation
.end field

.field private final o:Lrx/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field private volatile requested:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 56
    const-class v0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;

    const-string v1, "requested"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-result-object v0

    sput-object v0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    return-void
.end method

.method private constructor <init>(Lrx/Subscriber;Ljava/util/Iterator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;",
            "Ljava/util/Iterator",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, "this":Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;, "Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer<TT;>;"
    .local p1, "o":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    .local p2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->requested:J

    .line 59
    iput-object p1, p0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->o:Lrx/Subscriber;

    .line 60
    iput-object p2, p0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->it:Ljava/util/Iterator;

    .line 61
    return-void
.end method

.method synthetic constructor <init>(Lrx/Subscriber;Ljava/util/Iterator;Lrx/internal/operators/OnSubscribeFromIterable$1;)V
    .locals 0
    .param p1, "x0"    # Lrx/Subscriber;
    .param p2, "x1"    # Ljava/util/Iterator;
    .param p3, "x2"    # Lrx/internal/operators/OnSubscribeFromIterable$1;

    .prologue
    .line 50
    .local p0, "this":Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;, "Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer<TT;>;"
    invoke-direct {p0, p1, p2}, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;-><init>(Lrx/Subscriber;Ljava/util/Iterator;)V

    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 13
    .param p1, "n"    # J

    .prologue
    .local p0, "this":Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;, "Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer<TT;>;"
    const-wide v8, 0x7fffffffffffffffL

    const-wide/16 v10, 0x0

    .line 65
    sget-object v6, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v6, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v6

    cmp-long v6, v6, v8

    if-nez v6, :cond_1

    .line 115
    :cond_0
    :goto_0
    return-void

    .line 69
    :cond_1
    cmp-long v6, p1, v8

    if-nez v6, :cond_3

    .line 70
    sget-object v6, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v6, p0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->set(Ljava/lang/Object;J)V

    .line 72
    :goto_1
    iget-object v6, p0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->it:Ljava/util/Iterator;

    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 73
    iget-object v6, p0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->o:Lrx/Subscriber;

    invoke-virtual {v6}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v6

    if-nez v6, :cond_0

    .line 76
    iget-object v6, p0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->o:Lrx/Subscriber;

    iget-object v7, p0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->it:Ljava/util/Iterator;

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    goto :goto_1

    .line 78
    :cond_2
    iget-object v6, p0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->o:Lrx/Subscriber;

    invoke-virtual {v6}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v6

    if-nez v6, :cond_0

    .line 79
    iget-object v6, p0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->o:Lrx/Subscriber;

    invoke-virtual {v6}, Lrx/Subscriber;->onCompleted()V

    goto :goto_0

    .line 81
    :cond_3
    cmp-long v6, p1, v10

    if-lez v6, :cond_0

    .line 83
    sget-object v6, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-static {v6, p0, p1, p2}, Lrx/internal/operators/BackpressureUtils;->getAndAddRequest(Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;Ljava/lang/Object;J)J

    move-result-wide v0

    .line 84
    .local v0, "_c":J
    cmp-long v6, v0, v10

    if-nez v6, :cond_0

    .line 90
    :cond_4
    iget-wide v4, p0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->requested:J

    .line 91
    .local v4, "r":J
    move-wide v2, v4

    .line 92
    .local v2, "numToEmit":J
    :goto_2
    iget-object v6, p0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->it:Ljava/util/Iterator;

    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    const-wide/16 v6, 0x1

    sub-long/2addr v2, v6

    cmp-long v6, v2, v10

    if-ltz v6, :cond_5

    .line 93
    iget-object v6, p0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->o:Lrx/Subscriber;

    invoke-virtual {v6}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v6

    if-nez v6, :cond_0

    .line 96
    iget-object v6, p0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->o:Lrx/Subscriber;

    iget-object v7, p0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->it:Ljava/util/Iterator;

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    goto :goto_2

    .line 100
    :cond_5
    iget-object v6, p0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->it:Ljava/util/Iterator;

    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_6

    .line 101
    iget-object v6, p0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->o:Lrx/Subscriber;

    invoke-virtual {v6}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v6

    if-nez v6, :cond_0

    .line 102
    iget-object v6, p0, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->o:Lrx/Subscriber;

    invoke-virtual {v6}, Lrx/Subscriber;->onCompleted()V

    goto :goto_0

    .line 106
    :cond_6
    sget-object v6, Lrx/internal/operators/OnSubscribeFromIterable$IterableProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    neg-long v8, v4

    invoke-virtual {v6, p0, v8, v9}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->addAndGet(Ljava/lang/Object;J)J

    move-result-wide v6

    cmp-long v6, v6, v10

    if-nez v6, :cond_4

    goto/16 :goto_0
.end method
