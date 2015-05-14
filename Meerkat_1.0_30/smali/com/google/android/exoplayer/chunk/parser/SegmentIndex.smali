.class public final Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;
.super Ljava/lang/Object;
.source "SegmentIndex.java"


# instance fields
.field public final durationsUs:[J

.field public final length:I

.field public final offsets:[J

.field public final sizeBytes:I

.field public final sizes:[I

.field public final timesUs:[J


# direct methods
.method public constructor <init>(I[I[J[J[J)V
    .locals 1
    .param p1, "sizeBytes"    # I
    .param p2, "sizes"    # [I
    .param p3, "offsets"    # [J
    .param p4, "durationsUs"    # [J
    .param p5, "timesUs"    # [J

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput p1, p0, Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;->sizeBytes:I

    .line 63
    array-length v0, p2

    iput v0, p0, Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;->length:I

    .line 64
    iput-object p2, p0, Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;->sizes:[I

    .line 65
    iput-object p3, p0, Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;->offsets:[J

    .line 66
    iput-object p4, p0, Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;->durationsUs:[J

    .line 67
    iput-object p5, p0, Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;->timesUs:[J

    .line 68
    return-void
.end method
