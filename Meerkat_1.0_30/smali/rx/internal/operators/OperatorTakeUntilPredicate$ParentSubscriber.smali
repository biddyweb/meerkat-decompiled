.class final Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;
.super Lrx/Subscriber;
.source "OperatorTakeUntilPredicate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorTakeUntilPredicate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ParentSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lrx/Subscriber",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final child:Lrx/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field private done:Z

.field final synthetic this$0:Lrx/internal/operators/OperatorTakeUntilPredicate;


# direct methods
.method private constructor <init>(Lrx/internal/operators/OperatorTakeUntilPredicate;Lrx/Subscriber;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, "this":Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;, "Lrx/internal/operators/OperatorTakeUntilPredicate<TT;>.ParentSubscriber;"
    .local p2, "child":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    iput-object p1, p0, Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;->this$0:Lrx/internal/operators/OperatorTakeUntilPredicate;

    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-boolean v0, p0, Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;->done:Z

    .line 36
    iput-object p2, p0, Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;->child:Lrx/Subscriber;

    .line 37
    return-void
.end method

.method synthetic constructor <init>(Lrx/internal/operators/OperatorTakeUntilPredicate;Lrx/Subscriber;Lrx/internal/operators/OperatorTakeUntilPredicate$1;)V
    .locals 0
    .param p1, "x0"    # Lrx/internal/operators/OperatorTakeUntilPredicate;
    .param p2, "x1"    # Lrx/Subscriber;
    .param p3, "x2"    # Lrx/internal/operators/OperatorTakeUntilPredicate$1;

    .prologue
    .line 31
    .local p0, "this":Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;, "Lrx/internal/operators/OperatorTakeUntilPredicate<TT;>.ParentSubscriber;"
    invoke-direct {p0, p1, p2}, Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;-><init>(Lrx/internal/operators/OperatorTakeUntilPredicate;Lrx/Subscriber;)V

    return-void
.end method


# virtual methods
.method downstreamRequest(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 73
    .local p0, "this":Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;, "Lrx/internal/operators/OperatorTakeUntilPredicate<TT;>.ParentSubscriber;"
    invoke-virtual {p0, p1, p2}, Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;->request(J)V

    .line 74
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .prologue
    .line 61
    .local p0, "this":Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;, "Lrx/internal/operators/OperatorTakeUntilPredicate<TT;>.ParentSubscriber;"
    iget-boolean v0, p0, Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;->done:Z

    if-nez v0, :cond_0

    .line 62
    iget-object v0, p0, Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 64
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 68
    .local p0, "this":Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;, "Lrx/internal/operators/OperatorTakeUntilPredicate<TT;>.ParentSubscriber;"
    iget-boolean v0, p0, Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;->done:Z

    if-nez v0, :cond_0

    .line 69
    iget-object v0, p0, Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 71
    :cond_0
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;, "Lrx/internal/operators/OperatorTakeUntilPredicate<TT;>.ParentSubscriber;"
    .local p1, "args":Ljava/lang/Object;, "TT;"
    const/4 v3, 0x1

    .line 41
    iget-object v2, p0, Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v2, p1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 43
    const/4 v1, 0x0

    .line 45
    .local v1, "stop":Z
    :try_start_0
    iget-object v2, p0, Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;->this$0:Lrx/internal/operators/OperatorTakeUntilPredicate;

    # getter for: Lrx/internal/operators/OperatorTakeUntilPredicate;->stopPredicate:Lrx/functions/Func1;
    invoke-static {v2}, Lrx/internal/operators/OperatorTakeUntilPredicate;->access$000(Lrx/internal/operators/OperatorTakeUntilPredicate;)Lrx/functions/Func1;

    move-result-object v2

    invoke-interface {v2, p1}, Lrx/functions/Func1;->call(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 52
    if-eqz v1, :cond_0

    .line 53
    iput-boolean v3, p0, Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;->done:Z

    .line 54
    iget-object v2, p0, Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v2}, Lrx/Subscriber;->onCompleted()V

    .line 55
    invoke-virtual {p0}, Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;->unsubscribe()V

    .line 57
    :cond_0
    :goto_0
    return-void

    .line 46
    :catch_0
    move-exception v0

    .line 47
    .local v0, "e":Ljava/lang/Throwable;
    iput-boolean v3, p0, Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;->done:Z

    .line 48
    iget-object v2, p0, Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v2, v0}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 49
    invoke-virtual {p0}, Lrx/internal/operators/OperatorTakeUntilPredicate$ParentSubscriber;->unsubscribe()V

    goto :goto_0
.end method
