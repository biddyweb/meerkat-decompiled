.class public final Lcom/google/android/gms/internal/zzju;
.super Lcom/google/android/gms/common/internal/zzk;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzju$1;,
        Lcom/google/android/gms/internal/zzju$zzc;,
        Lcom/google/android/gms/internal/zzju$zzb;,
        Lcom/google/android/gms/internal/zzju$zza;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/internal/zzk",
        "<",
        "Lcom/google/android/gms/internal/zzjz;",
        ">;"
    }
.end annotation


# static fields
.field private static final zzKB:Ljava/lang/Object;

.field private static final zzKC:Ljava/lang/Object;

.field private static final zzKh:Lcom/google/android/gms/internal/zzkc;


# instance fields
.field private final zzIB:Lcom/google/android/gms/cast/Cast$Listener;

.field private zzJm:D

.field private zzJn:Z

.field private zzKA:Lcom/google/android/gms/common/api/zza$zzb;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/zza$zzb",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation
.end field

.field private zzKi:Lcom/google/android/gms/cast/ApplicationMetadata;

.field private final zzKj:Lcom/google/android/gms/cast/CastDevice;

.field private final zzKk:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/cast/Cast$MessageReceivedCallback;",
            ">;"
        }
    .end annotation
.end field

.field private final zzKl:J

.field private zzKm:Lcom/google/android/gms/internal/zzju$zzc;

.field private zzKn:Ljava/lang/String;

.field private zzKo:Z

.field private zzKp:Z

.field private zzKq:Z

.field private zzKr:I

.field private zzKs:I

.field private final zzKt:Ljava/util/concurrent/atomic/AtomicLong;

.field private zzKu:Ljava/lang/String;

.field private zzKv:Ljava/lang/String;

.field private zzKw:Landroid/os/Bundle;

.field private final zzKx:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/google/android/gms/common/api/zza$zzb",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;>;"
        }
    .end annotation
.end field

.field private final zzKy:Lcom/google/android/gms/internal/zzju$zzb;

.field private zzKz:Lcom/google/android/gms/common/api/zza$zzb;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/zza$zzb",
            "<",
            "Lcom/google/android/gms/cast/Cast$ApplicationConnectionResult;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zzkc;

    const-string v1, "CastClientImpl"

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzkc;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/internal/zzju;->zzKh:Lcom/google/android/gms/internal/zzkc;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzju;->zzKB:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzju;->zzKC:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/cast/CastDevice;JLcom/google/android/gms/cast/Cast$Listener;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .locals 6

    const/16 v3, 0xa

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p7

    move-object v5, p8

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/common/internal/zzk;-><init>(Landroid/content/Context;Landroid/os/Looper;ILcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    iput-object p3, p0, Lcom/google/android/gms/internal/zzju;->zzKj:Lcom/google/android/gms/cast/CastDevice;

    iput-object p6, p0, Lcom/google/android/gms/internal/zzju;->zzIB:Lcom/google/android/gms/cast/Cast$Listener;

    iput-wide p4, p0, Lcom/google/android/gms/internal/zzju;->zzKl:J

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKk:Ljava/util/Map;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v2, 0x0

    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKt:Ljava/util/concurrent/atomic/AtomicLong;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKx:Ljava/util/Map;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzju;->zzho()V

    new-instance v0, Lcom/google/android/gms/internal/zzju$zzb;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/zzju$zzb;-><init>(Lcom/google/android/gms/internal/zzju;Lcom/google/android/gms/internal/zzju$1;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKy:Lcom/google/android/gms/internal/zzju$zzb;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKy:Lcom/google/android/gms/internal/zzju$zzb;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzju;->registerConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzju;Lcom/google/android/gms/cast/ApplicationMetadata;)Lcom/google/android/gms/cast/ApplicationMetadata;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzju;->zzKi:Lcom/google/android/gms/cast/ApplicationMetadata;

    return-object p1
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzju;Lcom/google/android/gms/common/api/zza$zzb;)Lcom/google/android/gms/common/api/zza$zzb;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzju;->zzKz:Lcom/google/android/gms/common/api/zza$zzb;

    return-object p1
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzju;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzju;->zzKu:Ljava/lang/String;

    return-object p1
.end method

.method private zza(Lcom/google/android/gms/internal/zzjp;)V
    .locals 7

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzjp;->zzhl()Ljava/lang/String;

    move-result-object v0

    iget-object v3, p0, Lcom/google/android/gms/internal/zzju;->zzKn:Ljava/lang/String;

    invoke-static {v0, v3}, Lcom/google/android/gms/internal/zzjv;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    iput-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKn:Ljava/lang/String;

    move v0, v1

    :goto_0
    sget-object v3, Lcom/google/android/gms/internal/zzju;->zzKh:Lcom/google/android/gms/internal/zzkc;

    const-string v4, "hasChanged=%b, mFirstApplicationStatusUpdate=%b"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v5, v2

    iget-boolean v6, p0, Lcom/google/android/gms/internal/zzju;->zzKo:Z

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-virtual {v3, v4, v5}, Lcom/google/android/gms/internal/zzkc;->zzb(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzju;->zzIB:Lcom/google/android/gms/cast/Cast$Listener;

    if-eqz v1, :cond_1

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzju;->zzKo:Z

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzIB:Lcom/google/android/gms/cast/Cast$Listener;

    invoke-virtual {v0}, Lcom/google/android/gms/cast/Cast$Listener;->onApplicationStatusChanged()V

    :cond_1
    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzju;->zzKo:Z

    return-void

    :cond_2
    move v0, v2

    goto :goto_0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzju;Lcom/google/android/gms/internal/zzjp;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzju;->zza(Lcom/google/android/gms/internal/zzjp;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzju;Lcom/google/android/gms/internal/zzjw;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzju;->zza(Lcom/google/android/gms/internal/zzjw;)V

    return-void
.end method

.method private zza(Lcom/google/android/gms/internal/zzjw;)V
    .locals 11

    const/4 v10, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzjw;->getApplicationMetadata()Lcom/google/android/gms/cast/ApplicationMetadata;

    move-result-object v0

    iget-object v3, p0, Lcom/google/android/gms/internal/zzju;->zzKi:Lcom/google/android/gms/cast/ApplicationMetadata;

    invoke-static {v0, v3}, Lcom/google/android/gms/internal/zzjv;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKi:Lcom/google/android/gms/cast/ApplicationMetadata;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzIB:Lcom/google/android/gms/cast/Cast$Listener;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzju;->zzKi:Lcom/google/android/gms/cast/ApplicationMetadata;

    invoke-virtual {v0, v3}, Lcom/google/android/gms/cast/Cast$Listener;->onApplicationMetadataChanged(Lcom/google/android/gms/cast/ApplicationMetadata;)V

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzjw;->zzhs()D

    move-result-wide v4

    const-wide/high16 v6, 0x7ff8000000000000L    # NaN

    cmpl-double v0, v4, v6

    if-eqz v0, :cond_a

    iget-wide v6, p0, Lcom/google/android/gms/internal/zzju;->zzJm:D

    sub-double v6, v4, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    const-wide v8, 0x3e7ad7f29abcaf48L    # 1.0E-7

    cmpl-double v0, v6, v8

    if-lez v0, :cond_a

    iput-wide v4, p0, Lcom/google/android/gms/internal/zzju;->zzJm:D

    move v0, v1

    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzjw;->zzhA()Z

    move-result v3

    iget-boolean v4, p0, Lcom/google/android/gms/internal/zzju;->zzJn:Z

    if-eq v3, v4, :cond_1

    iput-boolean v3, p0, Lcom/google/android/gms/internal/zzju;->zzJn:Z

    move v0, v1

    :cond_1
    sget-object v3, Lcom/google/android/gms/internal/zzju;->zzKh:Lcom/google/android/gms/internal/zzkc;

    const-string v4, "hasVolumeChanged=%b, mFirstDeviceStatusUpdate=%b"

    new-array v5, v10, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v5, v2

    iget-boolean v6, p0, Lcom/google/android/gms/internal/zzju;->zzKp:Z

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-virtual {v3, v4, v5}, Lcom/google/android/gms/internal/zzkc;->zzb(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/google/android/gms/internal/zzju;->zzIB:Lcom/google/android/gms/cast/Cast$Listener;

    if-eqz v3, :cond_3

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzju;->zzKp:Z

    if-eqz v0, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzIB:Lcom/google/android/gms/cast/Cast$Listener;

    invoke-virtual {v0}, Lcom/google/android/gms/cast/Cast$Listener;->onVolumeChanged()V

    :cond_3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzjw;->zzhB()I

    move-result v0

    iget v3, p0, Lcom/google/android/gms/internal/zzju;->zzKr:I

    if-eq v0, v3, :cond_9

    iput v0, p0, Lcom/google/android/gms/internal/zzju;->zzKr:I

    move v0, v1

    :goto_1
    sget-object v3, Lcom/google/android/gms/internal/zzju;->zzKh:Lcom/google/android/gms/internal/zzkc;

    const-string v4, "hasActiveInputChanged=%b, mFirstDeviceStatusUpdate=%b"

    new-array v5, v10, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v5, v2

    iget-boolean v6, p0, Lcom/google/android/gms/internal/zzju;->zzKp:Z

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-virtual {v3, v4, v5}, Lcom/google/android/gms/internal/zzkc;->zzb(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/google/android/gms/internal/zzju;->zzIB:Lcom/google/android/gms/cast/Cast$Listener;

    if-eqz v3, :cond_5

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzju;->zzKp:Z

    if-eqz v0, :cond_5

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzIB:Lcom/google/android/gms/cast/Cast$Listener;

    iget v3, p0, Lcom/google/android/gms/internal/zzju;->zzKr:I

    invoke-virtual {v0, v3}, Lcom/google/android/gms/cast/Cast$Listener;->zzab(I)V

    :cond_5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzjw;->zzhC()I

    move-result v0

    iget v3, p0, Lcom/google/android/gms/internal/zzju;->zzKs:I

    if-eq v0, v3, :cond_8

    iput v0, p0, Lcom/google/android/gms/internal/zzju;->zzKs:I

    move v0, v1

    :goto_2
    sget-object v3, Lcom/google/android/gms/internal/zzju;->zzKh:Lcom/google/android/gms/internal/zzkc;

    const-string v4, "hasStandbyStateChanged=%b, mFirstDeviceStatusUpdate=%b"

    new-array v5, v10, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v5, v2

    iget-boolean v6, p0, Lcom/google/android/gms/internal/zzju;->zzKp:Z

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-virtual {v3, v4, v5}, Lcom/google/android/gms/internal/zzkc;->zzb(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzju;->zzIB:Lcom/google/android/gms/cast/Cast$Listener;

    if-eqz v1, :cond_7

    if-nez v0, :cond_6

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzju;->zzKp:Z

    if-eqz v0, :cond_7

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzIB:Lcom/google/android/gms/cast/Cast$Listener;

    iget v1, p0, Lcom/google/android/gms/internal/zzju;->zzKs:I

    invoke-virtual {v0, v1}, Lcom/google/android/gms/cast/Cast$Listener;->zzac(I)V

    :cond_7
    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzju;->zzKp:Z

    return-void

    :cond_8
    move v0, v2

    goto :goto_2

    :cond_9
    move v0, v2

    goto :goto_1

    :cond_a
    move v0, v2

    goto/16 :goto_0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzju;Lcom/google/android/gms/common/api/zza$zzb;)Lcom/google/android/gms/common/api/zza$zzb;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzju;->zzKA:Lcom/google/android/gms/common/api/zza$zzb;

    return-object p1
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzju;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzju;->zzKv:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzju;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzju;->zzht()V

    return-void
.end method

.method private zzc(Lcom/google/android/gms/common/api/zza$zzb;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/zza$zzb",
            "<",
            "Lcom/google/android/gms/cast/Cast$ApplicationConnectionResult;",
            ">;)V"
        }
    .end annotation

    sget-object v1, Lcom/google/android/gms/internal/zzju;->zzKB:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKz:Lcom/google/android/gms/common/api/zza$zzb;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKz:Lcom/google/android/gms/common/api/zza$zzb;

    new-instance v2, Lcom/google/android/gms/internal/zzju$zza;

    new-instance v3, Lcom/google/android/gms/common/api/Status;

    const/16 v4, 0x7d2

    invoke-direct {v3, v4}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    invoke-direct {v2, v3}, Lcom/google/android/gms/internal/zzju$zza;-><init>(Lcom/google/android/gms/common/api/Status;)V

    invoke-interface {v0, v2}, Lcom/google/android/gms/common/api/zza$zzb;->zzd(Ljava/lang/Object;)V

    :cond_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzju;->zzKz:Lcom/google/android/gms/common/api/zza$zzb;

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zzju;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzju;->zzho()V

    return-void
.end method

.method static synthetic zzd(Lcom/google/android/gms/internal/zzju;)Lcom/google/android/gms/common/api/zza$zzb;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKz:Lcom/google/android/gms/common/api/zza$zzb;

    return-object v0
.end method

.method static synthetic zze(Lcom/google/android/gms/internal/zzju;)Lcom/google/android/gms/cast/Cast$Listener;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzIB:Lcom/google/android/gms/cast/Cast$Listener;

    return-object v0
.end method

.method private zze(Lcom/google/android/gms/common/api/zza$zzb;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/zza$zzb",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;)V"
        }
    .end annotation

    sget-object v1, Lcom/google/android/gms/internal/zzju;->zzKC:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKA:Lcom/google/android/gms/common/api/zza$zzb;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/16 v2, 0x7d1

    invoke-direct {v0, v2}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    invoke-interface {p1, v0}, Lcom/google/android/gms/common/api/zza$zzb;->zzd(Ljava/lang/Object;)V

    monitor-exit v1

    :goto_0
    return-void

    :cond_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzju;->zzKA:Lcom/google/android/gms/common/api/zza$zzb;

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static synthetic zzf(Lcom/google/android/gms/internal/zzju;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKk:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic zzg(Lcom/google/android/gms/internal/zzju;)Lcom/google/android/gms/cast/CastDevice;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKj:Lcom/google/android/gms/cast/CastDevice;

    return-object v0
.end method

.method static synthetic zzh(Lcom/google/android/gms/internal/zzju;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKx:Ljava/util/Map;

    return-object v0
.end method

.method private zzho()V
    .locals 3

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v0, -0x1

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzju;->zzKq:Z

    iput v0, p0, Lcom/google/android/gms/internal/zzju;->zzKr:I

    iput v0, p0, Lcom/google/android/gms/internal/zzju;->zzKs:I

    iput-object v1, p0, Lcom/google/android/gms/internal/zzju;->zzKi:Lcom/google/android/gms/cast/ApplicationMetadata;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzju;->zzKn:Ljava/lang/String;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzju;->zzJm:D

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzju;->zzJn:Z

    return-void
.end method

.method private zzht()V
    .locals 3

    sget-object v0, Lcom/google/android/gms/internal/zzju;->zzKh:Lcom/google/android/gms/internal/zzkc;

    const-string v1, "removing all MessageReceivedCallbacks"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzkc;->zzb(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzju;->zzKk:Ljava/util/Map;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKk:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private zzhu()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzju;->zzKq:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKm:Lcom/google/android/gms/internal/zzju$zzc;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKm:Lcom/google/android/gms/internal/zzju$zzc;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzju$zzc;->zzhz()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected to a device"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    return-void
.end method

.method static synthetic zzhv()Lcom/google/android/gms/internal/zzkc;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzju;->zzKh:Lcom/google/android/gms/internal/zzkc;

    return-object v0
.end method

.method static synthetic zzhw()Ljava/lang/Object;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzju;->zzKB:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic zzhx()Ljava/lang/Object;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzju;->zzKC:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic zzi(Lcom/google/android/gms/internal/zzju;)Lcom/google/android/gms/common/api/zza$zzb;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKA:Lcom/google/android/gms/common/api/zza$zzb;

    return-object v0
.end method


# virtual methods
.method public disconnect()V
    .locals 6

    const/4 v5, 0x1

    const/4 v4, 0x0

    sget-object v0, Lcom/google/android/gms/internal/zzju;->zzKh:Lcom/google/android/gms/internal/zzkc;

    const-string v1, "disconnect(); ServiceListener=%s, isConnected=%b"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzju;->zzKm:Lcom/google/android/gms/internal/zzju$zzc;

    aput-object v3, v2, v4

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzju;->isConnected()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzkc;->zzb(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKm:Lcom/google/android/gms/internal/zzju$zzc;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/gms/internal/zzju;->zzKm:Lcom/google/android/gms/internal/zzju$zzc;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzju$zzc;->zzhy()Lcom/google/android/gms/internal/zzju;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/zzju;->zzKh:Lcom/google/android/gms/internal/zzkc;

    const-string v1, "already disposed, so short-circuiting"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzkc;->zzb(Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    return-void

    :cond_1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzju;->zzht()V

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzju;->isConnected()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzju;->isConnecting()Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzju;->zzjb()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzjz;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzjz;->disconnect()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    invoke-super {p0}, Lcom/google/android/gms/common/internal/zzk;->disconnect()V

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_1
    sget-object v1, Lcom/google/android/gms/internal/zzju;->zzKh:Lcom/google/android/gms/internal/zzkc;

    const-string v2, "Error while disconnecting the controller interface: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v0, v2, v3}, Lcom/google/android/gms/internal/zzkc;->zza(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-super {p0}, Lcom/google/android/gms/common/internal/zzk;->disconnect()V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-super {p0}, Lcom/google/android/gms/common/internal/zzk;->disconnect()V

    throw v0
.end method

.method public getApplicationMetadata()Lcom/google/android/gms/cast/ApplicationMetadata;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzju;->zzhu()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKi:Lcom/google/android/gms/cast/ApplicationMetadata;

    return-object v0
.end method

.method public getApplicationStatus()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzju;->zzhu()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKn:Ljava/lang/String;

    return-object v0
.end method

.method public isMute()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzju;->zzhu()V

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzju;->zzJn:Z

    return v0
.end method

.method public zzL(Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzju;->zzjb()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzjz;

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzju;->zzJm:D

    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzju;->zzJn:Z

    invoke-interface {v0, p1, v2, v3, v1}, Lcom/google/android/gms/internal/zzjz;->zza(ZDZ)V

    return-void
.end method

.method protected zzO(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzjz;
    .locals 1

    invoke-static {p1}, Lcom/google/android/gms/internal/zzjz$zza;->zzP(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzjz;

    move-result-object v0

    return-object v0
.end method

.method public zza(D)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-static {p1, p2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Volume cannot be "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzju;->zzjb()Landroid/os/IInterface;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzjz;

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzju;->zzJm:D

    iget-boolean v6, p0, Lcom/google/android/gms/internal/zzju;->zzJn:Z

    move-wide v2, p1

    invoke-interface/range {v1 .. v6}, Lcom/google/android/gms/internal/zzjz;->zza(DDZ)V

    return-void
.end method

.method protected zza(ILandroid/os/IBinder;Landroid/os/Bundle;)V
    .locals 7

    const/16 v6, 0x3e9

    const/4 v0, 0x0

    const/4 v5, 0x1

    sget-object v1, Lcom/google/android/gms/internal/zzju;->zzKh:Lcom/google/android/gms/internal/zzkc;

    const-string v2, "in onPostInitHandler; statusCode=%d"

    new-array v3, v5, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v0

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/internal/zzkc;->zzb(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    if-ne p1, v6, :cond_2

    :cond_0
    iput-boolean v5, p0, Lcom/google/android/gms/internal/zzju;->zzKq:Z

    iput-boolean v5, p0, Lcom/google/android/gms/internal/zzju;->zzKo:Z

    iput-boolean v5, p0, Lcom/google/android/gms/internal/zzju;->zzKp:Z

    :goto_0
    if-ne p1, v6, :cond_1

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    iput-object v1, p0, Lcom/google/android/gms/internal/zzju;->zzKw:Landroid/os/Bundle;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzju;->zzKw:Landroid/os/Bundle;

    const-string v2, "com.google.android.gms.cast.EXTRA_APP_NO_LONGER_RUNNING"

    invoke-virtual {v1, v2, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    move p1, v0

    :cond_1
    invoke-super {p0, p1, p2, p3}, Lcom/google/android/gms/common/internal/zzk;->zza(ILandroid/os/IBinder;Landroid/os/Bundle;)V

    return-void

    :cond_2
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzju;->zzKq:Z

    goto :goto_0
.end method

.method public zza(Ljava/lang/String;Lcom/google/android/gms/cast/Cast$MessageReceivedCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-static {p1}, Lcom/google/android/gms/internal/zzjv;->zzaK(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzju;->zzaJ(Ljava/lang/String;)V

    if-eqz p2, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzju;->zzKk:Ljava/util/Map;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKk:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzju;->zzjb()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzjz;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzjz;->zzaN(Ljava/lang/String;)V

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public zza(Ljava/lang/String;Lcom/google/android/gms/cast/LaunchOptions;Lcom/google/android/gms/common/api/zza$zzb;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/cast/LaunchOptions;",
            "Lcom/google/android/gms/common/api/zza$zzb",
            "<",
            "Lcom/google/android/gms/cast/Cast$ApplicationConnectionResult;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/zzju;->zzc(Lcom/google/android/gms/common/api/zza$zzb;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzju;->zzjb()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzjz;

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/zzjz;->zza(Ljava/lang/String;Lcom/google/android/gms/cast/LaunchOptions;)V

    return-void
.end method

.method public zza(Ljava/lang/String;Lcom/google/android/gms/common/api/zza$zzb;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/common/api/zza$zzb",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/zzju;->zze(Lcom/google/android/gms/common/api/zza$zzb;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzju;->zzjb()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzjz;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzjz;->zzaM(Ljava/lang/String;)V

    return-void
.end method

.method public zza(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/common/api/zza$zzb;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/common/api/zza$zzb",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The message payload cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/high16 v1, 0x10000

    if-le v0, v1, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Message exceeds maximum size"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    invoke-static {p1}, Lcom/google/android/gms/internal/zzjv;->zzaK(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzju;->zzhu()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKt:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v2

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKx:Ljava/util/Map;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzju;->zzjb()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzjz;

    invoke-interface {v0, p1, p2, v2, v3}, Lcom/google/android/gms/internal/zzjz;->zza(Ljava/lang/String;Ljava/lang/String;J)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzju;->zzKx:Ljava/util/Map;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    throw v0
.end method

.method public zza(Ljava/lang/String;ZLcom/google/android/gms/common/api/zza$zzb;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Lcom/google/android/gms/common/api/zza$zzb",
            "<",
            "Lcom/google/android/gms/cast/Cast$ApplicationConnectionResult;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/zzju;->zzc(Lcom/google/android/gms/common/api/zza$zzb;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzju;->zzjb()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzjz;

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/zzjz;->zzf(Ljava/lang/String;Z)V

    return-void
.end method

.method public zzaJ(Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Channel namespace cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzju;->zzKk:Ljava/util/Map;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKk:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/cast/Cast$MessageReceivedCallback;

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    :try_start_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzju;->zzjb()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzjz;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzjz;->zzaO(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    :cond_1
    :goto_0
    return-void

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/google/android/gms/internal/zzju;->zzKh:Lcom/google/android/gms/internal/zzkc;

    const-string v2, "Error unregistering namespace (%s): %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v0, v2, v3}, Lcom/google/android/gms/internal/zzkc;->zza(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public zzb(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/common/api/zza$zzb;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/common/api/zza$zzb",
            "<",
            "Lcom/google/android/gms/cast/Cast$ApplicationConnectionResult;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/zzju;->zzc(Lcom/google/android/gms/common/api/zza$zzb;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzju;->zzjb()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzjz;

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/zzjz;->zzo(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected zzcF()Ljava/lang/String;
    .locals 1

    const-string v0, "com.google.android.gms.cast.service.BIND_CAST_DEVICE_CONTROLLER_SERVICE"

    return-object v0
.end method

.method protected zzcG()Ljava/lang/String;
    .locals 1

    const-string v0, "com.google.android.gms.cast.internal.ICastDeviceController"

    return-object v0
.end method

.method public zzd(Lcom/google/android/gms/common/api/zza$zzb;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/zza$zzb",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzju;->zze(Lcom/google/android/gms/common/api/zza$zzb;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzju;->zzjb()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzjz;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzjz;->zzhD()V

    return-void
.end method

.method public zzhp()Landroid/os/Bundle;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKw:Landroid/os/Bundle;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzju;->zzKw:Landroid/os/Bundle;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/gms/internal/zzju;->zzKw:Landroid/os/Bundle;

    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Lcom/google/android/gms/common/internal/zzk;->zzhp()Landroid/os/Bundle;

    move-result-object v0

    goto :goto_0
.end method

.method protected zzhq()Landroid/os/Bundle;
    .locals 6

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    sget-object v1, Lcom/google/android/gms/internal/zzju;->zzKh:Lcom/google/android/gms/internal/zzkc;

    const-string v2, "getRemoteService(): mLastApplicationId=%s, mLastSessionId=%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/google/android/gms/internal/zzju;->zzKu:Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/google/android/gms/internal/zzju;->zzKv:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/internal/zzkc;->zzb(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzju;->zzKj:Lcom/google/android/gms/cast/CastDevice;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/cast/CastDevice;->putInBundle(Landroid/os/Bundle;)V

    const-string v1, "com.google.android.gms.cast.EXTRA_CAST_FLAGS"

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzju;->zzKl:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    new-instance v1, Lcom/google/android/gms/internal/zzju$zzc;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzju$zzc;-><init>(Lcom/google/android/gms/internal/zzju;)V

    iput-object v1, p0, Lcom/google/android/gms/internal/zzju;->zzKm:Lcom/google/android/gms/internal/zzju$zzc;

    const-string v1, "listener"

    new-instance v2, Lcom/google/android/gms/common/internal/BinderWrapper;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzju;->zzKm:Lcom/google/android/gms/internal/zzju$zzc;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzju$zzc;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/google/android/gms/common/internal/BinderWrapper;-><init>(Landroid/os/IBinder;)V

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzju;->zzKu:Ljava/lang/String;

    if-eqz v1, :cond_0

    const-string v1, "last_application_id"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzju;->zzKu:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzju;->zzKv:Ljava/lang/String;

    if-eqz v1, :cond_0

    const-string v1, "last_session_id"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzju;->zzKv:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-object v0
.end method

.method public zzhr()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzju;->zzjb()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzjz;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzjz;->zzhr()V

    return-void
.end method

.method public zzhs()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzju;->zzhu()V

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzju;->zzJm:D

    return-wide v0
.end method

.method protected synthetic zzp(Landroid/os/IBinder;)Landroid/os/IInterface;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzju;->zzO(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzjz;

    move-result-object v0

    return-object v0
.end method
