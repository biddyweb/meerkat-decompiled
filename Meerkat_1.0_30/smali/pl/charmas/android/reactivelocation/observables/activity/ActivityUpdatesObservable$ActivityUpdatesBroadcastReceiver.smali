.class Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable$ActivityUpdatesBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ActivityUpdatesObservable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ActivityUpdatesBroadcastReceiver"
.end annotation


# instance fields
.field private final observer:Lrx/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Observer",
            "<-",
            "Lcom/google/android/gms/location/ActivityRecognitionResult;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/Observer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observer",
            "<-",
            "Lcom/google/android/gms/location/ActivityRecognitionResult;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p1, "observer":Lrx/Observer;, "Lrx/Observer<-Lcom/google/android/gms/location/ActivityRecognitionResult;>;"
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 58
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable$ActivityUpdatesBroadcastReceiver;->observer:Lrx/Observer;

    .line 59
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 63
    invoke-static {p2}, Lcom/google/android/gms/location/ActivityRecognitionResult;->hasResult(Landroid/content/Intent;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 64
    invoke-static {p2}, Lcom/google/android/gms/location/ActivityRecognitionResult;->extractResult(Landroid/content/Intent;)Lcom/google/android/gms/location/ActivityRecognitionResult;

    move-result-object v0

    .line 65
    .local v0, "result":Lcom/google/android/gms/location/ActivityRecognitionResult;
    iget-object v1, p0, Lpl/charmas/android/reactivelocation/observables/activity/ActivityUpdatesObservable$ActivityUpdatesBroadcastReceiver;->observer:Lrx/Observer;

    invoke-interface {v1, v0}, Lrx/Observer;->onNext(Ljava/lang/Object;)V

    .line 67
    .end local v0    # "result":Lcom/google/android/gms/location/ActivityRecognitionResult;
    :cond_0
    return-void
.end method
