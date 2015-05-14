.class final Lrx/internal/operators/OnSubscribeRange$RangeProducer;
.super Ljava/lang/Object;
.source "OnSubscribeRange.java"

# interfaces
.implements Lrx/Producer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OnSubscribeRange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RangeProducer"
.end annotation


# static fields
.field private static final REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicLongFieldUpdater",
            "<",
            "Lrx/internal/operators/OnSubscribeRange$RangeProducer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final end:I

.field private index:J

.field private final o:Lrx/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Subscriber",
            "<-",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private volatile requested:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 46
    const-class v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;

    const-string v1, "requested"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-result-object v0

    sput-object v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    return-void
.end method

.method private constructor <init>(Lrx/Subscriber;II)V
    .locals 2
    .param p2, "start"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Ljava/lang/Integer;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p1, "o":Lrx/Subscriber;, "Lrx/Subscriber<-Ljava/lang/Integer;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->o:Lrx/Subscriber;

    .line 52
    int-to-long v0, p2

    iput-wide v0, p0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->index:J

    .line 53
    iput p3, p0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->end:I

    .line 54
    return-void
.end method

.method synthetic constructor <init>(Lrx/Subscriber;IILrx/internal/operators/OnSubscribeRange$1;)V
    .locals 0
    .param p1, "x0"    # Lrx/Subscriber;
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # Lrx/internal/operators/OnSubscribeRange$1;

    .prologue
    .line 42
    invoke-direct {p0, p1, p2, p3}, Lrx/internal/operators/OnSubscribeRange$RangeProducer;-><init>(Lrx/Subscriber;II)V

    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 25
    .param p1, "n"    # J

    .prologue
    .line 58
    sget-object v7, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-object/from16 v0, p0

    invoke-virtual {v7, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v20

    const-wide v22, 0x7fffffffffffffffL

    cmp-long v7, v20, v22

    if-nez v7, :cond_1

    .line 108
    :cond_0
    :goto_0
    return-void

    .line 62
    :cond_1
    const-wide v20, 0x7fffffffffffffffL

    cmp-long v7, p1, v20

    if-nez v7, :cond_3

    .line 63
    sget-object v7, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    invoke-virtual {v7, v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->set(Ljava/lang/Object;J)V

    .line 65
    move-object/from16 v0, p0

    iget-wide v10, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->index:J

    .local v10, "i":J
    :goto_1
    move-object/from16 v0, p0

    iget v7, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->end:I

    int-to-long v0, v7

    move-wide/from16 v20, v0

    cmp-long v7, v10, v20

    if-gtz v7, :cond_2

    .line 66
    move-object/from16 v0, p0

    iget-object v7, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->o:Lrx/Subscriber;

    invoke-virtual {v7}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v7

    if-nez v7, :cond_0

    .line 69
    move-object/from16 v0, p0

    iget-object v7, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->o:Lrx/Subscriber;

    long-to-int v0, v10

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 65
    const-wide/16 v20, 0x1

    add-long v10, v10, v20

    goto :goto_1

    .line 71
    :cond_2
    move-object/from16 v0, p0

    iget-object v7, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->o:Lrx/Subscriber;

    invoke-virtual {v7}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v7

    if-nez v7, :cond_0

    .line 72
    move-object/from16 v0, p0

    iget-object v7, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->o:Lrx/Subscriber;

    invoke-virtual {v7}, Lrx/Subscriber;->onCompleted()V

    goto :goto_0

    .line 74
    .end local v10    # "i":J
    :cond_3
    const-wide/16 v20, 0x0

    cmp-long v7, p1, v20

    if-lez v7, :cond_0

    .line 76
    sget-object v7, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    invoke-static {v7, v0, v1, v2}, Lrx/internal/operators/BackpressureUtils;->getAndAddRequest(Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;Ljava/lang/Object;J)J

    move-result-wide v4

    .line 77
    .local v4, "_c":J
    const-wide/16 v20, 0x0

    cmp-long v7, v4, v20

    if-nez v7, :cond_0

    .line 83
    :cond_4
    move-object/from16 v0, p0

    iget-wide v0, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->requested:J

    move-wide/from16 v16, v0

    .line 84
    .local v16, "r":J
    move-object/from16 v0, p0

    iget-wide v12, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->index:J

    .line 85
    .local v12, "idx":J
    move-object/from16 v0, p0

    iget v7, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->end:I

    int-to-long v0, v7

    move-wide/from16 v20, v0

    sub-long v20, v20, v12

    const-wide/16 v22, 0x1

    add-long v14, v20, v22

    .line 86
    .local v14, "numLeft":J
    invoke-static/range {v14 .. v17}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    .line 87
    .local v8, "e":J
    cmp-long v7, v14, v16

    if-gtz v7, :cond_5

    const/4 v6, 0x1

    .line 88
    .local v6, "completeOnFinish":Z
    :goto_2
    add-long v18, v8, v12

    .line 89
    .local v18, "stopAt":J
    move-wide v10, v12

    .restart local v10    # "i":J
    :goto_3
    cmp-long v7, v10, v18

    if-gez v7, :cond_6

    .line 90
    move-object/from16 v0, p0

    iget-object v7, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->o:Lrx/Subscriber;

    invoke-virtual {v7}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v7

    if-nez v7, :cond_0

    .line 93
    move-object/from16 v0, p0

    iget-object v7, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->o:Lrx/Subscriber;

    long-to-int v0, v10

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 89
    const-wide/16 v20, 0x1

    add-long v10, v10, v20

    goto :goto_3

    .line 87
    .end local v6    # "completeOnFinish":Z
    .end local v10    # "i":J
    .end local v18    # "stopAt":J
    :cond_5
    const/4 v6, 0x0

    goto :goto_2

    .line 95
    .restart local v6    # "completeOnFinish":Z
    .restart local v10    # "i":J
    .restart local v18    # "stopAt":J
    :cond_6
    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->index:J

    .line 97
    if-eqz v6, :cond_7

    .line 98
    move-object/from16 v0, p0

    iget-object v7, v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->o:Lrx/Subscriber;

    invoke-virtual {v7}, Lrx/Subscriber;->onCompleted()V

    goto/16 :goto_0

    .line 101
    :cond_7
    sget-object v7, Lrx/internal/operators/OnSubscribeRange$RangeProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    neg-long v0, v8

    move-wide/from16 v20, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v20

    invoke-virtual {v7, v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->addAndGet(Ljava/lang/Object;J)J

    move-result-wide v20

    const-wide/16 v22, 0x0

    cmp-long v7, v20, v22

    if-nez v7, :cond_4

    goto/16 :goto_0
.end method
