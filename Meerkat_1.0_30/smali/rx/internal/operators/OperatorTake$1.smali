.class Lrx/internal/operators/OperatorTake$1;
.super Lrx/Subscriber;
.source "OperatorTake.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorTake;->call(Lrx/Subscriber;)Lrx/Subscriber;
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
.field completed:Z

.field count:I

.field final synthetic this$0:Lrx/internal/operators/OperatorTake;

.field final synthetic val$child:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorTake;Lrx/Subscriber;)V
    .locals 1

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorTake$1;, "Lrx/internal/operators/OperatorTake.1;"
    const/4 v0, 0x0

    .line 42
    iput-object p1, p0, Lrx/internal/operators/OperatorTake$1;->this$0:Lrx/internal/operators/OperatorTake;

    iput-object p2, p0, Lrx/internal/operators/OperatorTake$1;->val$child:Lrx/Subscriber;

    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    .line 44
    iput v0, p0, Lrx/internal/operators/OperatorTake$1;->count:I

    .line 45
    iput-boolean v0, p0, Lrx/internal/operators/OperatorTake$1;->completed:Z

    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .prologue
    .line 49
    .local p0, "this":Lrx/internal/operators/OperatorTake$1;, "Lrx/internal/operators/OperatorTake.1;"
    iget-boolean v0, p0, Lrx/internal/operators/OperatorTake$1;->completed:Z

    if-nez v0, :cond_0

    .line 50
    iget-object v0, p0, Lrx/internal/operators/OperatorTake$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 52
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 56
    .local p0, "this":Lrx/internal/operators/OperatorTake$1;, "Lrx/internal/operators/OperatorTake.1;"
    iget-boolean v0, p0, Lrx/internal/operators/OperatorTake$1;->completed:Z

    if-nez v0, :cond_0

    .line 57
    iget-object v0, p0, Lrx/internal/operators/OperatorTake$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 59
    :cond_0
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p0, "this":Lrx/internal/operators/OperatorTake$1;, "Lrx/internal/operators/OperatorTake.1;"
    .local p1, "i":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Lrx/internal/operators/OperatorTake$1;->isUnsubscribed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 64
    iget v0, p0, Lrx/internal/operators/OperatorTake$1;->count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lrx/internal/operators/OperatorTake$1;->count:I

    iget-object v1, p0, Lrx/internal/operators/OperatorTake$1;->this$0:Lrx/internal/operators/OperatorTake;

    iget v1, v1, Lrx/internal/operators/OperatorTake;->limit:I

    if-lt v0, v1, :cond_0

    .line 65
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrx/internal/operators/OperatorTake$1;->completed:Z

    .line 67
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OperatorTake$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 68
    iget-boolean v0, p0, Lrx/internal/operators/OperatorTake$1;->completed:Z

    if-eqz v0, :cond_1

    .line 69
    iget-object v0, p0, Lrx/internal/operators/OperatorTake$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 70
    invoke-virtual {p0}, Lrx/internal/operators/OperatorTake$1;->unsubscribe()V

    .line 73
    :cond_1
    return-void
.end method

.method public setProducer(Lrx/Producer;)V
    .locals 2
    .param p1, "producer"    # Lrx/Producer;

    .prologue
    .line 80
    .local p0, "this":Lrx/internal/operators/OperatorTake$1;, "Lrx/internal/operators/OperatorTake.1;"
    iget-object v0, p0, Lrx/internal/operators/OperatorTake$1;->val$child:Lrx/Subscriber;

    new-instance v1, Lrx/internal/operators/OperatorTake$1$1;

    invoke-direct {v1, p0, p1}, Lrx/internal/operators/OperatorTake$1$1;-><init>(Lrx/internal/operators/OperatorTake$1;Lrx/Producer;)V

    invoke-virtual {v0, v1}, Lrx/Subscriber;->setProducer(Lrx/Producer;)V

    .line 94
    return-void
.end method
