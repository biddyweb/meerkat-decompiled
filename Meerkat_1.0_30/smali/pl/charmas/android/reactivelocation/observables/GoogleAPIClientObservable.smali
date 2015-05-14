.class public Lpl/charmas/android/reactivelocation/observables/GoogleAPIClientObservable;
.super Lpl/charmas/android/reactivelocation/observables/BaseObservable;
.source "GoogleAPIClientObservable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lpl/charmas/android/reactivelocation/observables/BaseObservable",
        "<",
        "Lcom/google/android/gms/common/api/GoogleApiClient;",
        ">;"
    }
.end annotation


# direct methods
.method protected varargs constructor <init>(Landroid/content/Context;[Lcom/google/android/gms/common/api/Api;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "[",
            "Lcom/google/android/gms/common/api/Api",
            "<+",
            "Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 20
    .local p2, "apis":[Lcom/google/android/gms/common/api/Api;, "[Lcom/google/android/gms/common/api/Api<+Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;>;"
    invoke-direct {p0, p1, p2}, Lpl/charmas/android/reactivelocation/observables/BaseObservable;-><init>(Landroid/content/Context;[Lcom/google/android/gms/common/api/Api;)V

    .line 21
    return-void
.end method

.method public static varargs create(Landroid/content/Context;[Lcom/google/android/gms/common/api/Api;)Lrx/Observable;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "[",
            "Lcom/google/android/gms/common/api/Api",
            "<+",
            "Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;",
            ">;)",
            "Lrx/Observable",
            "<",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 15
    .local p1, "apis":[Lcom/google/android/gms/common/api/Api;, "[Lcom/google/android/gms/common/api/Api<+Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;>;"
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/GoogleAPIClientObservable;

    invoke-direct {v0, p0, p1}, Lpl/charmas/android/reactivelocation/observables/GoogleAPIClientObservable;-><init>(Landroid/content/Context;[Lcom/google/android/gms/common/api/Api;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected onGoogleApiClientReady(Lcom/google/android/gms/common/api/GoogleApiClient;Lrx/Observer;)V
    .locals 0
    .param p1, "apiClient"    # Lcom/google/android/gms/common/api/GoogleApiClient;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Lrx/Observer",
            "<-",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p2, "observer":Lrx/Observer;, "Lrx/Observer<-Lcom/google/android/gms/common/api/GoogleApiClient;>;"
    invoke-interface {p2, p1}, Lrx/Observer;->onNext(Ljava/lang/Object;)V

    .line 26
    invoke-interface {p2}, Lrx/Observer;->onCompleted()V

    .line 27
    return-void
.end method
