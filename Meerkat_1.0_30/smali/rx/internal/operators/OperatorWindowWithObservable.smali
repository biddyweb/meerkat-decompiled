.class public final Lrx/internal/operators/OperatorWindowWithObservable;
.super Ljava/lang/Object;
.source "OperatorWindowWithObservable.java"

# interfaces
.implements Lrx/Observable$Operator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorWindowWithObservable$BoundarySubscriber;,
        Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/Observable$Operator",
        "<",
        "Lrx/Observable",
        "<TT;>;TT;>;"
    }
.end annotation


# static fields
.field static final NEXT_SUBJECT:Ljava/lang/Object;

.field static final nl:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final otherFactory:Lrx/functions/Func0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/functions/Func0",
            "<+",
            "Lrx/Observable",
            "<+TU;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 74
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lrx/internal/operators/OperatorWindowWithObservable;->NEXT_SUBJECT:Ljava/lang/Object;

    .line 76
    invoke-static {}, Lrx/internal/operators/NotificationLite;->instance()Lrx/internal/operators/NotificationLite;

    move-result-object v0

    sput-object v0, Lrx/internal/operators/OperatorWindowWithObservable;->nl:Lrx/internal/operators/NotificationLite;

    return-void
.end method

.method public constructor <init>(Lrx/Observable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable",
            "<TU;>;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable;, "Lrx/internal/operators/OperatorWindowWithObservable<TT;TU;>;"
    .local p1, "other":Lrx/Observable;, "Lrx/Observable<TU;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Lrx/internal/operators/OperatorWindowWithObservable$1;

    invoke-direct {v0, p0, p1}, Lrx/internal/operators/OperatorWindowWithObservable$1;-><init>(Lrx/internal/operators/OperatorWindowWithObservable;Lrx/Observable;)V

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithObservable;->otherFactory:Lrx/functions/Func0;

    .line 51
    return-void
.end method

.method public constructor <init>(Lrx/functions/Func0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func0",
            "<+",
            "Lrx/Observable",
            "<+TU;>;>;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable;, "Lrx/internal/operators/OperatorWindowWithObservable<TT;TU;>;"
    .local p1, "otherFactory":Lrx/functions/Func0;, "Lrx/functions/Func0<+Lrx/Observable<+TU;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithObservable;->otherFactory:Lrx/functions/Func0;

    .line 41
    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 36
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable;, "Lrx/internal/operators/OperatorWindowWithObservable<TT;TU;>;"
    check-cast p1, Lrx/Subscriber;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorWindowWithObservable;->call(Lrx/Subscriber;)Lrx/Subscriber;

    move-result-object v0

    return-object v0
.end method

.method public call(Lrx/Subscriber;)Lrx/Subscriber;
    .locals 5
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
    .line 58
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable;, "Lrx/internal/operators/OperatorWindowWithObservable<TT;TU;>;"
    .local p1, "child":Lrx/Subscriber;, "Lrx/Subscriber<-Lrx/Observable<TT;>;>;"
    :try_start_0
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithObservable;->otherFactory:Lrx/functions/Func0;

    invoke-interface {v4}, Lrx/functions/Func0;->call()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrx/Observable;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .local v2, "other":Lrx/Observable;, "Lrx/Observable<+TU;>;"
    new-instance v3, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;

    invoke-direct {v3, p1}, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;-><init>(Lrx/Subscriber;)V

    .line 65
    .local v3, "sub":Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorWindowWithObservable$BoundarySubscriber;

    invoke-direct {v0, p1, v3}, Lrx/internal/operators/OperatorWindowWithObservable$BoundarySubscriber;-><init>(Lrx/Subscriber;Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;)V

    .line 67
    .local v0, "bs":Lrx/internal/operators/OperatorWindowWithObservable$BoundarySubscriber;, "Lrx/internal/operators/OperatorWindowWithObservable$BoundarySubscriber<TT;TU;>;"
    invoke-virtual {v3}, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->replaceWindow()V

    .line 69
    invoke-virtual {v2, v0}, Lrx/Observable;->unsafeSubscribe(Lrx/Subscriber;)Lrx/Subscription;

    .line 71
    .end local v0    # "bs":Lrx/internal/operators/OperatorWindowWithObservable$BoundarySubscriber;, "Lrx/internal/operators/OperatorWindowWithObservable$BoundarySubscriber<TT;TU;>;"
    .end local v2    # "other":Lrx/Observable;, "Lrx/Observable<+TU;>;"
    .end local v3    # "sub":Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber<TT;>;"
    :goto_0
    return-object v3

    .line 59
    :catch_0
    move-exception v1

    .line 60
    .local v1, "e":Ljava/lang/Throwable;
    invoke-virtual {p1, v1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 61
    invoke-static {}, Lrx/observers/Subscribers;->empty()Lrx/Subscriber;

    move-result-object v3

    goto :goto_0
.end method
