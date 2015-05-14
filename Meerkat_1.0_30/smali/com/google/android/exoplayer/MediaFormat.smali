.class public Lcom/google/android/exoplayer/MediaFormat;
.super Ljava/lang/Object;
.source "MediaFormat.java"


# static fields
.field private static final KEY_PIXEL_WIDTH_HEIGHT_RATIO:Ljava/lang/String; = "com.google.android.videos.pixelWidthHeightRatio"

.field public static final NO_VALUE:I = -0x1


# instance fields
.field public final bitrate:I

.field public final channelCount:I

.field private frameworkMediaFormat:Landroid/media/MediaFormat;

.field private hashCode:I

.field public final height:I

.field public final initializationData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation
.end field

.field private maxHeight:I

.field public final maxInputSize:I

.field private maxWidth:I

.field public final mimeType:Ljava/lang/String;

.field public final pixelWidthHeightRatio:F

.field public final sampleRate:I

.field public final width:I


# direct methods
.method private constructor <init>(Landroid/media/MediaFormat;)V
    .locals 6
    .param p1, "format"    # Landroid/media/MediaFormat;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    const/4 v5, -0x1

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    iput-object p1, p0, Lcom/google/android/exoplayer/MediaFormat;->frameworkMediaFormat:Landroid/media/MediaFormat;

    .line 110
    const-string v3, "mime"

    invoke-virtual {p1, v3}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    .line 111
    const-string v3, "max-input-size"

    invoke-static {p1, v3}, Lcom/google/android/exoplayer/MediaFormat;->getOptionalIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/google/android/exoplayer/MediaFormat;->maxInputSize:I

    .line 112
    const-string v3, "width"

    invoke-static {p1, v3}, Lcom/google/android/exoplayer/MediaFormat;->getOptionalIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/google/android/exoplayer/MediaFormat;->width:I

    .line 113
    const-string v3, "height"

    invoke-static {p1, v3}, Lcom/google/android/exoplayer/MediaFormat;->getOptionalIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/google/android/exoplayer/MediaFormat;->height:I

    .line 114
    const-string v3, "channel-count"

    invoke-static {p1, v3}, Lcom/google/android/exoplayer/MediaFormat;->getOptionalIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    .line 115
    const-string v3, "sample-rate"

    invoke-static {p1, v3}, Lcom/google/android/exoplayer/MediaFormat;->getOptionalIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    .line 116
    const-string v3, "bitrate"

    invoke-static {p1, v3}, Lcom/google/android/exoplayer/MediaFormat;->getOptionalIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/google/android/exoplayer/MediaFormat;->bitrate:I

    .line 117
    const-string v3, "com.google.android.videos.pixelWidthHeightRatio"

    invoke-static {p1, v3}, Lcom/google/android/exoplayer/MediaFormat;->getOptionalFloatV16(Landroid/media/MediaFormat;Ljava/lang/String;)F

    move-result v3

    iput v3, p0, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    .line 118
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    .line 119
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "csd-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 120
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "csd-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/media/MediaFormat;->getByteBuffer(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 121
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    new-array v1, v3, [B

    .line 122
    .local v1, "data":[B
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 123
    iget-object v3, p0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 119
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 126
    .end local v0    # "buffer":Ljava/nio/ByteBuffer;
    .end local v1    # "data":[B
    :cond_0
    iput v5, p0, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    .line 127
    iput v5, p0, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    .line 128
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIIFIIILjava/util/List;)V
    .locals 1
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "maxInputSize"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "pixelWidthHeightRatio"    # F
    .param p6, "channelCount"    # I
    .param p7, "sampleRate"    # I
    .param p8, "bitrate"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "IIIFIII",
            "Ljava/util/List",
            "<[B>;)V"
        }
    .end annotation

    .prologue
    .local p9, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/4 v0, -0x1

    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 133
    iput-object p1, p0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    .line 134
    iput p2, p0, Lcom/google/android/exoplayer/MediaFormat;->maxInputSize:I

    .line 135
    iput p3, p0, Lcom/google/android/exoplayer/MediaFormat;->width:I

    .line 136
    iput p4, p0, Lcom/google/android/exoplayer/MediaFormat;->height:I

    .line 137
    iput p5, p0, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    .line 138
    iput p6, p0, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    .line 139
    iput p7, p0, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    .line 140
    iput p8, p0, Lcom/google/android/exoplayer/MediaFormat;->bitrate:I

    .line 141
    if-nez p9, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p9

    .end local p9    # "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    :cond_0
    iput-object p9, p0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    .line 143
    iput v0, p0, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    .line 144
    iput v0, p0, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    .line 145
    return-void
.end method

.method public static createAudioFormat(Ljava/lang/String;IIIILjava/util/List;)Lcom/google/android/exoplayer/MediaFormat;
    .locals 10
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "maxInputSize"    # I
    .param p2, "channelCount"    # I
    .param p3, "sampleRate"    # I
    .param p4, "bitrate"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "IIII",
            "Ljava/util/List",
            "<[B>;)",
            "Lcom/google/android/exoplayer/MediaFormat;"
        }
    .end annotation

    .prologue
    .local p5, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/4 v3, -0x1

    .line 86
    new-instance v0, Lcom/google/android/exoplayer/MediaFormat;

    const/high16 v5, -0x40800000    # -1.0f

    move-object v1, p0

    move v2, p1

    move v4, v3

    move v6, p2

    move v7, p3

    move v8, p4

    move-object v9, p5

    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer/MediaFormat;-><init>(Ljava/lang/String;IIIFIIILjava/util/List;)V

    return-object v0
.end method

.method public static createAudioFormat(Ljava/lang/String;IIILjava/util/List;)Lcom/google/android/exoplayer/MediaFormat;
    .locals 10
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "maxInputSize"    # I
    .param p2, "channelCount"    # I
    .param p3, "sampleRate"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "III",
            "Ljava/util/List",
            "<[B>;)",
            "Lcom/google/android/exoplayer/MediaFormat;"
        }
    .end annotation

    .prologue
    .local p4, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/4 v3, -0x1

    .line 80
    new-instance v0, Lcom/google/android/exoplayer/MediaFormat;

    const/high16 v5, -0x40800000    # -1.0f

    move-object v1, p0

    move v2, p1

    move v4, v3

    move v6, p2

    move v7, p3

    move v8, v3

    move-object v9, p4

    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer/MediaFormat;-><init>(Ljava/lang/String;IIIFIIILjava/util/List;)V

    return-object v0
.end method

.method public static createEia608Format()Lcom/google/android/exoplayer/MediaFormat;
    .locals 1

    .prologue
    .line 95
    const-string v0, "application/eia-608"

    invoke-static {v0}, Lcom/google/android/exoplayer/MediaFormat;->createFormatForMimeType(Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    return-object v0
.end method

.method public static createFormatForMimeType(Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;
    .locals 10
    .param p0, "mimeType"    # Ljava/lang/String;

    .prologue
    const/4 v2, -0x1

    .line 103
    new-instance v0, Lcom/google/android/exoplayer/MediaFormat;

    const/high16 v5, -0x40800000    # -1.0f

    const/4 v9, 0x0

    move-object v1, p0

    move v3, v2

    move v4, v2

    move v6, v2

    move v7, v2

    move v8, v2

    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer/MediaFormat;-><init>(Ljava/lang/String;IIIFIIILjava/util/List;)V

    return-object v0
.end method

.method public static createFromFrameworkMediaFormatV16(Landroid/media/MediaFormat;)Lcom/google/android/exoplayer/MediaFormat;
    .locals 1
    .param p0, "format"    # Landroid/media/MediaFormat;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 64
    new-instance v0, Lcom/google/android/exoplayer/MediaFormat;

    invoke-direct {v0, p0}, Lcom/google/android/exoplayer/MediaFormat;-><init>(Landroid/media/MediaFormat;)V

    return-object v0
.end method

.method public static createId3Format()Lcom/google/android/exoplayer/MediaFormat;
    .locals 1

    .prologue
    .line 91
    const-string v0, "application/id3"

    invoke-static {v0}, Lcom/google/android/exoplayer/MediaFormat;->createFormatForMimeType(Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    return-object v0
.end method

.method public static createTtmlFormat()Lcom/google/android/exoplayer/MediaFormat;
    .locals 1

    .prologue
    .line 99
    const-string v0, "application/ttml+xml"

    invoke-static {v0}, Lcom/google/android/exoplayer/MediaFormat;->createFormatForMimeType(Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    return-object v0
.end method

.method public static createVideoFormat(Ljava/lang/String;IIIFLjava/util/List;)Lcom/google/android/exoplayer/MediaFormat;
    .locals 10
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "maxInputSize"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "pixelWidthHeightRatio"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "IIIF",
            "Ljava/util/List",
            "<[B>;)",
            "Lcom/google/android/exoplayer/MediaFormat;"
        }
    .end annotation

    .prologue
    .local p5, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/4 v6, -0x1

    .line 74
    new-instance v0, Lcom/google/android/exoplayer/MediaFormat;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v7, v6

    move v8, v6

    move-object v9, p5

    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer/MediaFormat;-><init>(Ljava/lang/String;IIIFIIILjava/util/List;)V

    return-object v0
.end method

.method public static createVideoFormat(Ljava/lang/String;IIILjava/util/List;)Lcom/google/android/exoplayer/MediaFormat;
    .locals 6
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "maxInputSize"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "III",
            "Ljava/util/List",
            "<[B>;)",
            "Lcom/google/android/exoplayer/MediaFormat;"
        }
    .end annotation

    .prologue
    .line 69
    .local p4, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/high16 v4, 0x3f800000    # 1.0f

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lcom/google/android/exoplayer/MediaFormat;->createVideoFormat(Ljava/lang/String;IIIFLjava/util/List;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    return-object v0
.end method

.method private equalsInternal(Lcom/google/android/exoplayer/MediaFormat;Z)Z
    .locals 4
    .param p1, "other"    # Lcom/google/android/exoplayer/MediaFormat;
    .param p2, "ignoreMaxDimensions"    # Z

    .prologue
    const/4 v3, 0x0

    .line 207
    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->maxInputSize:I

    iget v2, p1, Lcom/google/android/exoplayer/MediaFormat;->maxInputSize:I

    if-ne v1, v2, :cond_1

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->width:I

    iget v2, p1, Lcom/google/android/exoplayer/MediaFormat;->width:I

    if-ne v1, v2, :cond_1

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->height:I

    iget v2, p1, Lcom/google/android/exoplayer/MediaFormat;->height:I

    if-ne v1, v2, :cond_1

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    iget v2, p1, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    cmpl-float v1, v1, v2

    if-nez v1, :cond_1

    if-nez p2, :cond_0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    iget v2, p1, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    if-ne v1, v2, :cond_1

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    iget v2, p1, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    if-ne v1, v2, :cond_1

    :cond_0
    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    iget v2, p1, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    if-ne v1, v2, :cond_1

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    iget v2, p1, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    .line 211
    invoke-static {v1, v2}, Lcom/google/android/exoplayer/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->bitrate:I

    iget v2, p1, Lcom/google/android/exoplayer/MediaFormat;->bitrate:I

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    .line 213
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget-object v2, p1, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eq v1, v2, :cond_2

    :cond_1
    move v1, v3

    .line 221
    :goto_0
    return v1

    .line 216
    :cond_2
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 217
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    iget-object v2, p1, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_3

    move v1, v3

    .line 218
    goto :goto_0

    .line 216
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 221
    :cond_4
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private static final getOptionalFloatV16(Landroid/media/MediaFormat;Ljava/lang/String;)F
    .locals 1
    .param p0, "format"    # Landroid/media/MediaFormat;
    .param p1, "key"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 285
    invoke-virtual {p0, p1}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Landroid/media/MediaFormat;->getFloat(Ljava/lang/String;)F

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/high16 v0, -0x40800000    # -1.0f

    goto :goto_0
.end method

.method private static final getOptionalIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;)I
    .locals 1
    .param p0, "format"    # Landroid/media/MediaFormat;
    .param p1, "key"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 280
    invoke-virtual {p0, p1}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method private static final maybeSetFloatV16(Landroid/media/MediaFormat;Ljava/lang/String;F)V
    .locals 1
    .param p0, "format"    # Landroid/media/MediaFormat;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # F
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 273
    const/high16 v0, -0x40800000    # -1.0f

    cmpl-float v0, p2, v0

    if-eqz v0, :cond_0

    .line 274
    invoke-virtual {p0, p1, p2}, Landroid/media/MediaFormat;->setFloat(Ljava/lang/String;F)V

    .line 276
    :cond_0
    return-void
.end method

.method private static final maybeSetIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;I)V
    .locals 1
    .param p0, "format"    # Landroid/media/MediaFormat;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 265
    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    .line 266
    invoke-virtual {p0, p1, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 268
    :cond_0
    return-void
.end method

.method private final maybeSetMaxDimensionsV16(Landroid/media/MediaFormat;)V
    .locals 2
    .param p1, "format"    # Landroid/media/MediaFormat;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 258
    const-string v0, "max-width"

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    invoke-static {p1, v0, v1}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 259
    const-string v0, "max-height"

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    invoke-static {p1, v0, v1}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 260
    return-void
.end method


# virtual methods
.method public equals(Lcom/google/android/exoplayer/MediaFormat;Z)Z
    .locals 1
    .param p1, "other"    # Lcom/google/android/exoplayer/MediaFormat;
    .param p2, "ignoreMaxDimensions"    # Z

    .prologue
    .line 197
    if-ne p0, p1, :cond_0

    .line 198
    const/4 v0, 0x1

    .line 203
    :goto_0
    return v0

    .line 200
    :cond_0
    if-nez p1, :cond_1

    .line 201
    const/4 v0, 0x0

    goto :goto_0

    .line 203
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/MediaFormat;->equalsInternal(Lcom/google/android/exoplayer/MediaFormat;Z)Z

    move-result v0

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 187
    if-ne p0, p1, :cond_1

    .line 188
    const/4 v0, 0x1

    .line 193
    .end local p1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return v0

    .line 190
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_1
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-ne v1, v2, :cond_0

    .line 193
    check-cast p1, Lcom/google/android/exoplayer/MediaFormat;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-direct {p0, p1, v0}, Lcom/google/android/exoplayer/MediaFormat;->equalsInternal(Lcom/google/android/exoplayer/MediaFormat;Z)Z

    move-result v0

    goto :goto_0
.end method

.method public final getFrameworkMediaFormatV16()Landroid/media/MediaFormat;
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 236
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->frameworkMediaFormat:Landroid/media/MediaFormat;

    if-nez v2, :cond_1

    .line 237
    new-instance v0, Landroid/media/MediaFormat;

    invoke-direct {v0}, Landroid/media/MediaFormat;-><init>()V

    .line 238
    .local v0, "format":Landroid/media/MediaFormat;
    const-string v2, "mime"

    iget-object v3, p0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    const-string v2, "max-input-size"

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->maxInputSize:I

    invoke-static {v0, v2, v3}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 240
    const-string v2, "width"

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->width:I

    invoke-static {v0, v2, v3}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 241
    const-string v2, "height"

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->height:I

    invoke-static {v0, v2, v3}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 242
    const-string v2, "channel-count"

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    invoke-static {v0, v2, v3}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 243
    const-string v2, "sample-rate"

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    invoke-static {v0, v2, v3}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 244
    const-string v2, "bitrate"

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->bitrate:I

    invoke-static {v0, v2, v3}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 245
    const-string v2, "com.google.android.videos.pixelWidthHeightRatio"

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    invoke-static {v0, v2, v3}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetFloatV16(Landroid/media/MediaFormat;Ljava/lang/String;F)V

    .line 246
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 247
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "csd-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 246
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 249
    :cond_0
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetMaxDimensionsV16(Landroid/media/MediaFormat;)V

    .line 250
    iput-object v0, p0, Lcom/google/android/exoplayer/MediaFormat;->frameworkMediaFormat:Landroid/media/MediaFormat;

    .line 252
    .end local v0    # "format":Landroid/media/MediaFormat;
    .end local v1    # "i":I
    :cond_1
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->frameworkMediaFormat:Landroid/media/MediaFormat;

    return-object v2
.end method

.method public getMaxVideoHeight()I
    .locals 1

    .prologue
    .line 160
    iget v0, p0, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    return v0
.end method

.method public getMaxVideoWidth()I
    .locals 1

    .prologue
    .line 156
    iget v0, p0, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    return v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    .line 165
    iget v2, p0, Lcom/google/android/exoplayer/MediaFormat;->hashCode:I

    if-nez v2, :cond_2

    .line 166
    const/16 v1, 0x11

    .line 167
    .local v1, "result":I
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    :goto_0
    add-int/lit16 v1, v2, 0x20f

    .line 168
    mul-int/lit8 v2, v1, 0x1f

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->maxInputSize:I

    add-int v1, v2, v3

    .line 169
    mul-int/lit8 v2, v1, 0x1f

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->width:I

    add-int v1, v2, v3

    .line 170
    mul-int/lit8 v2, v1, 0x1f

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->height:I

    add-int v1, v2, v3

    .line 171
    mul-int/lit8 v2, v1, 0x1f

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    invoke-static {v3}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v3

    add-int v1, v2, v3

    .line 172
    mul-int/lit8 v2, v1, 0x1f

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    add-int v1, v2, v3

    .line 173
    mul-int/lit8 v2, v1, 0x1f

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    add-int v1, v2, v3

    .line 174
    mul-int/lit8 v2, v1, 0x1f

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    add-int v1, v2, v3

    .line 175
    mul-int/lit8 v2, v1, 0x1f

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    add-int v1, v2, v3

    .line 176
    mul-int/lit8 v2, v1, 0x1f

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->bitrate:I

    add-int v1, v2, v3

    .line 177
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 178
    mul-int/lit8 v3, v1, 0x1f

    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([B)I

    move-result v2

    add-int v1, v3, v2

    .line 177
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 167
    .end local v0    # "i":I
    :cond_0
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_0

    .line 180
    .restart local v0    # "i":I
    :cond_1
    iput v1, p0, Lcom/google/android/exoplayer/MediaFormat;->hashCode:I

    .line 182
    .end local v0    # "i":I
    .end local v1    # "result":I
    :cond_2
    iget v2, p0, Lcom/google/android/exoplayer/MediaFormat;->hashCode:I

    return v2
.end method

.method public setMaxVideoDimensions(II)V
    .locals 1
    .param p1, "maxWidth"    # I
    .param p2, "maxHeight"    # I

    .prologue
    .line 148
    iput p1, p0, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    .line 149
    iput p2, p0, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    .line 150
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaFormat;->frameworkMediaFormat:Landroid/media/MediaFormat;

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaFormat;->frameworkMediaFormat:Landroid/media/MediaFormat;

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetMaxDimensionsV16(Landroid/media/MediaFormat;)V

    .line 153
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 226
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MediaFormat("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->maxInputSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->width:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->bitrate:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
