.class public interface abstract Lcom/google/android/exoplayer/SampleSource;
.super Ljava/lang/Object;
.source "SampleSource.java"


# static fields
.field public static final DISCONTINUITY_READ:I = -0x5

.field public static final END_OF_STREAM:I = -0x1

.field public static final FORMAT_READ:I = -0x4

.field public static final NOTHING_READ:I = -0x2

.field public static final SAMPLE_READ:I = -0x3


# virtual methods
.method public abstract continueBuffering(J)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract disable(I)V
.end method

.method public abstract enable(IJ)V
.end method

.method public abstract getBufferedPositionUs()J
.end method

.method public abstract getTrackCount()I
.end method

.method public abstract getTrackInfo(I)Lcom/google/android/exoplayer/TrackInfo;
.end method

.method public abstract prepare()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract readData(IJLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;Z)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract release()V
.end method

.method public abstract seekToUs(J)V
.end method
