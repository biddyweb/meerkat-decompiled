.class Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable$1;
.super Ljava/lang/Object;
.source "AddGeofenceObservable.java"

# interfaces
.implements Lcom/google/android/gms/common/api/ResultCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable;->onGoogleApiClientReady(Lcom/google/android/gms/common/api/GoogleApiClient;Lrx/Observer;)V
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
.field final synthetic this$0:Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable;

.field final synthetic val$observer:Lrx/Observer;


# direct methods
.method constructor <init>(Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable;Lrx/Observer;)V
    .locals 0
    .param p1, "this$0"    # Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable;

    .prologue
    .line 33
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable$1;->this$0:Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable;

    iput-object p2, p0, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable$1;->val$observer:Lrx/Observer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResult(Lcom/google/android/gms/common/api/Result;)V
    .locals 0

    .prologue
    .line 33
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p0, p1}, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable$1;->onResult(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method

.method public onResult(Lcom/google/android/gms/common/api/Status;)V
    .locals 3
    .param p1, "status"    # Lcom/google/android/gms/common/api/Status;

    .prologue
    .line 36
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceResult;

    invoke-virtual {p1}, Lcom/google/android/gms/common/api/Status;->getStatusCode()I

    move-result v1

    invoke-direct {v0, v1}, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceResult;-><init>(I)V

    .line 37
    .local v0, "result":Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceResult;
    invoke-virtual {v0}, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceResult;->isSuccess()Z

    move-result v1

    if-nez v1, :cond_0

    .line 38
    iget-object v1, p0, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable$1;->val$observer:Lrx/Observer;

    new-instance v2, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceException;

    invoke-direct {v2, v0}, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceException;-><init>(Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceResult;)V

    invoke-interface {v1, v2}, Lrx/Observer;->onError(Ljava/lang/Throwable;)V

    .line 43
    :goto_0
    return-void

    .line 40
    :cond_0
    iget-object v1, p0, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable$1;->val$observer:Lrx/Observer;

    invoke-interface {v1, v0}, Lrx/Observer;->onNext(Ljava/lang/Object;)V

    .line 41
    iget-object v1, p0, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable$1;->val$observer:Lrx/Observer;

    invoke-interface {v1}, Lrx/Observer;->onCompleted()V

    goto :goto_0
.end method
