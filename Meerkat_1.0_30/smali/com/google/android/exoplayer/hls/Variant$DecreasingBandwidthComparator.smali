.class public final Lcom/google/android/exoplayer/hls/Variant$DecreasingBandwidthComparator;
.super Ljava/lang/Object;
.source "Variant.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/hls/Variant;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DecreasingBandwidthComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/google/android/exoplayer/hls/Variant;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/google/android/exoplayer/hls/Variant;Lcom/google/android/exoplayer/hls/Variant;)I
    .locals 3
    .param p1, "a"    # Lcom/google/android/exoplayer/hls/Variant;
    .param p2, "b"    # Lcom/google/android/exoplayer/hls/Variant;

    .prologue
    .line 34
    iget v1, p2, Lcom/google/android/exoplayer/hls/Variant;->bandwidth:I

    iget v2, p1, Lcom/google/android/exoplayer/hls/Variant;->bandwidth:I

    sub-int v0, v1, v2

    .line 35
    .local v0, "bandwidthDifference":I
    if-eqz v0, :cond_0

    .end local v0    # "bandwidthDifference":I
    :goto_0
    return v0

    .restart local v0    # "bandwidthDifference":I
    :cond_0
    iget v1, p1, Lcom/google/android/exoplayer/hls/Variant;->index:I

    iget v2, p2, Lcom/google/android/exoplayer/hls/Variant;->index:I

    sub-int v0, v1, v2

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 30
    check-cast p1, Lcom/google/android/exoplayer/hls/Variant;

    check-cast p2, Lcom/google/android/exoplayer/hls/Variant;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer/hls/Variant$DecreasingBandwidthComparator;->compare(Lcom/google/android/exoplayer/hls/Variant;Lcom/google/android/exoplayer/hls/Variant;)I

    move-result v0

    return v0
.end method
