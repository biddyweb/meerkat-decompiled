.class public Lcom/google/android/exoplayer/DefaultLoadControl;
.super Ljava/lang/Object;
.source "DefaultLoadControl.java"

# interfaces
.implements Lcom/google/android/exoplayer/LoadControl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;,
        Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;
    }
.end annotation


# static fields
.field private static final ABOVE_HIGH_WATERMARK:I = 0x0

.field private static final BELOW_LOW_WATERMARK:I = 0x2

.field private static final BETWEEN_WATERMARKS:I = 0x1

.field public static final DEFAULT_HIGH_POOL_LOAD:F = 0.8f

.field public static final DEFAULT_HIGH_WATERMARK_MS:I = 0x7530

.field public static final DEFAULT_LOW_POOL_LOAD:F = 0.2f

.field public static final DEFAULT_LOW_WATERMARK_MS:I = 0x3a98


# instance fields
.field private final allocator:Lcom/google/android/exoplayer/upstream/Allocator;

.field private bufferPoolState:I

.field private final eventHandler:Landroid/os/Handler;

.field private final eventListener:Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;

.field private fillingBuffers:Z

.field private final highPoolLoad:F

.field private final highWatermarkUs:J

.field private final loaderStates:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Object;",
            "Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;",
            ">;"
        }
    .end annotation
.end field

.field private final loaders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final lowPoolLoad:F

.field private final lowWatermarkUs:J

.field private maxLoadStartPositionUs:J

.field private streamingPrioritySet:Z

.field private targetBufferSize:I


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/Allocator;)V
    .locals 1
    .param p1, "allocator"    # Lcom/google/android/exoplayer/upstream/Allocator;

    .prologue
    const/4 v0, 0x0

    .line 90
    invoke-direct {p0, p1, v0, v0}, Lcom/google/android/exoplayer/DefaultLoadControl;-><init>(Lcom/google/android/exoplayer/upstream/Allocator;Landroid/os/Handler;Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;)V

    .line 91
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/Allocator;Landroid/os/Handler;Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;)V
    .locals 8
    .param p1, "allocator"    # Lcom/google/android/exoplayer/upstream/Allocator;
    .param p2, "eventHandler"    # Landroid/os/Handler;
    .param p3, "eventListener"    # Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;

    .prologue
    .line 103
    const/16 v4, 0x3a98

    const/16 v5, 0x7530

    const v6, 0x3e4ccccd    # 0.2f

    const v7, 0x3f4ccccd    # 0.8f

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer/DefaultLoadControl;-><init>(Lcom/google/android/exoplayer/upstream/Allocator;Landroid/os/Handler;Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;IIFF)V

    .line 105
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/Allocator;Landroid/os/Handler;Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;IIFF)V
    .locals 4
    .param p1, "allocator"    # Lcom/google/android/exoplayer/upstream/Allocator;
    .param p2, "eventHandler"    # Landroid/os/Handler;
    .param p3, "eventListener"    # Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;
    .param p4, "lowWatermarkMs"    # I
    .param p5, "highWatermarkMs"    # I
    .param p6, "lowPoolLoad"    # F
    .param p7, "highPoolLoad"    # F

    .prologue
    const-wide/16 v2, 0x3e8

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    iput-object p1, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->allocator:Lcom/google/android/exoplayer/upstream/Allocator;

    .line 128
    iput-object p2, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->eventHandler:Landroid/os/Handler;

    .line 129
    iput-object p3, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->eventListener:Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;

    .line 130
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaders:Ljava/util/List;

    .line 131
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaderStates:Ljava/util/HashMap;

    .line 132
    int-to-long v0, p4

    mul-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->lowWatermarkUs:J

    .line 133
    int-to-long v0, p5

    mul-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->highWatermarkUs:J

    .line 134
    iput p6, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->lowPoolLoad:F

    .line 135
    iput p7, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->highPoolLoad:F

    .line 136
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/exoplayer/DefaultLoadControl;)Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/DefaultLoadControl;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->eventListener:Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;

    return-object v0
.end method

.method private getBufferPoolState(I)I
    .locals 3
    .param p1, "allocatedSize"    # I

    .prologue
    .line 208
    int-to-float v1, p1

    iget v2, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->targetBufferSize:I

    int-to-float v2, v2

    div-float v0, v1, v2

    .line 209
    .local v0, "bufferPoolLoad":F
    iget v1, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->highPoolLoad:F

    cmpl-float v1, v0, v1

    if-lez v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_0
    iget v1, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->lowPoolLoad:F

    cmpg-float v1, v0, v1

    if-gez v1, :cond_1

    const/4 v1, 0x2

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private getLoaderBufferState(JJ)I
    .locals 7
    .param p1, "playbackPositionUs"    # J
    .param p3, "nextLoadPositionUs"    # J

    .prologue
    const/4 v2, 0x0

    .line 197
    const-wide/16 v4, -0x1

    cmp-long v3, p3, v4

    if-nez v3, :cond_1

    .line 201
    :cond_0
    :goto_0
    return v2

    .line 200
    :cond_1
    sub-long v0, p3, p1

    .line 201
    .local v0, "timeUntilNextLoadPosition":J
    iget-wide v4, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->highWatermarkUs:J

    cmp-long v3, v0, v4

    if-gtz v3, :cond_0

    iget-wide v2, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->lowWatermarkUs:J

    cmp-long v2, v0, v2

    if-gez v2, :cond_2

    const/4 v2, 0x2

    goto :goto_0

    :cond_2
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private notifyLoadingChanged(Z)V
    .locals 2
    .param p1, "loading"    # Z

    .prologue
    .line 255
    iget-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->eventListener:Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;

    if-eqz v0, :cond_0

    .line 256
    iget-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/DefaultLoadControl$1;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/DefaultLoadControl$1;-><init>(Lcom/google/android/exoplayer/DefaultLoadControl;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 263
    :cond_0
    return-void
.end method

.method private updateControlState()V
    .locals 14

    .prologue
    .line 215
    const/4 v8, 0x0

    .line 216
    .local v8, "loading":Z
    const/4 v0, 0x0

    .line 217
    .local v0, "failed":Z
    const/4 v1, 0x0

    .line 218
    .local v1, "haveNextLoadPosition":Z
    iget v2, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->bufferPoolState:I

    .line 219
    .local v2, "highestState":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v9, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaders:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    if-ge v3, v9, :cond_1

    .line 220
    iget-object v9, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaderStates:Ljava/util/HashMap;

    iget-object v10, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaders:Ljava/util/List;

    invoke-interface {v10, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;

    .line 221
    .local v5, "loaderState":Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;
    iget-boolean v9, v5, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->loading:Z

    or-int/2addr v8, v9

    .line 222
    iget-boolean v9, v5, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->failed:Z

    or-int/2addr v0, v9

    .line 223
    iget-wide v10, v5, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->nextLoadPositionUs:J

    const-wide/16 v12, -0x1

    cmp-long v9, v10, v12

    if-eqz v9, :cond_0

    const/4 v9, 0x1

    :goto_1
    or-int/2addr v1, v9

    .line 224
    iget v9, v5, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->bufferState:I

    invoke-static {v2, v9}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 219
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 223
    :cond_0
    const/4 v9, 0x0

    goto :goto_1

    .line 227
    .end local v5    # "loaderState":Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;
    :cond_1
    iget-object v9, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaders:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_7

    if-nez v0, :cond_7

    if-nez v8, :cond_2

    if-eqz v1, :cond_7

    :cond_2
    const/4 v9, 0x2

    if-eq v2, v9, :cond_3

    const/4 v9, 0x1

    if-ne v2, v9, :cond_7

    iget-boolean v9, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->fillingBuffers:Z

    if-eqz v9, :cond_7

    :cond_3
    const/4 v9, 0x1

    :goto_2
    iput-boolean v9, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->fillingBuffers:Z

    .line 230
    iget-boolean v9, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->fillingBuffers:Z

    if-eqz v9, :cond_8

    iget-boolean v9, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->streamingPrioritySet:Z

    if-nez v9, :cond_8

    .line 231
    sget-object v9, Lcom/google/android/exoplayer/upstream/NetworkLock;->instance:Lcom/google/android/exoplayer/upstream/NetworkLock;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer/upstream/NetworkLock;->add(I)V

    .line 232
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->streamingPrioritySet:Z

    .line 233
    const/4 v9, 0x1

    invoke-direct {p0, v9}, Lcom/google/android/exoplayer/DefaultLoadControl;->notifyLoadingChanged(Z)V

    .line 240
    :cond_4
    :goto_3
    const-wide/16 v10, -0x1

    iput-wide v10, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->maxLoadStartPositionUs:J

    .line 241
    iget-boolean v9, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->fillingBuffers:Z

    if-eqz v9, :cond_9

    .line 242
    const/4 v3, 0x0

    :goto_4
    iget-object v9, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaders:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    if-ge v3, v9, :cond_9

    .line 243
    iget-object v9, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaders:Ljava/util/List;

    invoke-interface {v9, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 244
    .local v4, "loader":Ljava/lang/Object;
    iget-object v9, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaderStates:Ljava/util/HashMap;

    invoke-virtual {v9, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;

    .line 245
    .restart local v5    # "loaderState":Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;
    iget-wide v6, v5, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->nextLoadPositionUs:J

    .line 246
    .local v6, "loaderTime":J
    const-wide/16 v10, -0x1

    cmp-long v9, v6, v10

    if-eqz v9, :cond_6

    iget-wide v10, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->maxLoadStartPositionUs:J

    const-wide/16 v12, -0x1

    cmp-long v9, v10, v12

    if-eqz v9, :cond_5

    iget-wide v10, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->maxLoadStartPositionUs:J

    cmp-long v9, v6, v10

    if-gez v9, :cond_6

    .line 248
    :cond_5
    iput-wide v6, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->maxLoadStartPositionUs:J

    .line 242
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 227
    .end local v4    # "loader":Ljava/lang/Object;
    .end local v5    # "loaderState":Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;
    .end local v6    # "loaderTime":J
    :cond_7
    const/4 v9, 0x0

    goto :goto_2

    .line 234
    :cond_8
    iget-boolean v9, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->fillingBuffers:Z

    if-nez v9, :cond_4

    iget-boolean v9, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->streamingPrioritySet:Z

    if-eqz v9, :cond_4

    if-nez v8, :cond_4

    .line 235
    sget-object v9, Lcom/google/android/exoplayer/upstream/NetworkLock;->instance:Lcom/google/android/exoplayer/upstream/NetworkLock;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer/upstream/NetworkLock;->remove(I)V

    .line 236
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->streamingPrioritySet:Z

    .line 237
    const/4 v9, 0x0

    invoke-direct {p0, v9}, Lcom/google/android/exoplayer/DefaultLoadControl;->notifyLoadingChanged(Z)V

    goto :goto_3

    .line 252
    :cond_9
    return-void
.end method


# virtual methods
.method public getAllocator()Lcom/google/android/exoplayer/upstream/Allocator;
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->allocator:Lcom/google/android/exoplayer/upstream/Allocator;

    return-object v0
.end method

.method public register(Ljava/lang/Object;I)V
    .locals 2
    .param p1, "loader"    # Ljava/lang/Object;
    .param p2, "bufferSizeContribution"    # I

    .prologue
    .line 140
    iget-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    iget-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaderStates:Ljava/util/HashMap;

    new-instance v1, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;

    invoke-direct {v1, p2}, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;-><init>(I)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    iget v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->targetBufferSize:I

    add-int/2addr v0, p2

    iput v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->targetBufferSize:I

    .line 143
    return-void
.end method

.method public trimAllocator()V
    .locals 2

    .prologue
    .line 155
    iget-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->allocator:Lcom/google/android/exoplayer/upstream/Allocator;

    iget v1, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->targetBufferSize:I

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/upstream/Allocator;->trim(I)V

    .line 156
    return-void
.end method

.method public unregister(Ljava/lang/Object;)V
    .locals 3
    .param p1, "loader"    # Ljava/lang/Object;

    .prologue
    .line 147
    iget-object v1, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaders:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 148
    iget-object v1, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaderStates:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;

    .line 149
    .local v0, "state":Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;
    iget v1, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->targetBufferSize:I

    iget v2, v0, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->bufferSizeContribution:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->targetBufferSize:I

    .line 150
    invoke-direct {p0}, Lcom/google/android/exoplayer/DefaultLoadControl;->updateControlState()V

    .line 151
    return-void
.end method

.method public update(Ljava/lang/Object;JJZZ)Z
    .locals 8
    .param p1, "loader"    # Ljava/lang/Object;
    .param p2, "playbackPositionUs"    # J
    .param p4, "nextLoadPositionUs"    # J
    .param p6, "loading"    # Z
    .param p7, "failed"    # Z

    .prologue
    .line 167
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/google/android/exoplayer/DefaultLoadControl;->getLoaderBufferState(JJ)I

    move-result v3

    .line 168
    .local v3, "loaderBufferState":I
    iget-object v6, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaderStates:Ljava/util/HashMap;

    invoke-virtual {v6, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;

    .line 169
    .local v4, "loaderState":Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;
    iget v6, v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->bufferState:I

    if-ne v6, v3, :cond_0

    iget-wide v6, v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->nextLoadPositionUs:J

    cmp-long v6, v6, p4

    if-nez v6, :cond_0

    iget-boolean v6, v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->loading:Z

    if-ne v6, p6, :cond_0

    iget-boolean v6, v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->failed:Z

    if-eq v6, p7, :cond_5

    :cond_0
    const/4 v5, 0x1

    .line 172
    .local v5, "loaderStateChanged":Z
    :goto_0
    if-eqz v5, :cond_1

    .line 173
    iput v3, v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->bufferState:I

    .line 174
    iput-wide p4, v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->nextLoadPositionUs:J

    .line 175
    iput-boolean p6, v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->loading:Z

    .line 176
    iput-boolean p7, v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->failed:Z

    .line 180
    :cond_1
    iget-object v6, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->allocator:Lcom/google/android/exoplayer/upstream/Allocator;

    invoke-interface {v6}, Lcom/google/android/exoplayer/upstream/Allocator;->getAllocatedSize()I

    move-result v0

    .line 181
    .local v0, "allocatedSize":I
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/DefaultLoadControl;->getBufferPoolState(I)I

    move-result v1

    .line 182
    .local v1, "bufferPoolState":I
    iget v6, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->bufferPoolState:I

    if-eq v6, v1, :cond_6

    const/4 v2, 0x1

    .line 183
    .local v2, "bufferPoolStateChanged":Z
    :goto_1
    if-eqz v2, :cond_2

    .line 184
    iput v1, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->bufferPoolState:I

    .line 188
    :cond_2
    if-nez v5, :cond_3

    if-eqz v2, :cond_4

    .line 189
    :cond_3
    invoke-direct {p0}, Lcom/google/android/exoplayer/DefaultLoadControl;->updateControlState()V

    .line 192
    :cond_4
    iget v6, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->targetBufferSize:I

    if-ge v0, v6, :cond_7

    const-wide/16 v6, -0x1

    cmp-long v6, p4, v6

    if-eqz v6, :cond_7

    iget-wide v6, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->maxLoadStartPositionUs:J

    cmp-long v6, p4, v6

    if-gtz v6, :cond_7

    const/4 v6, 0x1

    :goto_2
    return v6

    .line 169
    .end local v0    # "allocatedSize":I
    .end local v1    # "bufferPoolState":I
    .end local v2    # "bufferPoolStateChanged":Z
    .end local v5    # "loaderStateChanged":Z
    :cond_5
    const/4 v5, 0x0

    goto :goto_0

    .line 182
    .restart local v0    # "allocatedSize":I
    .restart local v1    # "bufferPoolState":I
    .restart local v5    # "loaderStateChanged":Z
    :cond_6
    const/4 v2, 0x0

    goto :goto_1

    .line 192
    .restart local v2    # "bufferPoolStateChanged":Z
    :cond_7
    const/4 v6, 0x0

    goto :goto_2
.end method
