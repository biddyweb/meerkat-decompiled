.class public final Lcom/google/android/gms/internal/zzxd$zzb;
.super Lcom/google/android/gms/internal/zzwy;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzxd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zzb"
.end annotation


# static fields
.field private static volatile zzaIz:[Lcom/google/android/gms/internal/zzxd$zzb;


# instance fields
.field public zzaIA:J

.field public zzaIB:J

.field public zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

.field public zzaID:I

.field public zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

.field public zzaIF:I

.field public zzaIG:Lcom/google/android/gms/internal/zzxc$zzb;

.field public zzaIH:J

.field public zzaII:J


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzwy;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzxd$zzb;->zzwk()Lcom/google/android/gms/internal/zzxd$zzb;

    return-void
.end method

.method public static zzwj()[Lcom/google/android/gms/internal/zzxd$zzb;
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIz:[Lcom/google/android/gms/internal/zzxd$zzb;

    if-nez v0, :cond_1

    sget-object v1, Lcom/google/android/gms/internal/zzww;->zzaHL:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIz:[Lcom/google/android/gms/internal/zzxd$zzb;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/android/gms/internal/zzxd$zzb;

    sput-object v0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIz:[Lcom/google/android/gms/internal/zzxd$zzb;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIz:[Lcom/google/android/gms/internal/zzxd$zzb;

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
    .locals 6
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
    instance-of v2, p1, Lcom/google/android/gms/internal/zzxd$zzb;

    if-nez v2, :cond_2

    move v0, v1

    goto :goto_0

    :cond_2
    check-cast p1, Lcom/google/android/gms/internal/zzxd$zzb;

    .end local p1    # "o":Ljava/lang/Object;
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIA:J

    iget-wide v4, p1, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIA:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_3

    move v0, v1

    goto :goto_0

    :cond_3
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIB:J

    iget-wide v4, p1, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIB:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_4

    move v0, v1

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzww;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    move v0, v1

    goto :goto_0

    :cond_5
    iget v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaID:I

    iget v3, p1, Lcom/google/android/gms/internal/zzxd$zzb;->zzaID:I

    if-eq v2, v3, :cond_6

    move v0, v1

    goto :goto_0

    :cond_6
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    if-nez v2, :cond_7

    iget-object v2, p1, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    if-eqz v2, :cond_8

    move v0, v1

    goto :goto_0

    :cond_7
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzxc$zzb;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    move v0, v1

    goto :goto_0

    :cond_8
    iget v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIF:I

    iget v3, p1, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIF:I

    if-eq v2, v3, :cond_9

    move v0, v1

    goto :goto_0

    :cond_9
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIG:Lcom/google/android/gms/internal/zzxc$zzb;

    if-nez v2, :cond_a

    iget-object v2, p1, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIG:Lcom/google/android/gms/internal/zzxc$zzb;

    if-eqz v2, :cond_b

    move v0, v1

    goto :goto_0

    :cond_a
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIG:Lcom/google/android/gms/internal/zzxc$zzb;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIG:Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzxc$zzb;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_b

    move v0, v1

    goto :goto_0

    :cond_b
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIH:J

    iget-wide v4, p1, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIH:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_c

    move v0, v1

    goto :goto_0

    :cond_c
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaII:J

    iget-wide v4, p1, Lcom/google/android/gms/internal/zzxd$zzb;->zzaII:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 7

    const/4 v1, 0x0

    const/16 v6, 0x20

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIA:J

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIA:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v0, v2

    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIB:J

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIB:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzww;->hashCode([Ljava/lang/Object;)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaID:I

    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIF:I

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIG:Lcom/google/android/gms/internal/zzxc$zzb;

    if-nez v2, :cond_1

    :goto_1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIH:J

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIH:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v1, v2

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaII:J

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaII:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v1, v2

    add-int/2addr v0, v1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzxc$zzb;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIG:Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzxc$zzb;->hashCode()I

    move-result v1

    goto :goto_1
.end method

.method public zzH(Lcom/google/android/gms/internal/zzwq;)Lcom/google/android/gms/internal/zzxd$zzb;
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
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwq;->zzvw()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIA:J

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwq;->zzvw()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIB:J

    goto :goto_0

    :sswitch_3
    const/16 v0, 0x1a

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzxb;->zzc(Lcom/google/android/gms/internal/zzwq;I)I

    move-result v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

    if-nez v0, :cond_2

    move v0, v1

    :goto_1
    add-int/2addr v2, v0

    new-array v2, v2, [Lcom/google/android/gms/internal/zzxc$zzf;

    if-eqz v0, :cond_1

    iget-object v3, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

    invoke-static {v3, v1, v2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_1
    :goto_2
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_3

    new-instance v3, Lcom/google/android/gms/internal/zzxc$zzf;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zzxc$zzf;-><init>()V

    aput-object v3, v2, v0

    aget-object v3, v2, v0

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/zzwq;->zza(Lcom/google/android/gms/internal/zzwy;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwq;->zzvu()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

    array-length v0, v0

    goto :goto_1

    :cond_3
    new-instance v3, Lcom/google/android/gms/internal/zzxc$zzf;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zzxc$zzf;-><init>()V

    aput-object v3, v2, v0

    aget-object v0, v2, v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzwq;->zza(Lcom/google/android/gms/internal/zzwy;)V

    iput-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

    goto :goto_0

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwq;->zzvx()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaID:I

    goto :goto_0

    :sswitch_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    if-nez v0, :cond_4

    new-instance v0, Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzxc$zzb;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzwq;->zza(Lcom/google/android/gms/internal/zzwy;)V

    goto :goto_0

    :sswitch_6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwq;->zzvx()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIF:I

    goto :goto_0

    :sswitch_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIG:Lcom/google/android/gms/internal/zzxc$zzb;

    if-nez v0, :cond_5

    new-instance v0, Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzxc$zzb;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIG:Lcom/google/android/gms/internal/zzxc$zzb;

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIG:Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzwq;->zza(Lcom/google/android/gms/internal/zzwy;)V

    goto/16 :goto_0

    :sswitch_8
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwq;->zzvw()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIH:J

    goto/16 :goto_0

    :sswitch_9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwq;->zzvw()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaII:J

    goto/16 :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x10 -> :sswitch_2
        0x1a -> :sswitch_3
        0x20 -> :sswitch_4
        0x2a -> :sswitch_5
        0x30 -> :sswitch_6
        0x3a -> :sswitch_7
        0x40 -> :sswitch_8
        0x48 -> :sswitch_9
    .end sparse-switch
.end method

.method public zza(Lcom/google/android/gms/internal/zzwr;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v4, 0x0

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIA:J

    cmp-long v0, v0, v4

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIA:J

    invoke-virtual {p1, v0, v2, v3}, Lcom/google/android/gms/internal/zzwr;->zzb(IJ)V

    :cond_0
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIB:J

    cmp-long v0, v0, v4

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIB:J

    invoke-virtual {p1, v0, v2, v3}, Lcom/google/android/gms/internal/zzwr;->zzb(IJ)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

    array-length v0, v0

    if-lez v0, :cond_3

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

    array-length v1, v1

    if-ge v0, v1, :cond_3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

    aget-object v1, v1, v0

    if-eqz v1, :cond_2

    const/4 v2, 0x3

    invoke-virtual {p1, v2, v1}, Lcom/google/android/gms/internal/zzwr;->zza(ILcom/google/android/gms/internal/zzwy;)V

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    iget v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaID:I

    if-eqz v0, :cond_4

    const/4 v0, 0x4

    iget v1, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaID:I

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzwr;->zzy(II)V

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    if-eqz v0, :cond_5

    const/4 v0, 0x5

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzwr;->zza(ILcom/google/android/gms/internal/zzwy;)V

    :cond_5
    iget v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIF:I

    if-eqz v0, :cond_6

    const/4 v0, 0x6

    iget v1, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIF:I

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzwr;->zzy(II)V

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIG:Lcom/google/android/gms/internal/zzxc$zzb;

    if-eqz v0, :cond_7

    const/4 v0, 0x7

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIG:Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzwr;->zza(ILcom/google/android/gms/internal/zzwy;)V

    :cond_7
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIH:J

    cmp-long v0, v0, v4

    if-eqz v0, :cond_8

    const/16 v0, 0x8

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIH:J

    invoke-virtual {p1, v0, v2, v3}, Lcom/google/android/gms/internal/zzwr;->zzb(IJ)V

    :cond_8
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaII:J

    cmp-long v0, v0, v4

    if-eqz v0, :cond_9

    const/16 v0, 0x9

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaII:J

    invoke-virtual {p1, v0, v2, v3}, Lcom/google/android/gms/internal/zzwr;->zzb(IJ)V

    :cond_9
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

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzxd$zzb;->zzH(Lcom/google/android/gms/internal/zzwq;)Lcom/google/android/gms/internal/zzxd$zzb;

    move-result-object v0

    return-object v0
.end method

.method protected zzc()I
    .locals 7

    const-wide/16 v4, 0x0

    invoke-super {p0}, Lcom/google/android/gms/internal/zzwy;->zzc()I

    move-result v0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIA:J

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIA:J

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/zzwr;->zzd(IJ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_0
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIB:J

    cmp-long v1, v2, v4

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIB:J

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/zzwr;->zzd(IJ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

    array-length v1, v1

    if-lez v1, :cond_4

    const/4 v1, 0x0

    move v6, v1

    move v1, v0

    move v0, v6

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

    array-length v2, v2

    if-ge v0, v2, :cond_3

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

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
    iget v1, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaID:I

    if-eqz v1, :cond_5

    const/4 v1, 0x4

    iget v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaID:I

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzwr;->zzA(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_5
    iget-object v1, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    if-eqz v1, :cond_6

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzwr;->zzc(ILcom/google/android/gms/internal/zzwy;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_6
    iget v1, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIF:I

    if-eqz v1, :cond_7

    const/4 v1, 0x6

    iget v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIF:I

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzwr;->zzA(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_7
    iget-object v1, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIG:Lcom/google/android/gms/internal/zzxc$zzb;

    if-eqz v1, :cond_8

    const/4 v1, 0x7

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIG:Lcom/google/android/gms/internal/zzxc$zzb;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzwr;->zzc(ILcom/google/android/gms/internal/zzwy;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_8
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIH:J

    cmp-long v1, v2, v4

    if-eqz v1, :cond_9

    const/16 v1, 0x8

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIH:J

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/zzwr;->zzd(IJ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_9
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaII:J

    cmp-long v1, v2, v4

    if-eqz v1, :cond_a

    const/16 v1, 0x9

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaII:J

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/zzwr;->zzd(IJ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_a
    return v0
.end method

.method public zzwk()Lcom/google/android/gms/internal/zzxd$zzb;
    .locals 5

    const/4 v4, 0x0

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIA:J

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIB:J

    invoke-static {}, Lcom/google/android/gms/internal/zzxc$zzf;->zzwg()[Lcom/google/android/gms/internal/zzxc$zzf;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIC:[Lcom/google/android/gms/internal/zzxc$zzf;

    iput v1, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaID:I

    iput-object v4, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIE:Lcom/google/android/gms/internal/zzxc$zzb;

    iput v1, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIF:I

    iput-object v4, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIG:Lcom/google/android/gms/internal/zzxc$zzb;

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaIH:J

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaII:J

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzxd$zzb;->zzaHM:I

    return-object p0
.end method
