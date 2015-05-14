.class Lcom/google/android/gms/internal/zzoc$1;
.super Lcom/google/android/gms/internal/zznb$zzc;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzoc;->zza(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/fitness/data/DataSet;Z)Lcom/google/android/gms/common/api/PendingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaah:Lcom/google/android/gms/fitness/data/DataSet;

.field final synthetic zzaai:Z

.field final synthetic zzaaj:Lcom/google/android/gms/internal/zzoc;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzoc;Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/fitness/data/DataSet;Z)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzoc$1;->zzaaj:Lcom/google/android/gms/internal/zzoc;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzoc$1;->zzaah:Lcom/google/android/gms/fitness/data/DataSet;

    iput-boolean p4, p0, Lcom/google/android/gms/internal/zzoc$1;->zzaai:Z

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/zznb$zzc;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

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

    check-cast p1, Lcom/google/android/gms/internal/zznb;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzoc$1;->zza(Lcom/google/android/gms/internal/zznb;)V

    return-void
.end method

.method protected zza(Lcom/google/android/gms/internal/zznb;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v1, Lcom/google/android/gms/internal/zzoh;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzoh;-><init>(Lcom/google/android/gms/common/api/zza$zzb;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zznb;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zznb;->zzjb()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zznl;

    new-instance v3, Lcom/google/android/gms/fitness/request/zze;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzoc$1;->zzaah:Lcom/google/android/gms/fitness/data/DataSet;

    iget-boolean v5, p0, Lcom/google/android/gms/internal/zzoc$1;->zzaai:Z

    invoke-direct {v3, v4, v1, v2, v5}, Lcom/google/android/gms/fitness/request/zze;-><init>(Lcom/google/android/gms/fitness/data/DataSet;Lcom/google/android/gms/internal/zznv;Ljava/lang/String;Z)V

    invoke-interface {v0, v3}, Lcom/google/android/gms/internal/zznl;->zza(Lcom/google/android/gms/fitness/request/zze;)V

    return-void
.end method
