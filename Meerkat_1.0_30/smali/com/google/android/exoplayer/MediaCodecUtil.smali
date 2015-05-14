.class public Lcom/google/android/exoplayer/MediaCodecUtil;
.super Ljava/lang/Object;
.source "MediaCodecUtil.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;,
        Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompatV16;,
        Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompatV21;,
        Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;,
        Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MediaCodecUtil"

.field private static final codecs:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Landroid/media/MediaCodecInfo$CodecCapabilities;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/exoplayer/MediaCodecUtil;->codecs:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 348
    return-void
.end method

.method private static avcLevelToMaxFrameSize(I)I
    .locals 4
    .param p0, "avcLevel"    # I

    .prologue
    const/high16 v3, 0x200000

    const v2, 0x65400

    const/16 v0, 0x6300

    const v1, 0x18c00

    .line 233
    sparse-switch p0, :sswitch_data_0

    .line 249
    const/4 v0, -0x1

    :goto_0
    :sswitch_0
    return v0

    :sswitch_1
    move v0, v1

    .line 236
    goto :goto_0

    :sswitch_2
    move v0, v1

    .line 237
    goto :goto_0

    :sswitch_3
    move v0, v1

    .line 238
    goto :goto_0

    .line 239
    :sswitch_4
    const v0, 0x31800

    goto :goto_0

    :sswitch_5
    move v0, v2

    .line 240
    goto :goto_0

    :sswitch_6
    move v0, v2

    .line 241
    goto :goto_0

    .line 242
    :sswitch_7
    const v0, 0xe1000

    goto :goto_0

    .line 243
    :sswitch_8
    const/high16 v0, 0x140000

    goto :goto_0

    :sswitch_9
    move v0, v3

    .line 244
    goto :goto_0

    :sswitch_a
    move v0, v3

    .line 245
    goto :goto_0

    .line 246
    :sswitch_b
    const/high16 v0, 0x220000

    goto :goto_0

    .line 247
    :sswitch_c
    const v0, 0x564000

    goto :goto_0

    .line 248
    :sswitch_d
    const/high16 v0, 0x900000

    goto :goto_0

    .line 233
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_0
        0x8 -> :sswitch_1
        0x10 -> :sswitch_2
        0x20 -> :sswitch_3
        0x40 -> :sswitch_4
        0x80 -> :sswitch_5
        0x100 -> :sswitch_6
        0x200 -> :sswitch_7
        0x400 -> :sswitch_8
        0x800 -> :sswitch_9
        0x1000 -> :sswitch_a
        0x2000 -> :sswitch_b
        0x4000 -> :sswitch_c
        0x8000 -> :sswitch_d
    .end sparse-switch
.end method

.method public static getDecoderInfo(Ljava/lang/String;Z)Lcom/google/android/exoplayer/DecoderInfo;
    .locals 4
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "secure"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    .line 67
    invoke-static {p0, p1}, Lcom/google/android/exoplayer/MediaCodecUtil;->getMediaCodecInfo(Ljava/lang/String;Z)Landroid/util/Pair;

    move-result-object v0

    .line 68
    .local v0, "info":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;>;"
    if-nez v0, :cond_0

    .line 69
    const/4 v1, 0x0

    .line 71
    :goto_0
    return-object v1

    :cond_0
    new-instance v3, Lcom/google/android/exoplayer/DecoderInfo;

    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v2, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Landroid/media/MediaCodecInfo$CodecCapabilities;

    invoke-static {v2}, Lcom/google/android/exoplayer/MediaCodecUtil;->isAdaptive(Landroid/media/MediaCodecInfo$CodecCapabilities;)Z

    move-result v2

    invoke-direct {v3, v1, v2}, Lcom/google/android/exoplayer/DecoderInfo;-><init>(Ljava/lang/String;Z)V

    move-object v1, v3

    goto :goto_0
.end method

.method private static getMediaCodecInfo(Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;)Landroid/util/Pair;
    .locals 3
    .param p0, "key"    # Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;
    .param p1, "mediaCodecList"    # Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;",
            "Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;",
            ")",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Landroid/media/MediaCodecInfo$CodecCapabilities;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    .line 120
    :try_start_0
    invoke-static {p0, p1}, Lcom/google/android/exoplayer/MediaCodecUtil;->getMediaCodecInfoInternal(Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;)Landroid/util/Pair;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 121
    :catch_0
    move-exception v0

    .line 124
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;-><init>(Ljava/lang/Throwable;Lcom/google/android/exoplayer/MediaCodecUtil$1;)V

    throw v1
.end method

.method private static declared-synchronized getMediaCodecInfo(Ljava/lang/String;Z)Landroid/util/Pair;
    .locals 7
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "secure"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Landroid/media/MediaCodecInfo$CodecCapabilities;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x15

    .line 97
    const-class v4, Lcom/google/android/exoplayer/MediaCodecUtil;

    monitor-enter v4

    :try_start_0
    new-instance v1, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;-><init>(Ljava/lang/String;Z)V

    .line 98
    .local v1, "key":Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;
    sget-object v3, Lcom/google/android/exoplayer/MediaCodecUtil;->codecs:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 99
    sget-object v3, Lcom/google/android/exoplayer/MediaCodecUtil;->codecs:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Pair;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 114
    :goto_0
    monitor-exit v4

    return-object v3

    .line 101
    :cond_0
    :try_start_1
    sget v3, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    if-lt v3, v5, :cond_2

    new-instance v2, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompatV21;

    invoke-direct {v2, p1}, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompatV21;-><init>(Z)V

    .line 103
    .local v2, "mediaCodecList":Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;
    :goto_1
    invoke-static {v1, v2}, Lcom/google/android/exoplayer/MediaCodecUtil;->getMediaCodecInfo(Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;)Landroid/util/Pair;

    move-result-object v0

    .line 105
    .local v0, "codecInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;>;"
    if-eqz p1, :cond_1

    if-nez v0, :cond_1

    sget v3, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    if-lt v3, v5, :cond_1

    .line 107
    new-instance v2, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompatV16;

    .end local v2    # "mediaCodecList":Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;
    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompatV16;-><init>(Lcom/google/android/exoplayer/MediaCodecUtil$1;)V

    .line 108
    .restart local v2    # "mediaCodecList":Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;
    invoke-static {v1, v2}, Lcom/google/android/exoplayer/MediaCodecUtil;->getMediaCodecInfo(Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;)Landroid/util/Pair;

    move-result-object v0

    .line 109
    if-eqz v0, :cond_1

    .line 110
    const-string v5, "MediaCodecUtil"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "MediaCodecList API didn\'t list secure decoder for: "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, ". Assuming: "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v3, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    move-object v3, v0

    .line 114
    goto :goto_0

    .line 101
    .end local v0    # "codecInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;>;"
    .end local v2    # "mediaCodecList":Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;
    :cond_2
    new-instance v2, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompatV16;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompatV16;-><init>(Lcom/google/android/exoplayer/MediaCodecUtil$1;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 97
    .end local v1    # "key":Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;
    :catchall_0
    move-exception v3

    monitor-exit v4

    throw v3
.end method

.method private static getMediaCodecInfoInternal(Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;)Landroid/util/Pair;
    .locals 16
    .param p0, "key"    # Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;
    .param p1, "mediaCodecList"    # Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;",
            "Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;",
            ")",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Landroid/media/MediaCodecInfo$CodecCapabilities;",
            ">;"
        }
    .end annotation

    .prologue
    .line 130
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;->mimeType:Ljava/lang/String;

    .line 131
    .local v6, "mimeType":Ljava/lang/String;
    invoke-interface/range {p1 .. p1}, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;->getCodecCount()I

    move-result v7

    .line 132
    .local v7, "numberOfCodecs":I
    invoke-interface/range {p1 .. p1}, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;->secureDecodersExplicit()Z

    move-result v9

    .line 134
    .local v9, "secureDecodersExplicit":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v7, :cond_8

    .line 135
    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    move-result-object v4

    .line 136
    .local v4, "info":Landroid/media/MediaCodecInfo;
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v2

    .line 137
    .local v2, "codecName":Ljava/lang/String;
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v12

    if-nez v12, :cond_7

    const-string v12, "OMX."

    invoke-virtual {v2, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_7

    if-nez v9, :cond_0

    const-string v12, ".secure"

    .line 138
    invoke-virtual {v2, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_7

    .line 139
    :cond_0
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v11

    .line 140
    .local v11, "supportedTypes":[Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_1
    array-length v12, v11

    if-ge v5, v12, :cond_7

    .line 141
    aget-object v10, v11, v5

    .line 142
    .local v10, "supportedType":Ljava/lang/String;
    invoke-virtual {v10, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_6

    .line 143
    invoke-virtual {v4, v10}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v1

    .line 144
    .local v1, "capabilities":Landroid/media/MediaCodecInfo$CodecCapabilities;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;->mimeType:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v1}, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;->isSecurePlaybackSupported(Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;)Z

    move-result v8

    .line 145
    .local v8, "secure":Z
    if-nez v9, :cond_4

    .line 147
    sget-object v13, Lcom/google/android/exoplayer/MediaCodecUtil;->codecs:Ljava/util/HashMap;

    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;->secure:Z

    if-eqz v12, :cond_2

    new-instance v12, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;

    const/4 v14, 0x0

    invoke-direct {v12, v6, v14}, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;-><init>(Ljava/lang/String;Z)V

    .line 148
    :goto_2
    invoke-static {v2, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v14

    .line 147
    invoke-virtual {v13, v12, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    if-eqz v8, :cond_1

    .line 150
    sget-object v13, Lcom/google/android/exoplayer/MediaCodecUtil;->codecs:Ljava/util/HashMap;

    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;->secure:Z

    if-eqz v12, :cond_3

    move-object/from16 v12, p0

    :goto_3
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ".secure"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 151
    invoke-static {v14, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v14

    .line 150
    invoke-virtual {v13, v12, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    :cond_1
    :goto_4
    sget-object v12, Lcom/google/android/exoplayer/MediaCodecUtil;->codecs:Ljava/util/HashMap;

    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_6

    .line 160
    sget-object v12, Lcom/google/android/exoplayer/MediaCodecUtil;->codecs:Ljava/util/HashMap;

    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/util/Pair;

    .line 166
    .end local v1    # "capabilities":Landroid/media/MediaCodecInfo$CodecCapabilities;
    .end local v2    # "codecName":Ljava/lang/String;
    .end local v4    # "info":Landroid/media/MediaCodecInfo;
    .end local v5    # "j":I
    .end local v8    # "secure":Z
    .end local v10    # "supportedType":Ljava/lang/String;
    .end local v11    # "supportedTypes":[Ljava/lang/String;
    :goto_5
    return-object v12

    .restart local v1    # "capabilities":Landroid/media/MediaCodecInfo$CodecCapabilities;
    .restart local v2    # "codecName":Ljava/lang/String;
    .restart local v4    # "info":Landroid/media/MediaCodecInfo;
    .restart local v5    # "j":I
    .restart local v8    # "secure":Z
    .restart local v10    # "supportedType":Ljava/lang/String;
    .restart local v11    # "supportedTypes":[Ljava/lang/String;
    :cond_2
    move-object/from16 v12, p0

    .line 147
    goto :goto_2

    .line 150
    :cond_3
    new-instance v12, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;

    const/4 v14, 0x1

    invoke-direct {v12, v6, v14}, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;-><init>(Ljava/lang/String;Z)V

    goto :goto_3

    .line 156
    :cond_4
    sget-object v13, Lcom/google/android/exoplayer/MediaCodecUtil;->codecs:Ljava/util/HashMap;

    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;->secure:Z

    if-ne v12, v8, :cond_5

    move-object/from16 v12, p0

    .line 157
    :goto_6
    invoke-static {v2, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v14

    .line 156
    invoke-virtual {v13, v12, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    :cond_5
    new-instance v12, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;

    invoke-direct {v12, v6, v8}, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;-><init>(Ljava/lang/String;Z)V

    goto :goto_6

    .line 140
    .end local v1    # "capabilities":Landroid/media/MediaCodecInfo$CodecCapabilities;
    .end local v8    # "secure":Z
    :cond_6
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_1

    .line 134
    .end local v5    # "j":I
    .end local v10    # "supportedType":Ljava/lang/String;
    .end local v11    # "supportedTypes":[Ljava/lang/String;
    :cond_7
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 166
    .end local v2    # "codecName":Ljava/lang/String;
    .end local v4    # "info":Landroid/media/MediaCodecInfo;
    :cond_8
    const/4 v12, 0x0

    goto :goto_5
.end method

.method private static isAdaptive(Landroid/media/MediaCodecInfo$CodecCapabilities;)Z
    .locals 2
    .param p0, "capabilities"    # Landroid/media/MediaCodecInfo$CodecCapabilities;

    .prologue
    .line 170
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 171
    invoke-static {p0}, Lcom/google/android/exoplayer/MediaCodecUtil;->isAdaptiveV19(Landroid/media/MediaCodecInfo$CodecCapabilities;)Z

    move-result v0

    .line 173
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isAdaptiveV19(Landroid/media/MediaCodecInfo$CodecCapabilities;)Z
    .locals 1
    .param p0, "capabilities"    # Landroid/media/MediaCodecInfo$CodecCapabilities;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    .line 179
    const-string v0, "adaptive-playback"

    invoke-virtual {p0, v0}, Landroid/media/MediaCodecInfo$CodecCapabilities;->isFeatureSupported(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isH264ProfileSupported(II)Z
    .locals 6
    .param p0, "profile"    # I
    .param p1, "level"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 189
    const-string v5, "video/avc"

    invoke-static {v5, v4}, Lcom/google/android/exoplayer/MediaCodecUtil;->getMediaCodecInfo(Ljava/lang/String;Z)Landroid/util/Pair;

    move-result-object v2

    .line 190
    .local v2, "info":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;>;"
    if-nez v2, :cond_1

    .line 202
    :cond_0
    :goto_0
    return v4

    .line 194
    :cond_1
    iget-object v0, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 195
    .local v0, "capabilities":Landroid/media/MediaCodecInfo$CodecCapabilities;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v5, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    array-length v5, v5

    if-ge v1, v5, :cond_0

    .line 196
    iget-object v5, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    aget-object v3, v5, v1

    .line 197
    .local v3, "profileLevel":Landroid/media/MediaCodecInfo$CodecProfileLevel;
    iget v5, v3, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    if-ne v5, p0, :cond_2

    iget v5, v3, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    if-lt v5, p1, :cond_2

    .line 198
    const/4 v4, 0x1

    goto :goto_0

    .line 195
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public static maxH264DecodableFrameSize()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 209
    const-string v5, "video/avc"

    invoke-static {v5, v3}, Lcom/google/android/exoplayer/MediaCodecUtil;->getMediaCodecInfo(Ljava/lang/String;Z)Landroid/util/Pair;

    move-result-object v2

    .line 210
    .local v2, "info":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;>;"
    if-nez v2, :cond_1

    .line 222
    :cond_0
    return v3

    .line 214
    :cond_1
    const/4 v3, 0x0

    .line 215
    .local v3, "maxH264DecodableFrameSize":I
    iget-object v0, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 216
    .local v0, "capabilities":Landroid/media/MediaCodecInfo$CodecCapabilities;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v5, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    array-length v5, v5

    if-ge v1, v5, :cond_0

    .line 217
    iget-object v5, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    aget-object v4, v5, v1

    .line 218
    .local v4, "profileLevel":Landroid/media/MediaCodecInfo$CodecProfileLevel;
    iget v5, v4, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    .line 219
    invoke-static {v5}, Lcom/google/android/exoplayer/MediaCodecUtil;->avcLevelToMaxFrameSize(I)I

    move-result v5

    .line 218
    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 216
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static declared-synchronized warmCodec(Ljava/lang/String;Z)V
    .locals 4
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "secure"    # Z

    .prologue
    .line 85
    const-class v2, Lcom/google/android/exoplayer/MediaCodecUtil;

    monitor-enter v2

    :try_start_0
    invoke-static {p0, p1}, Lcom/google/android/exoplayer/MediaCodecUtil;->getMediaCodecInfo(Ljava/lang/String;Z)Landroid/util/Pair;
    :try_end_0
    .catch Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    :goto_0
    monitor-exit v2

    return-void

    .line 86
    :catch_0
    move-exception v0

    .line 88
    .local v0, "e":Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
    :try_start_1
    const-string v1, "MediaCodecUtil"

    const-string v3, "Codec warming failed"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 85
    .end local v0    # "e":Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method
