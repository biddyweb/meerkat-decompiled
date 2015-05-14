.class Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2$1;
.super Ljava/lang/Object;
.source "OperatorSwitchIfEmpty.java"

# interfaces
.implements Lrx/Producer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;->setProducer(Lrx/Producer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;

.field final synthetic val$producer:Lrx/Producer;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;Lrx/Producer;)V
    .locals 0

    .prologue
    .line 84
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2$1;, "Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2.1;"
    iput-object p1, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2$1;->this$2:Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;

    iput-object p2, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2$1;->val$producer:Lrx/Producer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 87
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2$1;, "Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2.1;"
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2$1;->val$producer:Lrx/Producer;

    invoke-interface {v0, p1, p2}, Lrx/Producer;->request(J)V

    .line 88
    return-void
.end method
