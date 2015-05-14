.class Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$1;
.super Ljava/lang/Object;
.source "OperatorSwitchIfEmpty.java"

# interfaces
.implements Lrx/Producer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->setProducer(Lrx/Producer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;

.field final synthetic val$producer:Lrx/Producer;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;Lrx/Producer;)V
    .locals 0

    .prologue
    .line 59
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$1;, "Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber.1;"
    iput-object p1, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$1;->this$1:Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;

    iput-object p2, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$1;->val$producer:Lrx/Producer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 62
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$1;, "Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber.1;"
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$1;->this$1:Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;

    iget-boolean v0, v0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->empty:Z

    if-eqz v0, :cond_0

    .line 63
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$1;->this$1:Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;

    iget-object v0, v0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->consumerCapacity:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 65
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$1;->val$producer:Lrx/Producer;

    invoke-interface {v0, p1, p2}, Lrx/Producer;->request(J)V

    .line 66
    return-void
.end method
