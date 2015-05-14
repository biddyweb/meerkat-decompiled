.class Lrx/internal/operators/OnSubscribeAmb$1;
.super Ljava/lang/Object;
.source "OnSubscribeAmb.java"

# interfaces
.implements Lrx/functions/Action0;


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


# direct methods
.method constructor <init>(Lrx/internal/operators/OnSubscribeAmb;)V
    .locals 0

    .prologue
    .line 356
    .local p0, "this":Lrx/internal/operators/OnSubscribeAmb$1;, "Lrx/internal/operators/OnSubscribeAmb.1;"
    iput-object p1, p0, Lrx/internal/operators/OnSubscribeAmb$1;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .prologue
    .line 360
    .local p0, "this":Lrx/internal/operators/OnSubscribeAmb$1;, "Lrx/internal/operators/OnSubscribeAmb.1;"
    iget-object v2, p0, Lrx/internal/operators/OnSubscribeAmb$1;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v2}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v2

    iget-object v2, v2, Lrx/internal/operators/OnSubscribeAmb$Selection;->choice:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 362
    iget-object v2, p0, Lrx/internal/operators/OnSubscribeAmb$1;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v2}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v2

    iget-object v2, v2, Lrx/internal/operators/OnSubscribeAmb$Selection;->choice:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;

    invoke-virtual {v2}, Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;->unsubscribe()V

    .line 365
    :cond_0
    iget-object v2, p0, Lrx/internal/operators/OnSubscribeAmb$1;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v2}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v2

    iget-object v2, v2, Lrx/internal/operators/OnSubscribeAmb$Selection;->ambSubscribers:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 366
    iget-object v2, p0, Lrx/internal/operators/OnSubscribeAmb$1;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v2}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v2

    iget-object v2, v2, Lrx/internal/operators/OnSubscribeAmb$Selection;->ambSubscribers:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;

    .line 367
    .local v1, "other":Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;, "Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber<TT;>;"
    invoke-virtual {v1}, Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;->unsubscribe()V

    goto :goto_0

    .line 369
    .end local v1    # "other":Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber;, "Lrx/internal/operators/OnSubscribeAmb$AmbSubscriber<TT;>;"
    :cond_1
    iget-object v2, p0, Lrx/internal/operators/OnSubscribeAmb$1;->this$0:Lrx/internal/operators/OnSubscribeAmb;

    # getter for: Lrx/internal/operators/OnSubscribeAmb;->selection:Lrx/internal/operators/OnSubscribeAmb$Selection;
    invoke-static {v2}, Lrx/internal/operators/OnSubscribeAmb;->access$100(Lrx/internal/operators/OnSubscribeAmb;)Lrx/internal/operators/OnSubscribeAmb$Selection;

    move-result-object v2

    iget-object v2, v2, Lrx/internal/operators/OnSubscribeAmb$Selection;->ambSubscribers:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->clear()V

    .line 371
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_2
    return-void
.end method
