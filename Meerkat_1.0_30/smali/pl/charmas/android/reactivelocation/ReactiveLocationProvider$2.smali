.class Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$2;
.super Ljava/lang/Object;
.source "ReactiveLocationProvider.java"

# interfaces
.implements Lrx/functions/Func1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;->getCurrentPlace(Lcom/google/android/gms/location/places/PlaceFilter;)Lrx/Observable;
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
        "Lcom/google/android/gms/location/places/PlaceLikelihoodBuffer;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;

.field final synthetic val$placeFilter:Lcom/google/android/gms/location/places/PlaceFilter;


# direct methods
.method constructor <init>(Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;Lcom/google/android/gms/location/places/PlaceFilter;)V
    .locals 0
    .param p1, "this$0"    # Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;

    .prologue
    .line 195
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$2;->this$0:Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;

    iput-object p2, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$2;->val$placeFilter:Lcom/google/android/gms/location/places/PlaceFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 195
    check-cast p1, Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {p0, p1}, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$2;->call(Lcom/google/android/gms/common/api/GoogleApiClient;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public call(Lcom/google/android/gms/common/api/GoogleApiClient;)Lrx/Observable;
    .locals 2
    .param p1, "api"    # Lcom/google/android/gms/common/api/GoogleApiClient;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            ")",
            "Lrx/Observable",
            "<",
            "Lcom/google/android/gms/location/places/PlaceLikelihoodBuffer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 198
    sget-object v0, Lcom/google/android/gms/location/places/Places;->PlaceDetectionApi:Lcom/google/android/gms/location/places/PlaceDetectionApi;

    iget-object v1, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$2;->val$placeFilter:Lcom/google/android/gms/location/places/PlaceFilter;

    invoke-interface {v0, p1, v1}, Lcom/google/android/gms/location/places/PlaceDetectionApi;->getCurrentPlace(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/location/places/PlaceFilter;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v0

    invoke-static {v0}, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;->fromPendingResult(Lcom/google/android/gms/common/api/PendingResult;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method
