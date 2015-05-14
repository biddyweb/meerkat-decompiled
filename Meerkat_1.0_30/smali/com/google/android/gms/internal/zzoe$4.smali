.class Lcom/google/android/gms/internal/zzoe$4;
.super Lcom/google/android/gms/internal/zznd$zzc;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzoe;->unsubscribe(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/fitness/data/DataType;)Lcom/google/android/gms/common/api/PendingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaao:Lcom/google/android/gms/internal/zzoe;

.field final synthetic zzaap:Lcom/google/android/gms/fitness/data/DataType;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzoe;Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/fitness/data/DataType;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzoe$4;->zzaao:Lcom/google/android/gms/internal/zzoe;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzoe$4;->zzaap:Lcom/google/android/gms/fitness/data/DataType;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/zznd$zzc;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

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

    check-cast p1, Lcom/google/android/gms/internal/zznd;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzoe$4;->zza(Lcom/google/android/gms/internal/zznd;)V

    return-void
.end method

.method protected zza(Lcom/google/android/gms/internal/zznd;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v1, Lcom/google/android/gms/internal/zzoh;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzoh;-><init>(Lcom/google/android/gms/common/api/zza$zzb;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zznd;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zznd;->zzjb()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zznn;

    new-instance v3, Lcom/google/android/gms/fitness/request/zzax;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzoe$4;->zzaap:Lcom/google/android/gms/fitness/data/DataType;

    const/4 v5, 0x0

    invoke-direct {v3, v4, v5, v1, v2}, Lcom/google/android/gms/fitness/request/zzax;-><init>(Lcom/google/android/gms/fitness/data/DataType;Lcom/google/android/gms/fitness/data/DataSource;Lcom/google/android/gms/internal/zznv;Ljava/lang/String;)V

    invoke-interface {v0, v3}, Lcom/google/android/gms/internal/zznn;->zza(Lcom/google/android/gms/fitness/request/zzax;)V

    return-void
.end method
