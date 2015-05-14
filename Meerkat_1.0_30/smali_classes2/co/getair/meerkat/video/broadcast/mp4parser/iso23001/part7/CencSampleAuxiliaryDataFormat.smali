.class public Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
.super Ljava/lang/Object;
.source "CencSampleAuxiliaryDataFormat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$AbstractPair;,
        Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$IntLongPair;,
        Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$IntIntPair;,
        Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$IntShortPair;,
        Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$IntBytePair;,
        Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortLongPair;,
        Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortIntPair;,
        Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortShortPair;,
        Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortBytePair;,
        Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ByteLongPair;,
        Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ByteIntPair;,
        Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ByteShortPair;,
        Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ByteBytePair;,
        Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;
    }
.end annotation


# instance fields
.field public iv:[B

.field public pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const/4 v0, 0x0

    new-array v0, v0, [B

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->iv:[B

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    .line 325
    return-void
.end method


# virtual methods
.method public createPair(IJ)Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;
    .locals 8
    .param p1, "clear"    # I
    .param p2, "encrypted"    # J

    .prologue
    const-wide/32 v6, 0x7fffffff

    const-wide/16 v4, 0x7fff

    const-wide/16 v2, 0x7f

    .line 35
    const/16 v0, 0x7f

    if-gt p1, v0, :cond_3

    .line 36
    cmp-long v0, p2, v2

    if-gtz v0, :cond_0

    .line 37
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ByteBytePair;

    invoke-direct {v0, p0, p1, p2, p3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ByteBytePair;-><init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;IJ)V

    .line 63
    :goto_0
    return-object v0

    .line 38
    :cond_0
    cmp-long v0, p2, v4

    if-gtz v0, :cond_1

    .line 39
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ByteShortPair;

    invoke-direct {v0, p0, p1, p2, p3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ByteShortPair;-><init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;IJ)V

    goto :goto_0

    .line 40
    :cond_1
    cmp-long v0, p2, v6

    if-gtz v0, :cond_2

    .line 41
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ByteIntPair;

    invoke-direct {v0, p0, p1, p2, p3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ByteIntPair;-><init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;IJ)V

    goto :goto_0

    .line 43
    :cond_2
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ByteLongPair;

    invoke-direct {v0, p0, p1, p2, p3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ByteLongPair;-><init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;IJ)V

    goto :goto_0

    .line 45
    :cond_3
    const/16 v0, 0x7fff

    if-gt p1, v0, :cond_7

    .line 46
    cmp-long v0, p2, v2

    if-gtz v0, :cond_4

    .line 47
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortBytePair;

    invoke-direct {v0, p0, p1, p2, p3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortBytePair;-><init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;IJ)V

    goto :goto_0

    .line 48
    :cond_4
    cmp-long v0, p2, v4

    if-gtz v0, :cond_5

    .line 49
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortShortPair;

    invoke-direct {v0, p0, p1, p2, p3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortShortPair;-><init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;IJ)V

    goto :goto_0

    .line 50
    :cond_5
    cmp-long v0, p2, v6

    if-gtz v0, :cond_6

    .line 51
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortIntPair;

    invoke-direct {v0, p0, p1, p2, p3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortIntPair;-><init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;IJ)V

    goto :goto_0

    .line 53
    :cond_6
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortLongPair;

    invoke-direct {v0, p0, p1, p2, p3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortLongPair;-><init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;IJ)V

    goto :goto_0

    .line 56
    :cond_7
    cmp-long v0, p2, v2

    if-gtz v0, :cond_8

    .line 57
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$IntBytePair;

    invoke-direct {v0, p0, p1, p2, p3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$IntBytePair;-><init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;IJ)V

    goto :goto_0

    .line 58
    :cond_8
    cmp-long v0, p2, v4

    if-gtz v0, :cond_9

    .line 59
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$IntShortPair;

    invoke-direct {v0, p0, p1, p2, p3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$IntShortPair;-><init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;IJ)V

    goto :goto_0

    .line 60
    :cond_9
    cmp-long v0, p2, v6

    if-gtz v0, :cond_a

    .line 61
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$IntIntPair;

    invoke-direct {v0, p0, p1, p2, p3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$IntIntPair;-><init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;IJ)V

    goto :goto_0

    .line 63
    :cond_a
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$IntLongPair;

    invoke-direct {v0, p0, p1, p2, p3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$IntLongPair;-><init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;IJ)V

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 70
    if-ne p0, p1, :cond_1

    .line 86
    :cond_0
    :goto_0
    return v1

    .line 73
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 74
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 77
    check-cast v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    .line 79
    .local v0, "entry":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
    new-instance v3, Ljava/math/BigInteger;

    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->iv:[B

    invoke-direct {v3, v4}, Ljava/math/BigInteger;-><init>([B)V

    new-instance v4, Ljava/math/BigInteger;

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->iv:[B

    invoke-direct {v4, v5}, Ljava/math/BigInteger;-><init>([B)V

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 80
    goto :goto_0

    .line 82
    :cond_4
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 83
    goto :goto_0

    .line 82
    :cond_5
    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public getSize()I
    .locals 2

    .prologue
    .line 25
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->iv:[B

    array-length v0, v1

    .line 26
    .local v0, "size":I
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    array-length v1, v1

    if-lez v1, :cond_0

    .line 27
    add-int/lit8 v0, v0, 0x2

    .line 28
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x6

    add-int/2addr v0, v1

    .line 30
    :cond_0
    return v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 91
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->iv:[B

    if-eqz v2, :cond_1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->iv:[B

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    .line 92
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v1

    :cond_0
    add-int v0, v2, v1

    .line 93
    return v0

    .end local v0    # "result":I
    :cond_1
    move v0, v1

    .line 91
    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Entry{iv="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->iv:[B

    .line 99
    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Hex;->encodeHex([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", pairs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    .line 100
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
