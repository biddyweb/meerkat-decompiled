.class Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable$1;
.super Ljava/lang/Object;
.source "LocationUpdatesObservable.java"

# interfaces
.implements Lcom/google/android/gms/location/LocationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable;->onGoogleApiClientReady(Lcom/google/android/gms/common/api/GoogleApiClient;Lrx/Observer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable;

.field final synthetic val$observer:Lrx/Observer;


# direct methods
.method constructor <init>(Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable;Lrx/Observer;)V
    .locals 0
    .param p1, "this$0"    # Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable;

    .prologue
    .line 33
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable$1;->this$0:Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable;

    iput-object p2, p0, Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable$1;->val$observer:Lrx/Observer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLocationChanged(Landroid/location/Location;)V
    .locals 1
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 36
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/location/LocationUpdatesObservable$1;->val$observer:Lrx/Observer;

    invoke-interface {v0, p1}, Lrx/Observer;->onNext(Ljava/lang/Object;)V

    .line 37
    return-void
.end method
