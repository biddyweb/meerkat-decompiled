.class Lrx/internal/operators/OperatorToObservableSortedList$1;
.super Lrx/Subscriber;
.source "OperatorToObservableSortedList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorToObservableSortedList;->call(Lrx/Subscriber;)Lrx/Subscriber;
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
.field final list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lrx/internal/operators/OperatorToObservableSortedList;

.field final synthetic val$o:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorToObservableSortedList;Lrx/Subscriber;Lrx/Subscriber;)V
    .locals 1

    .prologue
    .line 51
    .local p0, "this":Lrx/internal/operators/OperatorToObservableSortedList$1;, "Lrx/internal/operators/OperatorToObservableSortedList.1;"
    .local p2, "x0":Lrx/Subscriber;, "Lrx/Subscriber<*>;"
    iput-object p1, p0, Lrx/internal/operators/OperatorToObservableSortedList$1;->this$0:Lrx/internal/operators/OperatorToObservableSortedList;

    iput-object p3, p0, Lrx/internal/operators/OperatorToObservableSortedList$1;->val$o:Lrx/Subscriber;

    invoke-direct {p0, p2}, Lrx/Subscriber;-><init>(Lrx/Subscriber;)V

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lrx/internal/operators/OperatorToObservableSortedList$1;->list:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 3

    .prologue
    .line 65
    .local p0, "this":Lrx/internal/operators/OperatorToObservableSortedList$1;, "Lrx/internal/operators/OperatorToObservableSortedList.1;"
    :try_start_0
    iget-object v1, p0, Lrx/internal/operators/OperatorToObservableSortedList$1;->list:Ljava/util/List;

    new-instance v2, Lrx/internal/operators/OperatorToObservableSortedList$1$1;

    invoke-direct {v2, p0}, Lrx/internal/operators/OperatorToObservableSortedList$1$1;-><init>(Lrx/internal/operators/OperatorToObservableSortedList$1;)V

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 74
    iget-object v1, p0, Lrx/internal/operators/OperatorToObservableSortedList$1;->val$o:Lrx/Subscriber;

    iget-object v2, p0, Lrx/internal/operators/OperatorToObservableSortedList$1;->list:Ljava/util/List;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 75
    iget-object v1, p0, Lrx/internal/operators/OperatorToObservableSortedList$1;->val$o:Lrx/Subscriber;

    invoke-virtual {v1}, Lrx/Subscriber;->onCompleted()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    :goto_0
    return-void

    .line 76
    :catch_0
    move-exception v0

    .line 77
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorToObservableSortedList$1;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 83
    .local p0, "this":Lrx/internal/operators/OperatorToObservableSortedList$1;, "Lrx/internal/operators/OperatorToObservableSortedList.1;"
    iget-object v0, p0, Lrx/internal/operators/OperatorToObservableSortedList$1;->val$o:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 84
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
    .line 88
    .local p0, "this":Lrx/internal/operators/OperatorToObservableSortedList$1;, "Lrx/internal/operators/OperatorToObservableSortedList.1;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lrx/internal/operators/OperatorToObservableSortedList$1;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    return-void
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 57
    .local p0, "this":Lrx/internal/operators/OperatorToObservableSortedList$1;, "Lrx/internal/operators/OperatorToObservableSortedList.1;"
    const-wide v0, 0x7fffffffffffffffL

    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/OperatorToObservableSortedList$1;->request(J)V

    .line 58
    return-void
.end method
