.class public final Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;
.super Ljava/lang/Object;
.source "ByteArrayNonBlockingInputStream.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;


# instance fields
.field private final data:[B

.field private position:I


# direct methods
.method public constructor <init>([B)V
    .locals 1
    .param p1, "data"    # [B

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->data:[B

    .line 33
    return-void
.end method

.method private getReadLength(I)I
    .locals 2
    .param p1, "requestedLength"    # I

    .prologue
    .line 80
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->data:[B

    array-length v0, v0

    iget v1, p0, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->position:I

    sub-int/2addr v0, v1

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 77
    return-void
.end method

.method public getAvailableByteCount()J
    .locals 2

    .prologue
    .line 66
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->data:[B

    array-length v0, v0

    iget v1, p0, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->position:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    return-wide v0
.end method

.method public isEndOfStream()Z
    .locals 2

    .prologue
    .line 71
    iget v0, p0, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->position:I

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->data:[B

    array-length v1, v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public read(Ljava/nio/ByteBuffer;I)I
    .locals 3
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "length"    # I

    .prologue
    .line 55
    invoke-virtual {p0}, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->isEndOfStream()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 56
    const/4 v0, -0x1

    .line 61
    :goto_0
    return v0

    .line 58
    :cond_0
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->getReadLength(I)I

    move-result v0

    .line 59
    .local v0, "readLength":I
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->position:I

    invoke-virtual {p1, v1, v2, v0}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 60
    iget v1, p0, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->position:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->position:I

    goto :goto_0
.end method

.method public read([BII)I
    .locals 3
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 44
    invoke-virtual {p0}, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->isEndOfStream()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 45
    const/4 v0, -0x1

    .line 50
    :goto_0
    return v0

    .line 47
    :cond_0
    invoke-direct {p0, p3}, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->getReadLength(I)I

    move-result v0

    .line 48
    .local v0, "readLength":I
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->position:I

    invoke-static {v1, v2, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 49
    iget v1, p0, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->position:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->position:I

    goto :goto_0
.end method

.method public skip(I)I
    .locals 2
    .param p1, "length"    # I

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->getReadLength(I)I

    move-result v0

    .line 38
    .local v0, "skipLength":I
    iget v1, p0, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->position:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/android/exoplayer/upstream/ByteArrayNonBlockingInputStream;->position:I

    .line 39
    return v0
.end method
