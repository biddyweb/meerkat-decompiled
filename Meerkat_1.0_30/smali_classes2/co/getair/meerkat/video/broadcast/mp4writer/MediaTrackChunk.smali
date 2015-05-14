.class public Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
.super Ljava/lang/Object;
.source "MediaTrackChunk.java"


# static fields
.field public static final AUDIO_TRACK_ID:I = 0x2

.field public static final CHUNK_MAX_SIZE:I = 0x249f0

.field public static final SAMPLE_CAP:I = 0x12c

.field private static final TAG:Ljava/lang/String; = "MediaTrackChunk"

.field public static final VIDEO_TRACK_ID:I = 0x1


# instance fields
.field private count:I

.field private iFrameCount:I

.field private iFrameIndexes:Ljava/nio/IntBuffer;

.field private index:I

.field private mediaData:Ljava/nio/ByteBuffer;

.field private sampleDurations:Ljava/nio/IntBuffer;

.field private sampleSizes:Ljava/nio/IntBuffer;

.field private size:I

.field private sync:Ljava/lang/Object;

.field private trackId:I


# direct methods
.method public constructor <init>(II)V
    .locals 3
    .param p1, "trackId"    # I
    .param p2, "index"    # I

    .prologue
    const/16 v2, 0x12c

    const/4 v1, 0x0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->size:I

    .line 19
    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->count:I

    .line 30
    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->trackId:I

    .line 31
    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->index:I

    .line 32
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sync:Ljava/lang/Object;

    .line 37
    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->iFrameCount:I

    .line 38
    iput p2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->index:I

    .line 39
    const v0, 0x249f0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->mediaData:Ljava/nio/ByteBuffer;

    .line 40
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->mediaData:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 41
    invoke-static {v2}, Ljava/nio/IntBuffer;->allocate(I)Ljava/nio/IntBuffer;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sampleSizes:Ljava/nio/IntBuffer;

    .line 42
    invoke-static {v2}, Ljava/nio/IntBuffer;->allocate(I)Ljava/nio/IntBuffer;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sampleDurations:Ljava/nio/IntBuffer;

    .line 43
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 44
    invoke-static {v2}, Ljava/nio/IntBuffer;->allocate(I)Ljava/nio/IntBuffer;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->iFrameIndexes:Ljava/nio/IntBuffer;

    .line 46
    :cond_0
    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->count:I

    .line 48
    iput p1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->trackId:I

    .line 50
    return-void
.end method

.method private fillInADTSHeader(I)[B
    .locals 8
    .param p1, "encoded_length"    # I

    .prologue
    const/4 v7, 0x0

    const v6, 0xffff

    .line 95
    const/4 v5, 0x7

    new-array v0, v5, [B

    .line 97
    .local v0, "ENCByteArray":[B
    add-int/lit8 v1, p1, 0x7

    .line 99
    .local v1, "finallength":I
    and-int v5, v1, v6

    and-int/lit8 v5, v5, 0x7

    shl-int/lit8 v2, v5, 0x5

    .line 100
    .local v2, "length3bits":I
    and-int v5, v1, v6

    shr-int/lit8 v3, v5, 0x3

    .line 101
    .local v3, "length8bits":I
    and-int v5, v1, v6

    and-int/lit16 v5, v5, 0x1800

    shr-int/lit8 v4, v5, 0xb

    .line 103
    .local v4, "lengthMax2bits":I
    const/4 v5, -0x1

    aput-byte v5, v0, v7

    .line 104
    const/4 v5, 0x1

    const/16 v6, -0xf

    aput-byte v6, v0, v5

    .line 105
    const/4 v5, 0x2

    const/16 v6, 0x50

    aput-byte v6, v0, v5

    .line 106
    const/4 v5, 0x3

    and-int/lit16 v6, v4, 0xff

    shl-int/lit8 v6, v6, 0x6

    or-int/lit8 v6, v6, 0x40

    int-to-byte v6, v6

    aput-byte v6, v0, v5

    .line 107
    const/4 v5, 0x4

    int-to-byte v6, v3

    aput-byte v6, v0, v5

    .line 108
    const/4 v5, 0x5

    int-to-byte v6, v2

    aput-byte v6, v0, v5

    .line 109
    const/4 v5, 0x6

    aput-byte v7, v0, v5

    .line 111
    return-object v0
.end method

.method private releaseSample(Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;)V
    .locals 2
    .param p1, "sample"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;

    .prologue
    .line 188
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sync:Ljava/lang/Object;

    monitor-enter v1

    .line 190
    :try_start_0
    sget-object v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mediaSamplesPool:Lco/getair/meerkat/utilities/objectPool/ObjectPool;

    invoke-virtual {v0, p1}, Lco/getair/meerkat/utilities/objectPool/ObjectPool;->release(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 194
    :goto_0
    :try_start_1
    monitor-exit v1

    .line 195
    return-void

    .line 194
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 191
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public addSample(Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;)V
    .locals 7
    .param p1, "sample"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;

    .prologue
    .line 53
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sync:Ljava/lang/Object;

    monitor-enter v3

    .line 55
    :try_start_0
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->getType()I

    move-result v1

    .line 58
    .local v1, "type":I
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sampleDurations:Ljava/nio/IntBuffer;

    iget v4, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->duration:I

    invoke-virtual {v2, v4}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    .line 60
    iget v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->trackId:I

    const/4 v4, 0x1

    if-ne v2, v4, :cond_1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->index:I

    if-lez v2, :cond_1

    .line 61
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->mediaData:Ljava/nio/ByteBuffer;

    iget-object v4, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    add-int/lit8 v4, v4, -0x4

    int-to-long v4, v4

    invoke-static {v2, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 62
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->mediaData:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->getData()Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    const/4 v5, 0x4

    iget-object v6, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    add-int/lit8 v6, v6, -0x4

    invoke-virtual {v2, v4, v5, v6}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 63
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sampleSizes:Ljava/nio/IntBuffer;

    iget-object v4, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    .line 64
    iget v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->size:I

    iget-object v4, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    add-int/2addr v2, v4

    iput v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->size:I

    .line 65
    const/4 v2, 0x5

    if-ne v1, v2, :cond_0

    .line 66
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->iFrameIndexes:Ljava/nio/IntBuffer;

    iget v4, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->count:I

    invoke-virtual {v2, v4}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    .line 67
    iget v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->iFrameCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->iFrameCount:I

    .line 82
    :cond_0
    :goto_0
    iget v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->count:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->count:I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 86
    :try_start_1
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->releaseSample(Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;)V

    .line 91
    .end local v1    # "type":I
    :goto_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 92
    return-void

    .line 70
    .restart local v1    # "type":I
    :cond_1
    :try_start_2
    iget v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->trackId:I

    const/4 v4, 0x2

    if-ne v2, v4, :cond_2

    iget v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->index:I

    if-nez v2, :cond_2

    .line 71
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sampleSizes:Ljava/nio/IntBuffer;

    iget-object v4, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    add-int/lit8 v4, v4, 0x7

    invoke-virtual {v2, v4}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    .line 72
    iget v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->size:I

    iget-object v4, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    add-int/lit8 v4, v4, 0x7

    add-int/2addr v2, v4

    iput v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->size:I

    .line 73
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->mediaData:Ljava/nio/ByteBuffer;

    iget-object v4, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    invoke-direct {p0, v4}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->fillInADTSHeader(I)[B

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 74
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->mediaData:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->getData()Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    const/4 v5, 0x0

    iget-object v6, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    invoke-virtual {v2, v4, v5, v6}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    .line 83
    .end local v1    # "type":I
    :catch_0
    move-exception v0

    .line 84
    .local v0, "e":Ljava/lang/Throwable;
    :try_start_3
    const-string v2, "MediaTrackChunk"

    const-string v4, "Error processing sample "

    invoke-static {v2, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 86
    :try_start_4
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->releaseSample(Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;)V

    goto :goto_1

    .line 91
    .end local v0    # "e":Ljava/lang/Throwable;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v2

    .line 76
    .restart local v1    # "type":I
    :cond_2
    :try_start_5
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sampleSizes:Ljava/nio/IntBuffer;

    iget-object v4, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    .line 77
    iget v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->size:I

    iget-object v4, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    add-int/2addr v2, v4

    iput v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->size:I

    .line 78
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->mediaData:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->getData()Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    const/4 v5, 0x0

    iget-object v6, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    invoke-virtual {v2, v4, v5, v6}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto/16 :goto_0

    .line 86
    .end local v1    # "type":I
    :catchall_1
    move-exception v2

    :try_start_6
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->releaseSample(Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;)V

    throw v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
.end method

.method public getData()Ljava/nio/ByteBuffer;
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->mediaData:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method public getIFrameIndexes()[I
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 127
    iget v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->iFrameCount:I

    new-array v0, v1, [I

    .line 128
    .local v0, "iFrameIndexesOut":[I
    iget v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->iFrameCount:I

    if-lez v1, :cond_0

    .line 129
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->iFrameIndexes:Ljava/nio/IntBuffer;

    invoke-virtual {v1, v3}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    .line 130
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->iFrameIndexes:Ljava/nio/IntBuffer;

    iget v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->iFrameCount:I

    invoke-virtual {v1, v2}, Ljava/nio/IntBuffer;->limit(I)Ljava/nio/Buffer;

    .line 131
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->iFrameIndexes:Ljava/nio/IntBuffer;

    iget v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->iFrameCount:I

    invoke-virtual {v1, v0, v3, v2}, Ljava/nio/IntBuffer;->get([III)Ljava/nio/IntBuffer;

    .line 133
    :cond_0
    return-object v0
.end method

.method public getSampleCount()I
    .locals 2

    .prologue
    .line 115
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sync:Ljava/lang/Object;

    monitor-enter v1

    .line 116
    :try_start_0
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->count:I

    monitor-exit v1

    return v0

    .line 117
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getSampleDurations()[I
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 175
    iget v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->count:I

    new-array v0, v1, [I

    .line 176
    .local v0, "sampleDurationsOut":[I
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sampleDurations:Ljava/nio/IntBuffer;

    invoke-virtual {v1, v3}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    .line 177
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sampleDurations:Ljava/nio/IntBuffer;

    iget v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->count:I

    invoke-virtual {v1, v2}, Ljava/nio/IntBuffer;->limit(I)Ljava/nio/Buffer;

    .line 178
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sampleDurations:Ljava/nio/IntBuffer;

    iget v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->count:I

    invoke-virtual {v1, v0, v3, v2}, Ljava/nio/IntBuffer;->get([III)Ljava/nio/IntBuffer;

    .line 179
    return-object v0
.end method

.method public getSampleSizes()[I
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 166
    iget v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->count:I

    new-array v0, v1, [I

    .line 167
    .local v0, "sampleSizesOut":[I
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sampleSizes:Ljava/nio/IntBuffer;

    invoke-virtual {v1, v3}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    .line 168
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sampleSizes:Ljava/nio/IntBuffer;

    iget v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->count:I

    invoke-virtual {v1, v2}, Ljava/nio/IntBuffer;->limit(I)Ljava/nio/Buffer;

    .line 169
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sampleSizes:Ljava/nio/IntBuffer;

    iget v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->count:I

    invoke-virtual {v1, v0, v3, v2}, Ljava/nio/IntBuffer;->get([III)Ljava/nio/IntBuffer;

    .line 170
    return-object v0
.end method

.method public getSize()I
    .locals 2

    .prologue
    .line 121
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sync:Ljava/lang/Object;

    monitor-enter v1

    .line 122
    :try_start_0
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->size:I

    monitor-exit v1

    return v0

    .line 123
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getTrackId()I
    .locals 1

    .prologue
    .line 183
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->trackId:I

    return v0
.end method

.method public release()V
    .locals 3

    .prologue
    .line 142
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sync:Ljava/lang/Object;

    monitor-enter v1

    .line 145
    const/4 v0, 0x0

    :try_start_0
    iput v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->count:I

    .line 146
    const/4 v0, 0x0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->size:I

    .line 147
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->mediaData:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 148
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sampleSizes:Ljava/nio/IntBuffer;

    invoke-virtual {v0}, Ljava/nio/IntBuffer;->clear()Ljava/nio/Buffer;

    .line 149
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->sampleDurations:Ljava/nio/IntBuffer;

    invoke-virtual {v0}, Ljava/nio/IntBuffer;->clear()Ljava/nio/Buffer;

    .line 150
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->trackId:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    .line 151
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->iFrameIndexes:Ljava/nio/IntBuffer;

    invoke-virtual {v0}, Ljava/nio/IntBuffer;->clear()Ljava/nio/Buffer;

    .line 152
    const/4 v0, 0x0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->iFrameCount:I

    .line 159
    :cond_0
    monitor-exit v1

    .line 162
    return-void

    .line 159
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
