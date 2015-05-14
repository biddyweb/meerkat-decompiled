.class Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;
.super Lrx/Subscriber;
.source "OperatorSwitchIfEmpty.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->subscribeToAlternate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lrx/Subscriber",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;)V
    .locals 0

    .prologue
    .line 80
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;, "Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber.2;"
    iput-object p1, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;->this$1:Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;

    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .prologue
    .line 102
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;, "Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber.2;"
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;->this$1:Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;

    # getter for: Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->child:Lrx/Subscriber;
    invoke-static {v0}, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->access$000(Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;)Lrx/Subscriber;

    move-result-object v0

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 103
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 107
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;, "Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber.2;"
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;->this$1:Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;

    # getter for: Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->child:Lrx/Subscriber;
    invoke-static {v0}, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->access$000(Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;)Lrx/Subscriber;

    move-result-object v0

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 108
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
    .line 112
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;, "Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber.2;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;->this$1:Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;

    # getter for: Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->child:Lrx/Subscriber;
    invoke-static {v0}, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->access$000(Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;)Lrx/Subscriber;

    move-result-object v0

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 113
    return-void
.end method

.method public onStart()V
    .locals 4

    .prologue
    .line 94
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;, "Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber.2;"
    iget-object v2, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;->this$1:Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;

    iget-object v2, v2, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->consumerCapacity:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 95
    .local v0, "capacity":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    .line 96
    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;->request(J)V

    .line 98
    :cond_0
    return-void
.end method

.method public setProducer(Lrx/Producer;)V
    .locals 2
    .param p1, "producer"    # Lrx/Producer;

    .prologue
    .line 84
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;, "Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber.2;"
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;->this$1:Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;

    # getter for: Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->child:Lrx/Subscriber;
    invoke-static {v0}, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->access$000(Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;)Lrx/Subscriber;

    move-result-object v0

    new-instance v1, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2$1;

    invoke-direct {v1, p0, p1}, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2$1;-><init>(Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;Lrx/Producer;)V

    invoke-virtual {v0, v1}, Lrx/Subscriber;->setProducer(Lrx/Producer;)V

    .line 90
    return-void
.end method
