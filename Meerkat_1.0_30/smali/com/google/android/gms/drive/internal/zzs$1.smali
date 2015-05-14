.class Lcom/google/android/gms/drive/internal/zzs$1;
.super Lcom/google/android/gms/drive/internal/zzp$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/drive/internal/zzs;->reopenForWrite(Lcom/google/android/gms/common/api/GoogleApiClient;)Lcom/google/android/gms/common/api/PendingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzTR:Lcom/google/android/gms/drive/internal/zzs;


# direct methods
.method constructor <init>(Lcom/google/android/gms/drive/internal/zzs;Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/drive/internal/zzs$1;->zzTR:Lcom/google/android/gms/drive/internal/zzs;

    invoke-direct {p0, p2}, Lcom/google/android/gms/drive/internal/zzp$zzb;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

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

    check-cast p1, Lcom/google/android/gms/drive/internal/zzr;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/internal/zzs$1;->zza(Lcom/google/android/gms/drive/internal/zzr;)V

    return-void
.end method

.method protected zza(Lcom/google/android/gms/drive/internal/zzr;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/drive/internal/zzr;->zzkF()Lcom/google/android/gms/drive/internal/zzag;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/drive/internal/OpenContentsRequest;

    iget-object v2, p0, Lcom/google/android/gms/drive/internal/zzs$1;->zzTR:Lcom/google/android/gms/drive/internal/zzs;

    invoke-virtual {v2}, Lcom/google/android/gms/drive/internal/zzs;->getDriveId()Lcom/google/android/gms/drive/DriveId;

    move-result-object v2

    const/high16 v3, 0x20000000

    iget-object v4, p0, Lcom/google/android/gms/drive/internal/zzs$1;->zzTR:Lcom/google/android/gms/drive/internal/zzs;

    invoke-static {v4}, Lcom/google/android/gms/drive/internal/zzs;->zza(Lcom/google/android/gms/drive/internal/zzs;)Lcom/google/android/gms/drive/Contents;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/drive/Contents;->getRequestId()I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/google/android/gms/drive/internal/OpenContentsRequest;-><init>(Lcom/google/android/gms/drive/DriveId;II)V

    new-instance v2, Lcom/google/android/gms/drive/internal/zzbe;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/google/android/gms/drive/internal/zzbe;-><init>(Lcom/google/android/gms/common/api/zza$zzb;Lcom/google/android/gms/drive/DriveFile$DownloadProgressListener;)V

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/drive/internal/zzag;->zza(Lcom/google/android/gms/drive/internal/OpenContentsRequest;Lcom/google/android/gms/drive/internal/zzah;)V

    return-void
.end method
