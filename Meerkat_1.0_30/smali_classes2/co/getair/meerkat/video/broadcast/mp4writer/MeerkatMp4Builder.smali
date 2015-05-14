.class public Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;
.super Ljava/lang/Object;
.source "MeerkatMp4Builder.java"


# static fields
.field public static final AUDIO_TICK:I = 0x400

.field public static final AUDIO_TRACK_TIMESCALE:I = 0xac44

.field public static final CHUNK_AFTER_SECONDS:D = 1.0

.field private static final TAG:Ljava/lang/String; = "MeerkatMp4Builder"

.field public static final VIDEO_FPS:I = 0x1e

.field public static final VIDEO_TICK:I = 0xbcc

.field public static final VIDEO_TRACK_TIMESCALE:I = 0x15f90


# instance fields
.field private baseFileOffset:J

.field public chunkIndex:I

.field private currentAudioDuration:J

.field private currentAudioSamples:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

.field private currentIFrameCount:I

.field private currentVideoDuration:J

.field private currentVideoSamples:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

.field private didWriteHeader:Z

.field private durationsBuffer:[J

.field private isStopped:Z

.field private lastAudioTime:J

.field private lastVideoTime:J

.field private outStream:Ljava/io/OutputStream;

.field private parametersSets:[B

.field private puddle:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

.field private totalAudioDuration:J

.field private totalVideoDuration:J


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 6
    .param p1, "outputStream"    # Ljava/io/OutputStream;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const-wide/16 v2, 0x0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-boolean v4, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->isStopped:Z

    .line 49
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    invoke-direct {v0, v5, v4}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;-><init>(II)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentVideoSamples:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    .line 50
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    const/4 v1, 0x2

    invoke-direct {v0, v1, v4}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;-><init>(II)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentAudioSamples:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    .line 52
    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentVideoDuration:J

    .line 53
    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentAudioDuration:J

    .line 54
    iput v4, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentIFrameCount:I

    .line 55
    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->baseFileOffset:J

    .line 57
    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->totalVideoDuration:J

    .line 58
    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->totalAudioDuration:J

    .line 59
    iput v4, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->chunkIndex:I

    .line 60
    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->lastAudioTime:J

    .line 61
    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->lastVideoTime:J

    .line 62
    const/16 v0, 0x3e8

    new-array v0, v0, [J

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->durationsBuffer:[J

    .line 63
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->outStream:Ljava/io/OutputStream;

    .line 65
    new-instance v0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    invoke-direct {v0, v5}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;-><init>(I)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->puddle:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    .line 66
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->puddle:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    invoke-virtual {v0, v5}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->setPriority(I)V

    .line 69
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;)Z
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    .prologue
    .line 13
    iget-boolean v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->isStopped:Z

    return v0
.end method

.method static synthetic access$002(Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;Z)Z
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;
    .param p1, "x1"    # Z

    .prologue
    .line 13
    iput-boolean p1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->isStopped:Z

    return p1
.end method

.method static synthetic access$100(Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;)Ljava/io/OutputStream;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    .prologue
    .line 13
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->outStream:Ljava/io/OutputStream;

    return-object v0
.end method

.method private resetChunks()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    .line 86
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    const/4 v1, 0x1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->chunkIndex:I

    add-int/lit8 v2, v2, 0x1

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;-><init>(II)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentVideoSamples:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    .line 87
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    const/4 v1, 0x2

    iget v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->chunkIndex:I

    add-int/lit8 v2, v2, 0x1

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;-><init>(II)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentAudioSamples:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    .line 89
    iput-wide v4, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentVideoDuration:J

    .line 90
    iput-wide v4, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentAudioDuration:J

    .line 92
    const/4 v0, 0x0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentIFrameCount:I

    .line 93
    return-void
.end method

.method private streamChunk([B)V
    .locals 1
    .param p1, "chunk"    # [B

    .prologue
    .line 147
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->streamChunk([BZ)V

    .line 148
    return-void
.end method

.method private streamChunk([BZ)V
    .locals 4
    .param p1, "chunk"    # [B
    .param p2, "endStream"    # Z

    .prologue
    .line 151
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->puddle:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    new-instance v1, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder$1;

    invoke-direct {v1, p0, p1, p2}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder$1;-><init>(Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;[BZ)V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->run(Ljava/lang/Runnable;)V

    .line 171
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->baseFileOffset:J

    array-length v2, p1

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->baseFileOffset:J

    .line 173
    return-void
.end method

.method private writeChunk()V
    .locals 12

    .prologue
    const/4 v9, 0x0

    .line 126
    const-string v4, "MeerkatMp4Builder"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Video Duration "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->totalVideoDuration:J

    long-to-double v6, v6

    const-wide v10, 0x40f5f90000000000L    # 90000.0

    div-double/2addr v6, v10

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    const-string v4, "MeerkatMp4Builder"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Audio Duration "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->totalAudioDuration:J

    long-to-double v6, v6

    const-wide v10, 0x40e5888000000000L    # 44100.0

    div-double/2addr v6, v10

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentVideoSamples:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    .line 130
    .local v1, "videoSamples":Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentAudioSamples:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    .line 132
    .local v3, "audioSamples":Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->durationsBuffer:[J

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getSampleCount()I

    move-result v5

    invoke-static {v4, v9, v5}, Ljava/util/Arrays;->copyOfRange([JII)[J

    move-result-object v2

    .line 134
    .local v2, "decodeDurations":[J
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->resetChunks()V

    .line 136
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->parametersSets:[B

    iget v5, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->chunkIndex:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->chunkIndex:I

    iget-wide v6, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->baseFileOffset:J

    invoke-static/range {v1 .. v7}, Lco/getair/meerkat/video/broadcast/mp4writer/BoxWriter;->getFragment(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;[JLco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;[BIJ)Ljava/util/List;

    move-result-object v8

    .line 138
    .local v8, "fragmentParts":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 139
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    const-string v5, "MeerkatMp4Builder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Writing Box "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getType()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " size "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getSize()J

    move-result-wide v10

    invoke-virtual {v6, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/mp4writer/BoxWriter;->getBytes(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)[B

    move-result-object v5

    invoke-direct {p0, v5, v9}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->streamChunk([BZ)V

    goto :goto_0

    .line 142
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :cond_0
    const-string v4, "MeerkatMp4Builder"

    const-string v5, "Writing Fragment Done"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    return-void
.end method

.method private writeHeader()V
    .locals 12

    .prologue
    .line 104
    const-string v5, "MeerkatMp4Builder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Writing Chunk audio duration "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v8, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentAudioDuration:J

    long-to-double v8, v8

    const-wide v10, 0x40e5888000000000L    # 44100.0

    div-double/2addr v8, v10

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " video duration "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v8, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentVideoDuration:J

    long-to-double v8, v8

    const-wide v10, 0x40f5f90000000000L    # 90000.0

    div-double/2addr v8, v10

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentVideoSamples:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    .line 107
    .local v4, "videoSamples":Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentAudioSamples:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    .line 108
    .local v0, "audioSamples":Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->durationsBuffer:[J

    const/4 v6, 0x0

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getSampleCount()I

    move-result v7

    invoke-static {v5, v6, v7}, Ljava/util/Arrays;->copyOfRange([JII)[J

    move-result-object v2

    .line 110
    .local v2, "decodeDurations":[J
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->resetChunks()V

    .line 111
    iget v5, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->chunkIndex:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->chunkIndex:I

    .line 112
    const/4 v5, 0x1

    iput-boolean v5, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->didWriteHeader:Z

    .line 114
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->parametersSets:[B

    invoke-static {v4, v2, v0, v5}, Lco/getair/meerkat/video/broadcast/mp4writer/BoxWriter;->getFirstChunk(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;[JLco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;[B)Ljava/util/List;

    move-result-object v3

    .line 115
    .local v3, "firstChunkBoxes":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 116
    .local v1, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    const-string v6, "MeerkatMp4Builder"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Writing Box "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getType()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " size "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getSize()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/mp4writer/BoxWriter;->getBytes(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)[B

    move-result-object v6

    invoke-direct {p0, v6}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->streamChunk([B)V

    goto :goto_0

    .line 120
    .end local v1    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :cond_0
    return-void
.end method


# virtual methods
.method public createRecoveryBuilder(Ljava/io/OutputStream;)Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;
    .locals 2
    .param p1, "outStream"    # Ljava/io/OutputStream;

    .prologue
    .line 97
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    invoke-direct {v0, p1}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;-><init>(Ljava/io/OutputStream;)V

    .line 98
    .local v0, "builder":Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->parametersSets:[B

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->setParametersSets([B)V

    .line 100
    return-object v0
.end method

.method public finishStreaming()V
    .locals 2

    .prologue
    .line 249
    const/16 v0, 0x18

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->streamChunk([BZ)V

    .line 259
    return-void

    .line 249
    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x8t
        0x77t
        0x69t
        0x64t
        0x65t
        0x0t
        0x0t
        0x0t
        0x8t
        0x77t
        0x69t
        0x64t
        0x65t
        0x0t
        0x0t
        0x0t
        0x8t
        0x77t
        0x69t
        0x64t
        0x65t
    .end array-data
.end method

.method public processAudioSample(Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;)V
    .locals 12
    .param p1, "sample"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;

    .prologue
    const-wide/16 v10, 0x400

    const-wide v8, 0x412e848000000000L    # 1000000.0

    .line 176
    iget-object v4, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->info:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v4, v4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    long-to-double v4, v4

    div-double/2addr v4, v8

    iget-wide v6, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->lastAudioTime:J

    long-to-double v6, v6

    div-double/2addr v6, v8

    sub-double/2addr v4, v6

    const-wide v6, 0x40e5888000000000L    # 44100.0

    mul-double v0, v4, v6

    .line 177
    .local v0, "accurateDuration":D
    double-to-long v2, v0

    .line 178
    .local v2, "duration":J
    iget-wide v4, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->lastAudioTime:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    .line 179
    const-wide/16 v2, 0x400

    .line 181
    :cond_0
    const/16 v4, 0x400

    iput v4, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->duration:I

    .line 182
    iget-wide v4, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentAudioDuration:J

    add-long/2addr v4, v10

    iput-wide v4, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentAudioDuration:J

    .line 183
    iget-wide v4, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->totalAudioDuration:J

    add-long/2addr v4, v10

    iput-wide v4, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->totalAudioDuration:J

    .line 185
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentAudioSamples:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    invoke-virtual {v4, p1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->addSample(Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;)V

    .line 186
    iget-object v4, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->info:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v4, v4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iput-wide v4, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->lastAudioTime:J

    .line 188
    return-void
.end method

.method public processVideoSample(Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;)V
    .locals 12
    .param p1, "sample"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;

    .prologue
    .line 191
    iget-object v5, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->limit()I

    move-result v5

    const/4 v6, 0x4

    if-le v5, v6, :cond_5

    .line 193
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->getType()I

    move-result v4

    .line 195
    .local v4, "type":I
    iget-object v5, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->info:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v6, v5, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    long-to-double v6, v6

    const-wide v8, 0x412e848000000000L    # 1000000.0

    div-double/2addr v6, v8

    iget-wide v8, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->lastVideoTime:J

    long-to-double v8, v8

    const-wide v10, 0x412e848000000000L    # 1000000.0

    div-double/2addr v8, v10

    sub-double/2addr v6, v8

    const-wide v8, 0x40f5f90000000000L    # 90000.0

    mul-double v0, v6, v8

    .line 197
    .local v0, "accurateDuration":D
    double-to-long v2, v0

    .line 198
    .local v2, "duration":J
    iget-wide v6, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->lastVideoTime:J

    const-wide/16 v8, 0x0

    cmp-long v5, v6, v8

    if-eqz v5, :cond_0

    const-wide/16 v6, 0x0

    cmp-long v5, v2, v6

    if-gez v5, :cond_1

    .line 199
    :cond_0
    const-wide/16 v2, 0xbcc

    .line 201
    :cond_1
    long-to-int v5, v2

    iput v5, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->duration:I

    .line 203
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->durationsBuffer:[J

    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentVideoSamples:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    invoke-virtual {v6}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getSampleCount()I

    move-result v6

    aput-wide v2, v5, v6

    .line 204
    iget-wide v6, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->totalVideoDuration:J

    add-long/2addr v6, v2

    iput-wide v6, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->totalVideoDuration:J

    .line 206
    const/4 v5, 0x1

    if-eq v4, v5, :cond_2

    const/4 v5, 0x5

    if-ne v4, v5, :cond_4

    .line 207
    :cond_2
    const/4 v5, 0x5

    if-ne v4, v5, :cond_3

    .line 208
    iget v5, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentIFrameCount:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentIFrameCount:I

    .line 211
    :cond_3
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentVideoSamples:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    invoke-virtual {v5, p1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->addSample(Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;)V

    .line 212
    iget-wide v6, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentVideoDuration:J

    add-long/2addr v6, v2

    iput-wide v6, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentVideoDuration:J

    .line 213
    iget-object v5, p1, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->info:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v6, v5, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iput-wide v6, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->lastVideoTime:J

    .line 216
    :cond_4
    iget-wide v6, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentVideoDuration:J

    long-to-double v6, v6

    const-wide v8, 0x40f5f90000000000L    # 90000.0

    cmpl-double v5, v6, v8

    if-lez v5, :cond_5

    .line 217
    iget-boolean v5, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->didWriteHeader:Z

    if-nez v5, :cond_6

    .line 218
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->writeHeader()V

    .line 227
    .end local v0    # "accurateDuration":D
    .end local v2    # "duration":J
    .end local v4    # "type":I
    :cond_5
    :goto_0
    return-void

    .line 220
    .restart local v0    # "accurateDuration":D
    .restart local v2    # "duration":J
    .restart local v4    # "type":I
    :cond_6
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->writeChunk()V

    goto :goto_0
.end method

.method public setParametersSets([B)V
    .locals 2
    .param p1, "readyPPSSPSHeader"    # [B

    .prologue
    .line 72
    array-length v1, p1

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 73
    .local v0, "header":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 74
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->parametersSets:[B

    .line 75
    return-void
.end method

.method public setParametersSets([B[B)V
    .locals 3
    .param p1, "pps"    # [B
    .param p2, "sps"    # [B

    .prologue
    .line 78
    array-length v1, p1

    array-length v2, p2

    add-int/2addr v1, v2

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 79
    .local v0, "header":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 80
    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 81
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->parametersSets:[B

    .line 82
    return-void
.end method

.method public stop()V
    .locals 3

    .prologue
    .line 234
    :try_start_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentAudioSamples:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->release()V

    .line 235
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->currentVideoSamples:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->release()V

    .line 236
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->resetChunks()V

    .line 239
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->outStream:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 246
    :goto_0
    return-void

    .line 242
    :catch_0
    move-exception v0

    .line 244
    .local v0, "e":Ljava/lang/Throwable;
    const-string v1, "MeerkatMp4Builder"

    const-string v2, "Error: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
