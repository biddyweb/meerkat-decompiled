.class public Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;
.super Ljava/lang/Object;
.source "ReactiveLocationProvider.java"


# instance fields
.field private final ctx:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;->ctx:Landroid/content/Context;

    .line 50
    return-void
.end method

.method public static fromPendingResult(Lcom/google/android/gms/common/api/PendingResult;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/google/android/gms/common/api/Result;",
            ">(",
            "Lcom/google/android/gms/common/api/PendingResult",
            "<TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 246
    .local p0, "result":Lcom/google/android/gms/common/api/PendingResult;, "Lcom/google/android/gms/common/api/PendingResult<TT;>;"
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;

    invoke-direct {v0, p0}, Lpl/charmas/android/reactivelocation/observables/PendingResultObservable;-><init>(Lcom/google/android/gms/common/api/PendingResult;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public addGeofences(Landroid/app/PendingIntent;Lcom/google/android/gms/location/GeofencingRequest;)Lrx/Observable;
    .locals 1
    .param p1, "geofenceTransitionPendingIntent"    # Landroid/app/PendingIntent;
    .param p2, "request"    # Lcom/google/android/gms/location/GeofencingRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/PendingIntent;",
            "Lcom/google/android/gms/location/GeofencingRequest;",
            ")",
            "Lrx/Observable",
            "<",
            "Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 118
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;->ctx:Landroid/content/Context;

    invoke-static {v0, p2, p1}, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceObservable;->createObservable(Landroid/content/Context;Lcom/google/android/gms/location/GeofencingRequest;Landroid/app/PendingIntent;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public checkLocationSettings(Lcom/google/android/gms/location/LocationSettingsRequest;)Lrx/Observable;
    .locals 3
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationSettingsRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationSettingsRequest;",
            ")",
            "Lrx/Observable",
            "<",
            "Lcom/google/android/gms/location/LocationSettingsResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 176
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/google/android/gms/common/api/Api;

    const/4 v1, 0x0

    sget-object v2, Lcom/google/android/gms/location/LocationServices;->API:Lcom/google/android/gms/common/api/Api;

    aput-object v2, v0, v1

    invoke-virtual {p0, v0}, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;->getGoogleApiClientObservable([Lcom/google/android/gms/common/api/Api;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$1;

    invoke-direct {v1, p0, p1}, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$1;-><init>(Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;Lcom/google/android/gms/location/LocationSettingsRequest;)V

    .line 177
    invoke-virtual {v0, v1}, Lrx/Observable;->flatMap(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final getCurrentPlace(Lcom/google/android/gms/location/places/PlaceFilter;)Lrx/Observable;
    .locals 3
    .param p1, "placeFilter"    # Lcom/google/android/gms/location/places/PlaceFilter;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/places/PlaceFilter;",
            ")",
            "Lrx/Observable",
            "<",
            "Lcom/google/android/gms/location/places/PlaceLikelihoodBuffer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 194
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/google/android/gms/common/api/Api;

    const/4 v1, 0x0

    sget-object v2, Lcom/google/android/gms/location/places/Places;->PLACE_DETECTION_API:Lcom/google/android/gms/common/api/Api;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/google/android/gms/location/places/Places;->GEO_DATA_API:Lcom/google/android/gms/common/api/Api;

    aput-object v2, v0, v1

    invoke-virtual {p0, v0}, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;->getGoogleApiClientObservable([Lcom/google/android/gms/common/api/Api;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$2;

    invoke-direct {v1, p0, p1}, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$2;-><init>(Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;Lcom/google/android/gms/location/places/PlaceFilter;)V

    .line 195
    invoke-virtual {v0, v1}, Lrx/Observable;->flatMap(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public getDetectedActivity(I)Lrx/Observable;
    .locals 1
    .param p1, "detectIntervalMiliseconds"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/Observable",
            "<",
            "Lcom/google/android/gms/location/ActivityRecognitionResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 165
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;->ctx:Landroid/content/Context;

    invoke-static {v0, p1}, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable;->createObservable(Landroid/content/Context;I)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public getGeocodeObservable(DDI)Lrx/Observable;
    .locals 7
    .param p1, "lat"    # D
    .param p3, "lng"    # D
    .param p5, "maxResults"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DDI)",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<",
            "Landroid/location/Address;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 96
    iget-object v1, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;->ctx:Landroid/content/Context;

    move-wide v2, p1

    move-wide v4, p3

    move v6, p5

    invoke-static/range {v1 .. v6}, Lpl/charmas/android/reactivelocation/observables/geocode/GeodecodeObservable;->createObservable(Landroid/content/Context;DDI)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final varargs getGoogleApiClientObservable([Lcom/google/android/gms/common/api/Api;)Lrx/Observable;
    .locals 1
    .param p1, "apis"    # [Lcom/google/android/gms/common/api/Api;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/google/android/gms/common/api/Api;",
            ")",
            "Lrx/Observable",
            "<",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            ">;"
        }
    .end annotation

    .prologue
    .line 235
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;->ctx:Landroid/content/Context;

    invoke-static {v0, p1}, Lpl/charmas/android/reactivelocation/observables/GoogleAPIClientObservable;->create(Landroid/content/Context;[Lcom/google/android/gms/common/api/Api;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public getLastKnownLocation()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    .line 65
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;->ctx:Landroid/content/Context;

    invoke-static {v0}, Lpl/charmas/android/reactivelocation/observables/location/LastKnownLocationObservable;->createObservable(Landroid/content/Context;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final getPlaceAutocompletePredictions(Ljava/lang/String;Lcom/google/android/gms/maps/model/LatLngBounds;Lcom/google/android/gms/location/places/AutocompleteFilter;)Lrx/Observable;
    .locals 3
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "bounds"    # Lcom/google/android/gms/maps/model/LatLngBounds;
    .param p3, "filter"    # Lcom/google/android/gms/location/places/AutocompleteFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/maps/model/LatLngBounds;",
            "Lcom/google/android/gms/location/places/AutocompleteFilter;",
            ")",
            "Lrx/Observable",
            "<",
            "Lcom/google/android/gms/location/places/AutocompletePredictionBuffer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 214
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/google/android/gms/common/api/Api;

    const/4 v1, 0x0

    sget-object v2, Lcom/google/android/gms/location/places/Places;->PLACE_DETECTION_API:Lcom/google/android/gms/common/api/Api;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/google/android/gms/location/places/Places;->GEO_DATA_API:Lcom/google/android/gms/common/api/Api;

    aput-object v2, v0, v1

    invoke-virtual {p0, v0}, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;->getGoogleApiClientObservable([Lcom/google/android/gms/common/api/Api;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$3;

    invoke-direct {v1, p0, p1, p2, p3}, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$3;-><init>(Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;Ljava/lang/String;Lcom/google/android/gms/maps/model/LatLngBounds;Lcom/google/android/gms/location/places/AutocompleteFilter;)V

    .line 215
    invoke-virtual {v0, v1}, Lrx/Observable;->flatMap(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public getUpdatedLocation(Lcom/google/android/gms/location/LocationRequest;)Lrx/Observable;
    .locals 1
    .param p1, "locationRequest"    # Lcom/google/android/gms/location/LocationRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationRequest;",
            ")",
            "Lrx/Observable",
            "<",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    .line 82
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;->ctx:Landroid/content/Context;

    invoke-static {v0, p1}, Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable;->createObservable(Landroid/content/Context;Lcom/google/android/gms/location/LocationRequest;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public removeGeofences(Landroid/app/PendingIntent;)Lrx/Observable;
    .locals 1
    .param p1, "pendingIntent"    # Landroid/app/PendingIntent;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/PendingIntent;",
            ")",
            "Lrx/Observable",
            "<",
            "Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$PendingIntentRemoveGeofenceResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 136
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;->ctx:Landroid/content/Context;

    invoke-static {v0, p1}, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceObservable;->createObservable(Landroid/content/Context;Landroid/app/PendingIntent;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public removeGeofences(Ljava/util/List;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lrx/Observable",
            "<",
            "Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$RequestIdsRemoveGeofenceResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 154
    .local p1, "requestIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;->ctx:Landroid/content/Context;

    invoke-static {v0, p1}, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceObservable;->createObservable(Landroid/content/Context;Ljava/util/List;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method
