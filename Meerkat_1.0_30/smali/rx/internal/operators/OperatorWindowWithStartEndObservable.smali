.class public final Lrx/internal/operators/OperatorWindowWithStartEndObservable;
.super Ljava/lang/Object;
.source "OperatorWindowWithStartEndObservable.java"

# interfaces
.implements Lrx/Observable$Operator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;,
        Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/Observable$Operator",
        "<",
        "Lrx/Observable",
        "<TT;>;TT;>;"
    }
.end annotation


# instance fields
.field final windowClosingSelector:Lrx/functions/Func1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/functions/Func1",
            "<-TU;+",
            "Lrx/Observable",
            "<+TV;>;>;"
        }
    .end annotation
.end field

.field final windowOpenings:Lrx/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Observable",
            "<+TU;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/Observable;Lrx/functions/Func1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable",
            "<+TU;>;",
            "Lrx/functions/Func1",
            "<-TU;+",
            "Lrx/Observable",
            "<+TV;>;>;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithStartEndObservable;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable<TT;TU;TV;>;"
    .local p1, "windowOpenings":Lrx/Observable;, "Lrx/Observable<+TU;>;"
    .local p2, "windowClosingSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TU;+Lrx/Observable<+TV;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable;->windowOpenings:Lrx/Observable;

    .line 47
    iput-object p2, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable;->windowClosingSelector:Lrx/functions/Func1;

    .line 48
    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 40
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithStartEndObservable;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable<TT;TU;TV;>;"
    check-cast p1, Lrx/Subscriber;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorWindowWithStartEndObservable;->call(Lrx/Subscriber;)Lrx/Subscriber;

    move-result-object v0

    return-object v0
.end method

.method public call(Lrx/Subscriber;)Lrx/Subscriber;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Lrx/Observable",
            "<TT;>;>;)",
            "Lrx/Subscriber",
            "<-TT;>;"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithStartEndObservable;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable<TT;TU;TV;>;"
    .local p1, "child":Lrx/Subscriber;, "Lrx/Subscriber<-Lrx/Observable<TT;>;>;"
    new-instance v1, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;

    invoke-direct {v1, p0, p1}, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;-><init>(Lrx/internal/operators/OperatorWindowWithStartEndObservable;Lrx/Subscriber;)V

    .line 54
    .local v1, "sub":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable<TT;TU;TV;>.SourceSubscriber;"
    new-instance v0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$1;

    invoke-direct {v0, p0, p1, v1}, Lrx/internal/operators/OperatorWindowWithStartEndObservable$1;-><init>(Lrx/internal/operators/OperatorWindowWithStartEndObservable;Lrx/Subscriber;Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;)V

    .line 77
    .local v0, "open":Lrx/Subscriber;, "Lrx/Subscriber<TU;>;"
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable;->windowOpenings:Lrx/Observable;

    invoke-virtual {v2, v0}, Lrx/Observable;->unsafeSubscribe(Lrx/Subscriber;)Lrx/Subscription;

    .line 79
    return-object v1
.end method
