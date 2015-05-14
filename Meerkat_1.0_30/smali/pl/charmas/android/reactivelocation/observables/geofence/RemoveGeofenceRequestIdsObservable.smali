.class Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceRequestIdsObservable;
.super Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceObservable;
.source "RemoveGeofenceRequestIdsObservable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceObservable",
        "<",
        "Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$RequestIdsRemoveGeofenceResult;",
        ">;"
    }
.end annotation


# instance fields
.field private final geofenceRequestIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 19
    .local p2, "geofenceRequestIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0, p1}, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceObservable;-><init>(Landroid/content/Context;)V

    .line 20
    iput-object p2, p0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceRequestIdsObservable;->geofenceRequestIds:Ljava/util/List;

    .line 21
    return-void
.end method

.method static synthetic access$000(Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceRequestIdsObservable;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceRequestIdsObservable;

    .prologue
    .line 14
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceRequestIdsObservable;->geofenceRequestIds:Ljava/util/List;

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
            "Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$RequestIdsRemoveGeofenceResult;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 26
    .local p2, "observer":Lrx/Observer;, "Lrx/Observer<-Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$RequestIdsRemoveGeofenceResult;>;"
    sget-object v0, Lcom/google/android/gms/location/LocationServices;->GeofencingApi:Lcom/google/android/gms/location/GeofencingApi;

    iget-object v1, p0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceRequestIdsObservable;->geofenceRequestIds:Ljava/util/List;

    invoke-interface {v0, p1, v1}, Lcom/google/android/gms/location/GeofencingApi;->removeGeofences(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/util/List;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v0

    new-instance v1, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceRequestIdsObservable$1;

    invoke-direct {v1, p0, p2}, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceRequestIdsObservable$1;-><init>(Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceRequestIdsObservable;Lrx/Observer;)V

    .line 27
    invoke-interface {v0, v1}, Lcom/google/android/gms/common/api/PendingResult;->setResultCallback(Lcom/google/android/gms/common/api/ResultCallback;)V

    .line 41
    return-void
.end method
