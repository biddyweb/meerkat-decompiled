.class Lpl/charmas/android/reactivelocation/observables/PendingResultObservable$2;
.super Ljava/lang/Object;
.source "PendingResultObservable.java"

# interfaces
.implements Lrx/functions/Action0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;


# direct methods
.method constructor <init>(Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;)V
    .locals 0
    .param p1, "this$0"    # Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;

    .prologue
    .line 30
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/PendingResultObservable$2;, "Lpl/charmas/android/reactivelocation/observables/PendingResultObservable.2;"
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable$2;->this$0:Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .prologue
    .line 33
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/PendingResultObservable$2;, "Lpl/charmas/android/reactivelocation/observables/PendingResultObservable.2;"
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable$2;->this$0:Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;

    # getter for: Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;->complete:Z
    invoke-static {v0}, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;->access$000(Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 34
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable$2;->this$0:Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;

    # getter for: Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;->result:Lcom/google/android/gms/common/api/PendingResult;
    invoke-static {v0}, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;->access$100(Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/api/PendingResult;->cancel()V

    .line 36
    :cond_0
    return-void
.end method
