.class public Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable;
.super Lpl/charmas/android/reactivelocation/observables/BaseLocationObservable;
.source "LocationUpdatesObservable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lpl/charmas/android/reactivelocation/observables/BaseLocationObservable",
        "<",
        "Landroid/location/Location;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private listener:Lcom/google/android/gms/location/LocationListener;

.field private final locationRequest:Lcom/google/android/gms/location/LocationRequest;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Lcom/google/android/gms/location/LocationRequest;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lpl/charmas/android/reactivelocation/observables/BaseLocationObservable;-><init>(Landroid/content/Context;)V

    .line 28
    iput-object p2, p0, Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable;->locationRequest:Lcom/google/android/gms/location/LocationRequest;

    .line 29
    return-void
.end method

.method public static createObservable(Landroid/content/Context;Lcom/google/android/gms/location/LocationRequest;)Lrx/Observable;
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/gms/location/LocationRequest;",
            ")",
            "Lrx/Observable",
            "<",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    .line 20
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable;

    invoke-direct {v0, p0, p1}, Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable;-><init>(Landroid/content/Context;Lcom/google/android/gms/location/LocationRequest;)V

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
            "Landroid/location/Location;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p2, "observer":Lrx/Observer;, "Lrx/Observer<-Landroid/location/Location;>;"
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable$1;

    invoke-direct {v0, p0, p2}, Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable$1;-><init>(Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable;Lrx/Observer;)V

    iput-object v0, p0, Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable;->listener:Lcom/google/android/gms/location/LocationListener;

    .line 39
    sget-object v0, Lcom/google/android/gms/location/LocationServices;->FusedLocationApi:Lcom/google/android/gms/location/FusedLocationProviderApi;

    iget-object v1, p0, Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable;->locationRequest:Lcom/google/android/gms/location/LocationRequest;

    iget-object v2, p0, Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable;->listener:Lcom/google/android/gms/location/LocationListener;

    invoke-interface {v0, p1, v1, v2}, Lcom/google/android/gms/location/FusedLocationProviderApi;->requestLocationUpdates(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/location/LocationRequest;Lcom/google/android/gms/location/LocationListener;)Lcom/google/android/gms/common/api/PendingResult;

    .line 40
    return-void
.end method

.method protected onUnsubscribed(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 2
    .param p1, "locationClient"    # Lcom/google/android/gms/common/api/GoogleApiClient;

    .prologue
    .line 44
    invoke-interface {p1}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 45
    sget-object v0, Lcom/google/android/gms/location/LocationServices;->FusedLocationApi:Lcom/google/android/gms/location/FusedLocationProviderApi;

    iget-object v1, p0, Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable;->listener:Lcom/google/android/gms/location/LocationListener;

    invoke-interface {v0, p1, v1}, Lcom/google/android/gms/location/FusedLocationProviderApi;->removeLocationUpdates(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/location/LocationListener;)Lcom/google/android/gms/common/api/PendingResult;

    .line 47
    :cond_0
    return-void
.end method
