.class Lcom/google/android/gms/internal/zzoa$2;
.super Lcom/google/android/gms/internal/zzmz$zzc;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzoa;->stopBleScan(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/fitness/request/BleScanCallback;)Lcom/google/android/gms/common/api/PendingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaaa:Lcom/google/android/gms/internal/zzoa;

.field final synthetic zzaab:Lcom/google/android/gms/fitness/request/BleScanCallback;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzoa;Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/fitness/request/BleScanCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzoa$2;->zzaaa:Lcom/google/android/gms/internal/zzoa;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzoa$2;->zzaab:Lcom/google/android/gms/fitness/request/BleScanCallback;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/zzmz$zzc;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic zza(Lcom/google/android/gms/common/api/Api$zza;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    check-cast p1, Lcom/google/android/gms/internal/zzmz;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzoa$2;->zza(Lcom/google/android/gms/internal/zzmz;)V

    return-void
.end method

.method protected zza(Lcom/google/android/gms/internal/zzmz;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v1, Lcom/google/android/gms/internal/zzoh;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzoh;-><init>(Lcom/google/android/gms/common/api/zza$zzb;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzmz;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzmz;->zzjb()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zznj;

    new-instance v3, Lcom/google/android/gms/fitness/request/zzar;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzoa$2;->zzaab:Lcom/google/android/gms/fitness/request/BleScanCallback;

    invoke-direct {v3, v4, v1, v2}, Lcom/google/android/gms/fitness/request/zzar;-><init>(Lcom/google/android/gms/fitness/request/BleScanCallback;Lcom/google/android/gms/internal/zznv;Ljava/lang/String;)V

    invoke-interface {v0, v3}, Lcom/google/android/gms/internal/zznj;->zza(Lcom/google/android/gms/fitness/request/zzar;)V

    return-void
.end method
