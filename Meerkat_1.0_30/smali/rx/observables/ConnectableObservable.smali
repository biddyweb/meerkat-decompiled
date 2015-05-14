.class public abstract Lrx/observables/ConnectableObservable;
.super Lrx/Observable;
.source "ConnectableObservable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/Observable",
        "<TT;>;"
    }
.end annotation


# direct methods
.method protected constructor <init>(Lrx/Observable$OnSubscribe;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable$OnSubscribe",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lrx/observables/ConnectableObservable;, "Lrx/observables/ConnectableObservable<TT;>;"
    .local p1, "onSubscribe":Lrx/Observable$OnSubscribe;, "Lrx/Observable$OnSubscribe<TT;>;"
    invoke-direct {p0, p1}, Lrx/Observable;-><init>(Lrx/Observable$OnSubscribe;)V

    .line 41
    return-void
.end method


# virtual methods
.method public final connect()Lrx/Subscription;
    .locals 2

    .prologue
    .line 53
    .local p0, "this":Lrx/observables/ConnectableObservable;, "Lrx/observables/ConnectableObservable<TT;>;"
    const/4 v1, 0x1

    new-array v0, v1, [Lrx/Subscription;

    .line 54
    .local v0, "out":[Lrx/Subscription;
    new-instance v1, Lrx/observables/ConnectableObservable$1;

    invoke-direct {v1, p0, v0}, Lrx/observables/ConnectableObservable$1;-><init>(Lrx/observables/ConnectableObservable;[Lrx/Subscription;)V

    invoke-virtual {p0, v1}, Lrx/observables/ConnectableObservable;->connect(Lrx/functions/Action1;)V

    .line 60
    const/4 v1, 0x0

    aget-object v1, v0, v1

    return-object v1
.end method

.method public abstract connect(Lrx/functions/Action1;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action1",
            "<-",
            "Lrx/Subscription;",
            ">;)V"
        }
    .end annotation
.end method

.method public refCount()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 81
    .local p0, "this":Lrx/observables/ConnectableObservable;, "Lrx/observables/ConnectableObservable<TT;>;"
    new-instance v0, Lrx/internal/operators/OnSubscribeRefCount;

    invoke-direct {v0, p0}, Lrx/internal/operators/OnSubscribeRefCount;-><init>(Lrx/observables/ConnectableObservable;)V

    invoke-static {v0}, Lrx/observables/ConnectableObservable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method
