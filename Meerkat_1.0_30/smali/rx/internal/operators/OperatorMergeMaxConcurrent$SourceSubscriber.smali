.class final Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;
.super Lrx/Subscriber;
.source "OperatorMergeMaxConcurrent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorMergeMaxConcurrent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SourceSubscriber"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;
    }
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


# static fields
.field static final REQUESTED:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicLongFieldUpdater",
            "<",
            "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;",
            ">;"
        }
    .end annotation
.end field

.field static final SOURCE_INDEX:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater",
            "<",
            "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;",
            ">;"
        }
    .end annotation
.end field

.field static final WIP:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater",
            "<",
            "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field active:I

.field final csub:Lrx/subscriptions/CompositeSubscription;

.field emitting:Z

.field final guard:Ljava/lang/Object;

.field lastIndex:I

.field final maxConcurrency:I

.field missedEmitting:I

.field final nl:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite",
            "<TT;>;"
        }
    .end annotation
.end field

.field final queue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lrx/Observable",
            "<+TT;>;>;"
        }
    .end annotation
.end field

.field volatile requested:J

.field final s:Lrx/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Subscriber",
            "<TT;>;"
        }
    .end annotation
.end field

.field volatile sourceIndex:I

.field final subscribers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber",
            "<TT;>.MergeItemSubscriber;>;"
        }
    .end annotation
.end field

.field volatile wip:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 77
    const-class v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;

    const-string v1, "wip"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->WIP:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 81
    const-class v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;

    const-string v1, "sourceIndex"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->SOURCE_INDEX:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 101
    const-class v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;

    const-string v1, "requested"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-result-object v0

    sput-object v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->REQUESTED:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    return-void
.end method

.method public constructor <init>(ILrx/Subscriber;Lrx/subscriptions/CompositeSubscription;)V
    .locals 1
    .param p1, "maxConcurrency"    # I
    .param p3, "csub"    # Lrx/subscriptions/CompositeSubscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lrx/Subscriber",
            "<TT;>;",
            "Lrx/subscriptions/CompositeSubscription;",
            ")V"
        }
    .end annotation

    .prologue
    .line 106
    .local p0, "this":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>;"
    .local p2, "s":Lrx/Subscriber;, "Lrx/Subscriber<TT;>;"
    invoke-direct {p0, p2}, Lrx/Subscriber;-><init>(Lrx/Subscriber;)V

    .line 69
    invoke-static {}, Lrx/internal/operators/NotificationLite;->instance()Lrx/internal/operators/NotificationLite;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->nl:Lrx/internal/operators/NotificationLite;

    .line 107
    iput p1, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->maxConcurrency:I

    .line 108
    iput-object p2, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->s:Lrx/Subscriber;

    .line 109
    iput-object p3, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->csub:Lrx/subscriptions/CompositeSubscription;

    .line 110
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->guard:Ljava/lang/Object;

    .line 111
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0, p1}, Ljava/util/ArrayDeque;-><init>(I)V

    iput-object v0, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->queue:Ljava/util/Queue;

    .line 112
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->subscribers:Ljava/util/List;

    .line 113
    const/4 v0, 0x1

    iput v0, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->wip:I

    .line 114
    return-void
.end method


# virtual methods
.method protected downstreamRequest(J)V
    .locals 11
    .param p1, "n"    # J

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>;"
    const-wide v8, 0x7fffffffffffffffL

    .line 182
    :cond_0
    iget-wide v2, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->requested:J

    .line 184
    .local v2, "r":J
    cmp-long v0, v2, v8

    if-eqz v0, :cond_1

    cmp-long v0, p1, v8

    if-nez v0, :cond_1

    .line 185
    const-wide v4, 0x7fffffffffffffffL

    .line 192
    .local v4, "u":J
    :goto_0
    sget-object v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->REQUESTED:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-object v1, p0

    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 196
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->drain()V

    .line 197
    return-void

    .line 187
    .end local v4    # "u":J
    :cond_1
    add-long v0, v2, p1

    const-wide/16 v6, 0x0

    cmp-long v0, v0, v6

    if-gez v0, :cond_2

    .line 188
    const-wide v4, 0x7fffffffffffffffL

    .restart local v4    # "u":J
    goto :goto_0

    .line 190
    .end local v4    # "u":J
    :cond_2
    add-long v4, v2, p1

    .restart local v4    # "u":J
    goto :goto_0
.end method

.method protected drain()V
    .locals 26

    .prologue
    .line 200
    .local p0, "this":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>;"
    monitor-enter p0

    .line 201
    :try_start_0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->emitting:Z

    move/from16 v22, v0

    if-eqz v22, :cond_1

    .line 202
    move-object/from16 v0, p0

    iget v0, v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->missedEmitting:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->missedEmitting:I

    .line 203
    monitor-exit p0

    .line 300
    :cond_0
    :goto_0
    return-void

    .line 205
    :cond_1
    const/16 v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->emitting:Z

    .line 206
    const/16 v22, 0x0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->missedEmitting:I

    .line 207
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 208
    move-object/from16 v0, p0

    iget-object v0, v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->subscribers:Ljava/util/List;

    move-object/from16 v19, v0

    .line 209
    .local v19, "subs":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;>;"
    move-object/from16 v0, p0

    iget-object v7, v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->s:Lrx/Subscriber;

    .line 210
    .local v7, "child":Lrx/Subscriber;, "Lrx/Subscriber<TT;>;"
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v22

    move/from16 v0, v22

    new-array v4, v0, [Ljava/lang/Object;

    .line 215
    .local v4, "active":[Ljava/lang/Object;
    :cond_2
    :goto_1
    move-object/from16 v0, p0

    iget-wide v0, v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->requested:J

    move-wide/from16 v16, v0

    .local v16, "r":J
    const-wide/16 v22, 0x0

    cmp-long v22, v16, v22

    if-lez v22, :cond_9

    .line 216
    move-object/from16 v0, p0

    iget v12, v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->lastIndex:I

    .line 217
    .local v12, "idx":I
    monitor-enter v19

    .line 218
    :try_start_1
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v22

    array-length v0, v4

    move/from16 v23, v0

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_4

    .line 219
    move-object/from16 v0, v19

    invoke-interface {v0, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    .line 223
    :goto_2
    monitor-exit v19
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 225
    const/16 v18, 0x0

    .line 226
    .local v18, "resumeIndex":I
    const/4 v13, 0x0

    .line 227
    .local v13, "j":I
    move-object v5, v4

    .local v5, "arr$":[Ljava/lang/Object;
    array-length v14, v5

    .local v14, "len$":I
    const/4 v11, 0x0

    .local v11, "i$":I
    :goto_3
    if-ge v11, v14, :cond_3

    aget-object v15, v5, v11

    .local v15, "o":Ljava/lang/Object;
    move-object v9, v15

    .line 229
    check-cast v9, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;

    .line 230
    .local v9, "e":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    iget v0, v9, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->index:I

    move/from16 v22, v0

    move/from16 v0, v22

    if-ne v0, v12, :cond_5

    .line 231
    move/from16 v18, v13

    .line 236
    .end local v9    # "e":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    .end local v15    # "o":Ljava/lang/Object;
    :cond_3
    const/16 v20, 0x0

    .line 237
    .local v20, "sumConsumed":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_4
    array-length v0, v4

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v10, v0, :cond_b

    .line 238
    add-int v22, v10, v18

    array-length v0, v4

    move/from16 v23, v0

    rem-int v13, v22, v23

    .line 241
    aget-object v9, v4, v13

    check-cast v9, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;

    .line 242
    .restart local v9    # "e":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    iget-object v6, v9, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->buffer:Lrx/internal/util/RxRingBuffer;

    .line 243
    .local v6, "b":Lrx/internal/util/RxRingBuffer;
    iget v0, v9, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->index:I

    move/from16 v22, v0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->lastIndex:I

    .line 245
    iget-boolean v0, v9, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->once:Z

    move/from16 v22, v0

    if-nez v22, :cond_6

    invoke-virtual {v6}, Lrx/internal/util/RxRingBuffer;->peek()Ljava/lang/Object;

    move-result-object v22

    if-nez v22, :cond_6

    .line 246
    move-object/from16 v0, v19

    invoke-interface {v0, v9}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 248
    move-object/from16 v0, p0

    iget-object v0, v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->guard:Ljava/lang/Object;

    move-object/from16 v23, v0

    monitor-enter v23

    .line 249
    :try_start_2
    move-object/from16 v0, p0

    iget v0, v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->active:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, -0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->active:I

    .line 250
    monitor-exit v23
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 251
    move-object/from16 v0, p0

    iget-object v0, v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->csub:Lrx/subscriptions/CompositeSubscription;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v9}, Lrx/subscriptions/CompositeSubscription;->remove(Lrx/Subscription;)V

    .line 253
    invoke-virtual {v9}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->release()V

    .line 255
    invoke-virtual/range {p0 .. p0}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->subscribeNext()V

    .line 257
    sget-object v22, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->WIP:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->decrementAndGet(Ljava/lang/Object;)I

    goto/16 :goto_1

    .line 207
    .end local v4    # "active":[Ljava/lang/Object;
    .end local v5    # "arr$":[Ljava/lang/Object;
    .end local v6    # "b":Lrx/internal/util/RxRingBuffer;
    .end local v7    # "child":Lrx/Subscriber;, "Lrx/Subscriber<TT;>;"
    .end local v9    # "e":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    .end local v10    # "i":I
    .end local v11    # "i$":I
    .end local v12    # "idx":I
    .end local v13    # "j":I
    .end local v14    # "len$":I
    .end local v16    # "r":J
    .end local v18    # "resumeIndex":I
    .end local v19    # "subs":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;>;"
    .end local v20    # "sumConsumed":I
    :catchall_0
    move-exception v22

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v22

    .line 221
    .restart local v4    # "active":[Ljava/lang/Object;
    .restart local v7    # "child":Lrx/Subscriber;, "Lrx/Subscriber<TT;>;"
    .restart local v12    # "idx":I
    .restart local v16    # "r":J
    .restart local v19    # "subs":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;>;"
    :cond_4
    :try_start_4
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_2

    .line 223
    :catchall_1
    move-exception v22

    monitor-exit v19
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v22

    .line 234
    .restart local v5    # "arr$":[Ljava/lang/Object;
    .restart local v9    # "e":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    .restart local v11    # "i$":I
    .restart local v13    # "j":I
    .restart local v14    # "len$":I
    .restart local v15    # "o":Ljava/lang/Object;
    .restart local v18    # "resumeIndex":I
    :cond_5
    add-int/lit8 v13, v13, 0x1

    .line 227
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_3

    .line 250
    .end local v15    # "o":Ljava/lang/Object;
    .restart local v6    # "b":Lrx/internal/util/RxRingBuffer;
    .restart local v10    # "i":I
    .restart local v20    # "sumConsumed":I
    :catchall_2
    move-exception v22

    :try_start_5
    monitor-exit v23
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v22

    .line 262
    :cond_6
    const/4 v8, 0x0

    .line 264
    .local v8, "consumed":I
    :goto_5
    const-wide/16 v22, 0x0

    cmp-long v22, v16, v22

    if-lez v22, :cond_7

    invoke-virtual {v6}, Lrx/internal/util/RxRingBuffer;->poll()Ljava/lang/Object;

    move-result-object v21

    .local v21, "v":Ljava/lang/Object;
    if-eqz v21, :cond_7

    .line 265
    move-object/from16 v0, p0

    iget-object v0, v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->nl:Lrx/internal/operators/NotificationLite;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v0, v7, v1}, Lrx/internal/operators/NotificationLite;->accept(Lrx/Observer;Ljava/lang/Object;)Z

    .line 266
    invoke-virtual {v7}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v22

    if-nez v22, :cond_0

    .line 269
    const-wide/16 v22, 0x1

    sub-long v16, v16, v22

    .line 270
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    .line 272
    .end local v21    # "v":Ljava/lang/Object;
    :cond_7
    if-lez v8, :cond_8

    .line 273
    add-int v20, v20, v8

    .line 274
    sget-object v22, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->REQUESTED:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    neg-int v0, v8

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v24, v0

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    move-wide/from16 v2, v24

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->addAndGet(Ljava/lang/Object;J)J

    .line 275
    int-to-long v0, v8

    move-wide/from16 v22, v0

    move-wide/from16 v0, v22

    invoke-virtual {v9, v0, v1}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->requestMore(J)V

    .line 277
    :cond_8
    const-wide/16 v22, 0x0

    cmp-long v22, v16, v22

    if-nez v22, :cond_a

    .line 286
    .end local v5    # "arr$":[Ljava/lang/Object;
    .end local v6    # "b":Lrx/internal/util/RxRingBuffer;
    .end local v8    # "consumed":I
    .end local v9    # "e":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    .end local v10    # "i":I
    .end local v11    # "i$":I
    .end local v12    # "idx":I
    .end local v13    # "j":I
    .end local v14    # "len$":I
    .end local v18    # "resumeIndex":I
    .end local v20    # "sumConsumed":I
    :cond_9
    :goto_6
    array-length v0, v4

    move/from16 v22, v0

    if-nez v22, :cond_c

    .line 287
    move-object/from16 v0, p0

    iget v0, v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->wip:I

    move/from16 v22, v0

    if-nez v22, :cond_c

    .line 288
    invoke-virtual {v7}, Lrx/Subscriber;->onCompleted()V

    goto/16 :goto_0

    .line 237
    .restart local v5    # "arr$":[Ljava/lang/Object;
    .restart local v6    # "b":Lrx/internal/util/RxRingBuffer;
    .restart local v8    # "consumed":I
    .restart local v9    # "e":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    .restart local v10    # "i":I
    .restart local v11    # "i$":I
    .restart local v12    # "idx":I
    .restart local v13    # "j":I
    .restart local v14    # "len$":I
    .restart local v18    # "resumeIndex":I
    .restart local v20    # "sumConsumed":I
    :cond_a
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_4

    .line 281
    .end local v6    # "b":Lrx/internal/util/RxRingBuffer;
    .end local v8    # "consumed":I
    .end local v9    # "e":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    :cond_b
    if-nez v20, :cond_2

    goto :goto_6

    .line 292
    .end local v5    # "arr$":[Ljava/lang/Object;
    .end local v10    # "i":I
    .end local v11    # "i$":I
    .end local v12    # "idx":I
    .end local v13    # "j":I
    .end local v14    # "len$":I
    .end local v18    # "resumeIndex":I
    .end local v20    # "sumConsumed":I
    :cond_c
    monitor-enter p0

    .line 293
    :try_start_6
    move-object/from16 v0, p0

    iget v0, v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->missedEmitting:I

    move/from16 v22, v0

    if-nez v22, :cond_d

    .line 294
    const/16 v22, 0x0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->emitting:Z

    .line 295
    monitor-exit p0

    goto/16 :goto_0

    .line 298
    :catchall_3
    move-exception v22

    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    throw v22

    .line 297
    :cond_d
    const/16 v22, 0x0

    :try_start_7
    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->missedEmitting:I

    .line 298
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto/16 :goto_1
.end method

.method public onCompleted()V
    .locals 1

    .prologue
    .line 176
    .local p0, "this":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>;"
    sget-object v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->WIP:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->decrementAndGet(Ljava/lang/Object;)I

    .line 177
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->drain()V

    .line 178
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 8
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 155
    .local p0, "this":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>;"
    iget-object v7, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->subscribers:Ljava/util/List;

    monitor-enter v7

    .line 156
    :try_start_0
    iget-object v6, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->subscribers:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v1

    .line 157
    .local v1, "active":[Ljava/lang/Object;
    iget-object v6, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->subscribers:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->clear()V

    .line 158
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    :try_start_1
    iget-object v6, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->s:Lrx/Subscriber;

    invoke-virtual {v6, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 163
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->unsubscribe()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 165
    move-object v2, v1

    .local v2, "arr$":[Ljava/lang/Object;
    array-length v4, v2

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v5, v2, v3

    .local v5, "o":Ljava/lang/Object;
    move-object v0, v5

    .line 167
    check-cast v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;

    .line 168
    .local v0, "a":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    invoke-virtual {v0}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->release()V

    .line 165
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 158
    .end local v0    # "a":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    .end local v1    # "active":[Ljava/lang/Object;
    .end local v2    # "arr$":[Ljava/lang/Object;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "o":Ljava/lang/Object;
    :catchall_0
    move-exception v6

    :try_start_2
    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v6

    .line 165
    .restart local v1    # "active":[Ljava/lang/Object;
    :catchall_1
    move-exception v6

    move-object v2, v1

    .restart local v2    # "arr$":[Ljava/lang/Object;
    array-length v4, v2

    .restart local v4    # "len$":I
    const/4 v3, 0x0

    .restart local v3    # "i$":I
    :goto_1
    if-ge v3, v4, :cond_0

    aget-object v5, v2, v3

    .restart local v5    # "o":Ljava/lang/Object;
    move-object v0, v5

    .line 167
    check-cast v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;

    .line 168
    .restart local v0    # "a":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    invoke-virtual {v0}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;->release()V

    .line 165
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .end local v0    # "a":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    .end local v5    # "o":Ljava/lang/Object;
    :cond_0
    throw v6

    .line 172
    :cond_1
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 68
    .local p0, "this":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>;"
    check-cast p1, Lrx/Observable;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->onNext(Lrx/Observable;)V

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
    .line 123
    .local p0, "this":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>;"
    .local p1, "t":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    iget-object v1, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v1

    .line 124
    :try_start_0
    iget-object v0, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->queue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 125
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 126
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->subscribeNext()V

    .line 127
    return-void

    .line 125
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 118
    .local p0, "this":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>;"
    iget v0, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->maxConcurrency:I

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->request(J)V

    .line 119
    return-void
.end method

.method subscribeNext()V
    .locals 5

    .prologue
    .line 131
    .local p0, "this":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>;"
    iget-object v3, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v3

    .line 132
    :try_start_0
    iget-object v2, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->queue:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrx/Observable;

    .line 133
    .local v1, "t":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    if-eqz v1, :cond_0

    iget v2, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->active:I

    iget v4, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->maxConcurrency:I

    if-lt v2, v4, :cond_1

    .line 134
    :cond_0
    monitor-exit v3

    .line 150
    :goto_0
    return-void

    .line 136
    :cond_1
    iget v2, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->active:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->active:I

    .line 137
    iget-object v2, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->queue:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 138
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 140
    new-instance v0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;

    sget-object v2, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->SOURCE_INDEX:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->getAndIncrement(Ljava/lang/Object;)I

    move-result v2

    invoke-direct {v0, p0, v2}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;-><init>(Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;I)V

    .line 141
    .local v0, "itemSub":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    iget-object v2, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->subscribers:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    iget-object v2, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->csub:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v2, v0}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 145
    sget-object v2, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->WIP:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->incrementAndGet(Ljava/lang/Object;)I

    .line 147
    invoke-virtual {v1, v0}, Lrx/Observable;->unsafeSubscribe(Lrx/Subscriber;)Lrx/Subscription;

    .line 149
    const-wide/16 v2, 0x1

    invoke-virtual {p0, v2, v3}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->request(J)V

    goto :goto_0

    .line 138
    .end local v0    # "itemSub":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>.MergeItemSubscriber;"
    .end local v1    # "t":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method
