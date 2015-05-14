.class Lrx/internal/operators/OperatorMulticast$2;
.super Lrx/Subscriber;
.source "OperatorMulticast.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorMulticast;->connect(Lrx/functions/Action1;)V
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
.field final synthetic this$0:Lrx/internal/operators/OperatorMulticast;

.field final synthetic val$subject:Lrx/subjects/Subject;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorMulticast;Lrx/subjects/Subject;)V
    .locals 0

    .prologue
    .line 93
    .local p0, "this":Lrx/internal/operators/OperatorMulticast$2;, "Lrx/internal/operators/OperatorMulticast.2;"
    iput-object p1, p0, Lrx/internal/operators/OperatorMulticast$2;->this$0:Lrx/internal/operators/OperatorMulticast;

    iput-object p2, p0, Lrx/internal/operators/OperatorMulticast$2;->val$subject:Lrx/subjects/Subject;

    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .prologue
    .line 96
    .local p0, "this":Lrx/internal/operators/OperatorMulticast$2;, "Lrx/internal/operators/OperatorMulticast.2;"
    iget-object v0, p0, Lrx/internal/operators/OperatorMulticast$2;->val$subject:Lrx/subjects/Subject;

    invoke-virtual {v0}, Lrx/subjects/Subject;->onCompleted()V

    .line 97
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 101
    .local p0, "this":Lrx/internal/operators/OperatorMulticast$2;, "Lrx/internal/operators/OperatorMulticast.2;"
    iget-object v0, p0, Lrx/internal/operators/OperatorMulticast$2;->val$subject:Lrx/subjects/Subject;

    invoke-virtual {v0, p1}, Lrx/subjects/Subject;->onError(Ljava/lang/Throwable;)V

    .line 102
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
    .line 106
    .local p0, "this":Lrx/internal/operators/OperatorMulticast$2;, "Lrx/internal/operators/OperatorMulticast.2;"
    .local p1, "args":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lrx/internal/operators/OperatorMulticast$2;->val$subject:Lrx/subjects/Subject;

    invoke-virtual {v0, p1}, Lrx/subjects/Subject;->onNext(Ljava/lang/Object;)V

    .line 107
    return-void
.end method
