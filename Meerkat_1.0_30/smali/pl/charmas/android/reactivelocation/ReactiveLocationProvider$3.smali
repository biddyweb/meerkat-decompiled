.class Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$3;
.super Ljava/lang/Object;
.source "ReactiveLocationProvider.java"

# interfaces
.implements Lrx/functions/Func1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;->getPlaceAutocompletePredictions(Ljava/lang/String;Lcom/google/android/gms/maps/model/LatLngBounds;Lcom/google/android/gms/location/places/AutocompleteFilter;)Lrx/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/functions/Func1",
        "<",
        "Lcom/google/android/gms/common/api/GoogleApiClient;",
        "Lrx/Observable",
        "<",
        "Lcom/google/android/gms/location/places/AutocompletePredictionBuffer;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;

.field final synthetic val$bounds:Lcom/google/android/gms/maps/model/LatLngBounds;

.field final synthetic val$filter:Lcom/google/android/gms/location/places/AutocompleteFilter;

.field final synthetic val$query:Ljava/lang/String;


# direct methods
.method constructor <init>(Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;Ljava/lang/String;Lcom/google/android/gms/maps/model/LatLngBounds;Lcom/google/android/gms/location/places/AutocompleteFilter;)V
    .locals 0
    .param p1, "this$0"    # Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;

    .prologue
    .line 215
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$3;->this$0:Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;

    iput-object p2, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$3;->val$query:Ljava/lang/String;

    iput-object p3, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$3;->val$bounds:Lcom/google/android/gms/maps/model/LatLngBounds;

    iput-object p4, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$3;->val$filter:Lcom/google/android/gms/location/places/AutocompleteFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 215
    check-cast p1, Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {p0, p1}, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$3;->call(Lcom/google/android/gms/common/api/GoogleApiClient;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public call(Lcom/google/android/gms/common/api/GoogleApiClient;)Lrx/Observable;
    .locals 4
    .param p1, "api"    # Lcom/google/android/gms/common/api/GoogleApiClient;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            ")",
            "Lrx/Observable",
            "<",
            "Lcom/google/android/gms/location/places/AutocompletePredictionBuffer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 218
    sget-object v0, Lcom/google/android/gms/location/places/Places;->GeoDataApi:Lcom/google/android/gms/location/places/GeoDataApi;

    iget-object v1, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$3;->val$query:Ljava/lang/String;

    iget-object v2, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$3;->val$bounds:Lcom/google/android/gms/maps/model/LatLngBounds;

    iget-object v3, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$3;->val$filter:Lcom/google/android/gms/location/places/AutocompleteFilter;

    invoke-interface {v0, p1, v1, v2, v3}, Lcom/google/android/gms/location/places/GeoDataApi;->getAutocompletePredictions(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;Lcom/google/android/gms/maps/model/LatLngBounds;Lcom/google/android/gms/location/places/AutocompleteFilter;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v0

    invoke-static {v0}, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;->fromPendingResult(Lcom/google/android/gms/common/api/PendingResult;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method
