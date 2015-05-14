.class public Lrx/internal/operators/OperatorPublish;
.super Lrx/observables/ConnectableObservable;
.source "OperatorPublish.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorPublish$RequestHandler;,
        Lrx/internal/operators/OperatorPublish$State;,
        Lrx/internal/operators/OperatorPublish$OriginSubscriber;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/observables/ConnectableObservable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorPublish$RequestHandler",
            "<TT;>;"
        }
    .end annotation
.end field

.field final source:Lrx/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Observable",
            "<+TT;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lrx/Observable;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, "this":Lrx/internal/operators/OperatorPublish;, "Lrx/internal/operators/OperatorPublish<TT;>;"
    .local p1, "source":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lrx/internal/operators/OperatorPublish$RequestHandler;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lrx/internal/operators/OperatorPublish$RequestHandler;-><init>(Lrx/internal/operators/OperatorPublish$1;)V

    invoke-direct {p0, p1, v0, v1}, Lrx/internal/operators/OperatorPublish;-><init>(Lrx/Observable;Ljava/lang/Object;Lrx/internal/operators/OperatorPublish$RequestHandler;)V

    .line 59
    return-void
.end method

.method private constructor <init>(Lrx/Observable;Ljava/lang/Object;Lrx/internal/operators/OperatorPublish$RequestHandler;)V
    .locals 1
    .param p2, "guard"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable",
            "<+TT;>;",
            "Ljava/lang/Object;",
            "Lrx/internal/operators/OperatorPublish$RequestHandler",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "this":Lrx/internal/operators/OperatorPublish;, "Lrx/internal/operators/OperatorPublish<TT;>;"
    .local p1, "source":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "requestHandler":Lrx/internal/operators/OperatorPublish$RequestHandler;, "Lrx/internal/operators/OperatorPublish$RequestHandler<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorPublish$2;

    invoke-direct {v0, p3}, Lrx/internal/operators/OperatorPublish$2;-><init>(Lrx/internal/operators/OperatorPublish$RequestHandler;)V

    invoke-direct {p0, v0}, Lrx/observables/ConnectableObservable;-><init>(Lrx/Observable$OnSubscribe;)V

    .line 83
    iput-object p1, p0, Lrx/internal/operators/OperatorPublish;->source:Lrx/Observable;

    .line 84
    iput-object p3, p0, Lrx/internal/operators/OperatorPublish;->requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;

    .line 85
    return-void
.end method

.method synthetic constructor <init>(Lrx/Observable;Lrx/internal/operators/OperatorPublish$1;)V
    .locals 0
    .param p1, "x0"    # Lrx/Observable;
    .param p2, "x1"    # Lrx/internal/operators/OperatorPublish$1;

    .prologue
    .line 29
    .local p0, "this":Lrx/internal/operators/OperatorPublish;, "Lrx/internal/operators/OperatorPublish<TT;>;"
    invoke-direct {p0, p1}, Lrx/internal/operators/OperatorPublish;-><init>(Lrx/Observable;)V

    return-void
.end method

.method static synthetic access$300(Lrx/internal/operators/OperatorPublish;)Lrx/internal/operators/OperatorPublish$RequestHandler;
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorPublish;

    .prologue
    .line 29
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish;->requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;

    return-object v0
.end method

.method public static create(Lrx/Observable;Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/functions/Func1",
            "<-",
            "Lrx/Observable",
            "<TT;>;+",
            "Lrx/Observable",
            "<TR;>;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, "source":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "selector":Lrx/functions/Func1;, "Lrx/functions/Func1<-Lrx/Observable<TT;>;+Lrx/Observable<TR;>;>;"
    new-instance v0, Lrx/internal/operators/OperatorPublish$1;

    invoke-direct {v0, p0, p1}, Lrx/internal/operators/OperatorPublish$1;-><init>(Lrx/Observable;Lrx/functions/Func1;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static create(Lrx/Observable;)Lrx/observables/ConnectableObservable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 34
    .local p0, "source":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorPublish;

    invoke-direct {v0, p0}, Lrx/internal/operators/OperatorPublish;-><init>(Lrx/Observable;)V

    return-object v0
.end method


# virtual methods
.method public connect(Lrx/functions/Action1;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action1",
            "<-",
            "Lrx/Subscription;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 90
    .local p0, "this":Lrx/internal/operators/OperatorPublish;, "Lrx/internal/operators/OperatorPublish<TT;>;"
    .local p1, "connection":Lrx/functions/Action1;, "Lrx/functions/Action1<-Lrx/Subscription;>;"
    const/4 v2, 0x0

    .line 93
    .local v2, "shouldSubscribe":Z
    iget-object v3, p0, Lrx/internal/operators/OperatorPublish;->requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;

    # getter for: Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;
    invoke-static {v3}, Lrx/internal/operators/OperatorPublish$RequestHandler;->access$200(Lrx/internal/operators/OperatorPublish$RequestHandler;)Lrx/internal/operators/OperatorPublish$State;

    move-result-object v3

    invoke-virtual {v3}, Lrx/internal/operators/OperatorPublish$State;->getOrigin()Lrx/internal/operators/OperatorPublish$OriginSubscriber;

    move-result-object v0

    .line 94
    .local v0, "origin":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    if-nez v0, :cond_0

    .line 95
    const/4 v2, 0x1

    .line 96
    iget-object v3, p0, Lrx/internal/operators/OperatorPublish;->requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;

    # getter for: Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;
    invoke-static {v3}, Lrx/internal/operators/OperatorPublish$RequestHandler;->access$200(Lrx/internal/operators/OperatorPublish$RequestHandler;)Lrx/internal/operators/OperatorPublish$State;

    move-result-object v3

    new-instance v4, Lrx/internal/operators/OperatorPublish$OriginSubscriber;

    iget-object v5, p0, Lrx/internal/operators/OperatorPublish;->requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;

    invoke-direct {v4, v5}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;-><init>(Lrx/internal/operators/OperatorPublish$RequestHandler;)V

    invoke-virtual {v3, v4}, Lrx/internal/operators/OperatorPublish$State;->setOrigin(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)V

    .line 100
    :cond_0
    if-eqz v2, :cond_1

    .line 102
    new-instance v3, Lrx/internal/operators/OperatorPublish$3;

    invoke-direct {v3, p0}, Lrx/internal/operators/OperatorPublish$3;-><init>(Lrx/internal/operators/OperatorPublish;)V

    invoke-static {v3}, Lrx/subscriptions/Subscriptions;->create(Lrx/functions/Action0;)Lrx/Subscription;

    move-result-object v3

    invoke-interface {p1, v3}, Lrx/functions/Action1;->call(Ljava/lang/Object;)V

    .line 115
    iget-object v3, p0, Lrx/internal/operators/OperatorPublish;->requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;

    # getter for: Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;
    invoke-static {v3}, Lrx/internal/operators/OperatorPublish$RequestHandler;->access$200(Lrx/internal/operators/OperatorPublish$RequestHandler;)Lrx/internal/operators/OperatorPublish$State;

    move-result-object v3

    invoke-virtual {v3}, Lrx/internal/operators/OperatorPublish$State;->getOrigin()Lrx/internal/operators/OperatorPublish$OriginSubscriber;

    move-result-object v1

    .line 116
    .local v1, "os":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    if-eqz v1, :cond_1

    .line 117
    iget-object v3, p0, Lrx/internal/operators/OperatorPublish;->source:Lrx/Observable;

    invoke-virtual {v3, v1}, Lrx/Observable;->unsafeSubscribe(Lrx/Subscriber;)Lrx/Subscription;

    .line 120
    .end local v1    # "os":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    :cond_1
    return-void
.end method
