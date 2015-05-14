.class public Lcom/google/android/gms/internal/zzmx;
.super Ljava/lang/Object;


# direct methods
.method public static zza(Lcom/google/android/gms/internal/zzxc$zzd;Lcom/google/android/gms/internal/zzxc$zzf;)Lcom/google/android/gms/fitness/data/Value;
    .locals 7

    const/4 v5, 0x2

    const/4 v2, 0x0

    const/4 v1, 0x1

    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    new-instance v3, Lcom/google/android/gms/fitness/data/Value;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxc$zzd;->zzaIh:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {v3, v0}, Lcom/google/android/gms/fitness/data/Value;-><init>(I)V

    iget-object v0, p1, Lcom/google/android/gms/internal/zzxc$zzf;->zzaIp:Ljava/lang/Double;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxc$zzd;->zzaIh:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v5, :cond_2

    move v0, v1

    :goto_1
    const-string v4, "Field format %d does not match stored value %s"

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/google/android/gms/internal/zzxc$zzd;->zzaIh:Ljava/lang/Integer;

    aput-object v6, v5, v2

    iget-object v2, p1, Lcom/google/android/gms/internal/zzxc$zzf;->zzaIp:Ljava/lang/Double;

    aput-object v2, v5, v1

    invoke-static {v0, v4, v5}, Lcom/google/android/gms/common/internal/zzx;->zzb(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p1, Lcom/google/android/gms/internal/zzxc$zzf;->zzaIp:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->floatValue()F

    move-result v0

    invoke-virtual {v3, v0}, Lcom/google/android/gms/fitness/data/Value;->setFloat(F)V

    :cond_1
    :goto_2
    move-object v0, v3

    goto :goto_0

    :cond_2
    move v0, v2

    goto :goto_1

    :cond_3
    iget-object v0, p1, Lcom/google/android/gms/internal/zzxc$zzf;->zzaIo:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxc$zzd;->zzaIh:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v1, :cond_4

    move v0, v1

    :goto_3
    const-string v4, "Field format %d does not match stored value %s"

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/google/android/gms/internal/zzxc$zzd;->zzaIh:Ljava/lang/Integer;

    aput-object v6, v5, v2

    iget-object v2, p1, Lcom/google/android/gms/internal/zzxc$zzf;->zzaIo:Ljava/lang/Integer;

    aput-object v2, v5, v1

    invoke-static {v0, v4, v5}, Lcom/google/android/gms/common/internal/zzx;->zzb(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p1, Lcom/google/android/gms/internal/zzxc$zzf;->zzaIo:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v3, v0}, Lcom/google/android/gms/fitness/data/Value;->setInt(I)V

    goto :goto_2

    :cond_4
    move v0, v2

    goto :goto_3
.end method

.method public static zza([Lcom/google/android/gms/internal/zzxc$zzd;[Lcom/google/android/gms/internal/zzxc$zzf;)[Lcom/google/android/gms/fitness/data/Value;
    .locals 5

    array-length v0, p1

    new-array v1, v0, [Lcom/google/android/gms/fitness/data/Value;

    array-length v0, p0

    array-length v2, p1

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, p0, v0

    aget-object v4, p1, v0

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/zzmx;->zza(Lcom/google/android/gms/internal/zzxc$zzd;Lcom/google/android/gms/internal/zzxc$zzf;)Lcom/google/android/gms/fitness/data/Value;

    move-result-object v3

    aput-object v3, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method public static zza([Lcom/google/android/gms/fitness/data/Value;)[Lcom/google/android/gms/internal/zzxc$zzf;
    .locals 3

    array-length v0, p0

    new-array v1, v0, [Lcom/google/android/gms/internal/zzxc$zzf;

    const/4 v0, 0x0

    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_0

    aget-object v2, p0, v0

    invoke-static {v2}, Lcom/google/android/gms/internal/zzmx;->zzb(Lcom/google/android/gms/fitness/data/Value;)Lcom/google/android/gms/internal/zzxc$zzf;

    move-result-object v2

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method public static zzb(Lcom/google/android/gms/fitness/data/Value;)Lcom/google/android/gms/internal/zzxc$zzf;
    .locals 4

    new-instance v0, Lcom/google/android/gms/internal/zzxc$zzf;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzxc$zzf;-><init>()V

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/fitness/data/Value;->isSet()Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    const/4 v1, 0x2

    invoke-virtual {p0}, Lcom/google/android/gms/fitness/data/Value;->getFormat()I

    move-result v2

    if-ne v1, v2, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/fitness/data/Value;->asFloat()F

    move-result v1

    float-to-double v2, v1

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/internal/zzxc$zzf;->zzaIp:Ljava/lang/Double;

    goto :goto_0

    :cond_2
    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/google/android/gms/fitness/data/Value;->getFormat()I

    move-result v2

    if-ne v1, v2, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gms/fitness/data/Value;->asInt()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/internal/zzxc$zzf;->zzaIo:Ljava/lang/Integer;

    goto :goto_0

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/fitness/data/Value;->getFormat()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " in: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
