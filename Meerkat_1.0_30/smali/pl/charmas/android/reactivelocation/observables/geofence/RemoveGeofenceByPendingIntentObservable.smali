.class Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable;
.super Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceObservable;
.source "RemoveGeofenceByPendingIntentObservable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceObservable",
        "<",
        "Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$PendingIntentRemoveGeofenceResult;",
        ">;"
    }
.end annotation


# instance fields
.field private final pendingIntent:Landroid/app/PendingIntent;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/app/PendingIntent;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "pendingIntent"    # Landroid/app/PendingIntent;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceObservable;-><init>(Landroid/content/Context;)V

    .line 19
    iput-object p2, p0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable;->pendingIntent:Landroid/app/PendingIntent;

    .line 20
    return-void
.end method

.method static synthetic access$000(Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable;)Landroid/app/PendingIntent;
    .locals 1
    .param p0, "x0"    # Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable;

    .prologue
    .line 13
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable;->pendingIntent:Landroid/app/PendingIntent;

    return-object v0
.end method


# virtual methods
.method protected removeGeofences(Lcom/google/android/gms/common/api/GoogleApiClient;Lrx/Observer;)V
    .locals 2
    .param p1, "locationClient"    # Lcom/google/android/gms/common/api/GoogleApiClient;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Lrx/Observer",
            "<-",
            "Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$PendingIntentRemoveGeofenceResult;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p2, "observer":Lrx/Observer;, "Lrx/Observer<-Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$PendingIntentRemoveGeofenceResult;>;"
    sget-object v0, Lcom/google/android/gms/location/LocationServices;->GeofencingApi:Lcom/google/android/gms/location/GeofencingApi;

    iget-object v1, p0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable;->pendingIntent:Landroid/app/PendingIntent;

    invoke-interface {v0, p1, v1}, Lcom/google/android/gms/location/GeofencingApi;->removeGeofences(Lcom/google/android/gms/common/api/GoogleApiClient;Landroid/app/PendingIntent;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v0

    new-instance v1, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable$1;

    invoke-direct {v1, p0, p2}, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable$1;-><init>(Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable;Lrx/Observer;)V

    .line 26
    invoke-interface {v0, v1}, Lcom/google/android/gms/common/api/PendingResult;->setResultCallback(Lcom/google/android/gms/common/api/ResultCallback;)V

    .line 40
    return-void
.end method
