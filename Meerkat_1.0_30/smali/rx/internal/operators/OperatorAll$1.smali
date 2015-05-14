.class Lrx/internal/operators/OperatorAll$1;
.super Lrx/Subscriber;
.source "OperatorAll.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorAll;->call(Lrx/Subscriber;)Lrx/Subscriber;
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
.field done:Z

.field final synthetic this$0:Lrx/internal/operators/OperatorAll;

.field final synthetic val$child:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorAll;Lrx/Subscriber;)V
    .locals 0

    .prologue
    .line 37
    .local p0, "this":Lrx/internal/operators/OperatorAll$1;, "Lrx/internal/operators/OperatorAll.1;"
    iput-object p1, p0, Lrx/internal/operators/OperatorAll$1;->this$0:Lrx/internal/operators/OperatorAll;

    iput-object p2, p0, Lrx/internal/operators/OperatorAll$1;->val$child:Lrx/Subscriber;

    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 2

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorAll$1;, "Lrx/internal/operators/OperatorAll.1;"
    const/4 v1, 0x1

    .line 61
    iget-boolean v0, p0, Lrx/internal/operators/OperatorAll$1;->done:Z

    if-nez v0, :cond_0

    .line 62
    iput-boolean v1, p0, Lrx/internal/operators/OperatorAll$1;->done:Z

    .line 63
    iget-object v0, p0, Lrx/internal/operators/OperatorAll$1;->val$child:Lrx/Subscriber;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 64
    iget-object v0, p0, Lrx/internal/operators/OperatorAll$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 66
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 56
    .local p0, "this":Lrx/internal/operators/OperatorAll$1;, "Lrx/internal/operators/OperatorAll.1;"
    iget-object v0, p0, Lrx/internal/operators/OperatorAll$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 57
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lrx/internal/operators/OperatorAll$1;, "Lrx/internal/operators/OperatorAll.1;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lrx/internal/operators/OperatorAll$1;->this$0:Lrx/internal/operators/OperatorAll;

    # getter for: Lrx/internal/operators/OperatorAll;->predicate:Lrx/functions/Func1;
    invoke-static {v1}, Lrx/internal/operators/OperatorAll;->access$000(Lrx/internal/operators/OperatorAll;)Lrx/functions/Func1;

    move-result-object v1

    invoke-interface {v1, p1}, Lrx/functions/Func1;->call(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 43
    .local v0, "result":Z
    if-nez v0, :cond_0

    iget-boolean v1, p0, Lrx/internal/operators/OperatorAll$1;->done:Z

    if-nez v1, :cond_0

    .line 44
    const/4 v1, 0x1

    iput-boolean v1, p0, Lrx/internal/operators/OperatorAll$1;->done:Z

    .line 45
    iget-object v1, p0, Lrx/internal/operators/OperatorAll$1;->val$child:Lrx/Subscriber;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 46
    iget-object v1, p0, Lrx/internal/operators/OperatorAll$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v1}, Lrx/Subscriber;->onCompleted()V

    .line 47
    invoke-virtual {p0}, Lrx/internal/operators/OperatorAll$1;->unsubscribe()V

    .line 52
    :goto_0
    return-void

    .line 50
    :cond_0
    const-wide/16 v2, 0x1

    invoke-virtual {p0, v2, v3}, Lrx/internal/operators/OperatorAll$1;->request(J)V

    goto :goto_0
.end method
