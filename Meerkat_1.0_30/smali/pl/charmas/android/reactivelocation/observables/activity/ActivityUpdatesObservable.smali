.class public Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable;
.super Lpl/charmas/android/reactivelocation/observables/activity/BaseActivityObservable;
.source "ActivityUpdatesObservable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable$ActivityUpdatesBroadcastReceiver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lpl/charmas/android/reactivelocation/observables/activity/BaseActivityObservable",
        "<",
        "Lcom/google/android/gms/location/ActivityRecognitionResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final ACTION_ACTIVITY_DETECTED:Ljava/lang/String; = "pl.charmas.android.reactivelocation.ACTION_ACTIVITY_UPDATE_DETECTED"


# instance fields
.field private final context:Landroid/content/Context;

.field private final detectionIntervalMilliseconds:I

.field private receiver:Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable$ActivityUpdatesBroadcastReceiver;


# direct methods
.method private constructor <init>(Landroid/content/Context;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "detectionIntervalMilliseconds"    # I

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lpl/charmas/android/reactivelocation/observables/activity/BaseActivityObservable;-><init>(Landroid/content/Context;)V

    .line 29
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable;->context:Landroid/content/Context;

    .line 30
    iput p2, p0, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable;->detectionIntervalMilliseconds:I

    .line 31
    return-void
.end method

.method public static createObservable(Landroid/content/Context;I)Lrx/Observable;
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "detectionIntervalMiliseconds"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I)",
            "Lrx/Observable",
            "<",
            "Lcom/google/android/gms/location/ActivityRecognitionResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 24
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable;

    invoke-direct {v0, p0, p1}, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable;-><init>(Landroid/content/Context;I)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method private getReceiverPendingIntent()Landroid/app/PendingIntent;
    .locals 4

    .prologue
    .line 42
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable;->context:Landroid/content/Context;

    const/4 v1, 0x0

    new-instance v2, Landroid/content/Intent;

    const-string v3, "pl.charmas.android.reactivelocation.ACTION_ACTIVITY_UPDATE_DETECTED"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v3, 0x8000000

    invoke-static {v0, v1, v2, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected onGoogleApiClientReady(Lcom/google/android/gms/common/api/GoogleApiClient;Lrx/Observer;)V
    .locals 5
    .param p1, "apiClient"    # Lcom/google/android/gms/common/api/GoogleApiClient;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Lrx/Observer",
            "<-",
            "Lcom/google/android/gms/location/ActivityRecognitionResult;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p2, "observer":Lrx/Observer;, "Lrx/Observer<-Lcom/google/android/gms/location/ActivityRecognitionResult;>;"
    new-instance v1, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable$ActivityUpdatesBroadcastReceiver;

    invoke-direct {v1, p2}, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable$ActivityUpdatesBroadcastReceiver;-><init>(Lrx/Observer;)V

    iput-object v1, p0, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable;->receiver:Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable$ActivityUpdatesBroadcastReceiver;

    .line 36
    iget-object v1, p0, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable;->context:Landroid/content/Context;

    iget-object v2, p0, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable;->receiver:Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable$ActivityUpdatesBroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "pl.charmas.android.reactivelocation.ACTION_ACTIVITY_UPDATE_DETECTED"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 37
    invoke-direct {p0}, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable;->getReceiverPendingIntent()Landroid/app/PendingIntent;

    move-result-object v0

    .line 38
    .local v0, "receiverIntent":Landroid/app/PendingIntent;
    sget-object v1, Lcom/google/android/gms/location/ActivityRecognition;->ActivityRecognitionApi:Lcom/google/android/gms/location/ActivityRecognitionApi;

    iget v2, p0, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable;->detectionIntervalMilliseconds:I

    int-to-long v2, v2

    invoke-interface {v1, p1, v2, v3, v0}, Lcom/google/android/gms/location/ActivityRecognitionApi;->requestActivityUpdates(Lcom/google/android/gms/common/api/GoogleApiClient;JLandroid/app/PendingIntent;)Lcom/google/android/gms/common/api/PendingResult;

    .line 39
    return-void
.end method

.method protected onUnsubscribed(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 2
    .param p1, "apiClient"    # Lcom/google/android/gms/common/api/GoogleApiClient;

    .prologue
    .line 47
    invoke-interface {p1}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    sget-object v0, Lcom/google/android/gms/location/ActivityRecognition;->ActivityRecognitionApi:Lcom/google/android/gms/location/ActivityRecognitionApi;

    invoke-direct {p0}, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable;->getReceiverPendingIntent()Landroid/app/PendingIntent;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lcom/google/android/gms/location/ActivityRecognitionApi;->removeActivityUpdates(Lcom/google/android/gms/common/api/GoogleApiClient;Landroid/app/PendingIntent;)Lcom/google/android/gms/common/api/PendingResult;

    .line 50
    :cond_0
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable;->context:Landroid/content/Context;

    iget-object v1, p0, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable;->receiver:Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable$ActivityUpdatesBroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable;->receiver:Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable$ActivityUpdatesBroadcastReceiver;

    .line 52
    return-void
.end method
