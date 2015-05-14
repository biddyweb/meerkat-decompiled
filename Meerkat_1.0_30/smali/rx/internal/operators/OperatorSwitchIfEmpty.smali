.class public final Lrx/internal/operators/OperatorSwitchIfEmpty;
.super Ljava/lang/Object;
.source "OperatorSwitchIfEmpty.java"

# interfaces
.implements Lrx/Observable$Operator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/Observable$Operator",
        "<TT;TT;>;"
    }
.end annotation


# instance fields
.field private final alternate:Lrx/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Observable",
            "<+TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/Observable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty;, "Lrx/internal/operators/OperatorSwitchIfEmpty<TT;>;"
    .local p1, "alternate":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lrx/internal/operators/OperatorSwitchIfEmpty;->alternate:Lrx/Observable;

    .line 33
    return-void
.end method

.method static synthetic access$100(Lrx/internal/operators/OperatorSwitchIfEmpty;)Lrx/Observable;
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorSwitchIfEmpty;

    .prologue
    .line 28
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitchIfEmpty;->alternate:Lrx/Observable;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 28
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty;, "Lrx/internal/operators/OperatorSwitchIfEmpty<TT;>;"
    check-cast p1, Lrx/Subscriber;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorSwitchIfEmpty;->call(Lrx/Subscriber;)Lrx/Subscriber;

    move-result-object v0

    return-object v0
.end method

.method public call(Lrx/Subscriber;)Lrx/Subscriber;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;)",
            "Lrx/Subscriber",
            "<-TT;>;"
        }
    .end annotation

    .prologue
    .line 37
    .local p0, "this":Lrx/internal/operators/OperatorSwitchIfEmpty;, "Lrx/internal/operators/OperatorSwitchIfEmpty<TT;>;"
    .local p1, "child":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    new-instance v1, Lrx/subscriptions/SerialSubscription;

    invoke-direct {v1}, Lrx/subscriptions/SerialSubscription;-><init>()V

    .line 38
    .local v1, "ssub":Lrx/subscriptions/SerialSubscription;
    new-instance v0, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;

    invoke-direct {v0, p0, p1, v1}, Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;-><init>(Lrx/internal/operators/OperatorSwitchIfEmpty;Lrx/Subscriber;Lrx/subscriptions/SerialSubscription;)V

    .line 39
    .local v0, "parent":Lrx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber;, "Lrx/internal/operators/OperatorSwitchIfEmpty<TT;>.SwitchIfEmptySubscriber;"
    invoke-virtual {v1, v0}, Lrx/subscriptions/SerialSubscription;->set(Lrx/Subscription;)V

    .line 40
    invoke-virtual {p1, v1}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 41
    return-object v0
.end method
