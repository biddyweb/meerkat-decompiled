.class Lrx/internal/operators/OperatorSingle$1;
.super Lrx/Subscriber;
.source "OperatorSingle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorSingle;->call(Lrx/Subscriber;)Lrx/Subscriber;
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
.field private hasTooManyElements:Z

.field private isNonEmpty:Z

.field final synthetic this$0:Lrx/internal/operators/OperatorSingle;

.field final synthetic val$subscriber:Lrx/Subscriber;

.field private value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorSingle;Lrx/Subscriber;Lrx/Subscriber;)V
    .locals 1

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorSingle$1;, "Lrx/internal/operators/OperatorSingle.1;"
    .local p2, "x0":Lrx/Subscriber;, "Lrx/Subscriber<*>;"
    const/4 v0, 0x0

    .line 48
    iput-object p1, p0, Lrx/internal/operators/OperatorSingle$1;->this$0:Lrx/internal/operators/OperatorSingle;

    iput-object p3, p0, Lrx/internal/operators/OperatorSingle$1;->val$subscriber:Lrx/Subscriber;

    invoke-direct {p0, p2}, Lrx/Subscriber;-><init>(Lrx/Subscriber;)V

    .line 51
    iput-boolean v0, p0, Lrx/internal/operators/OperatorSingle$1;->isNonEmpty:Z

    .line 52
    iput-boolean v0, p0, Lrx/internal/operators/OperatorSingle$1;->hasTooManyElements:Z

    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 3

    .prologue
    .line 71
    .local p0, "this":Lrx/internal/operators/OperatorSingle$1;, "Lrx/internal/operators/OperatorSingle.1;"
    iget-boolean v0, p0, Lrx/internal/operators/OperatorSingle$1;->hasTooManyElements:Z

    if-eqz v0, :cond_0

    .line 86
    :goto_0
    return-void

    .line 74
    :cond_0
    iget-boolean v0, p0, Lrx/internal/operators/OperatorSingle$1;->isNonEmpty:Z

    if-eqz v0, :cond_1

    .line 75
    iget-object v0, p0, Lrx/internal/operators/OperatorSingle$1;->val$subscriber:Lrx/Subscriber;

    iget-object v1, p0, Lrx/internal/operators/OperatorSingle$1;->value:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 76
    iget-object v0, p0, Lrx/internal/operators/OperatorSingle$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    goto :goto_0

    .line 78
    :cond_1
    iget-object v0, p0, Lrx/internal/operators/OperatorSingle$1;->this$0:Lrx/internal/operators/OperatorSingle;

    # getter for: Lrx/internal/operators/OperatorSingle;->hasDefaultValue:Z
    invoke-static {v0}, Lrx/internal/operators/OperatorSingle;->access$000(Lrx/internal/operators/OperatorSingle;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 79
    iget-object v0, p0, Lrx/internal/operators/OperatorSingle$1;->val$subscriber:Lrx/Subscriber;

    iget-object v1, p0, Lrx/internal/operators/OperatorSingle$1;->this$0:Lrx/internal/operators/OperatorSingle;

    # getter for: Lrx/internal/operators/OperatorSingle;->defaultValue:Ljava/lang/Object;
    invoke-static {v1}, Lrx/internal/operators/OperatorSingle;->access$100(Lrx/internal/operators/OperatorSingle;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 80
    iget-object v0, p0, Lrx/internal/operators/OperatorSingle$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    goto :goto_0

    .line 82
    :cond_2
    iget-object v0, p0, Lrx/internal/operators/OperatorSingle$1;->val$subscriber:Lrx/Subscriber;

    new-instance v1, Ljava/util/NoSuchElementException;

    const-string v2, "Sequence contains no elements"

    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 90
    .local p0, "this":Lrx/internal/operators/OperatorSingle$1;, "Lrx/internal/operators/OperatorSingle.1;"
    iget-object v0, p0, Lrx/internal/operators/OperatorSingle$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 91
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorSingle$1;, "Lrx/internal/operators/OperatorSingle.1;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    const/4 v1, 0x1

    .line 56
    iget-boolean v0, p0, Lrx/internal/operators/OperatorSingle$1;->isNonEmpty:Z

    if-eqz v0, :cond_0

    .line 57
    iput-boolean v1, p0, Lrx/internal/operators/OperatorSingle$1;->hasTooManyElements:Z

    .line 58
    iget-object v0, p0, Lrx/internal/operators/OperatorSingle$1;->val$subscriber:Lrx/Subscriber;

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Sequence contains too many elements"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 59
    invoke-virtual {p0}, Lrx/internal/operators/OperatorSingle$1;->unsubscribe()V

    .line 67
    :goto_0
    return-void

    .line 61
    :cond_0
    iput-object p1, p0, Lrx/internal/operators/OperatorSingle$1;->value:Ljava/lang/Object;

    .line 62
    iput-boolean v1, p0, Lrx/internal/operators/OperatorSingle$1;->isNonEmpty:Z

    .line 65
    const-wide/16 v0, 0x1

    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/OperatorSingle$1;->request(J)V

    goto :goto_0
.end method
