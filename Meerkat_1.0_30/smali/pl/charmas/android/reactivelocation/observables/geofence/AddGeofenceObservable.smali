.class public Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable;
.super Lpl/charmas/android/reactivelocation/observables/BaseLocationObservable;
.source "AddGeofenceObservable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lpl/charmas/android/reactivelocation/observables/BaseLocationObservable",
        "<",
        "Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceResult;",
        ">;"
    }
.end annotation


# instance fields
.field private final geofenceTransitionPendingIntent:Landroid/app/PendingIntent;

.field private final request:Lcom/google/android/gms/location/GeofencingRequest;


# direct methods
.method private constructor <init>(Landroid/content/Context;Lcom/google/android/gms/location/GeofencingRequest;Landroid/app/PendingIntent;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "request"    # Lcom/google/android/gms/location/GeofencingRequest;
    .param p3, "geofenceTransitionPendingIntent"    # Landroid/app/PendingIntent;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lpl/charmas/android/reactivelocation/observables/BaseLocationObservable;-><init>(Landroid/content/Context;)V

    .line 26
    iput-object p2, p0, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable;->request:Lcom/google/android/gms/location/GeofencingRequest;

    .line 27
    iput-object p3, p0, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable;->geofenceTransitionPendingIntent:Landroid/app/PendingIntent;

    .line 28
    return-void
.end method

.method public static createObservable(Landroid/content/Context;Lcom/google/android/gms/location/GeofencingRequest;Landroid/app/PendingIntent;)Lrx/Observable;
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "request"    # Lcom/google/android/gms/location/GeofencingRequest;
    .param p2, "geofenceTransitionPendingIntent"    # Landroid/app/PendingIntent;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/gms/location/GeofencingRequest;",
            "Landroid/app/PendingIntent;",
            ")",
            "Lrx/Observable",
            "<",
            "Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 21
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable;

    invoke-direct {v0, p0, p1, p2}, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable;-><init>(Landroid/content/Context;Lcom/google/android/gms/location/GeofencingRequest;Landroid/app/PendingIntent;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected onGoogleApiClientReady(Lcom/google/android/gms/common/api/GoogleApiClient;Lrx/Observer;)V
    .locals 3
    .param p1, "apiClient"    # Lcom/google/android/gms/common/api/GoogleApiClient;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Lrx/Observer",
            "<-",
            "Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceResult;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p2, "observer":Lrx/Observer;, "Lrx/Observer<-Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceResult;>;"
    sget-object v0, Lcom/google/android/gms/location/LocationServices;->GeofencingApi:Lcom/google/android/gms/location/GeofencingApi;

    iget-object v1, p0, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable;->request:Lcom/google/android/gms/location/GeofencingRequest;

    iget-object v2, p0, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable;->geofenceTransitionPendingIntent:Landroid/app/PendingIntent;

    invoke-interface {v0, p1, v1, v2}, Lcom/google/android/gms/location/GeofencingApi;->addGeofences(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/location/GeofencingRequest;Landroid/app/PendingIntent;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v0

    new-instance v1, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable$1;

    invoke-direct {v1, p0, p2}, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable$1;-><init>(Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable;Lrx/Observer;)V

    .line 33
    invoke-interface {v0, v1}, Lcom/google/android/gms/common/api/PendingResult;->setResultCallback(Lcom/google/android/gms/common/api/ResultCallback;)V

    .line 45
    return-void
.end method
