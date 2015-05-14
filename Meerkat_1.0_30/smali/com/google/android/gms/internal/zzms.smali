.class public Lcom/google/android/gms/internal/zzms;
.super Ljava/lang/Object;


# direct methods
.method public static zzb(Lcom/google/android/gms/fitness/data/RawBucket;)Lcom/google/android/gms/internal/zzxd$zza;
    .locals 4

    new-instance v1, Lcom/google/android/gms/internal/zzxd$zza;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzxd$zza;-><init>()V

    iget-wide v2, p0, Lcom/google/android/gms/fitness/data/RawBucket;->zzON:J

    iput-wide v2, v1, Lcom/google/android/gms/internal/zzxd$zza;->zzaIq:J

    iget-wide v2, p0, Lcom/google/android/gms/fitness/data/RawBucket;->zzYq:J

    iput-wide v2, v1, Lcom/google/android/gms/internal/zzxd$zza;->zzaIr:J

    iget-object v0, p0, Lcom/google/android/gms/fitness/data/RawBucket;->zzYs:Lcom/google/android/gms/fitness/data/Session;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, v1, Lcom/google/android/gms/internal/zzxd$zza;->zzaIt:Lcom/google/android/gms/internal/zzxe$zza;

    iget v0, p0, Lcom/google/android/gms/fitness/data/RawBucket;->zzZI:I

    iput v0, v1, Lcom/google/android/gms/internal/zzxd$zza;->zzaIu:I

    iget-object v0, p0, Lcom/google/android/gms/fitness/data/RawBucket;->zzYD:Ljava/util/List;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzmv;->zzm(Ljava/util/List;)[Lcom/google/android/gms/internal/zzxd$zzc;

    move-result-object v0

    iput-object v0, v1, Lcom/google/android/gms/internal/zzxd$zza;->zzaIv:[Lcom/google/android/gms/internal/zzxd$zzc;

    iget-boolean v0, p0, Lcom/google/android/gms/fitness/data/RawBucket;->zzYF:Z

    iput-boolean v0, v1, Lcom/google/android/gms/internal/zzxd$zza;->zzaIx:Z

    iget v0, p0, Lcom/google/android/gms/fitness/data/RawBucket;->zzYE:I

    iput v0, v1, Lcom/google/android/gms/internal/zzxd$zza;->zzaIw:I

    return-object v1

    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/zzmw;->zzZW:Lcom/google/android/gms/internal/zzmw;

    iget-object v2, p0, Lcom/google/android/gms/fitness/data/RawBucket;->zzYs:Lcom/google/android/gms/fitness/data/Session;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzmw;->zzb(Lcom/google/android/gms/fitness/data/Session;)Lcom/google/android/gms/internal/zzxe$zza;

    move-result-object v0

    goto :goto_0
.end method
