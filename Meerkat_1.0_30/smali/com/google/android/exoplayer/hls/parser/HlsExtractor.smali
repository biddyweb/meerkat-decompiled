.class public abstract Lcom/google/android/exoplayer/hls/parser/HlsExtractor;
.super Ljava/lang/Object;
.source "HlsExtractor.java"


# instance fields
.field private final shouldSpliceIn:Z

.field private spliceConfigured:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0
    .param p1, "shouldSpliceIn"    # Z

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-boolean p1, p0, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->shouldSpliceIn:Z

    .line 37
    return-void
.end method


# virtual methods
.method public final configureSpliceTo(Lcom/google/android/exoplayer/hls/parser/HlsExtractor;)V
    .locals 5
    .param p1, "nextExtractor"    # Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

    .prologue
    .line 54
    iget-boolean v3, p0, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->spliceConfigured:Z

    if-nez v3, :cond_0

    iget-boolean v3, p1, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->shouldSpliceIn:Z

    if-eqz v3, :cond_0

    invoke-virtual {p1}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->isPrepared()Z

    move-result v3

    if-nez v3, :cond_1

    .line 65
    :cond_0
    :goto_0
    return-void

    .line 59
    :cond_1
    const/4 v1, 0x1

    .line 60
    .local v1, "spliceConfigured":Z
    invoke-virtual {p0}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->getTrackCount()I

    move-result v2

    .line 61
    .local v2, "trackCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v2, :cond_2

    .line 62
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->getSampleQueue(I)Lcom/google/android/exoplayer/hls/parser/SampleQueue;

    move-result-object v3

    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->getSampleQueue(I)Lcom/google/android/exoplayer/hls/parser/SampleQueue;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->configureSpliceTo(Lcom/google/android/exoplayer/hls/parser/SampleQueue;)Z

    move-result v3

    and-int/2addr v1, v3

    .line 61
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 64
    :cond_2
    iput-boolean v1, p0, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->spliceConfigured:Z

    goto :goto_0
.end method

.method public abstract discardUntil(IJ)V
.end method

.method public abstract getFormat(I)Lcom/google/android/exoplayer/MediaFormat;
.end method

.method public abstract getLargestSampleTimestamp()J
.end method

.method public abstract getSample(ILcom/google/android/exoplayer/SampleHolder;)Z
.end method

.method protected abstract getSampleQueue(I)Lcom/google/android/exoplayer/hls/parser/SampleQueue;
.end method

.method public abstract getTrackCount()I
.end method

.method public abstract hasSamples(I)Z
.end method

.method public abstract isPrepared()Z
.end method

.method public abstract read(Lcom/google/android/exoplayer/upstream/DataSource;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract release()V
.end method
