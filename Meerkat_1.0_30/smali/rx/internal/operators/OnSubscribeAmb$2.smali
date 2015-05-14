.class Lrx/internal/operators/OnSubscribeAmb$2;
.super Ljava/lang/Object;
.source "OnSubscribeAmb.java"

# interfaces
.implements Lrx/Producer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OnSubscribeAmb;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrx/internal/operators/OnSubscribeAmb;

.field final synthetic val$subscriber:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lrx/internal/operators/OnSubscribeAmb;Lrx/Subscriber;)V
    .locals 0

    .prologue
    .line 374
    .local p0, "this":Lrx/internal/operators/OnSubscribeAmb$2;, "Lrx/internal/operators/OnSubscribeAmb.2;"
    iput-object p1, p0, Lrx/internal/operators/OnSubscribeAmb$2;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    iput-object p2, p0, Lrx/internal/operators/OnSubscribeAmb$2;->val$subscriber:Lrx/Subscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 9
    .param p1, "n"    # J

    .prologue
    .line 378
    .local p0, "this":Lrx/internal/operators/OnSubscribeAmb$2;, "Lrx/internal/operators/OnSubscribeAmb.2;"
    iget-object v2, p0, Lrx/internal/operators/OnSubscribeAmb$2;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v2}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v2

    iget-object v2, v2, Lrx/internal/operators/OnSubscribeAmb$Selection;->choice:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 380
    iget-object v2, p0, Lrx/internal/operators/OnSubscribeAmb$2;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v2}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v2

    iget-object v2, v2, Lrx/internal/operators/OnSubscribeAmb$Selection;->choice:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;

    # invokes: Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;->requestMore(J)V
    invoke-static {v2, p1, p2}, Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;->access$200(Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;J)V

    .line 397
    :cond_0
    :goto_0
    return-void

    .line 382
    :cond_1
    iget-object v2, p0, Lrx/internal/operators/OnSubscribeAmb$2;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->sources:Ljava/lang/Iterable;
    invoke-static {v2}, Lrx/internal/operators/OnSubscribeAmb;->access$300(Lrx/internal/operators/OnSubscribeAmb;)Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lrx/Observable;

    .line 383
    .local v7, "source":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    iget-object v2, p0, Lrx/internal/operators/OnSubscribeAmb$2;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v2}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v2

    if-nez v2, :cond_0

    .line 386
    new-instance v1, Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;

    iget-object v4, p0, Lrx/internal/operators/OnSubscribeAmb$2;->val$subscriber:Lrx/Subscriber;

    iget-object v2, p0, Lrx/internal/operators/OnSubscribeAmb$2;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v2}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v5

    const/4 v6, 0x0

    move-wide v2, p1

    invoke-direct/range {v1 .. v6}, Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;-><init>(JLrx/Subscriber;Lrx/internal/operators/OnSubscribeAmb$Selection;Lrx/internal/operators/OnSubscribeAmb$1;)V

    .line 387
    .local v1, "ambSubscriber":Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;, "Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber<TT;>;"
    iget-object v2, p0, Lrx/internal/operators/OnSubscribeAmb$2;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v2}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v2

    iget-object v2, v2, Lrx/internal/operators/OnSubscribeAmb$Selection;->ambSubscribers:Ljava/util/Collection;

    invoke-interface {v2, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 389
    iget-object v2, p0, Lrx/internal/operators/OnSubscribeAmb$2;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v2}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v2

    iget-object v2, v2, Lrx/internal/operators/OnSubscribeAmb$Selection;->choice:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 391
    iget-object v2, p0, Lrx/internal/operators/OnSubscribeAmb$2;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v2}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v3

    iget-object v2, p0, Lrx/internal/operators/OnSubscribeAmb$2;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v2}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v2

    iget-object v2, v2, Lrx/internal/operators/OnSubscribeAmb$Selection;->choice:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;

    invoke-virtual {v3, v2}, Lrx/internal/operators/OnSubscribeAmb$Selection;->unsubscribeOthers(Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;)V

    goto :goto_0

    .line 394
    :cond_2
    invoke-virtual {v7, v1}, Lrx/Observable;->unsafeSubscribe(Lrx/Subscriber;)Lrx/Subscription;

    goto :goto_1
.end method
