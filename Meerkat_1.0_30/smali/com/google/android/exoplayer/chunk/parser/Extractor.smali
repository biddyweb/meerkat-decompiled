.class public interface abstract Lcom/google/android/exoplayer/chunk/parser/Extractor;
.super Ljava/lang/Object;
.source "Extractor.java"


# static fields
.field public static final RESULT_END_OF_STREAM:I = 0x2

.field public static final RESULT_NEED_MORE_DATA:I = 0x1

.field public static final RESULT_NEED_SAMPLE_HOLDER:I = 0x20

.field public static final RESULT_READ_INDEX:I = 0x10

.field public static final RESULT_READ_INIT:I = 0x8

.field public static final RESULT_READ_SAMPLE:I = 0x4


# virtual methods
.method public abstract getDurationUs()J
.end method

.method public abstract getFormat()Lcom/google/android/exoplayer/MediaFormat;
.end method

.method public abstract getIndex()Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;
.end method

.method public abstract getPsshInfo()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "[B>;"
        }
    .end annotation
.end method

.method public abstract hasRelativeIndexOffsets()Z
.end method

.method public abstract read(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;Lcom/google/android/exoplayer/SampleHolder;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation
.end method

.method public abstract seekTo(JZ)Z
.end method
