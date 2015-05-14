.class Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;
.super Lrx/Subscriber;
.source "OperatorOnErrorResumeNextViaFunction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction;->call(Lrx/Subscriber;)Lrx/Subscriber;
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
.field private done:Z

.field final synthetic this$0:Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction;

.field final synthetic val$child:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction;Lrx/Subscriber;)V
    .locals 1

    .prologue
    .line 54
    .local p0, "this":Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;, "Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction.1;"
    iput-object p1, p0, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;->this$0:Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction;

    iput-object p2, p0, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;->val$child:Lrx/Subscriber;

    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    .line 56
    const/4 v0, 0x0

    iput-boolean v0, p0, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;->done:Z

    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .prologue
    .line 60
    .local p0, "this":Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;, "Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction.1;"
    iget-boolean v0, p0, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;->done:Z

    if-eqz v0, :cond_0

    .line 65
    :goto_0
    return-void

    .line 63
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;->done:Z

    .line 64
    iget-object v0, p0, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 69
    .local p0, "this":Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;, "Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction.1;"
    iget-boolean v2, p0, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;->done:Z

    if-eqz v2, :cond_0

    .line 70
    invoke-static {p1}, Lrx/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 82
    :goto_0
    return-void

    .line 73
    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;->done:Z

    .line 75
    :try_start_0
    invoke-static {}, Lrx/plugins/RxJavaPlugins;->getInstance()Lrx/plugins/RxJavaPlugins;

    move-result-object v2

    invoke-virtual {v2}, Lrx/plugins/RxJavaPlugins;->getErrorHandler()Lrx/plugins/RxJavaErrorHandler;

    move-result-object v2

    invoke-virtual {v2, p1}, Lrx/plugins/RxJavaErrorHandler;->handleError(Ljava/lang/Throwable;)V

    .line 76
    invoke-virtual {p0}, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;->unsubscribe()V

    .line 77
    iget-object v2, p0, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;->this$0:Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction;

    # getter for: Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction;->resumeFunction:Lrx/functions/Func1;
    invoke-static {v2}, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction;->access$000(Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction;)Lrx/functions/Func1;

    move-result-object v2

    invoke-interface {v2, p1}, Lrx/functions/Func1;->call(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrx/Observable;

    .line 78
    .local v1, "resume":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    iget-object v2, p0, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v1, v2}, Lrx/Observable;->unsafeSubscribe(Lrx/Subscriber;)Lrx/Subscription;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 79
    .end local v1    # "resume":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    :catch_0
    move-exception v0

    .line 80
    .local v0, "e2":Ljava/lang/Throwable;
    iget-object v2, p0, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v2, v0}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

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
    .line 86
    .local p0, "this":Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;, "Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction.1;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;->done:Z

    if-eqz v0, :cond_0

    .line 90
    :goto_0
    return-void

    .line 89
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public setProducer(Lrx/Producer;)V
    .locals 2
    .param p1, "producer"    # Lrx/Producer;

    .prologue
    .line 94
    .local p0, "this":Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;, "Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction.1;"
    iget-object v0, p0, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;->val$child:Lrx/Subscriber;

    new-instance v1, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1$1;

    invoke-direct {v1, p0, p1}, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1$1;-><init>(Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction$1;Lrx/Producer;)V

    invoke-virtual {v0, v1}, Lrx/Subscriber;->setProducer(Lrx/Producer;)V

    .line 100
    return-void
.end method
