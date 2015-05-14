.class final Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;
.super Lrx/Subscriber;
.source "OperatorWindowWithSize.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorWindowWithSize;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ExactSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lrx/Subscriber",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final child:Lrx/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Subscriber",
            "<-",
            "Lrx/Observable",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field count:I

.field volatile noWindow:Z

.field final parentSubscription:Lrx/Subscription;

.field final synthetic this$0:Lrx/internal/operators/OperatorWindowWithSize;

.field window:Lrx/internal/operators/BufferUntilSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/BufferUntilSubscriber",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorWindowWithSize;Lrx/Subscriber;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Lrx/Observable",
            "<TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithSize<TT;>.ExactSubscriber;"
    .local p2, "child":Lrx/Subscriber;, "Lrx/Subscriber<-Lrx/Observable<TT;>;>;"
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithSize;

    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    .line 64
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->noWindow:Z

    .line 65
    iput-object p0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->parentSubscription:Lrx/Subscription;

    .line 72
    iput-object p2, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->child:Lrx/Subscriber;

    .line 76
    new-instance v0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber$1;

    invoke-direct {v0, p0, p1}, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber$1;-><init>(Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;Lrx/internal/operators/OperatorWindowWithSize;)V

    invoke-static {v0}, Lrx/subscriptions/Subscriptions;->create(Lrx/functions/Action0;)Lrx/Subscription;

    move-result-object v0

    invoke-virtual {p2, v0}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 87
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .prologue
    .line 124
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithSize<TT;>.ExactSubscriber;"
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->window:Lrx/internal/operators/BufferUntilSubscriber;

    if-eqz v0, :cond_0

    .line 125
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->window:Lrx/internal/operators/BufferUntilSubscriber;

    invoke-virtual {v0}, Lrx/internal/operators/BufferUntilSubscriber;->onCompleted()V

    .line 127
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 128
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 116
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithSize<TT;>.ExactSubscriber;"
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->window:Lrx/internal/operators/BufferUntilSubscriber;

    if-eqz v0, :cond_0

    .line 117
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->window:Lrx/internal/operators/BufferUntilSubscriber;

    invoke-virtual {v0, p1}, Lrx/internal/operators/BufferUntilSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 119
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 120
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 97
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithSize<TT;>.ExactSubscriber;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->window:Lrx/internal/operators/BufferUntilSubscriber;

    if-nez v0, :cond_0

    .line 98
    const/4 v0, 0x0

    iput-boolean v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->noWindow:Z

    .line 99
    invoke-static {}, Lrx/internal/operators/BufferUntilSubscriber;->create()Lrx/internal/operators/BufferUntilSubscriber;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->window:Lrx/internal/operators/BufferUntilSubscriber;

    .line 100
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->child:Lrx/Subscriber;

    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->window:Lrx/internal/operators/BufferUntilSubscriber;

    invoke-virtual {v0, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 102
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->window:Lrx/internal/operators/BufferUntilSubscriber;

    invoke-virtual {v0, p1}, Lrx/internal/operators/BufferUntilSubscriber;->onNext(Ljava/lang/Object;)V

    .line 103
    iget v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->count:I

    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithSize;

    iget v1, v1, Lrx/internal/operators/OperatorWindowWithSize;->size:I

    rem-int/2addr v0, v1

    if-nez v0, :cond_1

    .line 104
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->window:Lrx/internal/operators/BufferUntilSubscriber;

    invoke-virtual {v0}, Lrx/internal/operators/BufferUntilSubscriber;->onCompleted()V

    .line 105
    const/4 v0, 0x0

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->window:Lrx/internal/operators/BufferUntilSubscriber;

    .line 106
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->noWindow:Z

    .line 107
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 108
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->parentSubscription:Lrx/Subscription;

    invoke-interface {v0}, Lrx/Subscription;->unsubscribe()V

    .line 112
    :cond_1
    return-void
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 92
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithSize<TT;>.ExactSubscriber;"
    const-wide v0, 0x7fffffffffffffffL

    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->request(J)V

    .line 93
    return-void
.end method
