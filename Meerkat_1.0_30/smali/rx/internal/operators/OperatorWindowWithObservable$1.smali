.class Lrx/internal/operators/OperatorWindowWithObservable$1;
.super Ljava/lang/Object;
.source "OperatorWindowWithObservable.java"

# interfaces
.implements Lrx/functions/Func0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorWindowWithObservable;-><init>(Lrx/Observable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/functions/Func0",
        "<",
        "Lrx/Observable",
        "<TU;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lrx/internal/operators/OperatorWindowWithObservable;

.field final synthetic val$other:Lrx/Observable;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorWindowWithObservable;Lrx/Observable;)V
    .locals 0

    .prologue
    .line 43
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable$1;, "Lrx/internal/operators/OperatorWindowWithObservable.1;"
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithObservable$1;->this$0:Lrx/internal/operators/OperatorWindowWithObservable;

    iput-object p2, p0, Lrx/internal/operators/OperatorWindowWithObservable$1;->val$other:Lrx/Observable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 43
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable$1;, "Lrx/internal/operators/OperatorWindowWithObservable.1;"
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithObservable$1;->call()Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public call()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<TU;>;"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable$1;, "Lrx/internal/operators/OperatorWindowWithObservable.1;"
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithObservable$1;->val$other:Lrx/Observable;

    return-object v0
.end method
