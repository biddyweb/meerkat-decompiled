.class Lrx/internal/operators/OperatorToObservableSortedList$1$1;
.super Ljava/lang/Object;
.source "OperatorToObservableSortedList.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorToObservableSortedList$1;->onCompleted()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lrx/internal/operators/OperatorToObservableSortedList$1;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorToObservableSortedList$1;)V
    .locals 0

    .prologue
    .line 65
    .local p0, "this":Lrx/internal/operators/OperatorToObservableSortedList$1$1;, "Lrx/internal/operators/OperatorToObservableSortedList$1.1;"
    iput-object p1, p0, Lrx/internal/operators/OperatorToObservableSortedList$1$1;->this$1:Lrx/internal/operators/OperatorToObservableSortedList$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, "this":Lrx/internal/operators/OperatorToObservableSortedList$1$1;, "Lrx/internal/operators/OperatorToObservableSortedList$1.1;"
    .local p1, "o1":Ljava/lang/Object;, "TT;"
    .local p2, "o2":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lrx/internal/operators/OperatorToObservableSortedList$1$1;->this$1:Lrx/internal/operators/OperatorToObservableSortedList$1;

    iget-object v0, v0, Lrx/internal/operators/OperatorToObservableSortedList$1;->this$0:Lrx/internal/operators/OperatorToObservableSortedList;

    # getter for: Lrx/internal/operators/OperatorToObservableSortedList;->sortFunction:Lrx/functions/Func2;
    invoke-static {v0}, Lrx/internal/operators/OperatorToObservableSortedList;->access$000(Lrx/internal/operators/OperatorToObservableSortedList;)Lrx/functions/Func2;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lrx/functions/Func2;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method
