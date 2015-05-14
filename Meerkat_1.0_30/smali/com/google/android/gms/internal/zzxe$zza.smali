.class public final Lcom/google/android/gms/internal/zzxe$zza;
.super Lcom/google/android/gms/internal/zzwy;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzxe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zza"
.end annotation


# instance fields
.field public description:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public zzaIL:Ljava/lang/Long;

.field public zzaIM:Ljava/lang/Long;

.field public zzaIN:Ljava/lang/Long;

.field public zzaIO:Ljava/lang/Integer;

.field public zzaIe:Lcom/google/android/gms/internal/zzxc$zza;

.field public zzfl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzwy;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzxe$zza;->zzwn()Lcom/google/android/gms/internal/zzxe$zza;

    return-void
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
    instance-of v2, p1, Lcom/google/android/gms/internal/zzxe$zza;

    if-nez v2, :cond_2

    move v0, v1

    goto :goto_0

    :cond_2
    check-cast p1, Lcom/google/android/gms/internal/zzxe$zza;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzfl:Ljava/lang/String;

    if-nez v2, :cond_3

    iget-object v2, p1, Lcom/google/android/gms/internal/zzxe$zza;->zzfl:Ljava/lang/String;

    if-eqz v2, :cond_4

    move v0, v1

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzfl:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzxe$zza;->zzfl:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    move v0, v1

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->name:Ljava/lang/String;

    if-nez v2, :cond_5

    iget-object v2, p1, Lcom/google/android/gms/internal/zzxe$zza;->name:Ljava/lang/String;

    if-eqz v2, :cond_6

    move v0, v1

    goto :goto_0

    :cond_5
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->name:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzxe$zza;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    move v0, v1

    goto :goto_0

    :cond_6
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->description:Ljava/lang/String;

    if-nez v2, :cond_7

    iget-object v2, p1, Lcom/google/android/gms/internal/zzxe$zza;->description:Ljava/lang/String;

    if-eqz v2, :cond_8

    move v0, v1

    goto :goto_0

    :cond_7
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->description:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzxe$zza;->description:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    move v0, v1

    goto :goto_0

    :cond_8
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIL:Ljava/lang/Long;

    if-nez v2, :cond_9

    iget-object v2, p1, Lcom/google/android/gms/internal/zzxe$zza;->zzaIL:Ljava/lang/Long;

    if-eqz v2, :cond_a

    move v0, v1

    goto :goto_0

    :cond_9
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIL:Ljava/lang/Long;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzxe$zza;->zzaIL:Ljava/lang/Long;

    invoke-virtual {v2, v3}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    move v0, v1

    goto :goto_0

    :cond_a
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIM:Ljava/lang/Long;

    if-nez v2, :cond_b

    iget-object v2, p1, Lcom/google/android/gms/internal/zzxe$zza;->zzaIM:Ljava/lang/Long;

    if-eqz v2, :cond_c

    move v0, v1

    goto :goto_0

    :cond_b
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIM:Ljava/lang/Long;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzxe$zza;->zzaIM:Ljava/lang/Long;

    invoke-virtual {v2, v3}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c

    move v0, v1

    goto :goto_0

    :cond_c
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIN:Ljava/lang/Long;

    if-nez v2, :cond_d

    iget-object v2, p1, Lcom/google/android/gms/internal/zzxe$zza;->zzaIN:Ljava/lang/Long;

    if-eqz v2, :cond_e

    move v0, v1

    goto :goto_0

    :cond_d
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIN:Ljava/lang/Long;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzxe$zza;->zzaIN:Ljava/lang/Long;

    invoke-virtual {v2, v3}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e

    move v0, v1

    goto/16 :goto_0

    :cond_e
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIe:Lcom/google/android/gms/internal/zzxc$zza;

    if-nez v2, :cond_f

    iget-object v2, p1, Lcom/google/android/gms/internal/zzxe$zza;->zzaIe:Lcom/google/android/gms/internal/zzxc$zza;

    if-eqz v2, :cond_10

    move v0, v1

    goto/16 :goto_0

    :cond_f
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIe:Lcom/google/android/gms/internal/zzxc$zza;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzxe$zza;->zzaIe:Lcom/google/android/gms/internal/zzxc$zza;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzxc$zza;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_10

    move v0, v1

    goto/16 :goto_0

    :cond_10
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIO:Ljava/lang/Integer;

    if-nez v2, :cond_11

    iget-object v2, p1, Lcom/google/android/gms/internal/zzxe$zza;->zzaIO:Ljava/lang/Integer;

    if-eqz v2, :cond_0

    move v0, v1

    goto/16 :goto_0

    :cond_11
    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIO:Ljava/lang/Integer;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzxe$zza;->zzaIO:Ljava/lang/Integer;

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    move v0, v1

    goto/16 :goto_0
.end method

.method public hashCode()I
    .locals 3

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzfl:Ljava/lang/String;

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->name:Ljava/lang/String;

    if-nez v0, :cond_1

    move v0, v1

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->description:Ljava/lang/String;

    if-nez v0, :cond_2

    move v0, v1

    :goto_2
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIL:Ljava/lang/Long;

    if-nez v0, :cond_3

    move v0, v1

    :goto_3
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIM:Ljava/lang/Long;

    if-nez v0, :cond_4

    move v0, v1

    :goto_4
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIN:Ljava/lang/Long;

    if-nez v0, :cond_5

    move v0, v1

    :goto_5
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIe:Lcom/google/android/gms/internal/zzxc$zza;

    if-nez v0, :cond_6

    move v0, v1

    :goto_6
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIO:Ljava/lang/Integer;

    if-nez v2, :cond_7

    :goto_7
    add-int/2addr v0, v1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzfl:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->description:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_2

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIL:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->hashCode()I

    move-result v0

    goto :goto_3

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIM:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->hashCode()I

    move-result v0

    goto :goto_4

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIN:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->hashCode()I

    move-result v0

    goto :goto_5

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIe:Lcom/google/android/gms/internal/zzxc$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzxc$zza;->hashCode()I

    move-result v0

    goto :goto_6

    :cond_7
    iget-object v1, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIO:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->hashCode()I

    move-result v1

    goto :goto_7
.end method

.method public zzJ(Lcom/google/android/gms/internal/zzwq;)Lcom/google/android/gms/internal/zzxe$zza;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

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
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwq;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzfl:Ljava/lang/String;

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwq;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->name:Ljava/lang/String;

    goto :goto_0

    :sswitch_3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwq;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->description:Ljava/lang/String;

    goto :goto_0

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwq;->zzvw()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIL:Ljava/lang/Long;

    goto :goto_0

    :sswitch_5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwq;->zzvw()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIM:Ljava/lang/Long;

    goto :goto_0

    :sswitch_6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwq;->zzvw()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIN:Ljava/lang/Long;

    goto :goto_0

    :sswitch_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIe:Lcom/google/android/gms/internal/zzxc$zza;

    if-nez v0, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/zzxc$zza;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzxc$zza;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIe:Lcom/google/android/gms/internal/zzxc$zza;

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIe:Lcom/google/android/gms/internal/zzxc$zza;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzwq;->zza(Lcom/google/android/gms/internal/zzwy;)V

    goto :goto_0

    :sswitch_8
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzwq;->zzvx()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIO:Ljava/lang/Integer;

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_1
        0x12 -> :sswitch_2
        0x1a -> :sswitch_3
        0x20 -> :sswitch_4
        0x28 -> :sswitch_5
        0x40 -> :sswitch_6
        0x4a -> :sswitch_7
        0x50 -> :sswitch_8
    .end sparse-switch
.end method

.method public zza(Lcom/google/android/gms/internal/zzwr;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzfl:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzfl:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzwr;->zzb(ILjava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->name:Ljava/lang/String;

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxe$zza;->name:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzwr;->zzb(ILjava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->description:Ljava/lang/String;

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxe$zza;->description:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzwr;->zzb(ILjava/lang/String;)V

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIL:Ljava/lang/Long;

    if-eqz v0, :cond_3

    const/4 v0, 0x4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIL:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {p1, v0, v2, v3}, Lcom/google/android/gms/internal/zzwr;->zzb(IJ)V

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIM:Ljava/lang/Long;

    if-eqz v0, :cond_4

    const/4 v0, 0x5

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIM:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {p1, v0, v2, v3}, Lcom/google/android/gms/internal/zzwr;->zzb(IJ)V

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIN:Ljava/lang/Long;

    if-eqz v0, :cond_5

    const/16 v0, 0x8

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIN:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {p1, v0, v2, v3}, Lcom/google/android/gms/internal/zzwr;->zzb(IJ)V

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIe:Lcom/google/android/gms/internal/zzxc$zza;

    if-eqz v0, :cond_6

    const/16 v0, 0x9

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIe:Lcom/google/android/gms/internal/zzxc$zza;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzwr;->zza(ILcom/google/android/gms/internal/zzwy;)V

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIO:Ljava/lang/Integer;

    if-eqz v0, :cond_7

    const/16 v0, 0xa

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIO:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzwr;->zzy(II)V

    :cond_7
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

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzxe$zza;->zzJ(Lcom/google/android/gms/internal/zzwq;)Lcom/google/android/gms/internal/zzxe$zza;

    move-result-object v0

    return-object v0
.end method

.method protected zzc()I
    .locals 4

    invoke-super {p0}, Lcom/google/android/gms/internal/zzwy;->zzc()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzfl:Ljava/lang/String;

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzfl:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzwr;->zzj(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzxe$zza;->name:Ljava/lang/String;

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->name:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzwr;->zzj(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzxe$zza;->description:Ljava/lang/String;

    if-eqz v1, :cond_2

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->description:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzwr;->zzj(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIL:Ljava/lang/Long;

    if-eqz v1, :cond_3

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIL:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/zzwr;->zzd(IJ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIM:Ljava/lang/Long;

    if-eqz v1, :cond_4

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIM:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/zzwr;->zzd(IJ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIN:Ljava/lang/Long;

    if-eqz v1, :cond_5

    const/16 v1, 0x8

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIN:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/zzwr;->zzd(IJ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_5
    iget-object v1, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIe:Lcom/google/android/gms/internal/zzxc$zza;

    if-eqz v1, :cond_6

    const/16 v1, 0x9

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIe:Lcom/google/android/gms/internal/zzxc$zza;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzwr;->zzc(ILcom/google/android/gms/internal/zzwy;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_6
    iget-object v1, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIO:Ljava/lang/Integer;

    if-eqz v1, :cond_7

    const/16 v1, 0xa

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIO:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzwr;->zzA(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_7
    return v0
.end method

.method public zzwn()Lcom/google/android/gms/internal/zzxe$zza;
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzfl:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->name:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->description:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIL:Ljava/lang/Long;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIM:Ljava/lang/Long;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIN:Ljava/lang/Long;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIe:Lcom/google/android/gms/internal/zzxc$zza;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaIO:Ljava/lang/Integer;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzxe$zza;->zzaHM:I

    return-object p0
.end method
