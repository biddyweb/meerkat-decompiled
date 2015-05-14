.class Lrx/internal/operators/OperatorDelayWithSelector$1;
.super Lrx/Subscriber;
.source "OperatorDelayWithSelector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorDelayWithSelector;->call(Lrx/Subscriber;)Lrx/Subscriber;
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
.field final synthetic this$0:Lrx/internal/operators/OperatorDelayWithSelector;

.field final synthetic val$child:Lrx/observers/SerializedSubscriber;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorDelayWithSelector;Lrx/observers/SerializedSubscriber;)V
    .locals 0

    .prologue
    .line 47
    .local p0, "this":Lrx/internal/operators/OperatorDelayWithSelector$1;, "Lrx/internal/operators/OperatorDelayWithSelector.1;"
    iput-object p1, p0, Lrx/internal/operators/OperatorDelayWithSelector$1;->this$0:Lrx/internal/operators/OperatorDelayWithSelector;

    iput-object p2, p0, Lrx/internal/operators/OperatorDelayWithSelector$1;->val$child:Lrx/observers/SerializedSubscriber;

    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .prologue
    .line 51
    .local p0, "this":Lrx/internal/operators/OperatorDelayWithSelector$1;, "Lrx/internal/operators/OperatorDelayWithSelector.1;"
    iget-object v0, p0, Lrx/internal/operators/OperatorDelayWithSelector$1;->val$child:Lrx/observers/SerializedSubscriber;

    invoke-virtual {v0}, Lrx/observers/SerializedSubscriber;->onCompleted()V

    .line 52
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 56
    .local p0, "this":Lrx/internal/operators/OperatorDelayWithSelector$1;, "Lrx/internal/operators/OperatorDelayWithSelector.1;"
    iget-object v0, p0, Lrx/internal/operators/OperatorDelayWithSelector$1;->val$child:Lrx/observers/SerializedSubscriber;

    invoke-virtual {v0, p1}, Lrx/observers/SerializedSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 57
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
    .line 61
    .local p0, "this":Lrx/internal/operators/OperatorDelayWithSelector$1;, "Lrx/internal/operators/OperatorDelayWithSelector.1;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lrx/internal/operators/OperatorDelayWithSelector$1;->val$child:Lrx/observers/SerializedSubscriber;

    invoke-virtual {v0, p1}, Lrx/observers/SerializedSubscriber;->onNext(Ljava/lang/Object;)V

    .line 62
    return-void
.end method
