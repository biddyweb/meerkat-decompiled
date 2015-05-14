.class Lrx/internal/operators/OperatorDefaultIfEmpty$1;
.super Lrx/Subscriber;
.source "OperatorDefaultIfEmpty.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorDefaultIfEmpty;->call(Lrx/Subscriber;)Lrx/Subscriber;
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
.field hasValue:Z

.field final synthetic this$0:Lrx/internal/operators/OperatorDefaultIfEmpty;

.field final synthetic val$child:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorDefaultIfEmpty;Lrx/Subscriber;Lrx/Subscriber;)V
    .locals 0

    .prologue
    .line 35
    .local p0, "this":Lrx/internal/operators/OperatorDefaultIfEmpty$1;, "Lrx/internal/operators/OperatorDefaultIfEmpty.1;"
    .local p2, "x0":Lrx/Subscriber;, "Lrx/Subscriber<*>;"
    iput-object p1, p0, Lrx/internal/operators/OperatorDefaultIfEmpty$1;->this$0:Lrx/internal/operators/OperatorDefaultIfEmpty;

    iput-object p3, p0, Lrx/internal/operators/OperatorDefaultIfEmpty$1;->val$child:Lrx/Subscriber;

    invoke-direct {p0, p2}, Lrx/Subscriber;-><init>(Lrx/Subscriber;)V

    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 3

    .prologue
    .line 50
    .local p0, "this":Lrx/internal/operators/OperatorDefaultIfEmpty$1;, "Lrx/internal/operators/OperatorDefaultIfEmpty.1;"
    iget-boolean v1, p0, Lrx/internal/operators/OperatorDefaultIfEmpty$1;->hasValue:Z

    if-nez v1, :cond_0

    .line 52
    :try_start_0
    iget-object v1, p0, Lrx/internal/operators/OperatorDefaultIfEmpty$1;->val$child:Lrx/Subscriber;

    iget-object v2, p0, Lrx/internal/operators/OperatorDefaultIfEmpty$1;->this$0:Lrx/internal/operators/OperatorDefaultIfEmpty;

    iget-object v2, v2, Lrx/internal/operators/OperatorDefaultIfEmpty;->defaultValue:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    :cond_0
    iget-object v1, p0, Lrx/internal/operators/OperatorDefaultIfEmpty$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v1}, Lrx/Subscriber;->onCompleted()V

    .line 59
    :goto_0
    return-void

    .line 53
    :catch_0
    move-exception v0

    .line 54
    .local v0, "e":Ljava/lang/Throwable;
    iget-object v1, p0, Lrx/internal/operators/OperatorDefaultIfEmpty$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v1, v0}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 45
    .local p0, "this":Lrx/internal/operators/OperatorDefaultIfEmpty$1;, "Lrx/internal/operators/OperatorDefaultIfEmpty.1;"
    iget-object v0, p0, Lrx/internal/operators/OperatorDefaultIfEmpty$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 46
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
    .line 39
    .local p0, "this":Lrx/internal/operators/OperatorDefaultIfEmpty$1;, "Lrx/internal/operators/OperatorDefaultIfEmpty.1;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrx/internal/operators/OperatorDefaultIfEmpty$1;->hasValue:Z

    .line 40
    iget-object v0, p0, Lrx/internal/operators/OperatorDefaultIfEmpty$1;->val$child:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 41
    return-void
.end method
