.class public final Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;
.super Ljava/lang/Object;
.source "CodecSpecificDataUtil.java"


# static fields
.field private static final AUDIO_SPECIFIC_CONFIG_CHANNEL_COUNT_TABLE:[I

.field private static final AUDIO_SPECIFIC_CONFIG_SAMPLING_RATE_TABLE:[I

.field private static final NAL_START_CODE:[B

.field private static final SPS_NAL_UNIT_TYPE:I = 0x7


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->NAL_START_CODE:[B

    .line 32
    const/16 v0, 0xd

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->AUDIO_SPECIFIC_CONFIG_SAMPLING_RATE_TABLE:[I

    .line 36
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->AUDIO_SPECIFIC_CONFIG_CHANNEL_COUNT_TABLE:[I

    return-void

    .line 30
    nop

    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1t
    .end array-data

    .line 32
    :array_1
    .array-data 4
        0x17700
        0x15888
        0xfa00
        0xbb80
        0xac44
        0x7d00
        0x5dc0
        0x5622
        0x3e80
        0x2ee0
        0x2b11
        0x1f40
        0x1cb6
    .end array-data

    .line 36
    :array_2
    .array-data 4
        0x0
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x8
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static buildAudioSpecificConfig(II)[B
    .locals 7
    .param p0, "sampleRate"    # I
    .param p1, "numChannels"    # I

    .prologue
    .line 85
    const/4 v3, -0x1

    .line 86
    .local v3, "sampleRateIndex":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    sget-object v4, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->AUDIO_SPECIFIC_CONFIG_SAMPLING_RATE_TABLE:[I

    array-length v4, v4

    if-ge v2, v4, :cond_1

    .line 87
    sget-object v4, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->AUDIO_SPECIFIC_CONFIG_SAMPLING_RATE_TABLE:[I

    aget v4, v4, v2

    if-ne p0, v4, :cond_0

    .line 88
    move v3, v2

    .line 86
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 91
    :cond_1
    const/4 v0, -0x1

    .line 92
    .local v0, "channelConfig":I
    const/4 v2, 0x0

    :goto_1
    sget-object v4, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->AUDIO_SPECIFIC_CONFIG_CHANNEL_COUNT_TABLE:[I

    array-length v4, v4

    if-ge v2, v4, :cond_3

    .line 93
    sget-object v4, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->AUDIO_SPECIFIC_CONFIG_CHANNEL_COUNT_TABLE:[I

    aget v4, v4, v2

    if-ne p1, v4, :cond_2

    .line 94
    move v0, v2

    .line 92
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 98
    :cond_3
    const/4 v4, 0x2

    new-array v1, v4, [B

    .line 99
    .local v1, "csd":[B
    const/4 v4, 0x0

    shr-int/lit8 v5, v3, 0x1

    or-int/lit8 v5, v5, 0x10

    int-to-byte v5, v5

    aput-byte v5, v1, v4

    .line 100
    const/4 v4, 0x1

    and-int/lit8 v5, v3, 0x1

    shl-int/lit8 v5, v5, 0x7

    shl-int/lit8 v6, v0, 0x3

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v1, v4

    .line 101
    return-object v1
.end method

.method public static buildAudioSpecificConfig(III)[B
    .locals 4
    .param p0, "audioObjectType"    # I
    .param p1, "sampleRateIndex"    # I
    .param p2, "channelConfig"    # I

    .prologue
    .line 71
    const/4 v1, 0x2

    new-array v0, v1, [B

    .line 72
    .local v0, "audioSpecificConfig":[B
    const/4 v1, 0x0

    shl-int/lit8 v2, p0, 0x3

    and-int/lit16 v2, v2, 0xf8

    shr-int/lit8 v3, p1, 0x1

    and-int/lit8 v3, v3, 0x7

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 73
    const/4 v1, 0x1

    shl-int/lit8 v2, p1, 0x7

    and-int/lit16 v2, v2, 0x80

    shl-int/lit8 v3, p2, 0x3

    and-int/lit8 v3, v3, 0x78

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 74
    return-object v0
.end method

.method public static buildNalUnit([BII)[B
    .locals 4
    .param p0, "data"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    const/4 v3, 0x0

    .line 113
    sget-object v1, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->NAL_START_CODE:[B

    array-length v1, v1

    add-int/2addr v1, p2

    new-array v0, v1, [B

    .line 114
    .local v0, "nalUnit":[B
    sget-object v1, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->NAL_START_CODE:[B

    sget-object v2, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->NAL_START_CODE:[B

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 115
    sget-object v1, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->NAL_START_CODE:[B

    array-length v1, v1

    invoke-static {p0, p1, v0, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 116
    return-object v0
.end method

.method private static findNalStartCode([BI)I
    .locals 4
    .param p0, "data"    # [B
    .param p1, "index"    # I

    .prologue
    .line 160
    array-length v2, p0

    sget-object v3, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->NAL_START_CODE:[B

    array-length v3, v3

    sub-int v0, v2, v3

    .line 161
    .local v0, "endIndex":I
    move v1, p1

    .local v1, "i":I
    :goto_0
    if-gt v1, v0, :cond_1

    .line 162
    invoke-static {p0, v1}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->isNalStartCode([BI)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 166
    .end local v1    # "i":I
    :goto_1
    return v1

    .line 161
    .restart local v1    # "i":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 166
    :cond_1
    const/4 v1, -0x1

    goto :goto_1
.end method

.method private static isNalStartCode([BI)Z
    .locals 4
    .param p0, "data"    # [B
    .param p1, "index"    # I

    .prologue
    const/4 v1, 0x0

    .line 177
    array-length v2, p0

    sub-int/2addr v2, p1

    sget-object v3, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->NAL_START_CODE:[B

    array-length v3, v3

    if-gt v2, v3, :cond_1

    .line 185
    :cond_0
    :goto_0
    return v1

    .line 180
    :cond_1
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_1
    sget-object v2, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->NAL_START_CODE:[B

    array-length v2, v2

    if-ge v0, v2, :cond_2

    .line 181
    add-int v2, p1, v0

    aget-byte v2, p0, v2

    sget-object v3, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->NAL_START_CODE:[B

    aget-byte v3, v3, v0

    if-ne v2, v3, :cond_0

    .line 180
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 185
    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static parseAudioSpecificConfig([B)Landroid/util/Pair;
    .locals 9
    .param p0, "audioSpecificConfig"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 51
    aget-byte v7, p0, v5

    shr-int/lit8 v7, v7, 0x3

    and-int/lit8 v0, v7, 0x1f

    .line 52
    .local v0, "audioObjectType":I
    const/4 v7, 0x5

    if-eq v0, v7, :cond_0

    const/16 v7, 0x1d

    if-ne v0, v7, :cond_1

    :cond_0
    move v1, v6

    .line 53
    .local v1, "byteOffset":I
    :goto_0
    aget-byte v7, p0, v1

    and-int/lit8 v7, v7, 0x7

    shl-int/lit8 v7, v7, 0x1

    add-int/lit8 v8, v1, 0x1

    aget-byte v8, p0, v8

    shr-int/lit8 v8, v8, 0x7

    and-int/lit8 v8, v8, 0x1

    or-int v3, v7, v8

    .line 55
    .local v3, "frequencyIndex":I
    const/16 v7, 0xd

    if-ge v3, v7, :cond_2

    :goto_1
    invoke-static {v6}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 56
    sget-object v5, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->AUDIO_SPECIFIC_CONFIG_SAMPLING_RATE_TABLE:[I

    aget v4, v5, v3

    .line 57
    .local v4, "sampleRate":I
    add-int/lit8 v5, v1, 0x1

    aget-byte v5, p0, v5

    shr-int/lit8 v5, v5, 0x3

    and-int/lit8 v2, v5, 0xf

    .line 58
    .local v2, "channelCount":I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v5

    return-object v5

    .end local v1    # "byteOffset":I
    .end local v2    # "channelCount":I
    .end local v3    # "frequencyIndex":I
    .end local v4    # "sampleRate":I
    :cond_1
    move v1, v5

    .line 52
    goto :goto_0

    .restart local v1    # "byteOffset":I
    .restart local v3    # "frequencyIndex":I
    :cond_2
    move v6, v5

    .line 55
    goto :goto_1
.end method

.method private static parseAvcLevel([B)I
    .locals 3
    .param p0, "data"    # [B
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    const/16 v1, 0x8

    .line 237
    aget-byte v2, p0, v1

    and-int/lit16 v0, v2, 0xff

    .line 238
    .local v0, "levelIdc":I
    sparse-switch v0, :sswitch_data_0

    .line 272
    const/4 v1, 0x0

    :goto_0
    :sswitch_0
    return v1

    .line 240
    :sswitch_1
    const/4 v1, 0x2

    goto :goto_0

    .line 242
    :sswitch_2
    const/4 v1, 0x1

    goto :goto_0

    .line 244
    :sswitch_3
    const/4 v1, 0x4

    goto :goto_0

    .line 248
    :sswitch_4
    const/16 v1, 0x10

    goto :goto_0

    .line 250
    :sswitch_5
    const/16 v1, 0x20

    goto :goto_0

    .line 252
    :sswitch_6
    const/16 v1, 0x40

    goto :goto_0

    .line 254
    :sswitch_7
    const/16 v1, 0x80

    goto :goto_0

    .line 256
    :sswitch_8
    const/16 v1, 0x100

    goto :goto_0

    .line 258
    :sswitch_9
    const/16 v1, 0x200

    goto :goto_0

    .line 260
    :sswitch_a
    const/16 v1, 0x400

    goto :goto_0

    .line 262
    :sswitch_b
    const/16 v1, 0x800

    goto :goto_0

    .line 264
    :sswitch_c
    const/16 v1, 0x1000

    goto :goto_0

    .line 266
    :sswitch_d
    const/16 v1, 0x2000

    goto :goto_0

    .line 268
    :sswitch_e
    const/16 v1, 0x4000

    goto :goto_0

    .line 270
    :sswitch_f
    const v1, 0x8000

    goto :goto_0

    .line 238
    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_1
        0xa -> :sswitch_2
        0xb -> :sswitch_3
        0xc -> :sswitch_0
        0xd -> :sswitch_4
        0x14 -> :sswitch_5
        0x15 -> :sswitch_6
        0x16 -> :sswitch_7
        0x1e -> :sswitch_8
        0x1f -> :sswitch_9
        0x20 -> :sswitch_a
        0x28 -> :sswitch_b
        0x29 -> :sswitch_c
        0x2a -> :sswitch_d
        0x32 -> :sswitch_e
        0x33 -> :sswitch_f
    .end sparse-switch
.end method

.method private static parseAvcProfile([B)I
    .locals 2
    .param p0, "data"    # [B
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    .line 214
    const/4 v1, 0x6

    aget-byte v1, p0, v1

    and-int/lit16 v0, v1, 0xff

    .line 215
    .local v0, "profileIdc":I
    sparse-switch v0, :sswitch_data_0

    .line 231
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 217
    :sswitch_0
    const/4 v1, 0x1

    goto :goto_0

    .line 219
    :sswitch_1
    const/4 v1, 0x2

    goto :goto_0

    .line 221
    :sswitch_2
    const/4 v1, 0x4

    goto :goto_0

    .line 223
    :sswitch_3
    const/16 v1, 0x8

    goto :goto_0

    .line 225
    :sswitch_4
    const/16 v1, 0x10

    goto :goto_0

    .line 227
    :sswitch_5
    const/16 v1, 0x20

    goto :goto_0

    .line 229
    :sswitch_6
    const/16 v1, 0x40

    goto :goto_0

    .line 215
    :sswitch_data_0
    .sparse-switch
        0x42 -> :sswitch_0
        0x4d -> :sswitch_1
        0x58 -> :sswitch_2
        0x64 -> :sswitch_3
        0x6e -> :sswitch_4
        0x7a -> :sswitch_5
        0xf4 -> :sswitch_6
    .end sparse-switch
.end method

.method public static parseSpsNalUnit([B)Landroid/util/Pair;
    .locals 2
    .param p0, "spsNalUnit"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 205
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->isNalStartCode([BI)Z

    move-result v0

    if-eqz v0, :cond_0

    array-length v0, p0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    const/4 v0, 0x5

    aget-byte v0, p0, v0

    and-int/lit8 v0, v0, 0x1f

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    .line 207
    invoke-static {p0}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->parseAvcProfile([B)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p0}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->parseAvcLevel([B)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v0

    .line 209
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static splitNalUnits([B)[[B
    .locals 9
    .param p0, "data"    # [B

    .prologue
    const/4 v8, 0x0

    .line 131
    invoke-static {p0, v8}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->isNalStartCode([BI)Z

    move-result v7

    if-nez v7, :cond_0

    .line 133
    const/4 v7, 0x0

    check-cast v7, [[B

    .line 149
    :goto_0
    return-object v7

    .line 135
    :cond_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 136
    .local v6, "starts":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v3, 0x0

    .line 138
    .local v3, "nalUnitIndex":I
    :cond_1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    sget-object v7, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->NAL_START_CODE:[B

    array-length v7, v7

    add-int/2addr v7, v3

    invoke-static {p0, v7}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->findNalStartCode([BI)I

    move-result v3

    .line 140
    const/4 v7, -0x1

    if-ne v3, v7, :cond_1

    .line 141
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    new-array v4, v7, [[B

    .line 142
    .local v4, "split":[[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    if-ge v1, v7, :cond_3

    .line 143
    invoke-interface {v6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 144
    .local v5, "startIndex":I
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    if-ge v1, v7, :cond_2

    add-int/lit8 v7, v1, 0x1

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 145
    .local v0, "endIndex":I
    :goto_2
    sub-int v7, v0, v5

    new-array v2, v7, [B

    .line 146
    .local v2, "nal":[B
    array-length v7, v2

    invoke-static {p0, v5, v2, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 147
    aput-object v2, v4, v1

    .line 142
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 144
    .end local v0    # "endIndex":I
    .end local v2    # "nal":[B
    :cond_2
    array-length v0, p0

    goto :goto_2

    .end local v5    # "startIndex":I
    :cond_3
    move-object v7, v4

    .line 149
    goto :goto_0
.end method
