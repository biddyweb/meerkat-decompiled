.class public Lcom/google/android/exoplayer/text/TextTrackRenderer;
.super Lcom/google/android/exoplayer/TrackRenderer;
.source "TextTrackRenderer.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation


# static fields
.field private static final MSG_UPDATE_OVERLAY:I


# instance fields
.field private currentPositionUs:J

.field private final formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

.field private inputStreamEnded:Z

.field private nextSubtitleEventIndex:I

.field private parserHelper:Lcom/google/android/exoplayer/text/SubtitleParserHelper;

.field private parserIndex:I

.field private parserThread:Landroid/os/HandlerThread;

.field private final source:Lcom/google/android/exoplayer/SampleSource;

.field private subtitle:Lcom/google/android/exoplayer/text/Subtitle;

.field private final subtitleParsers:[Lcom/google/android/exoplayer/text/SubtitleParser;

.field private final textRenderer:Lcom/google/android/exoplayer/text/TextRenderer;

.field private final textRendererHandler:Landroid/os/Handler;

.field private textRendererNeedsUpdate:Z

.field private trackIndex:I


# direct methods
.method public varargs constructor <init>(Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/text/TextRenderer;Landroid/os/Looper;[Lcom/google/android/exoplayer/text/SubtitleParser;)V
    .locals 1
    .param p1, "source"    # Lcom/google/android/exoplayer/SampleSource;
    .param p2, "textRenderer"    # Lcom/google/android/exoplayer/text/TextRenderer;
    .param p3, "textRendererLooper"    # Landroid/os/Looper;
    .param p4, "subtitleParsers"    # [Lcom/google/android/exoplayer/text/SubtitleParser;

    .prologue
    .line 73
    invoke-direct {p0}, Lcom/google/android/exoplayer/TrackRenderer;-><init>()V

    .line 74
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/SampleSource;

    iput-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    .line 75
    invoke-static {p2}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/text/TextRenderer;

    iput-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->textRenderer:Lcom/google/android/exoplayer/text/TextRenderer;

    .line 76
    if-nez p3, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->textRendererHandler:Landroid/os/Handler;

    .line 78
    invoke-static {p4}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/exoplayer/text/SubtitleParser;

    iput-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitleParsers:[Lcom/google/android/exoplayer/text/SubtitleParser;

    .line 79
    new-instance v0, Lcom/google/android/exoplayer/MediaFormatHolder;

    invoke-direct {v0}, Lcom/google/android/exoplayer/MediaFormatHolder;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    .line 80
    return-void

    .line 76
    :cond_0
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, p3, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    goto :goto_0
.end method

.method private clearTextRenderer()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 267
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->textRendererHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 268
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->textRendererHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 272
    :goto_0
    return-void

    .line 270
    :cond_0
    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->invokeRendererInternal(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private getNextEventTime()J
    .locals 2

    .prologue
    .line 252
    iget v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitleEventIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitleEventIndex:I

    iget-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    .line 253
    invoke-interface {v1}, Lcom/google/android/exoplayer/text/Subtitle;->getEventTimeCount()I

    move-result v1

    if-lt v0, v1, :cond_1

    :cond_0
    const-wide v0, 0x7fffffffffffffffL

    .line 254
    :goto_0
    return-wide v0

    .line 253
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    iget v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitleEventIndex:I

    .line 254
    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/text/Subtitle;->getEventTime(I)J

    move-result-wide v0

    goto :goto_0
.end method

.method private invokeRendererInternal(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 285
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->textRenderer:Lcom/google/android/exoplayer/text/TextRenderer;

    invoke-interface {v0, p1}, Lcom/google/android/exoplayer/text/TextRenderer;->onText(Ljava/lang/String;)V

    .line 286
    return-void
.end method

.method private seekToInternal(J)V
    .locals 5
    .param p1, "positionUs"    # J

    .prologue
    const/4 v0, 0x0

    .line 120
    iput-boolean v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->inputStreamEnded:Z

    .line 121
    iput-wide p1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->currentPositionUs:J

    .line 122
    iget-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v1, p1, p2}, Lcom/google/android/exoplayer/SampleSource;->seekToUs(J)V

    .line 123
    iget-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    invoke-interface {v1}, Lcom/google/android/exoplayer/text/Subtitle;->getStartTime()J

    move-result-wide v2

    cmp-long v1, p1, v2

    if-ltz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    .line 124
    invoke-interface {v1}, Lcom/google/android/exoplayer/text/Subtitle;->getLastEventTime()J

    move-result-wide v2

    cmp-long v1, v2, p1

    if-gtz v1, :cond_1

    .line 125
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    .line 127
    :cond_1
    iget-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserHelper:Lcom/google/android/exoplayer/text/SubtitleParserHelper;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/text/SubtitleParserHelper;->flush()V

    .line 128
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->clearTextRenderer()V

    .line 129
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->syncNextEventIndex(J)V

    .line 130
    iget-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    if-eqz v1, :cond_2

    const/4 v0, 0x1

    :cond_2
    iput-boolean v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->textRendererNeedsUpdate:Z

    .line 131
    return-void
.end method

.method private syncNextEventIndex(J)V
    .locals 1
    .param p1, "positionUs"    # J

    .prologue
    .line 248
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    if-nez v0, :cond_0

    const/4 v0, -0x1

    :goto_0
    iput v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitleEventIndex:I

    .line 249
    return-void

    .line 248
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    invoke-interface {v0, p1, p2}, Lcom/google/android/exoplayer/text/Subtitle;->getNextEventTimeIndex(J)I

    move-result v0

    goto :goto_0
.end method

.method private updateTextRenderer(J)V
    .locals 3
    .param p1, "positionUs"    # J

    .prologue
    .line 258
    iget-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    invoke-interface {v1, p1, p2}, Lcom/google/android/exoplayer/text/Subtitle;->getText(J)Ljava/lang/String;

    move-result-object v0

    .line 259
    .local v0, "text":Ljava/lang/String;
    iget-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->textRendererHandler:Landroid/os/Handler;

    if-eqz v1, :cond_0

    .line 260
    iget-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->textRendererHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 264
    :goto_0
    return-void

    .line 262
    :cond_0
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->invokeRendererInternal(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method protected doPrepare()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 85
    :try_start_0
    iget-object v4, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v4}, Lcom/google/android/exoplayer/SampleSource;->prepare()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 86
    .local v3, "sourcePrepared":Z
    if-nez v3, :cond_0

    .line 87
    const/4 v4, 0x0

    .line 101
    :goto_0
    return v4

    .line 89
    .end local v3    # "sourcePrepared":Z
    :catch_0
    move-exception v0

    .line 90
    .local v0, "e":Ljava/io/IOException;
    new-instance v4, Lcom/google/android/exoplayer/ExoPlaybackException;

    invoke-direct {v4, v0}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 92
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v3    # "sourcePrepared":Z
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v4, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitleParsers:[Lcom/google/android/exoplayer/text/SubtitleParser;

    array-length v4, v4

    if-ge v1, v4, :cond_3

    .line 93
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_2
    iget-object v4, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v4}, Lcom/google/android/exoplayer/SampleSource;->getTrackCount()I

    move-result v4

    if-ge v2, v4, :cond_2

    .line 94
    iget-object v4, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitleParsers:[Lcom/google/android/exoplayer/text/SubtitleParser;

    aget-object v4, v4, v1

    iget-object v5, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v5, v2}, Lcom/google/android/exoplayer/SampleSource;->getTrackInfo(I)Lcom/google/android/exoplayer/TrackInfo;

    move-result-object v5

    iget-object v5, v5, Lcom/google/android/exoplayer/TrackInfo;->mimeType:Ljava/lang/String;

    invoke-interface {v4, v5}, Lcom/google/android/exoplayer/text/SubtitleParser;->canParse(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 95
    iput v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserIndex:I

    .line 96
    iput v2, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->trackIndex:I

    .line 97
    const/4 v4, 0x1

    goto :goto_0

    .line 93
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 92
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 101
    .end local v2    # "j":I
    :cond_3
    const/4 v4, -0x1

    goto :goto_0
.end method

.method protected doSomeWork(JJ)V
    .locals 13
    .param p1, "positionUs"    # J
    .param p3, "elapsedRealtimeUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 135
    iput-wide p1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->currentPositionUs:J

    .line 137
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v0, p1, p2}, Lcom/google/android/exoplayer/SampleSource;->continueBuffering(J)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 142
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserHelper:Lcom/google/android/exoplayer/text/SubtitleParserHelper;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/text/SubtitleParserHelper;->isParsing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 202
    :cond_0
    :goto_0
    return-void

    .line 138
    :catch_0
    move-exception v8

    .line 139
    .local v8, "e":Ljava/io/IOException;
    new-instance v0, Lcom/google/android/exoplayer/ExoPlaybackException;

    invoke-direct {v0, v8}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 146
    .end local v8    # "e":Ljava/io/IOException;
    :cond_1
    const/4 v7, 0x0

    .line 147
    .local v7, "dequeuedSubtitle":Lcom/google/android/exoplayer/text/Subtitle;
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    if-nez v0, :cond_2

    .line 149
    :try_start_1
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserHelper:Lcom/google/android/exoplayer/text/SubtitleParserHelper;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/text/SubtitleParserHelper;->getAndClearResult()Lcom/google/android/exoplayer/text/Subtitle;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v7

    .line 155
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    if-nez v0, :cond_5

    if-eqz v7, :cond_5

    .line 157
    iput-object v7, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    .line 158
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->syncNextEventIndex(J)V

    .line 159
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->textRendererNeedsUpdate:Z

    .line 177
    :cond_3
    :goto_1
    iget-boolean v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->inputStreamEnded:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    if-nez v0, :cond_4

    .line 179
    :try_start_2
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserHelper:Lcom/google/android/exoplayer/text/SubtitleParserHelper;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/text/SubtitleParserHelper;->getSampleHolder()Lcom/google/android/exoplayer/SampleHolder;

    move-result-object v5

    .line 180
    .local v5, "sampleHolder":Lcom/google/android/exoplayer/SampleHolder;
    invoke-virtual {v5}, Lcom/google/android/exoplayer/SampleHolder;->clearData()V

    .line 181
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->trackIndex:I

    iget-object v4, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    const/4 v6, 0x0

    move-wide v2, p1

    invoke-interface/range {v0 .. v6}, Lcom/google/android/exoplayer/SampleSource;->readData(IJLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;Z)I

    move-result v9

    .line 182
    .local v9, "result":I
    const/4 v0, -0x3

    if-ne v9, v0, :cond_7

    iget-boolean v0, v5, Lcom/google/android/exoplayer/SampleHolder;->decodeOnly:Z

    if-nez v0, :cond_7

    .line 183
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserHelper:Lcom/google/android/exoplayer/text/SubtitleParserHelper;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/text/SubtitleParserHelper;->startParseOperation()V

    .line 184
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->textRendererNeedsUpdate:Z
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 194
    .end local v5    # "sampleHolder":Lcom/google/android/exoplayer/SampleHolder;
    .end local v9    # "result":I
    :cond_4
    :goto_2
    iget-boolean v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->textRendererNeedsUpdate:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->getState()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 195
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->textRendererNeedsUpdate:Z

    .line 196
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    if-nez v0, :cond_8

    .line 197
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->clearTextRenderer()V

    goto :goto_0

    .line 150
    :catch_1
    move-exception v8

    .line 151
    .restart local v8    # "e":Ljava/io/IOException;
    new-instance v0, Lcom/google/android/exoplayer/ExoPlaybackException;

    invoke-direct {v0, v8}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 160
    .end local v8    # "e":Ljava/io/IOException;
    :cond_5
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    if-eqz v0, :cond_3

    .line 163
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->getNextEventTime()J

    move-result-wide v10

    .line 164
    .local v10, "nextEventTimeUs":J
    :goto_3
    cmp-long v0, v10, p1

    if-gtz v0, :cond_6

    .line 165
    iget v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitleEventIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitleEventIndex:I

    .line 166
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->getNextEventTime()J

    move-result-wide v10

    .line 167
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->textRendererNeedsUpdate:Z

    goto :goto_3

    .line 169
    :cond_6
    const-wide v0, 0x7fffffffffffffffL

    cmp-long v0, v10, v0

    if-nez v0, :cond_3

    .line 171
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    goto :goto_1

    .line 185
    .end local v10    # "nextEventTimeUs":J
    .restart local v5    # "sampleHolder":Lcom/google/android/exoplayer/SampleHolder;
    .restart local v9    # "result":I
    :cond_7
    const/4 v0, -0x1

    if-ne v9, v0, :cond_4

    .line 186
    const/4 v0, 0x1

    :try_start_3
    iput-boolean v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->inputStreamEnded:Z
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_2

    .line 188
    .end local v5    # "sampleHolder":Lcom/google/android/exoplayer/SampleHolder;
    .end local v9    # "result":I
    :catch_2
    move-exception v8

    .line 189
    .restart local v8    # "e":Ljava/io/IOException;
    new-instance v0, Lcom/google/android/exoplayer/ExoPlaybackException;

    invoke-direct {v0, v8}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 199
    .end local v8    # "e":Ljava/io/IOException;
    :cond_8
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->updateTextRenderer(J)V

    goto/16 :goto_0
.end method

.method protected getBufferedPositionUs()J
    .locals 2

    .prologue
    .line 232
    const-wide/16 v0, -0x3

    return-wide v0
.end method

.method protected getCurrentPositionUs()J
    .locals 2

    .prologue
    .line 221
    iget-wide v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->currentPositionUs:J

    return-wide v0
.end method

.method protected getDurationUs()J
    .locals 2

    .prologue
    .line 226
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->trackIndex:I

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/SampleSource;->getTrackInfo(I)Lcom/google/android/exoplayer/TrackInfo;

    move-result-object v0

    iget-wide v0, v0, Lcom/google/android/exoplayer/TrackInfo;->durationUs:J

    return-wide v0
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 276
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 281
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 278
    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->invokeRendererInternal(Ljava/lang/String;)V

    .line 279
    const/4 v0, 0x1

    goto :goto_0

    .line 276
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method protected isEnded()Z
    .locals 1

    .prologue
    .line 237
    iget-boolean v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->inputStreamEnded:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isReady()Z
    .locals 1

    .prologue
    .line 244
    const/4 v0, 0x1

    return v0
.end method

.method protected onDisabled()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 206
    iput-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/Subtitle;

    .line 207
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 208
    iput-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserThread:Landroid/os/HandlerThread;

    .line 209
    iput-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserHelper:Lcom/google/android/exoplayer/text/SubtitleParserHelper;

    .line 210
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->clearTextRenderer()V

    .line 211
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->trackIndex:I

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/SampleSource;->disable(I)V

    .line 212
    return-void
.end method

.method protected onEnabled(JZ)V
    .locals 5
    .param p1, "positionUs"    # J
    .param p3, "joining"    # Z

    .prologue
    .line 106
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->trackIndex:I

    invoke-interface {v0, v1, p1, p2}, Lcom/google/android/exoplayer/SampleSource;->enable(IJ)V

    .line 107
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "textParser"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserThread:Landroid/os/HandlerThread;

    .line 108
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 109
    new-instance v0, Lcom/google/android/exoplayer/text/SubtitleParserHelper;

    iget-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitleParsers:[Lcom/google/android/exoplayer/text/SubtitleParser;

    iget v3, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserIndex:I

    aget-object v2, v2, v3

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/text/SubtitleParserHelper;-><init>(Landroid/os/Looper;Lcom/google/android/exoplayer/text/SubtitleParser;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserHelper:Lcom/google/android/exoplayer/text/SubtitleParserHelper;

    .line 110
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->seekToInternal(J)V

    .line 111
    return-void
.end method

.method protected onReleased()V
    .locals 1

    .prologue
    .line 216
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v0}, Lcom/google/android/exoplayer/SampleSource;->release()V

    .line 217
    return-void
.end method

.method protected seekTo(J)V
    .locals 1
    .param p1, "positionUs"    # J

    .prologue
    .line 115
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v0, p1, p2}, Lcom/google/android/exoplayer/SampleSource;->seekToUs(J)V

    .line 116
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->seekToInternal(J)V

    .line 117
    return-void
.end method
