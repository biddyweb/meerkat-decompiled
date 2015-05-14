.class public Lcom/google/android/exoplayer/chunk/FormatEvaluator$RandomEvaluator;
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
    name = "RandomEvaluator"
.end annotation


# instance fields
.field private final random:Ljava/util/Random;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$RandomEvaluator;->random:Ljava/util/Random;

    .line 133
    return-void
.end method


# virtual methods
.method public disable()V
    .locals 0

    .prologue
    .line 143
    return-void
.end method

.method public enable()V
    .locals 0

    .prologue
    .line 138
    return-void
.end method

.method public evaluate(Ljava/util/List;J[Lcom/google/android/exoplayer/chunk/Format;Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;)V
    .locals 3
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
    .line 148
    .local p1, "queue":Ljava/util/List;, "Ljava/util/List<+Lcom/google/android/exoplayer/chunk/MediaChunk;>;"
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$RandomEvaluator;->random:Ljava/util/Random;

    array-length v2, p4

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    aget-object v0, p4, v1

    .line 149
    .local v0, "newFormat":Lcom/google/android/exoplayer/chunk/Format;
    iget-object v1, p5, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->format:Lcom/google/android/exoplayer/chunk/Format;

    if-eqz v1, :cond_0

    iget-object v1, p5, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v1, v1, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    iget-object v2, v0, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 150
    const/4 v1, 0x2

    iput v1, p5, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->trigger:I

    .line 152
    :cond_0
    iput-object v0, p5, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->format:Lcom/google/android/exoplayer/chunk/Format;

    .line 153
    return-void
.end method
