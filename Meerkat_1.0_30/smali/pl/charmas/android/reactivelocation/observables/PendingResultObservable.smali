.class public Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;
.super Ljava/lang/Object;
.source "PendingResultObservable.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/google/android/gms/common/api/Result;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/Observable$OnSubscribe",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private complete:Z

.field private final result:Lcom/google/android/gms/common/api/PendingResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/PendingResult",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/PendingResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/PendingResult",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 16
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;, "Lpl/charmas/android/reactivelocation/observables/PendingResultObservable<TT;>;"
    .local p1, "result":Lcom/google/android/gms/common/api/PendingResult;, "Lcom/google/android/gms/common/api/PendingResult<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const/4 v0, 0x0

    iput-boolean v0, p0, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;->complete:Z

    .line 17
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;->result:Lcom/google/android/gms/common/api/PendingResult;

    .line 18
    return-void
.end method

.method static synthetic access$000(Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;)Z
    .locals 1
    .param p0, "x0"    # Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;

    .prologue
    .line 12
    iget-boolean v0, p0, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;->complete:Z

    return v0
.end method

.method static synthetic access$002(Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;Z)Z
    .locals 0
    .param p0, "x0"    # Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;
    .param p1, "x1"    # Z

    .prologue
    .line 12
    iput-boolean p1, p0, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;->complete:Z

    return p1
.end method

.method static synthetic access$100(Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;)Lcom/google/android/gms/common/api/PendingResult;
    .locals 1
    .param p0, "x0"    # Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;

    .prologue
    .line 12
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;->result:Lcom/google/android/gms/common/api/PendingResult;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 12
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;, "Lpl/charmas/android/reactivelocation/observables/PendingResultObservable<TT;>;"
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 22
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;, "Lpl/charmas/android/reactivelocation/observables/PendingResultObservable<TT;>;"
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;->result:Lcom/google/android/gms/common/api/PendingResult;

    new-instance v1, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable$1;

    invoke-direct {v1, p0, p1}, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable$1;-><init>(Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;Lrx/Subscriber;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/common/api/PendingResult;->setResultCallback(Lcom/google/android/gms/common/api/ResultCallback;)V

    .line 30
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable$2;

    invoke-direct {v0, p0}, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable$2;-><init>(Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;)V

    invoke-static {v0}, Lrx/subscriptions/Subscriptions;->create(Lrx/functions/Action0;)Lrx/Subscription;

    move-result-object v0

    invoke-virtual {p1, v0}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 38
    return-void
.end method
