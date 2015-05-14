.class public abstract Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceObservable;
.super Lpl/charmas/android/reactivelocation/observables/BaseLocationObservable;
.source "RemoveGeofenceObservable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lpl/charmas/android/reactivelocation/observables/BaseLocationObservable",
        "<TT;>;"
    }
.end annotation


# direct methods
.method protected constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 27
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceObservable;, "Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceObservable<TT;>;"
    invoke-direct {p0, p1}, Lpl/charmas/android/reactivelocation/observables/BaseLocationObservable;-><init>(Landroid/content/Context;)V

    .line 28
    return-void
.end method

.method public static createObservable(Landroid/content/Context;Landroid/app/PendingIntent;)Lrx/Observable;
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "pendingIntent"    # Landroid/app/PendingIntent;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/app/PendingIntent;",
            ")",
            "Lrx/Observable",
            "<",
            "Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$PendingIntentRemoveGeofenceResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 18
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable;

    invoke-direct {v0, p0, p1}, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceByPendingIntentObservable;-><init>(Landroid/content/Context;Landroid/app/PendingIntent;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static createObservable(Landroid/content/Context;Ljava/util/List;)Lrx/Observable;
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
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
    .line 23
    .local p1, "requestIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceRequestIdsObservable;

    invoke-direct {v0, p0, p1}, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceRequestIdsObservable;-><init>(Landroid/content/Context;Ljava/util/List;)V

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
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceObservable;, "Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceObservable<TT;>;"
    .local p2, "observer":Lrx/Observer;, "Lrx/Observer<-TT;>;"
    invoke-virtual {p0, p1, p2}, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofenceObservable;->removeGeofences(Lcom/google/android/gms/common/api/GoogleApiClient;Lrx/Observer;)V

    .line 33
    return-void
.end method

.method protected abstract removeGeofences(Lcom/google/android/gms/common/api/GoogleApiClient;Lrx/Observer;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Lrx/Observer",
            "<-TT;>;)V"
        }
    .end annotation
.end method
