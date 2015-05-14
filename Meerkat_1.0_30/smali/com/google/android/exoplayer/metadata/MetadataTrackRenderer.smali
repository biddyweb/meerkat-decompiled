.class public Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;
.super Lcom/google/android/exoplayer/TrackRenderer;
.source "MetadataTrackRenderer.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer$MetadataRenderer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/android/exoplayer/TrackRenderer;",
        "Landroid/os/Handler$Callback;"
    }
.end annotation


# static fields
.field private static final MSG_INVOKE_RENDERER:I


# instance fields
.field private currentPositionUs:J

.field private final formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

.field private inputStreamEnded:Z

.field private final metadataHandler:Landroid/os/Handler;

.field private final metadataParser:Lcom/google/android/exoplayer/metadata/MetadataParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer/metadata/MetadataParser",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final metadataRenderer:Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer$MetadataRenderer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer$MetadataRenderer",
            "<TT;>;"
        }
    .end annotation
.end field

.field private pendingMetadata:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private pendingMetadataTimestamp:J

.field private final sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

.field private final source:Lcom/google/android/exoplayer/SampleSource;

.field private trackIndex:I


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/metadata/MetadataParser;Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer$MetadataRenderer;Landroid/os/Looper;)V
    .locals 2
    .param p1, "source"    # Lcom/google/android/exoplayer/SampleSource;
    .param p4, "metadataRendererLooper"    # Landroid/os/Looper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/SampleSource;",
            "Lcom/google/android/exoplayer/metadata/MetadataParser",
            "<TT;>;",
            "Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer$MetadataRenderer",
            "<TT;>;",
            "Landroid/os/Looper;",
            ")V"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "this":Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;, "Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer<TT;>;"
    .local p2, "metadataParser":Lcom/google/android/exoplayer/metadata/MetadataParser;, "Lcom/google/android/exoplayer/metadata/MetadataParser<TT;>;"
    .local p3, "metadataRenderer":Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer$MetadataRenderer;, "Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer$MetadataRenderer<TT;>;"
    invoke-direct {p0}, Lcom/google/android/exoplayer/TrackRenderer;-><init>()V

    .line 83
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/SampleSource;

    iput-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    .line 84
    invoke-static {p2}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/metadata/MetadataParser;

    iput-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->metadataParser:Lcom/google/android/exoplayer/metadata/MetadataParser;

    .line 85
    invoke-static {p3}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer$MetadataRenderer;

    iput-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->metadataRenderer:Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer$MetadataRenderer;

    .line 86
    if-nez p4, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->metadataHandler:Landroid/os/Handler;

    .line 88
    new-instance v0, Lcom/google/android/exoplayer/MediaFormatHolder;

    invoke-direct {v0}, Lcom/google/android/exoplayer/MediaFormatHolder;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    .line 89
    new-instance v0, Lcom/google/android/exoplayer/SampleHolder;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/SampleHolder;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    .line 90
    return-void

    .line 86
    :cond_0
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, p4, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    goto :goto_0
.end method

.method private invokeRenderer(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 192
    .local p0, "this":Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;, "Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer<TT;>;"
    .local p1, "metadata":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->metadataHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 193
    iget-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->metadataHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 197
    :goto_0
    return-void

    .line 195
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->invokeRendererInternal(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private invokeRendererInternal(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 211
    .local p0, "this":Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;, "Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer<TT;>;"
    .local p1, "metadata":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->metadataRenderer:Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer$MetadataRenderer;

    invoke-interface {v0, p1}, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer$MetadataRenderer;->onMetadata(Ljava/lang/Object;)V

    .line 212
    return-void
.end method

.method private seekToInternal(J)V
    .locals 1
    .param p1, "positionUs"    # J

    .prologue
    .line 124
    .local p0, "this":Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;, "Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer<TT;>;"
    iput-wide p1, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->currentPositionUs:J

    .line 125
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->pendingMetadata:Ljava/lang/Object;

    .line 126
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->inputStreamEnded:Z

    .line 127
    return-void
.end method


# virtual methods
.method protected doPrepare()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 95
    .local p0, "this":Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;, "Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer<TT;>;"
    :try_start_0
    iget-object v3, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v3}, Lcom/google/android/exoplayer/SampleSource;->prepare()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 96
    .local v2, "sourcePrepared":Z
    if-nez v2, :cond_0

    .line 97
    const/4 v3, 0x0

    .line 108
    :goto_0
    return v3

    .line 99
    .end local v2    # "sourcePrepared":Z
    :catch_0
    move-exception v0

    .line 100
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lcom/google/android/exoplayer/ExoPlaybackException;

    invoke-direct {v3, v0}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 102
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v2    # "sourcePrepared":Z
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v3, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v3}, Lcom/google/android/exoplayer/SampleSource;->getTrackCount()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 103
    iget-object v3, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->metadataParser:Lcom/google/android/exoplayer/metadata/MetadataParser;

    iget-object v4, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v4, v1}, Lcom/google/android/exoplayer/SampleSource;->getTrackInfo(I)Lcom/google/android/exoplayer/TrackInfo;

    move-result-object v4

    iget-object v4, v4, Lcom/google/android/exoplayer/TrackInfo;->mimeType:Ljava/lang/String;

    invoke-interface {v3, v4}, Lcom/google/android/exoplayer/metadata/MetadataParser;->canParse(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 104
    iput v1, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->trackIndex:I

    .line 105
    const/4 v3, 0x1

    goto :goto_0

    .line 102
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 108
    :cond_2
    const/4 v3, -0x1

    goto :goto_0
.end method

.method protected doSomeWork(JJ)V
    .locals 9
    .param p1, "positionUs"    # J
    .param p3, "elapsedRealtimeUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 132
    .local p0, "this":Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;, "Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer<TT;>;"
    iput-wide p1, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->currentPositionUs:J

    .line 134
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v0, p1, p2}, Lcom/google/android/exoplayer/SampleSource;->continueBuffering(J)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    iget-boolean v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->inputStreamEnded:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->pendingMetadata:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 141
    :try_start_1
    iget-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v1, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->trackIndex:I

    iget-object v4, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    iget-object v5, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    const/4 v6, 0x0

    move-wide v2, p1

    invoke-interface/range {v0 .. v6}, Lcom/google/android/exoplayer/SampleSource;->readData(IJLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;Z)I

    move-result v8

    .line 142
    .local v8, "result":I
    const/4 v0, -0x3

    if-ne v8, v0, :cond_2

    .line 143
    iget-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-wide v0, v0, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    iput-wide v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->pendingMetadataTimestamp:J

    .line 144
    iget-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->metadataParser:Lcom/google/android/exoplayer/metadata/MetadataParser;

    iget-object v1, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-object v1, v1, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget v2, v2, Lcom/google/android/exoplayer/SampleHolder;->size:I

    invoke-interface {v0, v1, v2}, Lcom/google/android/exoplayer/metadata/MetadataParser;->parse([BI)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->pendingMetadata:Ljava/lang/Object;

    .line 145
    iget-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-object v0, v0, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 154
    .end local v8    # "result":I
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->pendingMetadata:Ljava/lang/Object;

    if-eqz v0, :cond_1

    iget-wide v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->pendingMetadataTimestamp:J

    iget-wide v2, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->currentPositionUs:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_1

    .line 155
    iget-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->pendingMetadata:Ljava/lang/Object;

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->invokeRenderer(Ljava/lang/Object;)V

    .line 156
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->pendingMetadata:Ljava/lang/Object;

    .line 158
    :cond_1
    return-void

    .line 135
    :catch_0
    move-exception v7

    .line 136
    .local v7, "e":Ljava/io/IOException;
    new-instance v0, Lcom/google/android/exoplayer/ExoPlaybackException;

    invoke-direct {v0, v7}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 146
    .end local v7    # "e":Ljava/io/IOException;
    .restart local v8    # "result":I
    :cond_2
    const/4 v0, -0x1

    if-ne v8, v0, :cond_0

    .line 147
    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->inputStreamEnded:Z
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 149
    .end local v8    # "result":I
    :catch_1
    move-exception v7

    .line 150
    .restart local v7    # "e":Ljava/io/IOException;
    new-instance v0, Lcom/google/android/exoplayer/ExoPlaybackException;

    invoke-direct {v0, v7}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method protected getBufferedPositionUs()J
    .locals 2

    .prologue
    .line 178
    .local p0, "this":Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;, "Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer<TT;>;"
    const-wide/16 v0, -0x3

    return-wide v0
.end method

.method protected getCurrentPositionUs()J
    .locals 2

    .prologue
    .line 173
    .local p0, "this":Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;, "Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer<TT;>;"
    iget-wide v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->currentPositionUs:J

    return-wide v0
.end method

.method protected getDurationUs()J
    .locals 2

    .prologue
    .line 168
    .local p0, "this":Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;, "Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer<TT;>;"
    iget-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v1, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->trackIndex:I

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/SampleSource;->getTrackInfo(I)Lcom/google/android/exoplayer/TrackInfo;

    move-result-object v0

    iget-wide v0, v0, Lcom/google/android/exoplayer/TrackInfo;->durationUs:J

    return-wide v0
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 202
    .local p0, "this":Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;, "Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer<TT;>;"
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 207
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 204
    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->invokeRendererInternal(Ljava/lang/Object;)V

    .line 205
    const/4 v0, 0x1

    goto :goto_0

    .line 202
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method protected isEnded()Z
    .locals 1

    .prologue
    .line 183
    .local p0, "this":Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;, "Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer<TT;>;"
    iget-boolean v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->inputStreamEnded:Z

    return v0
.end method

.method protected isReady()Z
    .locals 1

    .prologue
    .line 188
    .local p0, "this":Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;, "Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer<TT;>;"
    const/4 v0, 0x1

    return v0
.end method

.method protected onDisabled()V
    .locals 2

    .prologue
    .line 162
    .local p0, "this":Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;, "Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer<TT;>;"
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->pendingMetadata:Ljava/lang/Object;

    .line 163
    iget-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v1, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->trackIndex:I

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/SampleSource;->disable(I)V

    .line 164
    return-void
.end method

.method protected onEnabled(JZ)V
    .locals 3
    .param p1, "positionUs"    # J
    .param p3, "joining"    # Z

    .prologue
    .line 113
    .local p0, "this":Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;, "Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer<TT;>;"
    iget-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v1, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->trackIndex:I

    invoke-interface {v0, v1, p1, p2}, Lcom/google/android/exoplayer/SampleSource;->enable(IJ)V

    .line 114
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->seekToInternal(J)V

    .line 115
    return-void
.end method

.method protected seekTo(J)V
    .locals 1
    .param p1, "positionUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 119
    .local p0, "this":Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;, "Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer<TT;>;"
    iget-object v0, p0, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v0, p1, p2}, Lcom/google/android/exoplayer/SampleSource;->seekToUs(J)V

    .line 120
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/metadata/MetadataTrackRenderer;->seekToInternal(J)V

    .line 121
    return-void
.end method
