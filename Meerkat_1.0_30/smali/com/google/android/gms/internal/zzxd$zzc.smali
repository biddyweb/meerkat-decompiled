.class public final Lcom/google/android/gms/internal/zzxd$zzc;
.super Lcom/google/android/gms/internal/zzwy;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzxd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zzc"
.end annotation


# static fields
.field private static volatile zzaIJ:[Lcom/google/android/gms/internal/zzxd$zzc;


# instance fields
.field public zzaID:I

.field public zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

.field public zzaIK:[Lcom/google/android/gms/internal/zzxd$zzb;

.field public zzaIx:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzwy;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzxd$zzc;->zzwm()Lcom/google/android/gms/internal/zzxd$zzc;

    return-void
.end method

.method public static zzwl()[Lcom/google/android/gms/internal/zzxd$zzc;
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIJ:[Lcom/google/android/gms/internal/zzxd$zzc;

    if-nez v0, :cond_1

    sget-object v1, Lcom/google/android/gms/internal/zzww;->zzaHL:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIJ:[Lcom/google/android/gms/internal/zzxd$zzc;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/android/gms/internal/zzxd$zzc;

    sput-object v0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIJ:[Lcom/google/android/gms/internal/zzxd$zzc;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIJ:[Lcom/google/android/gms/internal/zzxd$zzc;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_1

    .end local p1    # "o":Ljava/lang/Object;
    :cond_0
    :goto_0
    return v0

    .restart local p1    # "o":Ljava/lang/Object;
    :cond_1
    instance-of v2, p1, Lcom/google/android/gms/internal/zzxd$zzc;

    if-nez v2, :cond_2

    move v0, v1

    goto :goto_0

    :cond_2
    check-cast p1, Lcom/google/android/gms/internal/zzxd$zzc;

    .end local p1    # "o":Ljava/lang/Object;
    iget v2, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaID:I

    iget v3, p1, Lcom/google/android/gms/internal/zzxd$zzc;->zzaID:I

    if-eq v2, v3, :cond_3

    move v0, v1

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    if-nez v2, :cond_4

    iget-object v2, p1, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    if-eqz v2, :cond_5

    move v0, v1

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzxc$zzb;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    move v0, v1

    goto :goto_0

    :cond_5
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIK:[Lcom/google/android/gms/internal/zzxd$zzb;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIK:[Lcom/google/android/gms/internal/zzxd$zzb;

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzww;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    move v0, v1

    goto :goto_0

    :cond_6
    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIx:Z

    iget-boolean v3, p1, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIx:Z

    if-eq v2, v3, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    iget v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaID:I

    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v1, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIK:[Lcom/google/android/gms/internal/zzxd$zzb;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzww;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v1, v0, 0x1f

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIx:Z

    if-eqz v0, :cond_1

    const/16 v0, 0x4cf

    :goto_1
    add-int/2addr v0, v1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzxc$zzb;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_1
    const/16 v0, 0x4d5

    goto :goto_1
.end method

.method public zzI(Lcom/google/android/gms/internal/zzwq;)Lcom/google/android/gms/internal/zzxd$zzc;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwq;->zzvu()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzxb;->zzb(Lcom/google/android/gms/internal/zzwq;I)Z

    move-result v0

    if-nez v0, :cond_0

    :sswitch_0
    return-object p0

    :sswitch_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwq;->zzvx()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaID:I

    goto :goto_0

    :sswitch_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    if-nez v0, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzxc$zzb;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzwq;->zza(Lcom/google/android/gms/internal/zzwy;)V

    goto :goto_0

    :sswitch_3
    const/16 v0, 0x1a

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzxb;->zzc(Lcom/google/android/gms/internal/zzwq;I)I

    move-result v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIK:[Lcom/google/android/gms/internal/zzxd$zzb;

    if-nez v0, :cond_3

    move v0, v1

    :goto_1
    add-int/2addr v2, v0

    new-array v2, v2, [Lcom/google/android/gms/internal/zzxd$zzb;

    if-eqz v0, :cond_2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIK:[Lcom/google/android/gms/internal/zzxd$zzb;

    invoke-static {v3, v1, v2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_2
    :goto_2
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_4

    new-instance v3, Lcom/google/android/gms/internal/zzxd$zzb;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zzxd$zzb;-><init>()V

    aput-object v3, v2, v0

    aget-object v3, v2, v0

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/zzwq;->zza(Lcom/google/android/gms/internal/zzwy;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwq;->zzvu()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIK:[Lcom/google/android/gms/internal/zzxd$zzb;

    array-length v0, v0

    goto :goto_1

    :cond_4
    new-instance v3, Lcom/google/android/gms/internal/zzxd$zzb;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zzxd$zzb;-><init>()V

    aput-object v3, v2, v0

    aget-object v0, v2, v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzwq;->zza(Lcom/google/android/gms/internal/zzwy;)V

    iput-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIK:[Lcom/google/android/gms/internal/zzxd$zzb;

    goto :goto_0

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwq;->zzvy()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIx:Z

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x12 -> :sswitch_2
        0x1a -> :sswitch_3
        0x20 -> :sswitch_4
    .end sparse-switch
.end method

.method public zza(Lcom/google/android/gms/internal/zzwr;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaID:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iget v1, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaID:I

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzwr;->zzy(II)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzwr;->zza(ILcom/google/android/gms/internal/zzwy;)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIK:[Lcom/google/android/gms/internal/zzxd$zzb;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIK:[Lcom/google/android/gms/internal/zzxd$zzb;

    array-length v0, v0

    if-lez v0, :cond_3

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIK:[Lcom/google/android/gms/internal/zzxd$zzb;

    array-length v1, v1

    if-ge v0, v1, :cond_3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIK:[Lcom/google/android/gms/internal/zzxd$zzb;

    aget-object v1, v1, v0

    if-eqz v1, :cond_2

    const/4 v2, 0x3

    invoke-virtual {p1, v2, v1}, Lcom/google/android/gms/internal/zzwr;->zza(ILcom/google/android/gms/internal/zzwy;)V

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIx:Z

    if-eqz v0, :cond_4

    const/4 v0, 0x4

    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIx:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzwr;->zzb(IZ)V

    :cond_4
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzwy;->zza(Lcom/google/android/gms/internal/zzwr;)V

    return-void
.end method

.method public synthetic zzb(Lcom/google/android/gms/internal/zzwq;)Lcom/google/android/gms/internal/zzwy;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzxd$zzc;->zzI(Lcom/google/android/gms/internal/zzwq;)Lcom/google/android/gms/internal/zzxd$zzc;

    move-result-object v0

    return-object v0
.end method

.method protected zzc()I
    .locals 5

    invoke-super {p0}, Lcom/google/android/gms/internal/zzwy;->zzc()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaID:I

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    iget v2, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaID:I

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzwr;->zzA(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzwr;->zzc(ILcom/google/android/gms/internal/zzwy;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIK:[Lcom/google/android/gms/internal/zzxd$zzb;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIK:[Lcom/google/android/gms/internal/zzxd$zzb;

    array-length v1, v1

    if-lez v1, :cond_4

    const/4 v1, 0x0

    move v4, v1

    move v1, v0

    move v0, v4

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIK:[Lcom/google/android/gms/internal/zzxd$zzb;

    array-length v2, v2

    if-ge v0, v2, :cond_3

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIK:[Lcom/google/android/gms/internal/zzxd$zzb;

    aget-object v2, v2, v0

    if-eqz v2, :cond_2

    const/4 v3, 0x3

    invoke-static {v3, v2}, Lcom/google/android/gms/internal/zzwr;->zzc(ILcom/google/android/gms/internal/zzwy;)I

    move-result v2

    add-int/2addr v1, v2

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    move v0, v1

    :cond_4
    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIx:Z

    if-eqz v1, :cond_5

    const/4 v1, 0x4

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIx:Z

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzwr;->zzc(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_5
    return v0
.end method

.method public zzwm()Lcom/google/android/gms/internal/zzxd$zzc;
    .locals 2

    const/4 v1, 0x0

    iput v1, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaID:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-static {}, Lcom/google/android/gms/internal/zzxd$zzb;->zzwj()[Lcom/google/android/gms/internal/zzxd$zzb;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIK:[Lcom/google/android/gms/internal/zzxd$zzb;

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaIx:Z

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzxd$zzc;->zzaHM:I

    return-object p0
.end method
