.class public interface abstract Lcom/google/android/exoplayer/source/SampleExtractor;
.super Ljava/lang/Object;
.source "SampleExtractor.java"


# virtual methods
.method public abstract deselectTrack(I)V
.end method

.method public abstract getBufferedPositionUs()J
.end method

.method public abstract getTrackInfos()[Lcom/google/android/exoplayer/TrackInfo;
.end method

.method public abstract getTrackMediaFormat(ILcom/google/android/exoplayer/MediaFormatHolder;)V
.end method

.method public abstract prepare()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract readSample(ILcom/google/android/exoplayer/SampleHolder;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract release()V
.end method

.method public abstract seekTo(J)V
.end method

.method public abstract selectTrack(I)V
.end method
