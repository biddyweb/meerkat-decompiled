.class final Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource$SmoothStreamingFormat;
.super Lcom/google/android/exoplayer/chunk/Format;
.source "SmoothStreamingChunkSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SmoothStreamingFormat"
.end annotation


# instance fields
.field public final trackIndex:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IIIIII)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "numChannels"    # I
    .param p6, "audioSamplingRate"    # I
    .param p7, "bitrate"    # I
    .param p8, "trackIndex"    # I

    .prologue
    .line 408
    invoke-direct/range {p0 .. p7}, Lcom/google/android/exoplayer/chunk/Format;-><init>(Ljava/lang/String;Ljava/lang/String;IIIII)V

    .line 409
    iput p8, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource$SmoothStreamingFormat;->trackIndex:I

    .line 410
    return-void
.end method
