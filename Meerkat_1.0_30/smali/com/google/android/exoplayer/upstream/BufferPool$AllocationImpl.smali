.class Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;
.super Ljava/lang/Object;
.source "BufferPool.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/Allocation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/upstream/BufferPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AllocationImpl"
.end annotation


# instance fields
.field private buffers:[[B

.field final synthetic this$0:Lcom/google/android/exoplayer/upstream/BufferPool;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/BufferPool;[[B)V
    .locals 0
    .param p2, "buffers"    # [[B

    .prologue
    .line 170
    iput-object p1, p0, Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;->this$0:Lcom/google/android/exoplayer/upstream/BufferPool;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 171
    iput-object p2, p0, Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;->buffers:[[B

    .line 172
    return-void
.end method


# virtual methods
.method public capacity()I
    .locals 2

    .prologue
    .line 181
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;->this$0:Lcom/google/android/exoplayer/upstream/BufferPool;

    iget v0, v0, Lcom/google/android/exoplayer/upstream/BufferPool;->bufferLength:I

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;->buffers:[[B

    array-length v1, v1

    mul-int/2addr v0, v1

    return v0
.end method

.method public ensureCapacity(I)V
    .locals 2
    .param p1, "size"    # I

    .prologue
    .line 176
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;->this$0:Lcom/google/android/exoplayer/upstream/BufferPool;

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;->buffers:[[B

    invoke-virtual {v0, p1, v1}, Lcom/google/android/exoplayer/upstream/BufferPool;->allocate(I[[B)[[B

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;->buffers:[[B

    .line 177
    return-void
.end method

.method public getBuffers()[[B
    .locals 1

    .prologue
    .line 186
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;->buffers:[[B

    return-object v0
.end method

.method public getFragmentLength(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 196
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;->this$0:Lcom/google/android/exoplayer/upstream/BufferPool;

    iget v0, v0, Lcom/google/android/exoplayer/upstream/BufferPool;->bufferLength:I

    return v0
.end method

.method public getFragmentOffset(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 191
    const/4 v0, 0x0

    return v0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 201
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;->buffers:[[B

    if-eqz v0, :cond_0

    .line 202
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;->this$0:Lcom/google/android/exoplayer/upstream/BufferPool;

    invoke-virtual {v0, p0}, Lcom/google/android/exoplayer/upstream/BufferPool;->release(Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;)V

    .line 203
    const/4 v0, 0x0

    check-cast v0, [[B

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/BufferPool$AllocationImpl;->buffers:[[B

    .line 205
    :cond_0
    return-void
.end method
