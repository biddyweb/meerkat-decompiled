.class public final Lcom/google/android/exoplayer/upstream/DataSourceStream;
.super Ljava/lang/Object;
.source "DataSourceStream.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/Loader$Loadable;
.implements Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;,
        Lcom/google/android/exoplayer/upstream/DataSourceStream$DataSourceStreamLoadException;
    }
.end annotation


# static fields
.field private static final CHUNKED_ALLOCATION_INCREMENT:I = 0x40000


# instance fields
.field private allocation:Lcom/google/android/exoplayer/upstream/Allocation;

.field private final allocator:Lcom/google/android/exoplayer/upstream/Allocator;

.field private final dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

.field private final dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

.field private volatile loadCanceled:Z

.field private volatile loadPosition:J

.field private final readHead:Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;

.field private volatile resolvedLength:J

.field private writeFragmentIndex:I

.field private writeFragmentOffset:I

.field private writeFragmentRemainingLength:I


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Lcom/google/android/exoplayer/upstream/Allocator;)V
    .locals 4
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .param p3, "allocator"    # Lcom/google/android/exoplayer/upstream/Allocator;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iget-wide v0, p2, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    const-wide/32 v2, 0x7fffffff

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 70
    iput-object p1, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 71
    iput-object p2, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    .line 72
    iput-object p3, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocator:Lcom/google/android/exoplayer/upstream/Allocator;

    .line 73
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    .line 74
    new-instance v0, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;-><init>(Lcom/google/android/exoplayer/upstream/DataSourceStream$1;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->readHead:Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;

    .line 75
    return-void

    .line 69
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private maybeMoreToLoad()Z
    .locals 4

    .prologue
    .line 285
    iget-wide v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadPosition:J

    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private read(Ljava/nio/ByteBuffer;[BILcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;I)I
    .locals 8
    .param p1, "target"    # Ljava/nio/ByteBuffer;
    .param p2, "targetArray"    # [B
    .param p3, "targetArrayOffset"    # I
    .param p4, "readHead"    # Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;
    .param p5, "readLength"    # I

    .prologue
    const/4 v2, 0x0

    .line 163
    invoke-virtual {p0}, Lcom/google/android/exoplayer/upstream/DataSourceStream;->isEndOfStream()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 164
    const/4 v2, -0x1

    .line 197
    :cond_0
    return v2

    .line 166
    :cond_1
    iget-wide v4, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadPosition:J

    # getter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->position:I
    invoke-static {p4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$100(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I

    move-result v6

    int-to-long v6, v6

    sub-long/2addr v4, v6

    int-to-long v6, p5

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v3, v4

    .line 167
    .local v3, "bytesToRead":I
    if-eqz v3, :cond_0

    .line 170
    # getter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->position:I
    invoke-static {p4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$100(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I

    move-result v4

    if-nez v4, :cond_2

    .line 171
    # setter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentIndex:I
    invoke-static {p4, v2}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$202(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;I)I

    .line 172
    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    invoke-interface {v4, v2}, Lcom/google/android/exoplayer/upstream/Allocation;->getFragmentOffset(I)I

    move-result v4

    # setter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentOffset:I
    invoke-static {p4, v4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$302(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;I)I

    .line 173
    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    invoke-interface {v4, v2}, Lcom/google/android/exoplayer/upstream/Allocation;->getFragmentLength(I)I

    move-result v4

    # setter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentRemaining:I
    invoke-static {p4, v4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$402(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;I)I

    .line 175
    :cond_2
    const/4 v2, 0x0

    .line 176
    .local v2, "bytesRead":I
    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    invoke-interface {v4}, Lcom/google/android/exoplayer/upstream/Allocation;->getBuffers()[[B

    move-result-object v1

    .line 177
    .local v1, "buffers":[[B
    :goto_0
    if-ge v2, v3, :cond_0

    .line 178
    # getter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentRemaining:I
    invoke-static {p4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$400(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I

    move-result v4

    if-nez v4, :cond_3

    .line 179
    # operator++ for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentIndex:I
    invoke-static {p4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$208(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I

    .line 180
    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    # getter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentIndex:I
    invoke-static {p4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$200(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I

    move-result v5

    invoke-interface {v4, v5}, Lcom/google/android/exoplayer/upstream/Allocation;->getFragmentOffset(I)I

    move-result v4

    # setter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentOffset:I
    invoke-static {p4, v4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$302(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;I)I

    .line 181
    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    # getter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentIndex:I
    invoke-static {p4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$200(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I

    move-result v5

    invoke-interface {v4, v5}, Lcom/google/android/exoplayer/upstream/Allocation;->getFragmentLength(I)I

    move-result v4

    # setter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentRemaining:I
    invoke-static {p4, v4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$402(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;I)I

    .line 183
    :cond_3
    # getter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentRemaining:I
    invoke-static {p4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$400(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I

    move-result v4

    sub-int v5, v3, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 184
    .local v0, "bufferReadLength":I
    if-eqz p1, :cond_5

    .line 185
    # getter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentIndex:I
    invoke-static {p4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$200(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I

    move-result v4

    aget-object v4, v1, v4

    # getter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentOffset:I
    invoke-static {p4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$300(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I

    move-result v5

    invoke-virtual {p1, v4, v5, v0}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 191
    :cond_4
    :goto_1
    # getter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->position:I
    invoke-static {p4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$100(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I

    move-result v4

    add-int/2addr v4, v0

    # setter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->position:I
    invoke-static {p4, v4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$102(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;I)I

    .line 192
    add-int/2addr v2, v0

    .line 193
    # getter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentOffset:I
    invoke-static {p4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$300(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I

    move-result v4

    add-int/2addr v4, v0

    # setter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentOffset:I
    invoke-static {p4, v4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$302(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;I)I

    .line 194
    # getter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentRemaining:I
    invoke-static {p4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$400(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I

    move-result v4

    sub-int/2addr v4, v0

    # setter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentRemaining:I
    invoke-static {p4, v4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$402(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;I)I

    goto :goto_0

    .line 186
    :cond_5
    if-eqz p2, :cond_4

    .line 187
    # getter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentIndex:I
    invoke-static {p4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$200(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I

    move-result v4

    aget-object v4, v1, v4

    # getter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentOffset:I
    invoke-static {p4}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$300(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I

    move-result v5

    invoke-static {v4, v5, p2, p3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 189
    add-int/2addr p3, v0

    goto :goto_1
.end method


# virtual methods
.method public cancelLoad()V
    .locals 1

    .prologue
    .line 204
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadCanceled:Z

    .line 205
    return-void
.end method

.method public close()V
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    if-eqz v0, :cond_0

    .line 137
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    invoke-interface {v0}, Lcom/google/android/exoplayer/upstream/Allocation;->release()V

    .line 138
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    .line 140
    :cond_0
    return-void
.end method

.method public getAvailableByteCount()J
    .locals 4

    .prologue
    .line 126
    iget-wide v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadPosition:J

    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->readHead:Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;

    # getter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->position:I
    invoke-static {v2}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$100(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I

    move-result v2

    int-to-long v2, v2

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public getLength()J
    .locals 4

    .prologue
    .line 110
    iget-wide v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    :goto_0
    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-wide v0, v0, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    goto :goto_0
.end method

.method public getLoadPosition()J
    .locals 2

    .prologue
    .line 99
    iget-wide v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadPosition:J

    return-wide v0
.end method

.method public getReadPosition()J
    .locals 2

    .prologue
    .line 90
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->readHead:Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;

    # getter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->position:I
    invoke-static {v0}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$100(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public isEndOfStream()Z
    .locals 4

    .prologue
    .line 131
    iget-wide v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->readHead:Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;

    # getter for: Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->position:I
    invoke-static {v0}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->access$100(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I

    move-result v0

    int-to-long v0, v0

    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLoadCanceled()Z
    .locals 1

    .prologue
    .line 209
    iget-boolean v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadCanceled:Z

    return v0
.end method

.method public isLoadFinished()Z
    .locals 4

    .prologue
    .line 119
    iget-wide v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadPosition:J

    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public load()V
    .locals 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 214
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadCanceled:Z

    if-nez v5, :cond_0

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/upstream/DataSourceStream;->isLoadFinished()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 282
    :cond_0
    :goto_0
    return-void

    .line 221
    :cond_1
    :try_start_0
    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadPosition:J

    const-wide/16 v18, 0x0

    cmp-long v5, v6, v18

    if-nez v5, :cond_6

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    const-wide/16 v18, -0x1

    cmp-long v5, v6, v18

    if-nez v5, :cond_6

    .line 222
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    .line 223
    .local v4, "loadDataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v5, v4}, Lcom/google/android/exoplayer/upstream/DataSource;->open(Lcom/google/android/exoplayer/upstream/DataSpec;)J

    move-result-wide v16

    .line 224
    .local v16, "resolvedLength":J
    const-wide/32 v6, 0x7fffffff

    cmp-long v5, v16, v6

    if-lez v5, :cond_2

    .line 225
    new-instance v5, Lcom/google/android/exoplayer/upstream/DataSourceStream$DataSourceStreamLoadException;

    new-instance v6, Lcom/google/android/exoplayer/upstream/UnexpectedLengthException;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-wide v0, v7, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    move-wide/from16 v18, v0

    move-wide/from16 v0, v18

    move-wide/from16 v2, v16

    invoke-direct {v6, v0, v1, v2, v3}, Lcom/google/android/exoplayer/upstream/UnexpectedLengthException;-><init>(JJ)V

    invoke-direct {v5, v6}, Lcom/google/android/exoplayer/upstream/DataSourceStream$DataSourceStreamLoadException;-><init>(Ljava/io/IOException;)V

    throw v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 280
    .end local v4    # "loadDataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    .end local v16    # "resolvedLength":J
    :catchall_0
    move-exception v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-static {v6}, Lcom/google/android/exoplayer/util/Util;->closeQuietly(Lcom/google/android/exoplayer/upstream/DataSource;)V

    throw v5

    .line 228
    .restart local v4    # "loadDataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    .restart local v16    # "resolvedLength":J
    :cond_2
    :try_start_1
    move-wide/from16 v0, v16

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    .line 237
    .end local v16    # "resolvedLength":J
    :goto_1
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    if-nez v5, :cond_3

    .line 238
    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    const-wide/16 v18, -0x1

    cmp-long v5, v6, v18

    if-eqz v5, :cond_8

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    long-to-int v13, v6

    .line 240
    .local v13, "initialAllocationSize":I
    :goto_2
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocator:Lcom/google/android/exoplayer/upstream/Allocator;

    invoke-interface {v5, v13}, Lcom/google/android/exoplayer/upstream/Allocator;->allocate(I)Lcom/google/android/exoplayer/upstream/Allocation;

    move-result-object v5

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    .line 242
    .end local v13    # "initialAllocationSize":I
    :cond_3
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    invoke-interface {v5}, Lcom/google/android/exoplayer/upstream/Allocation;->capacity()I

    move-result v11

    .line 244
    .local v11, "allocationCapacity":I
    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadPosition:J

    const-wide/16 v18, 0x0

    cmp-long v5, v6, v18

    if-nez v5, :cond_4

    .line 245
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->writeFragmentIndex:I

    .line 246
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Lcom/google/android/exoplayer/upstream/Allocation;->getFragmentOffset(I)I

    move-result v5

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->writeFragmentOffset:I

    .line 247
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Lcom/google/android/exoplayer/upstream/Allocation;->getFragmentLength(I)I

    move-result v5

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->writeFragmentRemainingLength:I

    .line 250
    :cond_4
    const v14, 0x7fffffff

    .line 251
    .local v14, "read":I
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    invoke-interface {v5}, Lcom/google/android/exoplayer/upstream/Allocation;->getBuffers()[[B

    move-result-object v12

    .line 252
    .local v12, "buffers":[[B
    :cond_5
    :goto_3
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadCanceled:Z

    if-nez v5, :cond_d

    if-lez v14, :cond_d

    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/upstream/DataSourceStream;->maybeMoreToLoad()Z

    move-result v5

    if-eqz v5, :cond_d

    .line 253
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v5

    if-eqz v5, :cond_9

    .line 254
    new-instance v5, Ljava/lang/InterruptedException;

    invoke-direct {v5}, Ljava/lang/InterruptedException;-><init>()V

    throw v5

    .line 230
    .end local v4    # "loadDataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    .end local v11    # "allocationCapacity":I
    .end local v12    # "buffers":[[B
    .end local v14    # "read":I
    :cond_6
    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    const-wide/16 v18, -0x1

    cmp-long v5, v6, v18

    if-eqz v5, :cond_7

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadPosition:J

    move-wide/from16 v18, v0

    sub-long v8, v6, v18

    .line 232
    .local v8, "remainingLength":J
    :goto_4
    new-instance v4, Lcom/google/android/exoplayer/upstream/DataSpec;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-object v5, v5, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-wide v6, v6, Lcom/google/android/exoplayer/upstream/DataSpec;->position:J

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadPosition:J

    move-wide/from16 v18, v0

    add-long v6, v6, v18

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-object v10, v10, Lcom/google/android/exoplayer/upstream/DataSpec;->key:Ljava/lang/String;

    invoke-direct/range {v4 .. v10}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 234
    .restart local v4    # "loadDataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v5, v4}, Lcom/google/android/exoplayer/upstream/DataSource;->open(Lcom/google/android/exoplayer/upstream/DataSpec;)J

    goto/16 :goto_1

    .line 230
    .end local v4    # "loadDataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    .end local v8    # "remainingLength":J
    :cond_7
    const-wide/16 v8, -0x1

    goto :goto_4

    .line 238
    .restart local v4    # "loadDataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    :cond_8
    const/high16 v13, 0x40000

    goto/16 :goto_2

    .line 256
    .restart local v11    # "allocationCapacity":I
    .restart local v12    # "buffers":[[B
    .restart local v14    # "read":I
    :cond_9
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->writeFragmentIndex:I

    aget-object v6, v12, v6

    move-object/from16 v0, p0

    iget v7, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->writeFragmentOffset:I

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->writeFragmentRemainingLength:I

    invoke-interface {v5, v6, v7, v10}, Lcom/google/android/exoplayer/upstream/DataSource;->read([BII)I

    move-result v14

    .line 258
    if-lez v14, :cond_b

    .line 259
    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadPosition:J

    int-to-long v0, v14

    move-wide/from16 v18, v0

    add-long v6, v6, v18

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadPosition:J

    .line 260
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->writeFragmentOffset:I

    add-int/2addr v5, v14

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->writeFragmentOffset:I

    .line 261
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->writeFragmentRemainingLength:I

    sub-int/2addr v5, v14

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->writeFragmentRemainingLength:I

    .line 262
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->writeFragmentRemainingLength:I

    if-nez v5, :cond_5

    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/upstream/DataSourceStream;->maybeMoreToLoad()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 263
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->writeFragmentIndex:I

    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->writeFragmentIndex:I

    .line 264
    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadPosition:J

    int-to-long v0, v11

    move-wide/from16 v18, v0

    cmp-long v5, v6, v18

    if-nez v5, :cond_a

    .line 265
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    const/high16 v6, 0x40000

    add-int/2addr v6, v11

    invoke-interface {v5, v6}, Lcom/google/android/exoplayer/upstream/Allocation;->ensureCapacity(I)V

    .line 266
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    invoke-interface {v5}, Lcom/google/android/exoplayer/upstream/Allocation;->capacity()I

    move-result v11

    .line 267
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    invoke-interface {v5}, Lcom/google/android/exoplayer/upstream/Allocation;->getBuffers()[[B

    move-result-object v12

    .line 269
    :cond_a
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->writeFragmentIndex:I

    invoke-interface {v5, v6}, Lcom/google/android/exoplayer/upstream/Allocation;->getFragmentOffset(I)I

    move-result v5

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->writeFragmentOffset:I

    .line 270
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->allocation:Lcom/google/android/exoplayer/upstream/Allocation;

    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->writeFragmentIndex:I

    invoke-interface {v5, v6}, Lcom/google/android/exoplayer/upstream/Allocation;->getFragmentLength(I)I

    move-result v5

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->writeFragmentRemainingLength:I

    goto/16 :goto_3

    .line 272
    :cond_b
    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    const-wide/16 v18, -0x1

    cmp-long v5, v6, v18

    if-nez v5, :cond_c

    .line 273
    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadPosition:J

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    goto/16 :goto_3

    .line 274
    :cond_c
    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadPosition:J

    move-wide/from16 v18, v0

    cmp-long v5, v6, v18

    if-eqz v5, :cond_5

    .line 275
    new-instance v5, Lcom/google/android/exoplayer/upstream/DataSourceStream$DataSourceStreamLoadException;

    new-instance v6, Lcom/google/android/exoplayer/upstream/UnexpectedLengthException;

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resolvedLength:J

    move-wide/from16 v18, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->loadPosition:J

    move-wide/from16 v20, v0

    move-wide/from16 v0, v18

    move-wide/from16 v2, v20

    invoke-direct {v6, v0, v1, v2, v3}, Lcom/google/android/exoplayer/upstream/UnexpectedLengthException;-><init>(JJ)V

    invoke-direct {v5, v6}, Lcom/google/android/exoplayer/upstream/DataSourceStream$DataSourceStreamLoadException;-><init>(Ljava/io/IOException;)V

    throw v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 280
    :cond_d
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-static {v5}, Lcom/google/android/exoplayer/util/Util;->closeQuietly(Lcom/google/android/exoplayer/upstream/DataSource;)V

    goto/16 :goto_0
.end method

.method public read(Ljava/nio/ByteBuffer;I)I
    .locals 6
    .param p1, "target1"    # Ljava/nio/ByteBuffer;
    .param p2, "readLength"    # I

    .prologue
    .line 149
    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->readHead:Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;

    move-object v0, p0

    move-object v1, p1

    move v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/upstream/DataSourceStream;->read(Ljava/nio/ByteBuffer;[BILcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;I)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 6
    .param p1, "target"    # [B
    .param p2, "offset"    # I
    .param p3, "readLength"    # I

    .prologue
    .line 154
    const/4 v1, 0x0

    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->readHead:Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;

    move-object v0, p0

    move-object v2, p1

    move v3, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/upstream/DataSourceStream;->read(Ljava/nio/ByteBuffer;[BILcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;I)I

    move-result v0

    return v0
.end method

.method public resetReadPosition()V
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->readHead:Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->reset()V

    .line 82
    return-void
.end method

.method public skip(I)I
    .locals 6
    .param p1, "skipLength"    # I

    .prologue
    const/4 v1, 0x0

    .line 144
    const/4 v3, 0x0

    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream;->readHead:Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;

    move-object v0, p0

    move-object v2, v1

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/upstream/DataSourceStream;->read(Ljava/nio/ByteBuffer;[BILcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;I)I

    move-result v0

    return v0
.end method
