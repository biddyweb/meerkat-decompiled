.class public final Lcom/google/android/exoplayer/source/DefaultSampleSource;
.super Ljava/lang/Object;
.source "DefaultSampleSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/SampleSource;


# static fields
.field private static final TRACK_STATE_DISABLED:I = 0x0

.field private static final TRACK_STATE_ENABLED:I = 0x1

.field private static final TRACK_STATE_FORMAT_SENT:I = 0x2


# instance fields
.field private pendingDiscontinuities:[Z

.field private prepared:Z

.field private remainingReleaseCount:I

.field private final sampleExtractor:Lcom/google/android/exoplayer/source/SampleExtractor;

.field private seekPositionUs:J

.field private trackInfos:[Lcom/google/android/exoplayer/TrackInfo;

.field private trackStates:[I


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/source/SampleExtractor;I)V
    .locals 1
    .param p1, "sampleExtractor"    # Lcom/google/android/exoplayer/source/SampleExtractor;
    .param p2, "downstreamRendererCount"    # I

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/source/SampleExtractor;

    iput-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->sampleExtractor:Lcom/google/android/exoplayer/source/SampleExtractor;

    .line 54
    iput p2, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->remainingReleaseCount:I

    .line 55
    return-void
.end method

.method private seekToUsInternal(JZ)V
    .locals 5
    .param p1, "positionUs"    # J
    .param p3, "force"    # Z

    .prologue
    .line 154
    if-nez p3, :cond_0

    iget-wide v2, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->seekPositionUs:J

    cmp-long v1, v2, p1

    if-eqz v1, :cond_2

    .line 155
    :cond_0
    iput-wide p1, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->seekPositionUs:J

    .line 156
    iget-object v1, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->sampleExtractor:Lcom/google/android/exoplayer/source/SampleExtractor;

    invoke-interface {v1, p1, p2}, Lcom/google/android/exoplayer/source/SampleExtractor;->seekTo(J)V

    .line 157
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->trackStates:[I

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 158
    iget-object v1, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->trackStates:[I

    aget v1, v1, v0

    if-eqz v1, :cond_1

    .line 159
    iget-object v1, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->pendingDiscontinuities:[Z

    const/4 v2, 0x1

    aput-boolean v2, v1, v0

    .line 157
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 163
    .end local v0    # "i":I
    :cond_2
    return-void
.end method


# virtual methods
.method public continueBuffering(J)Z
    .locals 1
    .param p1, "positionUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    const/4 v0, 0x1

    return v0
.end method

.method public disable(I)V
    .locals 2
    .param p1, "track"    # I

    .prologue
    const/4 v1, 0x0

    .line 96
    iget-boolean v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 97
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->trackStates:[I

    aget v0, v0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 98
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->sampleExtractor:Lcom/google/android/exoplayer/source/SampleExtractor;

    invoke-interface {v0, p1}, Lcom/google/android/exoplayer/source/SampleExtractor;->deselectTrack(I)V

    .line 99
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->pendingDiscontinuities:[Z

    aput-boolean v1, v0, p1

    .line 100
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->trackStates:[I

    aput v1, v0, p1

    .line 101
    return-void

    :cond_0
    move v0, v1

    .line 97
    goto :goto_0
.end method

.method public enable(IJ)V
    .locals 6
    .param p1, "track"    # I
    .param p2, "positionUs"    # J

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 87
    iget-boolean v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 88
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->trackStates:[I

    aget v0, v0, p1

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 89
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->trackStates:[I

    aput v1, v0, p1

    .line 90
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->sampleExtractor:Lcom/google/android/exoplayer/source/SampleExtractor;

    invoke-interface {v0, p1}, Lcom/google/android/exoplayer/source/SampleExtractor;->selectTrack(I)V

    .line 91
    const-wide/16 v4, 0x0

    cmp-long v0, p2, v4

    if-eqz v0, :cond_1

    :goto_1
    invoke-direct {p0, p2, p3, v1}, Lcom/google/android/exoplayer/source/DefaultSampleSource;->seekToUsInternal(JZ)V

    .line 92
    return-void

    :cond_0
    move v0, v2

    .line 88
    goto :goto_0

    :cond_1
    move v1, v2

    .line 91
    goto :goto_1
.end method

.method public getBufferedPositionUs()J
    .locals 2

    .prologue
    .line 139
    iget-boolean v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 140
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->sampleExtractor:Lcom/google/android/exoplayer/source/SampleExtractor;

    invoke-interface {v0}, Lcom/google/android/exoplayer/source/SampleExtractor;->getBufferedPositionUs()J

    move-result-wide v0

    return-wide v0
.end method

.method public getTrackCount()I
    .locals 1

    .prologue
    .line 75
    iget-boolean v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 76
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->trackInfos:[Lcom/google/android/exoplayer/TrackInfo;

    array-length v0, v0

    return v0
.end method

.method public getTrackInfo(I)Lcom/google/android/exoplayer/TrackInfo;
    .locals 1
    .param p1, "track"    # I

    .prologue
    .line 81
    iget-boolean v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 82
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->trackInfos:[Lcom/google/android/exoplayer/TrackInfo;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public prepare()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 59
    iget-boolean v1, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->prepared:Z

    if-eqz v1, :cond_0

    .line 70
    :goto_0
    return v0

    .line 63
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->sampleExtractor:Lcom/google/android/exoplayer/source/SampleExtractor;

    invoke-interface {v1}, Lcom/google/android/exoplayer/source/SampleExtractor;->prepare()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 64
    iput-boolean v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->prepared:Z

    .line 65
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->sampleExtractor:Lcom/google/android/exoplayer/source/SampleExtractor;

    invoke-interface {v0}, Lcom/google/android/exoplayer/source/SampleExtractor;->getTrackInfos()[Lcom/google/android/exoplayer/TrackInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->trackInfos:[Lcom/google/android/exoplayer/TrackInfo;

    .line 66
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->trackInfos:[Lcom/google/android/exoplayer/TrackInfo;

    array-length v0, v0

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->trackStates:[I

    .line 67
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->trackInfos:[Lcom/google/android/exoplayer/TrackInfo;

    array-length v0, v0

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->pendingDiscontinuities:[Z

    .line 70
    :cond_1
    iget-boolean v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->prepared:Z

    goto :goto_0
.end method

.method public readData(IJLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;Z)I
    .locals 3
    .param p1, "track"    # I
    .param p2, "positionUs"    # J
    .param p4, "formatHolder"    # Lcom/google/android/exoplayer/MediaFormatHolder;
    .param p5, "sampleHolder"    # Lcom/google/android/exoplayer/SampleHolder;
    .param p6, "onlyReadDiscontinuity"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x2

    const/4 v1, 0x0

    .line 112
    iget-boolean v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 113
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->trackStates:[I

    aget v0, v0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 114
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->pendingDiscontinuities:[Z

    aget-boolean v0, v0, p1

    if-eqz v0, :cond_1

    .line 115
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->pendingDiscontinuities:[Z

    aput-boolean v1, v0, p1

    .line 116
    const/4 v0, -0x5

    .line 128
    :goto_1
    return v0

    :cond_0
    move v0, v1

    .line 113
    goto :goto_0

    .line 118
    :cond_1
    if-eqz p6, :cond_2

    .line 119
    const/4 v0, -0x2

    goto :goto_1

    .line 121
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->trackStates:[I

    aget v0, v0, p1

    if-eq v0, v2, :cond_3

    .line 122
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->sampleExtractor:Lcom/google/android/exoplayer/source/SampleExtractor;

    invoke-interface {v0, p1, p4}, Lcom/google/android/exoplayer/source/SampleExtractor;->getTrackMediaFormat(ILcom/google/android/exoplayer/MediaFormatHolder;)V

    .line 123
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->trackStates:[I

    aput v2, v0, p1

    .line 124
    const/4 v0, -0x4

    goto :goto_1

    .line 127
    :cond_3
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->seekPositionUs:J

    .line 128
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->sampleExtractor:Lcom/google/android/exoplayer/source/SampleExtractor;

    invoke-interface {v0, p1, p5}, Lcom/google/android/exoplayer/source/SampleExtractor;->readSample(ILcom/google/android/exoplayer/SampleHolder;)I

    move-result v0

    goto :goto_1
.end method

.method public release()V
    .locals 1

    .prologue
    .line 145
    iget v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->remainingReleaseCount:I

    if-lez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 146
    iget v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->remainingReleaseCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->remainingReleaseCount:I

    if-nez v0, :cond_0

    .line 147
    iget-object v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->sampleExtractor:Lcom/google/android/exoplayer/source/SampleExtractor;

    invoke-interface {v0}, Lcom/google/android/exoplayer/source/SampleExtractor;->release()V

    .line 149
    :cond_0
    return-void

    .line 145
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public seekToUs(J)V
    .locals 1
    .param p1, "positionUs"    # J

    .prologue
    .line 133
    iget-boolean v0, p0, Lcom/google/android/exoplayer/source/DefaultSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 134
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/exoplayer/source/DefaultSampleSource;->seekToUsInternal(JZ)V

    .line 135
    return-void
.end method
