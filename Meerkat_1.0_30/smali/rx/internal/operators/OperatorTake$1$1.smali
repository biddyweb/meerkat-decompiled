.class Lrx/internal/operators/OperatorTake$1$1;
.super Ljava/lang/Object;
.source "OperatorTake.java"

# interfaces
.implements Lrx/Producer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorTake$1;->setProducer(Lrx/Producer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lrx/internal/operators/OperatorTake$1;

.field final synthetic val$producer:Lrx/Producer;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorTake$1;Lrx/Producer;)V
    .locals 0

    .prologue
    .line 80
    .local p0, "this":Lrx/internal/operators/OperatorTake$1$1;, "Lrx/internal/operators/OperatorTake$1.1;"
    iput-object p1, p0, Lrx/internal/operators/OperatorTake$1$1;->this$1:Lrx/internal/operators/OperatorTake$1;

    iput-object p2, p0, Lrx/internal/operators/OperatorTake$1$1;->val$producer:Lrx/Producer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 5
    .param p1, "n"    # J

    .prologue
    .line 84
    .local p0, "this":Lrx/internal/operators/OperatorTake$1$1;, "Lrx/internal/operators/OperatorTake$1.1;"
    iget-object v2, p0, Lrx/internal/operators/OperatorTake$1$1;->this$1:Lrx/internal/operators/OperatorTake$1;

    iget-boolean v2, v2, Lrx/internal/operators/OperatorTake$1;->completed:Z

    if-nez v2, :cond_0

    .line 85
    iget-object v2, p0, Lrx/internal/operators/OperatorTake$1$1;->this$1:Lrx/internal/operators/OperatorTake$1;

    iget-object v2, v2, Lrx/internal/operators/OperatorTake$1;->this$0:Lrx/internal/operators/OperatorTake;

    iget v2, v2, Lrx/internal/operators/OperatorTake;->limit:I

    iget-object v3, p0, Lrx/internal/operators/OperatorTake$1$1;->this$1:Lrx/internal/operators/OperatorTake$1;

    iget v3, v3, Lrx/internal/operators/OperatorTake$1;->count:I

    sub-int/2addr v2, v3

    int-to-long v0, v2

    .line 86
    .local v0, "c":J
    cmp-long v2, p1, v0

    if-gez v2, :cond_1

    .line 87
    iget-object v2, p0, Lrx/internal/operators/OperatorTake$1$1;->val$producer:Lrx/Producer;

    invoke-interface {v2, p1, p2}, Lrx/Producer;->request(J)V

    .line 92
    .end local v0    # "c":J
    :cond_0
    :goto_0
    return-void

    .line 89
    .restart local v0    # "c":J
    :cond_1
    iget-object v2, p0, Lrx/internal/operators/OperatorTake$1$1;->val$producer:Lrx/Producer;

    invoke-interface {v2, v0, v1}, Lrx/Producer;->request(J)V

    goto :goto_0
.end method
