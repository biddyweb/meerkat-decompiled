.class Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$1;
.super Ljava/lang/Object;
.source "ReactiveLocationProvider.java"

# interfaces
.implements Lrx/functions/Func1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;->checkLocationSettings(Lcom/google/android/gms/location/LocationSettingsRequest;)Lrx/Observable;
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
        "Lcom/google/android/gms/location/LocationSettingsResult;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;

.field final synthetic val$locationRequest:Lcom/google/android/gms/location/LocationSettingsRequest;


# direct methods
.method constructor <init>(Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;Lcom/google/android/gms/location/LocationSettingsRequest;)V
    .locals 0
    .param p1, "this$0"    # Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;

    .prologue
    .line 177
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$1;->this$0:Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;

    iput-object p2, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$1;->val$locationRequest:Lcom/google/android/gms/location/LocationSettingsRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 177
    check-cast p1, Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {p0, p1}, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$1;->call(Lcom/google/android/gms/common/api/GoogleApiClient;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public call(Lcom/google/android/gms/common/api/GoogleApiClient;)Lrx/Observable;
    .locals 2
    .param p1, "googleApiClient"    # Lcom/google/android/gms/common/api/GoogleApiClient;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            ")",
            "Lrx/Observable",
            "<",
            "Lcom/google/android/gms/location/LocationSettingsResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 180
    sget-object v0, Lcom/google/android/gms/location/LocationServices;->SettingsApi:Lcom/google/android/gms/location/SettingsApi;

    iget-object v1, p0, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider$1;->val$locationRequest:Lcom/google/android/gms/location/LocationSettingsRequest;

    invoke-interface {v0, p1, v1}, Lcom/google/android/gms/location/SettingsApi;->checkLocationSettings(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/location/LocationSettingsRequest;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v0

    invoke-static {v0}, Lpl/charmas/android/reactivelocation/ReactiveLocationProvider;->fromPendingResult(Lcom/google/android/gms/common/api/PendingResult;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method
