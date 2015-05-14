.class Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;
.super Ljava/lang/Object;
.source "RollingSampleBuffer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InfoQueue"
.end annotation


# static fields
.field private static final SAMPLE_CAPACITY_INCREMENT:I = 0x3e8


# instance fields
.field private capacity:I

.field private flags:[I

.field private offsets:[J

.field private queueSize:I

.field private readIndex:I

.field private sizes:[I

.field private timesUs:[J

.field private writeIndex:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    const/16 v0, 0x3e8

    iput v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->capacity:I

    .line 210
    iget v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->capacity:I

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->offsets:[J

    .line 211
    iget v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->capacity:I

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->timesUs:[J

    .line 212
    iget v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->capacity:I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->flags:[I

    .line 213
    iget v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->capacity:I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->sizes:[I

    .line 214
    return-void
.end method


# virtual methods
.method public declared-synchronized commitSample(JJII)V
    .locals 11
    .param p1, "timeUs"    # J
    .param p3, "offset"    # J
    .param p5, "size"    # I
    .param p6, "sampleFlags"    # I

    .prologue
    .line 261
    monitor-enter p0

    :try_start_0
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->timesUs:[J

    iget v8, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->writeIndex:I

    aput-wide p1, v7, v8

    .line 262
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->offsets:[J

    iget v8, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->writeIndex:I

    aput-wide p3, v7, v8

    .line 263
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->sizes:[I

    iget v8, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->writeIndex:I

    aput p5, v7, v8

    .line 264
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->flags:[I

    iget v8, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->writeIndex:I

    aput p6, v7, v8

    .line 266
    iget v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->queueSize:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->queueSize:I

    .line 267
    iget v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->queueSize:I

    iget v8, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->capacity:I

    if-ne v7, v8, :cond_1

    .line 269
    iget v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->capacity:I

    add-int/lit16 v2, v7, 0x3e8

    .line 270
    .local v2, "newCapacity":I
    new-array v4, v2, [J

    .line 271
    .local v4, "newOffsets":[J
    new-array v6, v2, [J

    .line 272
    .local v6, "newTimesUs":[J
    new-array v3, v2, [I

    .line 273
    .local v3, "newFlags":[I
    new-array v5, v2, [I

    .line 274
    .local v5, "newSizes":[I
    iget v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->capacity:I

    iget v8, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->readIndex:I

    sub-int v1, v7, v8

    .line 275
    .local v1, "beforeWrap":I
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->offsets:[J

    iget v8, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->readIndex:I

    const/4 v9, 0x0

    invoke-static {v7, v8, v4, v9, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 276
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->timesUs:[J

    iget v8, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->readIndex:I

    const/4 v9, 0x0

    invoke-static {v7, v8, v6, v9, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 277
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->flags:[I

    iget v8, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->readIndex:I

    const/4 v9, 0x0

    invoke-static {v7, v8, v3, v9, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 278
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->sizes:[I

    iget v8, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->readIndex:I

    const/4 v9, 0x0

    invoke-static {v7, v8, v5, v9, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 279
    iget v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->readIndex:I

    .line 280
    .local v0, "afterWrap":I
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->offsets:[J

    const/4 v8, 0x0

    invoke-static {v7, v8, v4, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 281
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->timesUs:[J

    const/4 v8, 0x0

    invoke-static {v7, v8, v6, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 282
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->flags:[I

    const/4 v8, 0x0

    invoke-static {v7, v8, v3, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 283
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->sizes:[I

    const/4 v8, 0x0

    invoke-static {v7, v8, v5, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 284
    iput-object v4, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->offsets:[J

    .line 285
    iput-object v6, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->timesUs:[J

    .line 286
    iput-object v3, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->flags:[I

    .line 287
    iput-object v5, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->sizes:[I

    .line 288
    const/4 v7, 0x0

    iput v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->readIndex:I

    .line 289
    iget v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->capacity:I

    iput v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->writeIndex:I

    .line 290
    iget v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->capacity:I

    iput v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->queueSize:I

    .line 291
    iput v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->capacity:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 299
    .end local v0    # "afterWrap":I
    .end local v1    # "beforeWrap":I
    .end local v2    # "newCapacity":I
    .end local v3    # "newFlags":[I
    .end local v4    # "newOffsets":[J
    .end local v5    # "newSizes":[I
    .end local v6    # "newTimesUs":[J
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 293
    :cond_1
    :try_start_1
    iget v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->writeIndex:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->writeIndex:I

    .line 294
    iget v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->writeIndex:I

    iget v8, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->capacity:I

    if-ne v7, v8, :cond_0

    .line 296
    const/4 v7, 0x0

    iput v7, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->writeIndex:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 261
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7
.end method

.method public declared-synchronized moveToNextSample()J
    .locals 6

    .prologue
    .line 249
    monitor-enter p0

    :try_start_0
    iget v1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->queueSize:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->queueSize:I

    .line 250
    iget v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->readIndex:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->readIndex:I

    .line 251
    .local v0, "lastReadIndex":I
    iget v1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->readIndex:I

    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->capacity:I

    if-ne v1, v2, :cond_0

    .line 253
    const/4 v1, 0x0

    iput v1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->readIndex:I

    .line 255
    :cond_0
    iget v1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->queueSize:I

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->offsets:[J

    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->readIndex:I

    aget-wide v2, v1, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-wide v2

    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->sizes:[I

    aget v1, v1, v0

    int-to-long v2, v1

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->offsets:[J

    aget-wide v4, v1, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    add-long/2addr v2, v4

    goto :goto_0

    .line 249
    .end local v0    # "lastReadIndex":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized peekSample(Lcom/google/android/exoplayer/SampleHolder;[J)Z
    .locals 4
    .param p1, "holder"    # Lcom/google/android/exoplayer/SampleHolder;
    .param p2, "offsetHolder"    # [J

    .prologue
    const/4 v0, 0x0

    .line 232
    monitor-enter p0

    :try_start_0
    iget v1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->queueSize:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 239
    :goto_0
    monitor-exit p0

    return v0

    .line 235
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->timesUs:[J

    iget v1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->readIndex:I

    aget-wide v0, v0, v1

    iput-wide v0, p1, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    .line 236
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->sizes:[I

    iget v1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->readIndex:I

    aget v0, v0, v1

    iput v0, p1, Lcom/google/android/exoplayer/SampleHolder;->size:I

    .line 237
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->flags:[I

    iget v1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->readIndex:I

    aget v0, v0, v1

    iput v0, p1, Lcom/google/android/exoplayer/SampleHolder;->flags:I

    .line 238
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->offsets:[J

    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->readIndex:I

    aget-wide v2, v1, v2

    aput-wide v2, p2, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 239
    const/4 v0, 0x1

    goto :goto_0

    .line 232
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
