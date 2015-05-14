.class Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;
.super Ljava/lang/Object;
.source "BaseObservable.java"

# interfaces
.implements Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;
.implements Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lpl/charmas/android/reactivelocation/observables/BaseObservable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ApiClientConnectionCallbacks"
.end annotation


# instance fields
.field private apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

.field private final observer:Lrx/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Observer",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lpl/charmas/android/reactivelocation/observables/BaseObservable;


# direct methods
.method private constructor <init>(Lpl/charmas/android/reactivelocation/observables/BaseObservable;Lrx/Observer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 87
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;, "Lpl/charmas/android/reactivelocation/observables/BaseObservable<TT;>.ApiClientConnectionCallbacks;"
    .local p2, "observer":Lrx/Observer;, "Lrx/Observer<-TT;>;"
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;->this$0:Lpl/charmas/android/reactivelocation/observables/BaseObservable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    iput-object p2, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;->observer:Lrx/Observer;

    .line 89
    return-void
.end method

.method synthetic constructor <init>(Lpl/charmas/android/reactivelocation/observables/BaseObservable;Lrx/Observer;Lpl/charmas/android/reactivelocation/observables/BaseObservable$1;)V
    .locals 0
    .param p1, "x0"    # Lpl/charmas/android/reactivelocation/observables/BaseObservable;
    .param p2, "x1"    # Lrx/Observer;
    .param p3, "x2"    # Lpl/charmas/android/reactivelocation/observables/BaseObservable$1;

    .prologue
    .line 79
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;, "Lpl/charmas/android/reactivelocation/observables/BaseObservable<TT;>.ApiClientConnectionCallbacks;"
    invoke-direct {p0, p1, p2}, Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;-><init>(Lpl/charmas/android/reactivelocation/observables/BaseObservable;Lrx/Observer;)V

    return-void
.end method


# virtual methods
.method public onConnected(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 94
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;, "Lpl/charmas/android/reactivelocation/observables/BaseObservable<TT;>.ApiClientConnectionCallbacks;"
    :try_start_0
    iget-object v1, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;->this$0:Lpl/charmas/android/reactivelocation/observables/BaseObservable;

    iget-object v2, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;->apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    iget-object v3, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;->observer:Lrx/Observer;

    invoke-virtual {v1, v2, v3}, Lpl/charmas/android/reactivelocation/observables/BaseObservable;->onGoogleApiClientReady(Lcom/google/android/gms/common/api/GoogleApiClient;Lrx/Observer;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    :goto_0
    return-void

    .line 95
    :catch_0
    move-exception v0

    .line 96
    .local v0, "ex":Ljava/lang/Throwable;
    iget-object v1, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;->observer:Lrx/Observer;

    invoke-interface {v1, v0}, Lrx/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 3
    .param p1, "connectionResult"    # Lcom/google/android/gms/common/ConnectionResult;

    .prologue
    .line 107
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;, "Lpl/charmas/android/reactivelocation/observables/BaseObservable<TT;>.ApiClientConnectionCallbacks;"
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;->observer:Lrx/Observer;

    new-instance v1, Lpl/charmas/android/reactivelocation/observables/GoogleAPIConnectionException;

    const-string v2, "Error connecting to GoogleApiClient."

    invoke-direct {v1, v2, p1}, Lpl/charmas/android/reactivelocation/observables/GoogleAPIConnectionException;-><init>(Ljava/lang/String;Lcom/google/android/gms/common/ConnectionResult;)V

    invoke-interface {v0, v1}, Lrx/Observer;->onError(Ljava/lang/Throwable;)V

    .line 108
    return-void
.end method

.method public onConnectionSuspended(I)V
    .locals 2
    .param p1, "cause"    # I

    .prologue
    .line 102
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;, "Lpl/charmas/android/reactivelocation/observables/BaseObservable<TT;>.ApiClientConnectionCallbacks;"
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;->observer:Lrx/Observer;

    new-instance v1, Lpl/charmas/android/reactivelocation/observables/GoogleAPIConnectionSuspendedException;

    invoke-direct {v1, p1}, Lpl/charmas/android/reactivelocation/observables/GoogleAPIConnectionSuspendedException;-><init>(I)V

    invoke-interface {v0, v1}, Lrx/Observer;->onError(Ljava/lang/Throwable;)V

    .line 103
    return-void
.end method

.method public setClient(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 0
    .param p1, "client"    # Lcom/google/android/gms/common/api/GoogleApiClient;

    .prologue
    .line 111
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;, "Lpl/charmas/android/reactivelocation/observables/BaseObservable<TT;>.ApiClientConnectionCallbacks;"
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;->apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    .line 112
    return-void
.end method
