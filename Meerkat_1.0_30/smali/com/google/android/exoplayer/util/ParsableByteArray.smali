.class public final Lcom/google/android/exoplayer/util/ParsableByteArray;
.super Ljava/lang/Object;
.source "ParsableByteArray.java"


# instance fields
.field public data:[B

.field private limit:I

.field private position:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "length"    # I

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-array v0, p1, [B

    iput-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 37
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    array-length v0, v0

    iput v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    .line 38
    return-void
.end method

.method public constructor <init>([BI)V
    .locals 0
    .param p1, "data"    # [B
    .param p2, "limit"    # I

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 48
    iput p2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    .line 49
    return-void
.end method

.method private static shiftIntoInt([BII)I
    .locals 3
    .param p0, "bytes"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 248
    aget-byte v2, p0, p1

    and-int/lit16 v1, v2, 0xff

    .line 249
    .local v1, "result":I
    add-int/lit8 v0, p1, 0x1

    .local v0, "i":I
    :goto_0
    add-int v2, p1, p2

    if-ge v0, v2, :cond_0

    .line 250
    shl-int/lit8 v1, v1, 0x8

    .line 251
    aget-byte v2, p0, v0

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    .line 249
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 253
    :cond_0
    return v1
.end method

.method private static shiftIntoLong([BII)J
    .locals 6
    .param p0, "bytes"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 258
    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    int-to-long v2, v1

    .line 259
    .local v2, "result":J
    add-int/lit8 v0, p1, 0x1

    .local v0, "i":I
    :goto_0
    add-int v1, p1, p2

    if-ge v0, v1, :cond_0

    .line 260
    const/16 v1, 0x8

    shl-long/2addr v2, v1

    .line 261
    aget-byte v1, p0, v0

    and-int/lit16 v1, v1, 0xff

    int-to-long v4, v1

    or-long/2addr v2, v4

    .line 259
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 263
    :cond_0
    return-wide v2
.end method


# virtual methods
.method public bytesLeft()I
    .locals 2

    .prologue
    .line 73
    iget v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public capacity()I
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    array-length v0, v0

    goto :goto_0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 93
    iget v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    return v0
.end method

.method public limit()I
    .locals 1

    .prologue
    .line 78
    iget v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    return v0
.end method

.method public readBytes(Lcom/google/android/exoplayer/util/ParsableBitArray;I)V
    .locals 2
    .param p1, "bitArray"    # Lcom/google/android/exoplayer/util/ParsableBitArray;
    .param p2, "length"    # I

    .prologue
    const/4 v1, 0x0

    .line 136
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableBitArray;->getData()[B

    move-result-object v0

    invoke-virtual {p0, v0, v1, p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 137
    invoke-virtual {p1, v1}, Lcom/google/android/exoplayer/util/ParsableBitArray;->setPosition(I)V

    .line 138
    return-void
.end method

.method public readBytes(Ljava/nio/ByteBuffer;I)V
    .locals 2
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "length"    # I

    .prologue
    .line 156
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    invoke-virtual {p1, v0, v1, p2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 157
    iget v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/2addr v0, p2

    iput v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 158
    return-void
.end method

.method public readBytes([BII)V
    .locals 2
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 146
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 147
    iget v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/2addr v0, p3

    iput v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 148
    return-void
.end method

.method public readInt()I
    .locals 4

    .prologue
    .line 183
    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    const/4 v3, 0x4

    invoke-static {v1, v2, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->shiftIntoInt([BII)I

    move-result v0

    .line 184
    .local v0, "result":I
    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v1, v1, 0x4

    iput v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 185
    return v0
.end method

.method public readLong()J
    .locals 5

    .prologue
    .line 190
    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    const/16 v4, 0x8

    invoke-static {v2, v3, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->shiftIntoLong([BII)J

    move-result-wide v0

    .line 191
    .local v0, "result":J
    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v2, 0x8

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 192
    return-wide v0
.end method

.method public readSynchSafeInt()I
    .locals 6

    .prologue
    .line 211
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 212
    .local v0, "b1":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v1

    .line 213
    .local v1, "b2":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v2

    .line 214
    .local v2, "b3":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v3

    .line 215
    .local v3, "b4":I
    shl-int/lit8 v4, v0, 0x15

    shl-int/lit8 v5, v1, 0xe

    or-int/2addr v4, v5

    shl-int/lit8 v5, v2, 0x7

    or-int/2addr v4, v5

    or-int/2addr v4, v3

    return v4
.end method

.method public readUnsignedByte()I
    .locals 4

    .prologue
    .line 162
    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->shiftIntoInt([BII)I

    move-result v0

    .line 163
    .local v0, "result":I
    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 164
    return v0
.end method

.method public readUnsignedFixedPoint1616()I
    .locals 4

    .prologue
    .line 197
    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    const/4 v3, 0x2

    invoke-static {v1, v2, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->shiftIntoInt([BII)I

    move-result v0

    .line 198
    .local v0, "result":I
    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v1, v1, 0x4

    iput v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 199
    return v0
.end method

.method public readUnsignedInt()J
    .locals 5

    .prologue
    .line 176
    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    const/4 v4, 0x4

    invoke-static {v2, v3, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->shiftIntoLong([BII)J

    move-result-wide v0

    .line 177
    .local v0, "result":J
    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v2, 0x4

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 178
    return-wide v0
.end method

.method public readUnsignedIntToInt()I
    .locals 4

    .prologue
    .line 224
    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    const/4 v3, 0x4

    invoke-static {v1, v2, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->shiftIntoInt([BII)I

    move-result v0

    .line 225
    .local v0, "result":I
    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v1, v1, 0x4

    iput v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 226
    if-gez v0, :cond_0

    .line 227
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Top bit not zero: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 229
    :cond_0
    return v0
.end method

.method public readUnsignedLongToLong()J
    .locals 5

    .prologue
    .line 238
    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    const/16 v4, 0x8

    invoke-static {v2, v3, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->shiftIntoLong([BII)J

    move-result-wide v0

    .line 239
    .local v0, "result":J
    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v2, 0x8

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 240
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gez v2, :cond_0

    .line 241
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Top bit not zero: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 243
    :cond_0
    return-wide v0
.end method

.method public readUnsignedShort()I
    .locals 4

    .prologue
    .line 169
    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    const/4 v3, 0x2

    invoke-static {v1, v2, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->shiftIntoInt([BII)I

    move-result v0

    .line 170
    .local v0, "result":I
    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 171
    return v0
.end method

.method public reset()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 67
    iput v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 68
    iput v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    .line 69
    return-void
.end method

.method public reset([BI)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "limit"    # I

    .prologue
    .line 58
    iput-object p1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 59
    iput p2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    .line 60
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 61
    return-void
.end method

.method public setLimit(I)V
    .locals 1
    .param p1, "limit"    # I

    .prologue
    .line 87
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    array-length v0, v0

    if-gt p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 88
    iput p1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    .line 89
    return-void

    .line 87
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setPosition(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 110
    if-ltz p1, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    if-gt p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 111
    iput p1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 112
    return-void

    .line 110
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public skip(I)V
    .locals 1
    .param p1, "bytes"    # I

    .prologue
    .line 123
    iget v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 124
    return-void
.end method
