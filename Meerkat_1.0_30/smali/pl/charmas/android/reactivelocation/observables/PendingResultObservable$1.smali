.class Lpl/charmas/android/reactivelocation/observables/PendingResultObservable$1;
.super Ljava/lang/Object;
.source "PendingResultObservable.java"

# interfaces
.implements Lcom/google/android/gms/common/api/ResultCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/common/api/ResultCallback",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;

.field final synthetic val$subscriber:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;Lrx/Subscriber;)V
    .locals 0
    .param p1, "this$0"    # Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;

    .prologue
    .line 22
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/PendingResultObservable$1;, "Lpl/charmas/android/reactivelocation/observables/PendingResultObservable.1;"
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable$1;->this$0:Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;

    iput-object p2, p0, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable$1;->val$subscriber:Lrx/Subscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResult(Lcom/google/android/gms/common/api/Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/PendingResultObservable$1;, "Lpl/charmas/android/reactivelocation/observables/PendingResultObservable.1;"
    .local p1, "t":Lcom/google/android/gms/common/api/Result;, "TT;"
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 26
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable$1;->this$0:Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;

    const/4 v1, 0x1

    # setter for: Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;->complete:Z
    invoke-static {v0, v1}, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;->access$002(Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;Z)Z

    .line 27
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 28
    return-void
.end method
