.class Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1$1;
.super Lrx/Subscriber;
.source "OperatorRetryWithPredicate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1;->call()V
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
.field final synthetic this$1:Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1;

.field final synthetic val$_self:Lrx/functions/Action0;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1;Lrx/functions/Action0;)V
    .locals 0

    .prologue
    .line 86
    .local p0, "this":Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1$1;, "Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1.1;"
    iput-object p1, p0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1$1;->this$1:Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1;

    iput-object p2, p0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1$1;->val$_self:Lrx/functions/Action0;

    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .prologue
    .line 90
    .local p0, "this":Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1$1;, "Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1.1;"
    iget-object v0, p0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1$1;->this$1:Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1;

    iget-object v0, v0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1;->this$0:Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber;

    iget-object v0, v0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 91
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 95
    .local p0, "this":Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1$1;, "Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1.1;"
    iget-object v0, p0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1$1;->this$1:Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1;

    iget-object v0, v0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1;->this$0:Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber;

    iget-object v0, v0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber;->predicate:Lrx/functions/Func2;

    iget-object v1, p0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1$1;->this$1:Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1;

    iget-object v1, v1, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1;->this$0:Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber;

    iget v1, v1, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber;->attempts:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lrx/functions/Func2;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1$1;->this$1:Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1;

    iget-object v0, v0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1;->this$0:Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber;

    iget-object v0, v0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber;->inner:Lrx/Scheduler$Worker;

    invoke-virtual {v0}, Lrx/Scheduler$Worker;->isUnsubscribed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 97
    iget-object v0, p0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1$1;->this$1:Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1;

    iget-object v0, v0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1;->this$0:Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber;

    iget-object v0, v0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber;->inner:Lrx/Scheduler$Worker;

    iget-object v1, p0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1$1;->val$_self:Lrx/functions/Action0;

    invoke-virtual {v0, v1}, Lrx/Scheduler$Worker;->schedule(Lrx/functions/Action0;)Lrx/Subscription;

    .line 102
    :goto_0
    return-void

    .line 100
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1$1;->this$1:Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1;

    iget-object v0, v0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1;->this$0:Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber;

    iget-object v0, v0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 106
    .local p0, "this":Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1$1;, "Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1.1;"
    .local p1, "v":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1$1;->this$1:Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1;

    iget-object v0, v0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber$1;->this$0:Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber;

    iget-object v0, v0, Lrx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 107
    return-void
.end method
