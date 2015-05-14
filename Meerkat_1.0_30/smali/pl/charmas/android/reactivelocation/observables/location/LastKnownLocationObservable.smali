.class public Lpl/charmas/android/reactivelocation/observables/location/LastKnownLocationObservable;
.super Lpl/charmas/android/reactivelocation/observables/BaseLocationObservable;
.source "LastKnownLocationObservable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lpl/charmas/android/reactivelocation/observables/BaseLocationObservable",
        "<",
        "Landroid/location/Location;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lpl/charmas/android/reactivelocation/observables/BaseLocationObservable;-><init>(Landroid/content/Context;)V

    .line 21
    return-void
.end method

.method public static createObservable(Landroid/content/Context;)Lrx/Observable;
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lrx/Observable",
            "<",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    .line 16
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/location/LastKnownLocationObservable;

    invoke-direct {v0, p0}, Lpl/charmas/android/reactivelocation/observables/location/LastKnownLocationObservable;-><init>(Landroid/content/Context;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected onGoogleApiClientReady(Lcom/google/android/gms/common/api/GoogleApiClient;Lrx/Observer;)V
    .locals 2
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
    .line 25
    .local p2, "observer":Lrx/Observer;, "Lrx/Observer<-Landroid/location/Location;>;"
    sget-object v1, Lcom/google/android/gms/location/LocationServices;->FusedLocationApi:Lcom/google/android/gms/location/FusedLocationProviderApi;

    invoke-interface {v1, p1}, Lcom/google/android/gms/location/FusedLocationProviderApi;->getLastLocation(Lcom/google/android/gms/common/api/GoogleApiClient;)Landroid/location/Location;

    move-result-object v0

    .line 26
    .local v0, "location":Landroid/location/Location;
    if-eqz v0, :cond_0

    .line 27
    invoke-interface {p2, v0}, Lrx/Observer;->onNext(Ljava/lang/Object;)V

    .line 29
    :cond_0
    invoke-interface {p2}, Lrx/Observer;->onCompleted()V

    .line 30
    return-void
.end method
