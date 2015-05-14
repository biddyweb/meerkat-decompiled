.class public final Lcom/google/android/exoplayer/hls/Variant;
.super Ljava/lang/Object;
.source "Variant.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/hls/Variant$DecreasingBandwidthComparator;
    }
.end annotation


# instance fields
.field public final bandwidth:I

.field public final codecs:[Ljava/lang/String;

.field public final height:I

.field public final index:I

.field public final url:Ljava/lang/String;

.field public final width:I


# direct methods
.method public constructor <init>(ILjava/lang/String;I[Ljava/lang/String;II)V
    .locals 0
    .param p1, "index"    # I
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "bandwidth"    # I
    .param p4, "codecs"    # [Ljava/lang/String;
    .param p5, "width"    # I
    .param p6, "height"    # I

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput p1, p0, Lcom/google/android/exoplayer/hls/Variant;->index:I

    .line 49
    iput p3, p0, Lcom/google/android/exoplayer/hls/Variant;->bandwidth:I

    .line 50
    iput-object p2, p0, Lcom/google/android/exoplayer/hls/Variant;->url:Ljava/lang/String;

    .line 51
    iput-object p4, p0, Lcom/google/android/exoplayer/hls/Variant;->codecs:[Ljava/lang/String;

    .line 52
    iput p5, p0, Lcom/google/android/exoplayer/hls/Variant;->width:I

    .line 53
    iput p6, p0, Lcom/google/android/exoplayer/hls/Variant;->height:I

    .line 54
    return-void
.end method
