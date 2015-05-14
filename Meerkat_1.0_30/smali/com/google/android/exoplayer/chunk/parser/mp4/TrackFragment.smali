.class final Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;
.super Ljava/lang/Object;
.source "TrackFragment.java"


# instance fields
.field public definesEncryptionData:Z

.field public length:I

.field public sampleCompositionTimeOffsetTable:[I

.field public sampleDecodingTimeTable:[J

.field public sampleDescriptionIndex:I

.field public sampleEncryptionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field public sampleEncryptionDataLength:I

.field public sampleEncryptionDataNeedsFill:Z

.field public sampleHasSubsampleEncryptionTable:[Z

.field public sampleIsSyncFrameTable:[Z

.field public sampleSizeTable:[I


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fillEncryptionData(Lcom/google/android/exoplayer/util/ParsableByteArray;)V
    .locals 3
    .param p1, "source"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    const/4 v2, 0x0

    .line 130
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleEncryptionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleEncryptionDataLength:I

    invoke-virtual {p1, v0, v2, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 131
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleEncryptionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 132
    iput-boolean v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleEncryptionDataNeedsFill:Z

    .line 133
    return-void
.end method

.method public fillEncryptionData(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)Z
    .locals 6
    .param p1, "source"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;

    .prologue
    const/4 v0, 0x0

    .line 142
    invoke-interface {p1}, Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;->getAvailableByteCount()J

    move-result-wide v2

    iget v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleEncryptionDataLength:I

    int-to-long v4, v1

    cmp-long v1, v2, v4

    if-gez v1, :cond_0

    .line 148
    :goto_0
    return v0

    .line 145
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleEncryptionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v1, v1, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleEncryptionDataLength:I

    invoke-interface {p1, v1, v0, v2}, Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;->read([BII)I

    .line 146
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleEncryptionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 147
    iput-boolean v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleEncryptionDataNeedsFill:Z

    .line 148
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getSamplePresentationTime(I)J
    .locals 4
    .param p1, "index"    # I

    .prologue
    .line 152
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleDecodingTimeTable:[J

    aget-wide v0, v0, p1

    iget-object v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleCompositionTimeOffsetTable:[I

    aget v2, v2, p1

    int-to-long v2, v2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public initEncryptionData(I)V
    .locals 2
    .param p1, "length"    # I

    .prologue
    const/4 v1, 0x1

    .line 116
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleEncryptionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleEncryptionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v0

    if-ge v0, p1, :cond_1

    .line 117
    :cond_0
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v0, p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleEncryptionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 119
    :cond_1
    iput p1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleEncryptionDataLength:I

    .line 120
    iput-boolean v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->definesEncryptionData:Z

    .line 121
    iput-boolean v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleEncryptionDataNeedsFill:Z

    .line 122
    return-void
.end method

.method public initTables(I)V
    .locals 3
    .param p1, "sampleCount"    # I

    .prologue
    .line 93
    iput p1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->length:I

    .line 94
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleSizeTable:[I

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleSizeTable:[I

    array-length v1, v1

    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->length:I

    if-ge v1, v2, :cond_1

    .line 97
    :cond_0
    mul-int/lit8 v1, p1, 0x7d

    div-int/lit8 v0, v1, 0x64

    .line 98
    .local v0, "tableSize":I
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleSizeTable:[I

    .line 99
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleCompositionTimeOffsetTable:[I

    .line 100
    new-array v1, v0, [J

    iput-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleDecodingTimeTable:[J

    .line 101
    new-array v1, v0, [Z

    iput-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleIsSyncFrameTable:[Z

    .line 102
    new-array v1, v0, [Z

    iput-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleHasSubsampleEncryptionTable:[Z

    .line 104
    .end local v0    # "tableSize":I
    :cond_1
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 79
    iput v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->length:I

    .line 80
    iput-boolean v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->definesEncryptionData:Z

    .line 81
    iput-boolean v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleEncryptionDataNeedsFill:Z

    .line 82
    return-void
.end method
