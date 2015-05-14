.class public abstract Lpl/charmas/android/reactivelocation/observables/BaseObservable;
.super Ljava/lang/Object;
.source "BaseObservable.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/Observable$OnSubscribe",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final ctx:Landroid/content/Context;

.field private final services:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/common/api/Api",
            "<+",
            "Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method protected varargs constructor <init>(Landroid/content/Context;[Lcom/google/android/gms/common/api/Api;)V
    .locals 1
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
    .line 25
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/BaseObservable;, "Lpl/charmas/android/reactivelocation/observables/BaseObservable<TT;>;"
    .local p2, "services":[Lcom/google/android/gms/common/api/Api;, "[Lcom/google/android/gms/common/api/Api<+Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable;->ctx:Landroid/content/Context;

    .line 27
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable;->services:Ljava/util/List;

    .line 28
    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 20
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/BaseObservable;, "Lpl/charmas/android/reactivelocation/observables/BaseObservable<TT;>;"
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lpl/charmas/android/reactivelocation/observables/BaseObservable;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/BaseObservable;, "Lpl/charmas/android/reactivelocation/observables/BaseObservable<TT;>;"
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    invoke-virtual {p0, p1}, Lpl/charmas/android/reactivelocation/observables/BaseObservable;->createApiClient(Lrx/Subscriber;)Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v0

    .line 35
    .local v0, "apiClient":Lcom/google/android/gms/common/api/GoogleApiClient;
    :try_start_0
    invoke-interface {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->connect()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    :goto_0
    new-instance v2, Lpl/charmas/android/reactivelocation/observables/BaseObservable$1;

    invoke-direct {v2, p0, v0}, Lpl/charmas/android/reactivelocation/observables/BaseObservable$1;-><init>(Lpl/charmas/android/reactivelocation/observables/BaseObservable;Lcom/google/android/gms/common/api/GoogleApiClient;)V

    invoke-static {v2}, Lrx/subscriptions/Subscriptions;->create(Lrx/functions/Action0;)Lrx/Subscription;

    move-result-object v2

    invoke-virtual {p1, v2}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 49
    return-void

    .line 36
    :catch_0
    move-exception v1

    .line 37
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-virtual {p1, v1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected createApiClient(Lrx/Subscriber;)Lcom/google/android/gms/common/api/GoogleApiClient;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;)",
            "Lcom/google/android/gms/common/api/GoogleApiClient;"
        }
    .end annotation

    .prologue
    .line 54
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/BaseObservable;, "Lpl/charmas/android/reactivelocation/observables/BaseObservable<TT;>;"
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    new-instance v2, Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;

    const/4 v4, 0x0

    invoke-direct {v2, p0, p1, v4}, Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;-><init>(Lpl/charmas/android/reactivelocation/observables/BaseObservable;Lrx/Observer;Lpl/charmas/android/reactivelocation/observables/BaseObservable$1;)V

    .line 56
    .local v2, "apiClientConnectionCallbacks":Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;, "Lpl/charmas/android/reactivelocation/observables/BaseObservable<TT;>.ApiClientConnectionCallbacks;"
    new-instance v1, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    iget-object v4, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable;->ctx:Landroid/content/Context;

    invoke-direct {v1, v4}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;-><init>(Landroid/content/Context;)V

    .line 59
    .local v1, "apiClientBuilder":Lcom/google/android/gms/common/api/GoogleApiClient$Builder;
    iget-object v4, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable;->services:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/common/api/Api;

    .line 60
    .local v3, "service":Lcom/google/android/gms/common/api/Api;, "Lcom/google/android/gms/common/api/Api<+Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;>;"
    invoke-virtual {v1, v3}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addApi(Lcom/google/android/gms/common/api/Api;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    goto :goto_0

    .line 63
    .end local v3    # "service":Lcom/google/android/gms/common/api/Api;, "Lcom/google/android/gms/common/api/Api<+Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;>;"
    :cond_0
    invoke-virtual {v1, v2}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addConnectionCallbacks(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    .line 64
    invoke-virtual {v1, v2}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addOnConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    .line 66
    invoke-virtual {v1}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->build()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v0

    .line 68
    .local v0, "apiClient":Lcom/google/android/gms/common/api/GoogleApiClient;
    invoke-virtual {v2, v0}, Lpl/charmas/android/reactivelocation/observables/BaseObservable$ApiClientConnectionCallbacks;->setClient(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    .line 70
    return-object v0
.end method

.method protected abstract onGoogleApiClientReady(Lcom/google/android/gms/common/api/GoogleApiClient;Lrx/Observer;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Lrx/Observer",
            "<-TT;>;)V"
        }
    .end annotation
.end method

.method protected onUnsubscribed(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 0
    .param p1, "locationClient"    # Lcom/google/android/gms/common/api/GoogleApiClient;

    .prologue
    .line 75
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/BaseObservable;, "Lpl/charmas/android/reactivelocation/observables/BaseObservable<TT;>;"
    return-void
.end method
