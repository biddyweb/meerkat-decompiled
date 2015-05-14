.class final Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;
.super Ljava/lang/Object;
.source "H264Reader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/hls/parser/H264Reader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NalUnitTargetBuffer"
.end annotation


# instance fields
.field private isCompleted:Z

.field private isFilling:Z

.field public nalData:[B

.field public nalLength:I

.field private final targetType:I


# direct methods
.method public constructor <init>(II)V
    .locals 3
    .param p1, "targetType"    # I
    .param p2, "initialCapacity"    # I

    .prologue
    .line 313
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 314
    iput p1, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->targetType:I

    .line 316
    add-int/lit8 v0, p2, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalData:[B

    .line 317
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalData:[B

    const/4 v1, 0x2

    const/4 v2, 0x1

    aput-byte v2, v0, v1

    .line 318
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalData:[B

    const/4 v1, 0x3

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 319
    return-void
.end method


# virtual methods
.method public appendToNalUnit([BII)V
    .locals 3
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "limit"    # I

    .prologue
    .line 348
    iget-boolean v1, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->isFilling:Z

    if-nez v1, :cond_0

    .line 357
    :goto_0
    return-void

    .line 351
    :cond_0
    sub-int v0, p3, p2

    .line 352
    .local v0, "readLength":I
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalData:[B

    array-length v1, v1

    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalLength:I

    add-int/2addr v2, v0

    if-ge v1, v2, :cond_1

    .line 353
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalData:[B

    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalLength:I

    add-int/2addr v2, v0

    mul-int/lit8 v2, v2, 0x2

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalData:[B

    .line 355
    :cond_1
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalData:[B

    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalLength:I

    invoke-static {p1, p2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 356
    iget v1, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalLength:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalLength:I

    goto :goto_0
.end method

.method public endNalUnit(I)Z
    .locals 3
    .param p1, "discardPadding"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 367
    iget-boolean v2, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->isFilling:Z

    if-nez v2, :cond_0

    .line 373
    :goto_0
    return v0

    .line 370
    :cond_0
    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalLength:I

    sub-int/2addr v2, p1

    iput v2, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalLength:I

    .line 371
    iput-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->isFilling:Z

    .line 372
    iput-boolean v1, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->isCompleted:Z

    move v0, v1

    .line 373
    goto :goto_0
.end method

.method public isCompleted()Z
    .locals 1

    .prologue
    .line 322
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->isCompleted:Z

    return v0
.end method

.method public startNalUnit(I)V
    .locals 3
    .param p1, "type"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 331
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->isFilling:Z

    if-nez v0, :cond_1

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 332
    iget v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->targetType:I

    if-ne p1, v0, :cond_2

    :goto_1
    iput-boolean v1, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->isFilling:Z

    .line 333
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->isFilling:Z

    if-eqz v0, :cond_0

    .line 335
    const/4 v0, 0x4

    iput v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalLength:I

    .line 336
    iput-boolean v2, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->isCompleted:Z

    .line 338
    :cond_0
    return-void

    :cond_1
    move v0, v2

    .line 331
    goto :goto_0

    :cond_2
    move v1, v2

    .line 332
    goto :goto_1
.end method
