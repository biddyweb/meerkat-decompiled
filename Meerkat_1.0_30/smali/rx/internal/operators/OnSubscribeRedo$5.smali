.class Lrx/internal/operators/OnSubscribeRedo$5;
.super Ljava/lang/Object;
.source "OnSubscribeRedo.java"

# interfaces
.implements Lrx/Producer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OnSubscribeRedo;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrx/internal/operators/OnSubscribeRedo;

.field final synthetic val$consumerCapacity:Ljava/util/concurrent/atomic/AtomicLong;

.field final synthetic val$currentProducer:Ljava/util/concurrent/atomic/AtomicReference;

.field final synthetic val$resumeBoundary:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final synthetic val$subscribeToSource:Lrx/functions/Action0;

.field final synthetic val$worker:Lrx/Scheduler$Worker;


# direct methods
.method constructor <init>(Lrx/internal/operators/OnSubscribeRedo;Ljava/util/concurrent/atomic/AtomicLong;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/atomic/AtomicBoolean;Lrx/Scheduler$Worker;Lrx/functions/Action0;)V
    .locals 0

    .prologue
    .line 322
    .local p0, "this":Lrx/internal/operators/OnSubscribeRedo$5;, "Lrx/internal/operators/OnSubscribeRedo.5;"
    iput-object p1, p0, Lrx/internal/operators/OnSubscribeRedo$5;->this$0:Lrx/internal/operators/OnSubscribeRedo;

    iput-object p2, p0, Lrx/internal/operators/OnSubscribeRedo$5;->val$consumerCapacity:Ljava/util/concurrent/atomic/AtomicLong;

    iput-object p3, p0, Lrx/internal/operators/OnSubscribeRedo$5;->val$currentProducer:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object p4, p0, Lrx/internal/operators/OnSubscribeRedo$5;->val$resumeBoundary:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p5, p0, Lrx/internal/operators/OnSubscribeRedo$5;->val$worker:Lrx/Scheduler$Worker;

    iput-object p6, p0, Lrx/internal/operators/OnSubscribeRedo$5;->val$subscribeToSource:Lrx/functions/Action0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 7
    .param p1, "n"    # J

    .prologue
    .line 326
    .local p0, "this":Lrx/internal/operators/OnSubscribeRedo$5;, "Lrx/internal/operators/OnSubscribeRedo.5;"
    iget-object v3, p0, Lrx/internal/operators/OnSubscribeRedo$5;->val$consumerCapacity:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v3, p1, p2}, Lrx/internal/operators/BackpressureUtils;->getAndAddRequest(Ljava/util/concurrent/atomic/AtomicLong;J)J

    move-result-wide v0

    .line 327
    .local v0, "c":J
    iget-object v3, p0, Lrx/internal/operators/OnSubscribeRedo$5;->val$currentProducer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrx/Producer;

    .line 328
    .local v2, "producer":Lrx/Producer;
    if-eqz v2, :cond_1

    .line 329
    invoke-interface {v2, p1, p2}, Lrx/Producer;->request(J)V

    .line 334
    :cond_0
    :goto_0
    return-void

    .line 331
    :cond_1
    const-wide/16 v4, 0x0

    cmp-long v3, v0, v4

    if-nez v3, :cond_0

    iget-object v3, p0, Lrx/internal/operators/OnSubscribeRedo$5;->val$resumeBoundary:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 332
    iget-object v3, p0, Lrx/internal/operators/OnSubscribeRedo$5;->val$worker:Lrx/Scheduler$Worker;

    iget-object v4, p0, Lrx/internal/operators/OnSubscribeRedo$5;->val$subscribeToSource:Lrx/functions/Action0;

    invoke-virtual {v3, v4}, Lrx/Scheduler$Worker;->schedule(Lrx/functions/Action0;)Lrx/Subscription;

    goto :goto_0
.end method
