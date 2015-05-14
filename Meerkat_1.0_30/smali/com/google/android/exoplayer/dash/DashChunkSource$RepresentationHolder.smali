.class Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
.super Ljava/lang/Object;
.source "DashChunkSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/dash/DashChunkSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RepresentationHolder"
.end annotation


# instance fields
.field public final extractor:Lcom/google/android/exoplayer/chunk/parser/Extractor;

.field public final representation:Lcom/google/android/exoplayer/dash/mpd/Representation;

.field public segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

.field public segmentNumShift:I

.field public vttHeader:[B

.field public vttHeaderOffsetUs:J


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/dash/mpd/Representation;Lcom/google/android/exoplayer/chunk/parser/Extractor;)V
    .locals 1
    .param p1, "representation"    # Lcom/google/android/exoplayer/dash/mpd/Representation;
    .param p2, "extractor"    # Lcom/google/android/exoplayer/chunk/parser/Extractor;

    .prologue
    .line 591
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 592
    iput-object p1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->representation:Lcom/google/android/exoplayer/dash/mpd/Representation;

    .line 593
    iput-object p2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->extractor:Lcom/google/android/exoplayer/chunk/parser/Extractor;

    .line 594
    invoke-virtual {p1}, Lcom/google/android/exoplayer/dash/mpd/Representation;->getIndex()Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    .line 595
    return-void
.end method
