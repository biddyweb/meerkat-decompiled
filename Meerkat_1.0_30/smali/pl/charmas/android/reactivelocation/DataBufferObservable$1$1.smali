.class Lpl/charmas/android/reactivelocation/DataBufferObservable$1$1;
.super Ljava/lang/Object;
.source "DataBufferObservable.java"

# interfaces
.implements Lrx/functions/Action0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lpl/charmas/android/reactivelocation/DataBufferObservable$1;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lpl/charmas/android/reactivelocation/DataBufferObservable$1;


# direct methods
.method constructor <init>(Lpl/charmas/android/reactivelocation/DataBufferObservable$1;)V
    .locals 0
    .param p1, "this$0"    # Lpl/charmas/android/reactivelocation/DataBufferObservable$1;

    .prologue
    .line 31
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/DataBufferObservable$1$1;->this$0:Lpl/charmas/android/reactivelocation/DataBufferObservable$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/DataBufferObservable$1$1;->this$0:Lpl/charmas/android/reactivelocation/DataBufferObservable$1;

    iget-object v0, v0, Lpl/charmas/android/reactivelocation/DataBufferObservable$1;->val$buffer:Lcom/google/android/gms/common/data/AbstractDataBuffer;

    invoke-virtual {v0}, Lcom/google/android/gms/common/data/AbstractDataBuffer;->release()V

    .line 35
    return-void
.end method
