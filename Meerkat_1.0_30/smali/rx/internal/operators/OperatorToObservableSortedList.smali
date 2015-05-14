.class public final Lrx/internal/operators/OperatorToObservableSortedList;
.super Ljava/lang/Object;
.source "OperatorToObservableSortedList.java"

# interfaces
.implements Lrx/Observable$Operator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorToObservableSortedList$DefaultComparableFunction;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/Observable$Operator",
        "<",
        "Ljava/util/List",
        "<TT;>;TT;>;"
    }
.end annotation


# static fields
.field private static defaultSortFunction:Lrx/functions/Func2;


# instance fields
.field private final sortFunction:Lrx/functions/Func2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/functions/Func2",
            "<-TT;-TT;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 96
    new-instance v0, Lrx/internal/operators/OperatorToObservableSortedList$DefaultComparableFunction;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lrx/internal/operators/OperatorToObservableSortedList$DefaultComparableFunction;-><init>(Lrx/internal/operators/OperatorToObservableSortedList$1;)V

    sput-object v0, Lrx/internal/operators/OperatorToObservableSortedList;->defaultSortFunction:Lrx/functions/Func2;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    .local p0, "this":Lrx/internal/operators/OperatorToObservableSortedList;, "Lrx/internal/operators/OperatorToObservableSortedList<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    sget-object v0, Lrx/internal/operators/OperatorToObservableSortedList;->defaultSortFunction:Lrx/functions/Func2;

    iput-object v0, p0, Lrx/internal/operators/OperatorToObservableSortedList;->sortFunction:Lrx/functions/Func2;

    .line 43
    return-void
.end method

.method public constructor <init>(Lrx/functions/Func2;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func2",
            "<-TT;-TT;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p0, "this":Lrx/internal/operators/OperatorToObservableSortedList;, "Lrx/internal/operators/OperatorToObservableSortedList<TT;>;"
    .local p1, "sortFunction":Lrx/functions/Func2;, "Lrx/functions/Func2<-TT;-TT;Ljava/lang/Integer;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lrx/internal/operators/OperatorToObservableSortedList;->sortFunction:Lrx/functions/Func2;

    .line 47
    return-void
.end method

.method static synthetic access$000(Lrx/internal/operators/OperatorToObservableSortedList;)Lrx/functions/Func2;
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorToObservableSortedList;

    .prologue
    .line 37
    iget-object v0, p0, Lrx/internal/operators/OperatorToObservableSortedList;->sortFunction:Lrx/functions/Func2;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 37
    .local p0, "this":Lrx/internal/operators/OperatorToObservableSortedList;, "Lrx/internal/operators/OperatorToObservableSortedList<TT;>;"
    check-cast p1, Lrx/Subscriber;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorToObservableSortedList;->call(Lrx/Subscriber;)Lrx/Subscriber;

    move-result-object v0

    return-object v0
.end method

.method public call(Lrx/Subscriber;)Lrx/Subscriber;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Ljava/util/List",
            "<TT;>;>;)",
            "Lrx/Subscriber",
            "<-TT;>;"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lrx/internal/operators/OperatorToObservableSortedList;, "Lrx/internal/operators/OperatorToObservableSortedList<TT;>;"
    .local p1, "o":Lrx/Subscriber;, "Lrx/Subscriber<-Ljava/util/List<TT;>;>;"
    new-instance v0, Lrx/internal/operators/OperatorToObservableSortedList$1;

    invoke-direct {v0, p0, p1, p1}, Lrx/internal/operators/OperatorToObservableSortedList$1;-><init>(Lrx/internal/operators/OperatorToObservableSortedList;Lrx/Subscriber;Lrx/Subscriber;)V

    return-object v0
.end method
