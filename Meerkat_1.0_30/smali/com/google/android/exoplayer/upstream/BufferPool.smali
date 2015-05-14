.class public final Lcom/google/android/exoplayer/upstream/BufferPool;
.super Ljava/lang/Object;
.source "BufferPool.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/Allocator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;
    }
.end annotation


# static fields
.field private static final INITIAL_RECYCLED_BUFFERS_CAPACITY:I = 0x64


# instance fields
.field private allocatedBufferCount:I

.field public final bufferLength:I

.field private recycledBufferCount:I

.field private recycledBuffers:[[B


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "bufferLength"    # I

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    if-lez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 49
    iput p1, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->bufferLength:I

    .line 50
    const/16 v0, 0x64

    new-array v0, v0, [[B

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBuffers:[[B

    .line 51
    return-void

    .line 48
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private ensureRecycledBufferCapacity(I)V
    .locals 4
    .param p1, "requiredCapacity"    # I

    .prologue
    const/4 v3, 0x0

    .line 156
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBuffers:[[B

    array-length v1, v1

    if-ge v1, p1, :cond_1

    .line 158
    mul-int/lit8 v1, p1, 0x2

    new-array v0, v1, [[B

    .line 159
    .local v0, "newRecycledBuffers":[[B
    iget v1, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBufferCount:I

    if-lez v1, :cond_0

    .line 160
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBuffers:[[B

    iget v2, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBufferCount:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 162
    :cond_0
    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBuffers:[[B

    .line 164
    .end local v0    # "newRecycledBuffers":[[B
    :cond_1
    return-void
.end method

.method private nextBuffer()[B
    .locals 2

    .prologue
    .line 151
    iget v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBufferCount:I

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBuffers:[[B

    iget v1, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBufferCount:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBufferCount:I

    aget-object v0, v0, v1

    :goto_0
    return-object v0

    :cond_0
    iget v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->bufferLength:I

    new-array v0, v0, [B

    goto :goto_0
.end method

.method private requiredBufferCount(J)I
    .locals 5
    .param p1, "size"    # J

    .prologue
    .line 147
    iget v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->bufferLength:I

    int-to-long v0, v0

    add-long/2addr v0, p1

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    iget v2, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->bufferLength:I

    int-to-long v2, v2

    div-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method


# virtual methods
.method public declared-synchronized allocate(I)Lcom/google/android/exoplayer/upstream/Allocation;
    .locals 2
    .param p1, "size"    # I

    .prologue
    .line 70
    monitor-enter p0

    :try_start_0
    new-instance v1, Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;

    const/4 v0, 0x0

    check-cast v0, [[B

    invoke-virtual {p0, p1, v0}, Lcom/google/android/exoplayer/upstream/BufferPool;->allocate(I[[B)[[B

    move-result-object v0

    invoke-direct {v1, p0, v0}, Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;-><init>(Lcom/google/android/exoplayer/upstream/BufferPool;[[B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized allocate(I[[B)[[B
    .locals 6
    .param p1, "size"    # I
    .param p2, "existing"    # [[B

    .prologue
    .line 83
    monitor-enter p0

    int-to-long v4, p1

    :try_start_0
    invoke-direct {p0, v4, v5}, Lcom/google/android/exoplayer/upstream/BufferPool;->requiredBufferCount(J)I

    move-result v3

    .line 84
    .local v3, "requiredBufferCount":I
    if-eqz p2, :cond_0

    array-length v4, p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-gt v3, v4, :cond_0

    .line 101
    .end local p2    # "existing":[[B
    :goto_0
    monitor-exit p0

    return-object p2

    .line 89
    .restart local p2    # "existing":[[B
    :cond_0
    :try_start_1
    new-array v0, v3, [[B

    .line 90
    .local v0, "buffers":[[B
    const/4 v1, 0x0

    .line 91
    .local v1, "firstNewBufferIndex":I
    if-eqz p2, :cond_1

    .line 92
    array-length v1, p2

    .line 93
    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {p2, v4, v0, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 96
    :cond_1
    iget v4, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->allocatedBufferCount:I

    sub-int v5, v3, v1

    add-int/2addr v4, v5

    iput v4, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->allocatedBufferCount:I

    .line 97
    move v2, v1

    .local v2, "i":I
    :goto_1
    if-ge v2, v3, :cond_2

    .line 99
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/BufferPool;->nextBuffer()[B

    move-result-object v4

    aput-object v4, v0, v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    move-object p2, v0

    .line 101
    goto :goto_0

    .line 83
    .end local v0    # "buffers":[[B
    .end local v1    # "firstNewBufferIndex":I
    .end local v2    # "i":I
    .end local v3    # "requiredBufferCount":I
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized allocateDirect()[B
    .locals 1

    .prologue
    .line 113
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->allocatedBufferCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->allocatedBufferCount:I

    .line 114
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/BufferPool;->nextBuffer()[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 113
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getAllocatedSize()I
    .locals 2

    .prologue
    .line 55
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->allocatedBufferCount:I

    iget v1, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->bufferLength:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    mul-int/2addr v0, v1

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized release(Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;)V
    .locals 6
    .param p1, "allocation"    # Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;

    .prologue
    .line 137
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;->getBuffers()[[B

    move-result-object v0

    .line 138
    .local v0, "buffers":[[B
    iget v2, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->allocatedBufferCount:I

    array-length v3, v0

    sub-int/2addr v2, v3

    iput v2, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->allocatedBufferCount:I

    .line 140
    iget v2, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBufferCount:I

    array-length v3, v0

    add-int v1, v2, v3

    .line 141
    .local v1, "newRecycledBufferCount":I
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/upstream/BufferPool;->ensureRecycledBufferCapacity(I)V

    .line 142
    const/4 v2, 0x0

    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBuffers:[[B

    iget v4, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBufferCount:I

    array-length v5, v0

    invoke-static {v0, v2, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 143
    iput v1, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBufferCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 144
    monitor-exit p0

    return-void

    .line 137
    .end local v0    # "buffers":[[B
    .end local v1    # "newRecycledBufferCount":I
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized releaseDirect([B)V
    .locals 3
    .param p1, "buffer"    # [B

    .prologue
    .line 124
    monitor-enter p0

    :try_start_0
    array-length v0, p1

    iget v1, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->bufferLength:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 125
    iget v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->allocatedBufferCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->allocatedBufferCount:I

    .line 127
    iget v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBufferCount:I

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/upstream/BufferPool;->ensureRecycledBufferCapacity(I)V

    .line 128
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBuffers:[[B

    iget v1, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBufferCount:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBufferCount:I

    aput-object p1, v0, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 129
    monitor-exit p0

    return-void

    .line 124
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized trim(I)V
    .locals 5
    .param p1, "targetSize"    # I

    .prologue
    .line 60
    monitor-enter p0

    :try_start_0
    iget v2, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->bufferLength:I

    add-int/2addr v2, p1

    add-int/lit8 v2, v2, -0x1

    iget v3, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->bufferLength:I

    div-int v0, v2, v3

    .line 61
    .local v0, "targetBufferCount":I
    const/4 v2, 0x0

    iget v3, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->allocatedBufferCount:I

    sub-int v3, v0, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 62
    .local v1, "targetRecycledBufferCount":I
    iget v2, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBufferCount:I

    if-ge v1, v2, :cond_0

    .line 63
    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBuffers:[[B

    iget v3, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBufferCount:I

    const/4 v4, 0x0

    invoke-static {v2, v1, v3, v4}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 64
    iput v1, p0, Lcom/google/android/exoplayer/upstream/BufferPool;->recycledBufferCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    :cond_0
    monitor-exit p0

    return-void

    .line 60
    .end local v0    # "targetBufferCount":I
    .end local v1    # "targetRecycledBufferCount":I
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method
