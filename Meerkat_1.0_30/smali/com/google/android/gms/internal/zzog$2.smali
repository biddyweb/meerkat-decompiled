.class Lcom/google/android/gms/internal/zzog$2;
.super Lcom/google/android/gms/internal/zznf$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzog;->zza(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/common/api/PendingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zznf$zza",
        "<",
        "Lcom/google/android/gms/fitness/result/SessionStopResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$name:Ljava/lang/String;

.field final synthetic zzaaD:Lcom/google/android/gms/internal/zzog;

.field final synthetic zzaaE:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzog;Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzog$2;->zzaaD:Lcom/google/android/gms/internal/zzog;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzog$2;->val$name:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzog$2;->zzaaE:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/zznf$zza;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    return-void
.end method


# virtual methods
.method protected synthetic createFailedResult(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .locals 1
    .param p1, "x0"    # Lcom/google/android/gms/common/api/Status;

    .prologue
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzog$2;->zzz(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/fitness/result/SessionStopResult;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic zza(Lcom/google/android/gms/common/api/Api$zza;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    check-cast p1, Lcom/google/android/gms/internal/zznf;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzog$2;->zza(Lcom/google/android/gms/internal/zznf;)V

    return-void
.end method

.method protected zza(Lcom/google/android/gms/internal/zznf;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v1, Lcom/google/android/gms/internal/zzog$zzb;

    const/4 v0, 0x0

    invoke-direct {v1, p0, v0}, Lcom/google/android/gms/internal/zzog$zzb;-><init>(Lcom/google/android/gms/common/api/zza$zzb;Lcom/google/android/gms/internal/zzog$1;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zznf;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zznf;->zzjb()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zznp;

    new-instance v3, Lcom/google/android/gms/fitness/request/zzam;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzog$2;->val$name:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzog$2;->zzaaE:Ljava/lang/String;

    invoke-direct {v3, v4, v5, v1, v2}, Lcom/google/android/gms/fitness/request/zzam;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zznu;Ljava/lang/String;)V

    invoke-interface {v0, v3}, Lcom/google/android/gms/internal/zznp;->zza(Lcom/google/android/gms/fitness/request/zzam;)V

    return-void
.end method

.method protected zzz(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/fitness/result/SessionStopResult;
    .locals 1

    invoke-static {p1}, Lcom/google/android/gms/fitness/result/SessionStopResult;->zzG(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/fitness/result/SessionStopResult;

    move-result-object v0

    return-object v0
.end method
