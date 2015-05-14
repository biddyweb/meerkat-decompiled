.class Lpl/charmas/android/reactivelocation/observables/BaseObservable$1;
.super Ljava/lang/Object;
.source "BaseObservable.java"

# interfaces
.implements Lrx/functions/Action0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lpl/charmas/android/reactivelocation/observables/BaseObservable;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lpl/charmas/android/reactivelocation/observables/BaseObservable;

.field final synthetic val$apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;


# direct methods
.method constructor <init>(Lpl/charmas/android/reactivelocation/observables/BaseObservable;Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 0
    .param p1, "this$0"    # Lpl/charmas/android/reactivelocation/observables/BaseObservable;

    .prologue
    .line 40
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/BaseObservable$1;, "Lpl/charmas/android/reactivelocation/observables/BaseObservable.1;"
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable$1;->this$0:Lpl/charmas/android/reactivelocation/observables/BaseObservable;

    iput-object p2, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable$1;->val$apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .locals 2

    .prologue
    .line 43
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/BaseObservable$1;, "Lpl/charmas/android/reactivelocation/observables/BaseObservable.1;"
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable$1;->val$apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable$1;->val$apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnecting()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 44
    :cond_0
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable$1;->this$0:Lpl/charmas/android/reactivelocation/observables/BaseObservable;

    iget-object v1, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable$1;->val$apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {v0, v1}, Lpl/charmas/android/reactivelocation/observables/BaseObservable;->onUnsubscribed(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    .line 45
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/BaseObservable$1;->val$apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    .line 47
    :cond_1
    return-void
.end method
