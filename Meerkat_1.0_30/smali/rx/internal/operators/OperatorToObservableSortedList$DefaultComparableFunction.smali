.class Lrx/internal/operators/OperatorToObservableSortedList$DefaultComparableFunction;
.super Ljava/lang/Object;
.source "OperatorToObservableSortedList.java"

# interfaces
.implements Lrx/functions/Func2;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorToObservableSortedList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DefaultComparableFunction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/functions/Func2",
        "<",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lrx/internal/operators/OperatorToObservableSortedList$1;)V
    .locals 0
    .param p1, "x0"    # Lrx/internal/operators/OperatorToObservableSortedList$1;

    .prologue
    .line 98
    invoke-direct {p0}, Lrx/internal/operators/OperatorToObservableSortedList$DefaultComparableFunction;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Integer;
    .locals 3
    .param p1, "t1"    # Ljava/lang/Object;
    .param p2, "t2"    # Ljava/lang/Object;

    .prologue
    .line 104
    move-object v0, p1

    check-cast v0, Ljava/lang/Comparable;

    .local v0, "c1":Ljava/lang/Comparable;, "Ljava/lang/Comparable<Ljava/lang/Object;>;"
    move-object v1, p2

    .line 105
    check-cast v1, Ljava/lang/Comparable;

    .line 106
    .local v1, "c2":Ljava/lang/Comparable;, "Ljava/lang/Comparable<Ljava/lang/Object;>;"
    invoke-interface {v0, v1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    return-object v2
.end method

.method public bridge synthetic call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 98
    invoke-virtual {p0, p1, p2}, Lrx/internal/operators/OperatorToObservableSortedList$DefaultComparableFunction;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
