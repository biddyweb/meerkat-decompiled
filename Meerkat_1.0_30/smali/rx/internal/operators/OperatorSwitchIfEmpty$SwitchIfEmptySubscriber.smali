.class Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;
.super Lrx/Subscriber;
.source "OperatorSwitchIfEmpty.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorSwitchIfEmpty;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SwitchIfEmptySubscriber"
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

.field final consumerCapacity:Ljava/util/concurrent/atomic/AtomicLong;

.field empty:Z

.field final ssub:Lrx/subscriptions/SerialSubscription;

.field final synthetic this$0:Lrx/internal/operators/OperatorSwitchIfEmpty;


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorSwitchIfEmpty;Lrx/Subscriber;Lrx/subscriptions/SerialSubscription;)V
    .locals 4
    .param p3, "ssub"    # Lrx/subscriptions/SerialSubscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;",
            "Lrx/subscriptions/SerialSubscription;",
            ")V"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;, "Lrx/internal/operators/OperatorSwitchIfEmpty<TT;>.SwitchIfEmptySubscriber;"
    .local p2, "child":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    iput-object p1, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->this$0:Lrx/internal/operators/OperatorSwitchIfEmpty;

    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    .line 46
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->empty:Z

    .line 47
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v2, 0x0

    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->consumerCapacity:Ljava/util/concurrent/atomic/AtomicLong;

    .line 53
    iput-object p2, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->child:Lrx/Subscriber;

    .line 54
    iput-object p3, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->ssub:Lrx/subscriptions/SerialSubscription;

    .line 55
    return-void
.end method

.method static synthetic access$000(Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;)Lrx/Subscriber;
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;

    .prologue
    .line 44
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->child:Lrx/Subscriber;

    return-object v0
.end method

.method private subscribeToAlternate()V
    .locals 3

    .prologue
    .line 80
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;, "Lrx/internal/operators/OperatorSwitchIfEmpty<TT;>.SwitchIfEmptySubscriber;"
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->ssub:Lrx/subscriptions/SerialSubscription;

    iget-object v1, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->this$0:Lrx/internal/operators/OperatorSwitchIfEmpty;

    # getter for: Lrx/internal/operators/OperatorSwitchIfEmpty;->alternate:Lrx/Observable;
    invoke-static {v1}, Lrx/internal/operators/OperatorSwitchIfEmpty;->access$100(Lrx/internal/operators/OperatorSwitchIfEmpty;)Lrx/Observable;

    move-result-object v1

    new-instance v2, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;

    invoke-direct {v2, p0}, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$2;-><init>(Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;)V

    invoke-virtual {v1, v2}, Lrx/Observable;->unsafeSubscribe(Lrx/Subscriber;)Lrx/Subscription;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/subscriptions/SerialSubscription;->set(Lrx/Subscription;)V

    .line 115
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .prologue
    .line 72
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;, "Lrx/internal/operators/OperatorSwitchIfEmpty<TT;>.SwitchIfEmptySubscriber;"
    iget-boolean v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->empty:Z

    if-nez v0, :cond_1

    .line 73
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 77
    :cond_0
    :goto_0
    return-void

    .line 74
    :cond_1
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 75
    invoke-direct {p0}, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->subscribeToAlternate()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 119
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;, "Lrx/internal/operators/OperatorSwitchIfEmpty<TT;>.SwitchIfEmptySubscriber;"
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 120
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
    .line 124
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;, "Lrx/internal/operators/OperatorSwitchIfEmpty<TT;>.SwitchIfEmptySubscriber;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    iput-boolean v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->empty:Z

    .line 125
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 126
    return-void
.end method

.method public setProducer(Lrx/Producer;)V
    .locals 1
    .param p1, "producer"    # Lrx/Producer;

    .prologue
    .line 59
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;, "Lrx/internal/operators/OperatorSwitchIfEmpty<TT;>.SwitchIfEmptySubscriber;"
    new-instance v0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$1;

    invoke-direct {v0, p0, p1}, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber$1;-><init>(Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;Lrx/Producer;)V

    invoke-super {p0, v0}, Lrx/Subscriber;->setProducer(Lrx/Producer;)V

    .line 68
    return-void
.end method
