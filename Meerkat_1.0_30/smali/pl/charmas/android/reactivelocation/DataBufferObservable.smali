.class public final Lpl/charmas/android/reactivelocation/DataBufferObservable;
.super Ljava/lang/Object;
.source "DataBufferObservable.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    return-void
.end method

.method public static from(Lcom/google/android/gms/common/data/AbstractDataBuffer;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/common/data/AbstractDataBuffer",
            "<TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "buffer":Lcom/google/android/gms/common/data/AbstractDataBuffer;, "Lcom/google/android/gms/common/data/AbstractDataBuffer<TT;>;"
    new-instance v0, Lpl/charmas/android/reactivelocation/DataBufferObservable$1;

    invoke-direct {v0, p0}, Lpl/charmas/android/reactivelocation/DataBufferObservable$1;-><init>(Lcom/google/android/gms/common/data/AbstractDataBuffer;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method
