.class public Lcom/google/android/exoplayer/chunk/FormatEvaluator$FixedEvaluator;
.super Ljava/lang/Object;
.source "FormatEvaluator.java"

# interfaces
.implements Lcom/google/android/exoplayer/chunk/FormatEvaluator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/chunk/FormatEvaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FixedEvaluator"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public disable()V
    .locals 0

    .prologue
    .line 114
    return-void
.end method

.method public enable()V
    .locals 0

    .prologue
    .line 109
    return-void
.end method

.method public evaluate(Ljava/util/List;J[Lcom/google/android/exoplayer/chunk/Format;Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;)V
    .locals 1
    .param p2, "playbackPositionUs"    # J
    .param p4, "formats"    # [Lcom/google/android/exoplayer/chunk/Format;
    .param p5, "evaluation"    # Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/exoplayer/chunk/MediaChunk;",
            ">;J[",
            "Lcom/google/android/exoplayer/chunk/Format;",
            "Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;",
            ")V"
        }
    .end annotation

    .prologue
    .line 119
    .local p1, "queue":Ljava/util/List;, "Ljava/util/List<+Lcom/google/android/exoplayer/chunk/MediaChunk;>;"
    const/4 v0, 0x0

    aget-object v0, p4, v0

    iput-object v0, p5, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->format:Lcom/google/android/exoplayer/chunk/Format;

    .line 120
    return-void
.end method
