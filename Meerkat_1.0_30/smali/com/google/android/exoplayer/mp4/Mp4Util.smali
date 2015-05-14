.class public final Lcom/google/android/exoplayer/mp4/Mp4Util;
.super Ljava/lang/Object;
.source "Mp4Util.java"


# static fields
.field public static final ATOM_HEADER_SIZE:I = 0x8

.field public static final FULL_ATOM_HEADER_SIZE:I = 0xc

.field public static final LONG_ATOM_HEADER_SIZE:I = 0x10

.field public static final LONG_ATOM_SIZE:I = 0x1

.field private static final NAL_START_CODE:[B

.field public static final NO_SAMPLE:I = -0x1

.field public static final NO_TRACK:I = -0x1


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/android/exoplayer/mp4/Mp4Util;->NAL_START_CODE:[B

    return-void

    nop

    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static clearPrefixFlags([Z)V
    .locals 2
    .param p0, "prefixFlags"    # [Z

    .prologue
    const/4 v1, 0x0

    .line 245
    aput-boolean v1, p0, v1

    .line 246
    const/4 v0, 0x1

    aput-boolean v1, p0, v0

    .line 247
    const/4 v0, 0x2

    aput-boolean v1, p0, v0

    .line 248
    return-void
.end method

.method public static findNalUnit([BII)I
    .locals 1
    .param p0, "data"    # [B
    .param p1, "startOffset"    # I
    .param p2, "endOffset"    # I

    .prologue
    .line 210
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/google/android/exoplayer/mp4/Mp4Util;->findNalUnit([BII[Z)I

    move-result v0

    return v0
.end method

.method public static findNalUnit([BIII)I
    .locals 1
    .param p0, "data"    # [B
    .param p1, "startOffset"    # I
    .param p2, "endOffset"    # I
    .param p3, "type"    # I

    .prologue
    .line 116
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/google/android/exoplayer/mp4/Mp4Util;->findNalUnit([BIII[Z)I

    move-result v0

    return v0
.end method

.method public static findNalUnit([BIII[Z)I
    .locals 7
    .param p0, "data"    # [B
    .param p1, "startOffset"    # I
    .param p2, "endOffset"    # I
    .param p3, "type"    # I
    .param p4, "prefixFlags"    # [Z

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 142
    sub-int v1, p2, p1

    .line 144
    .local v1, "length":I
    if-ltz v1, :cond_1

    move v3, v4

    :goto_0
    invoke-static {v3}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 145
    if-nez v1, :cond_2

    .line 198
    .end local p2    # "endOffset":I
    :cond_0
    :goto_1
    return p2

    .restart local p2    # "endOffset":I
    :cond_1
    move v3, v5

    .line 144
    goto :goto_0

    .line 149
    :cond_2
    if-eqz p4, :cond_5

    .line 150
    aget-boolean v3, p4, v5

    if-eqz v3, :cond_3

    invoke-static {p0, p1, p3}, Lcom/google/android/exoplayer/mp4/Mp4Util;->matchesType([BII)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 151
    invoke-static {p4}, Lcom/google/android/exoplayer/mp4/Mp4Util;->clearPrefixFlags([Z)V

    .line 152
    add-int/lit8 p2, p1, -0x3

    goto :goto_1

    .line 153
    :cond_3
    if-le v1, v4, :cond_4

    aget-boolean v3, p4, v4

    if-eqz v3, :cond_4

    aget-byte v3, p0, p1

    if-ne v3, v4, :cond_4

    add-int/lit8 v3, p1, 0x1

    .line 154
    invoke-static {p0, v3, p3}, Lcom/google/android/exoplayer/mp4/Mp4Util;->matchesType([BII)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 155
    invoke-static {p4}, Lcom/google/android/exoplayer/mp4/Mp4Util;->clearPrefixFlags([Z)V

    .line 156
    add-int/lit8 p2, p1, -0x2

    goto :goto_1

    .line 157
    :cond_4
    if-le v1, v6, :cond_5

    aget-boolean v3, p4, v6

    if-eqz v3, :cond_5

    aget-byte v3, p0, p1

    if-nez v3, :cond_5

    add-int/lit8 v3, p1, 0x1

    aget-byte v3, p0, v3

    if-ne v3, v4, :cond_5

    add-int/lit8 v3, p1, 0x2

    .line 158
    invoke-static {p0, v3, p3}, Lcom/google/android/exoplayer/mp4/Mp4Util;->matchesType([BII)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 159
    invoke-static {p4}, Lcom/google/android/exoplayer/mp4/Mp4Util;->clearPrefixFlags([Z)V

    .line 160
    add-int/lit8 p2, p1, -0x1

    goto :goto_1

    .line 164
    :cond_5
    add-int/lit8 v2, p2, -0x1

    .line 168
    .local v2, "limit":I
    add-int/lit8 v0, p1, 0x2

    .local v0, "i":I
    :goto_2
    if-ge v0, v2, :cond_9

    .line 169
    aget-byte v3, p0, v0

    and-int/lit16 v3, v3, 0xfe

    if-eqz v3, :cond_6

    .line 168
    :goto_3
    add-int/lit8 v0, v0, 0x3

    goto :goto_2

    .line 172
    :cond_6
    add-int/lit8 v3, v0, -0x2

    aget-byte v3, p0, v3

    if-nez v3, :cond_8

    add-int/lit8 v3, v0, -0x1

    aget-byte v3, p0, v3

    if-nez v3, :cond_8

    aget-byte v3, p0, v0

    if-ne v3, v4, :cond_8

    add-int/lit8 v3, v0, 0x1

    .line 173
    invoke-static {p0, v3, p3}, Lcom/google/android/exoplayer/mp4/Mp4Util;->matchesType([BII)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 174
    if-eqz p4, :cond_7

    .line 175
    invoke-static {p4}, Lcom/google/android/exoplayer/mp4/Mp4Util;->clearPrefixFlags([Z)V

    .line 177
    :cond_7
    add-int/lit8 p2, v0, -0x2

    goto :goto_1

    .line 181
    :cond_8
    add-int/lit8 v0, v0, -0x2

    goto :goto_3

    .line 185
    :cond_9
    if-eqz p4, :cond_0

    .line 187
    if-le v1, v6, :cond_b

    add-int/lit8 v3, p2, -0x3

    aget-byte v3, p0, v3

    if-nez v3, :cond_a

    add-int/lit8 v3, p2, -0x2

    aget-byte v3, p0, v3

    if-nez v3, :cond_a

    add-int/lit8 v3, p2, -0x1

    aget-byte v3, p0, v3

    if-ne v3, v4, :cond_a

    move v3, v4

    :goto_4
    aput-boolean v3, p4, v5

    .line 192
    if-le v1, v4, :cond_10

    add-int/lit8 v3, p2, -0x2

    aget-byte v3, p0, v3

    if-nez v3, :cond_f

    add-int/lit8 v3, p2, -0x1

    aget-byte v3, p0, v3

    if-nez v3, :cond_f

    move v3, v4

    :goto_5
    aput-boolean v3, p4, v4

    .line 195
    add-int/lit8 v3, p2, -0x1

    aget-byte v3, p0, v3

    if-nez v3, :cond_12

    :goto_6
    aput-boolean v4, p4, v6

    goto/16 :goto_1

    :cond_a
    move v3, v5

    .line 187
    goto :goto_4

    :cond_b
    if-ne v1, v6, :cond_d

    aget-boolean v3, p4, v6

    if-eqz v3, :cond_c

    add-int/lit8 v3, p2, -0x2

    aget-byte v3, p0, v3

    if-nez v3, :cond_c

    add-int/lit8 v3, p2, -0x1

    aget-byte v3, p0, v3

    if-ne v3, v4, :cond_c

    move v3, v4

    goto :goto_4

    :cond_c
    move v3, v5

    goto :goto_4

    :cond_d
    aget-boolean v3, p4, v4

    if-eqz v3, :cond_e

    add-int/lit8 v3, p2, -0x1

    aget-byte v3, p0, v3

    if-ne v3, v4, :cond_e

    move v3, v4

    goto :goto_4

    :cond_e
    move v3, v5

    goto :goto_4

    :cond_f
    move v3, v5

    .line 192
    goto :goto_5

    :cond_10
    aget-boolean v3, p4, v6

    if-eqz v3, :cond_11

    add-int/lit8 v3, p2, -0x1

    aget-byte v3, p0, v3

    if-nez v3, :cond_11

    move v3, v4

    goto :goto_5

    :cond_11
    move v3, v5

    goto :goto_5

    :cond_12
    move v4, v5

    .line 195
    goto :goto_6
.end method

.method public static findNalUnit([BII[Z)I
    .locals 1
    .param p0, "data"    # [B
    .param p1, "startOffset"    # I
    .param p2, "endOffset"    # I
    .param p3, "prefixFlags"    # [Z

    .prologue
    .line 224
    const/4 v0, -0x1

    invoke-static {p0, p1, p2, v0, p3}, Lcom/google/android/exoplayer/mp4/Mp4Util;->findNalUnit([BIII[Z)I

    move-result v0

    return v0
.end method

.method public static getNalUnitType([BI)I
    .locals 1
    .param p0, "data"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 236
    add-int/lit8 v0, p1, 0x3

    aget-byte v0, p0, v0

    and-int/lit8 v0, v0, 0x1f

    return v0
.end method

.method private static matchesType([BII)Z
    .locals 1
    .param p0, "data"    # [B
    .param p1, "offset"    # I
    .param p2, "type"    # I

    .prologue
    .line 254
    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    aget-byte v0, p0, p1

    and-int/lit8 v0, v0, 0x1f

    if-ne v0, p2, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static parseChildNalUnit(Lcom/google/android/exoplayer/util/ParsableByteArray;)[B
    .locals 3
    .param p0, "atom"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    .line 97
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v0

    .line 98
    .local v0, "length":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v1

    .line 99
    .local v1, "offset":I
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 100
    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-static {v2, v1, v0}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->buildNalUnit([BII)[B

    move-result-object v2

    return-object v2
.end method

.method public static parseFullAtomFlags(I)I
    .locals 1
    .param p0, "fullAtomInt"    # I

    .prologue
    .line 57
    const v0, 0xffffff

    and-int/2addr v0, p0

    return v0
.end method

.method public static parseFullAtomVersion(I)I
    .locals 1
    .param p0, "fullAtomInt"    # I

    .prologue
    .line 52
    shr-int/lit8 v0, p0, 0x18

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public static readUnsignedIntToInt(Ljava/nio/ByteBuffer;)I
    .locals 5
    .param p0, "data"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 67
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v2

    and-int/lit16 v1, v2, 0xff

    .line 68
    .local v1, "result":I
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    const/4 v2, 0x4

    if-ge v0, v2, :cond_0

    .line 69
    shl-int/lit8 v1, v1, 0x8

    .line 70
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    .line 68
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 72
    :cond_0
    if-gez v1, :cond_1

    .line 73
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Top bit not zero: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 75
    :cond_1
    return v1
.end method

.method public static replaceLengthPrefixesWithAvcStartCodes(Ljava/nio/ByteBuffer;I)V
    .locals 4
    .param p0, "buffer"    # Ljava/nio/ByteBuffer;
    .param p1, "size"    # I

    .prologue
    .line 83
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    sub-int v2, v3, p1

    .line 84
    .local v2, "sampleOffset":I
    move v1, v2

    .line 85
    .local v1, "position":I
    :goto_0
    add-int v3, v2, p1

    if-ge v1, v3, :cond_0

    .line 86
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 87
    invoke-static {p0}, Lcom/google/android/exoplayer/mp4/Mp4Util;->readUnsignedIntToInt(Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 88
    .local v0, "length":I
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 89
    sget-object v3, Lcom/google/android/exoplayer/mp4/Mp4Util;->NAL_START_CODE:[B

    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 90
    add-int/lit8 v3, v0, 0x4

    add-int/2addr v1, v3

    .line 91
    goto :goto_0

    .line 92
    .end local v0    # "length":I
    :cond_0
    add-int v3, v2, p1

    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 93
    return-void
.end method
