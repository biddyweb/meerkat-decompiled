.class public Lcom/google/android/gms/internal/zzwj;
.super Lcom/google/android/gms/dynamic/zzg;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/dynamic/zzg",
        "<",
        "Lcom/google/android/gms/internal/zzwe;",
        ">;"
    }
.end annotation


# static fields
.field private static zzaFa:Lcom/google/android/gms/internal/zzwj;


# direct methods
.method protected constructor <init>()V
    .locals 1

    const-string v0, "com.google.android.gms.wallet.dynamite.WalletDynamiteCreatorImpl"

    invoke-direct {p0, v0}, Lcom/google/android/gms/dynamic/zzg;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static zza(Landroid/app/Activity;Lcom/google/android/gms/dynamic/zzc;Lcom/google/android/gms/wallet/fragment/WalletFragmentOptions;Lcom/google/android/gms/internal/zzwc;)Lcom/google/android/gms/internal/zzwb;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException;
        }
    .end annotation

    invoke-static {p0}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    if-eqz v0, :cond_0

    new-instance v1, Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException;

    invoke-direct {v1, v0}, Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException;-><init>(I)V

    throw v1

    :cond_0
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/internal/zzwj;->zzuU()Lcom/google/android/gms/internal/zzwj;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzwj;->zzS(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzwe;

    invoke-static {p0}, Lcom/google/android/gms/dynamic/zze;->zzn(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v1

    invoke-interface {v0, v1, p1, p2, p3}, Lcom/google/android/gms/internal/zzwe;->zza(Lcom/google/android/gms/dynamic/zzd;Lcom/google/android/gms/dynamic/zzc;Lcom/google/android/gms/wallet/fragment/WalletFragmentOptions;Lcom/google/android/gms/internal/zzwc;)Lcom/google/android/gms/internal/zzwb;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/google/android/gms/dynamic/zzg$zza; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static zzuU()Lcom/google/android/gms/internal/zzwj;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzwj;->zzaFa:Lcom/google/android/gms/internal/zzwj;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzwj;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzwj;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzwj;->zzaFa:Lcom/google/android/gms/internal/zzwj;

    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/zzwj;->zzaFa:Lcom/google/android/gms/internal/zzwj;

    return-object v0
.end method


# virtual methods
.method protected zzcO(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzwe;
    .locals 1

    invoke-static {p1}, Lcom/google/android/gms/internal/zzwe$zza;->zzcK(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzwe;

    move-result-object v0

    return-object v0
.end method

.method protected synthetic zzd(Landroid/os/IBinder;)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzwj;->zzcO(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzwe;

    move-result-object v0

    return-object v0
.end method
