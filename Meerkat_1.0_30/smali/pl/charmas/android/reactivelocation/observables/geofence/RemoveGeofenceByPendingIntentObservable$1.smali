.class Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable$1;
.super Ljava/lang/Object;
.source "RemoveGeofenceByPendingIntentObservable.java"

# interfaces
.implements Lcom/google/android/gms/common/api/ResultCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable;->removeGeofences(Lcom/google/android/gms/common/api/GoogleApiClient;Lrx/Observer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/common/api/ResultCallback",
        "<",
        "Lcom/google/android/gms/common/api/Status;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable;

.field final synthetic val$observer:Lrx/Observer;


# direct methods
.method constructor <init>(Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable;Lrx/Observer;)V
    .locals 0
    .param p1, "this$0"    # Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable;

    .prologue
    .line 26
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable$1;->this$0:Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable;

    iput-object p2, p0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable$1;->val$observer:Lrx/Observer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResult(Lcom/google/android/gms/common/api/Result;)V
    .locals 0

    .prologue
    .line 26
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p0, p1}, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable$1;->onResult(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method

.method public onResult(Lcom/google/android/gms/common/api/Status;)V
    .locals 4
    .param p1, "status"    # Lcom/google/android/gms/common/api/Status;

    .prologue
    .line 29
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$PendingIntentRemoveGeofenceResult;

    .line 30
    invoke-virtual {p1}, Lcom/google/android/gms/common/api/Status;->getStatusCode()I

    move-result v1

    iget-object v2, p0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable$1;->this$0:Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable;

    # getter for: Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable;->pendingIntent:Landroid/app/PendingIntent;
    invoke-static {v2}, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable;->access$000(Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable;)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$PendingIntentRemoveGeofenceResult;-><init>(ILandroid/app/PendingIntent;)V

    .line 32
    .local v0, "result":Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$PendingIntentRemoveGeofenceResult;
    invoke-virtual {v0}, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$PendingIntentRemoveGeofenceResult;->isSuccess()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 33
    iget-object v1, p0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable$1;->val$observer:Lrx/Observer;

    invoke-interface {v1, v0}, Lrx/Observer;->onNext(Ljava/lang/Object;)V

    .line 34
    iget-object v1, p0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable$1;->val$observer:Lrx/Observer;

    invoke-interface {v1}, Lrx/Observer;->onCompleted()V

    .line 38
    :goto_0
    return-void

    .line 36
    :cond_0
    iget-object v1, p0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable$1;->val$observer:Lrx/Observer;

    new-instance v2, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesException;

    invoke-virtual {v0}, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$PendingIntentRemoveGeofenceResult;->getStatusCode()I

    move-result v3

    invoke-direct {v2, v3}, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesException;-><init>(I)V

    invoke-interface {v1, v2}, Lrx/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
