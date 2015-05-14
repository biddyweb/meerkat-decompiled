.class public Lcom/google/android/gms/internal/zzmu;
.super Ljava/lang/Object;


# direct methods
.method public static zza([Lcom/google/android/gms/internal/zzxc$zzd;Lcom/google/android/gms/internal/zzxd$zzb;)Lcom/google/android/gms/fitness/data/RawDataPoint;
    .locals 13

    new-instance v0, Lcom/google/android/gms/fitness/data/RawDataPoint;

    const/4 v1, 0x4

    iget-wide v2, p1, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIA:J

    invoke-static {p1}, Lcom/google/android/gms/internal/zzmt;->zza(Lcom/google/android/gms/internal/zzxd$zzb;)J

    move-result-wide v4

    iget-object v6, p1, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

    invoke-static {p0, v6}, Lcom/google/android/gms/internal/zzmx;->zza([Lcom/google/android/gms/internal/zzxc$zzd;[Lcom/google/android/gms/internal/zzxc$zzf;)[Lcom/google/android/gms/fitness/data/Value;

    move-result-object v6

    iget v7, p1, Lcom/google/android/gms/internal/zzxd$zzb;->zzaID:I

    iget v8, p1, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIF:I

    invoke-static {p1}, Lcom/google/android/gms/internal/zzmt;->zzb(Lcom/google/android/gms/internal/zzxd$zzb;)J

    move-result-wide v9

    invoke-static {p1}, Lcom/google/android/gms/internal/zzmt;->zzc(Lcom/google/android/gms/internal/zzxd$zzb;)J

    move-result-wide v11

    invoke-direct/range {v0 .. v12}, Lcom/google/android/gms/fitness/data/RawDataPoint;-><init>(IJJ[Lcom/google/android/gms/fitness/data/Value;IIJJ)V

    return-object v0
.end method

.method public static zza([Lcom/google/android/gms/internal/zzxc$zzd;[Lcom/google/android/gms/internal/zzxd$zzb;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/google/android/gms/internal/zzxc$zzd;",
            "[",
            "Lcom/google/android/gms/internal/zzxd$zzb;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/RawDataPoint;",
            ">;"
        }
    .end annotation

    new-instance v1, Ljava/util/ArrayList;

    array-length v0, p1

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    array-length v2, p1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, p1, v0

    invoke-static {p0, v3}, Lcom/google/android/gms/internal/zzmu;->zza([Lcom/google/android/gms/internal/zzxc$zzd;Lcom/google/android/gms/internal/zzxd$zzb;)Lcom/google/android/gms/fitness/data/RawDataPoint;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method public static zzb(Lcom/google/android/gms/fitness/data/RawDataPoint;)Lcom/google/android/gms/internal/zzxd$zzb;
    .locals 4

    new-instance v0, Lcom/google/android/gms/internal/zzxd$zzb;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzxd$zzb;-><init>()V

    iget-wide v2, p0, Lcom/google/android/gms/fitness/data/RawDataPoint;->zzYG:J

    iput-wide v2, v0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIA:J

    iget-object v1, p0, Lcom/google/android/gms/fitness/data/RawDataPoint;->zzYI:[Lcom/google/android/gms/fitness/data/Value;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzmx;->zza([Lcom/google/android/gms/fitness/data/Value;)[Lcom/google/android/gms/internal/zzxc$zzf;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

    iget v1, p0, Lcom/google/android/gms/fitness/data/RawDataPoint;->zzZJ:I

    iput v1, v0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaID:I

    iget v1, p0, Lcom/google/android/gms/fitness/data/RawDataPoint;->zzZK:I

    iput v1, v0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIF:I

    iget-wide v2, p0, Lcom/google/android/gms/fitness/data/RawDataPoint;->zzYH:J

    iput-wide v2, v0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIB:J

    iget-wide v2, p0, Lcom/google/android/gms/fitness/data/RawDataPoint;->zzYK:J

    iput-wide v2, v0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIH:J

    iget-wide v2, p0, Lcom/google/android/gms/fitness/data/RawDataPoint;->zzYL:J

    iput-wide v2, v0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaII:J

    return-object v0
.end method

.method public static zzl(Ljava/util/List;)[Lcom/google/android/gms/internal/zzxd$zzb;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/RawDataPoint;",
            ">;)[",
            "Lcom/google/android/gms/internal/zzxd$zzb;"
        }
    .end annotation

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    new-array v2, v0, [Lcom/google/android/gms/internal/zzxd$zzb;

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_0

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/fitness/data/RawDataPoint;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzmu;->zzb(Lcom/google/android/gms/fitness/data/RawDataPoint;)Lcom/google/android/gms/internal/zzxd$zzb;

    move-result-object v0

    aput-object v0, v2, v1

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    return-object v2
.end method
