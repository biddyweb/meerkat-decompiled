.class final Lpl/charmas/android/reactivelocation/DataBufferObservable$1;
.super Ljava/lang/Object;
.source "DataBufferObservable.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lpl/charmas/android/reactivelocation/DataBufferObservable;->from(Lcom/google/android/gms/common/data/AbstractDataBuffer;)Lrx/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/Observable$OnSubscribe",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic val$buffer:Lcom/google/android/gms/common/data/AbstractDataBuffer;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/data/AbstractDataBuffer;)V
    .locals 0

    .prologue
    .line 27
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/DataBufferObservable$1;->val$buffer:Lcom/google/android/gms/common/data/AbstractDataBuffer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 27
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lpl/charmas/android/reactivelocation/DataBufferObservable$1;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/DataBufferObservable$1;->val$buffer:Lcom/google/android/gms/common/data/AbstractDataBuffer;

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    .line 31
    new-instance v0, Lpl/charmas/android/reactivelocation/DataBufferObservable$1$1;

    invoke-direct {v0, p0}, Lpl/charmas/android/reactivelocation/DataBufferObservable$1$1;-><init>(Lpl/charmas/android/reactivelocation/DataBufferObservable$1;)V

    invoke-static {v0}, Lrx/subscriptions/Subscriptions;->create(Lrx/functions/Action0;)Lrx/Subscription;

    move-result-object v0

    invoke-virtual {p1, v0}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 37
    return-void
.end method
