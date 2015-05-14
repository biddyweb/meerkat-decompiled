.class public Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;
.super Lcom/google/android/exoplayer/TrackRenderer;
.source "Eia608TrackRenderer.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# static fields
.field private static final CC_MODE_PAINT_ON:I = 0x3

.field private static final CC_MODE_POP_ON:I = 0x2

.field private static final CC_MODE_ROLL_UP:I = 0x1

.field private static final CC_MODE_UNKNOWN:I = 0x0

.field private static final DEFAULT_CAPTIONS_ROW_COUNT:I = 0x4

.field private static final MAX_SAMPLE_READAHEAD_US:I = 0x4c4b40

.field private static final MSG_INVOKE_RENDERER:I


# instance fields
.field private caption:Ljava/lang/String;

.field private captionMode:I

.field private captionRowCount:I

.field private final captionStringBuilder:Ljava/lang/StringBuilder;

.field private currentPositionUs:J

.field private final eia608Parser:Lcom/google/android/exoplayer/text/eia608/Eia608Parser;

.field private final formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

.field private inputStreamEnded:Z

.field private lastRenderedCaption:Ljava/lang/String;

.field private final pendingCaptionLists:Ljava/util/TreeSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeSet",
            "<",
            "Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;",
            ">;"
        }
    .end annotation
.end field

.field private final sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

.field private final source:Lcom/google/android/exoplayer/SampleSource;

.field private final textRenderer:Lcom/google/android/exoplayer/text/TextRenderer;

.field private final textRendererHandler:Landroid/os/Handler;

.field private trackIndex:I


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/text/TextRenderer;Landroid/os/Looper;)V
    .locals 2
    .param p1, "source"    # Lcom/google/android/exoplayer/SampleSource;
    .param p2, "textRenderer"    # Lcom/google/android/exoplayer/text/TextRenderer;
    .param p3, "textRendererLooper"    # Landroid/os/Looper;

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/google/android/exoplayer/TrackRenderer;-><init>()V

    .line 82
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/SampleSource;

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    .line 83
    invoke-static {p2}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/text/TextRenderer;

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->textRenderer:Lcom/google/android/exoplayer/text/TextRenderer;

    .line 84
    if-nez p3, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->textRendererHandler:Landroid/os/Handler;

    .line 85
    new-instance v0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;

    invoke-direct {v0}, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->eia608Parser:Lcom/google/android/exoplayer/text/eia608/Eia608Parser;

    .line 86
    new-instance v0, Lcom/google/android/exoplayer/MediaFormatHolder;

    invoke-direct {v0}, Lcom/google/android/exoplayer/MediaFormatHolder;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    .line 87
    new-instance v0, Lcom/google/android/exoplayer/SampleHolder;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/SampleHolder;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    .line 89
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->pendingCaptionLists:Ljava/util/TreeSet;

    .line 90
    return-void

    .line 84
    :cond_0
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, p3, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    goto :goto_0
.end method

.method private clearPendingSample()V
    .locals 4

    .prologue
    .line 378
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    const-wide/16 v2, -0x1

    iput-wide v2, v0, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    .line 379
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/SampleHolder;->clearData()V

    .line 380
    return-void
.end method

.method private consumeCaptionList(Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;)V
    .locals 6
    .param p1, "captionList"    # Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;

    .prologue
    .line 247
    iget-object v4, p1, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;->captions:[Lcom/google/android/exoplayer/text/eia608/ClosedCaption;

    array-length v1, v4

    .line 248
    .local v1, "captionBufferSize":I
    if-nez v1, :cond_1

    .line 269
    :cond_0
    :goto_0
    return-void

    .line 252
    :cond_1
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, v1, :cond_5

    .line 253
    iget-object v4, p1, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;->captions:[Lcom/google/android/exoplayer/text/eia608/ClosedCaption;

    aget-object v0, v4, v3

    .line 254
    .local v0, "caption":Lcom/google/android/exoplayer/text/eia608/ClosedCaption;
    iget v4, v0, Lcom/google/android/exoplayer/text/eia608/ClosedCaption;->type:I

    if-nez v4, :cond_4

    move-object v2, v0

    .line 255
    check-cast v2, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;

    .line 256
    .local v2, "captionCtrl":Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;
    invoke-virtual {v2}, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;->isMiscCode()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 257
    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->handleMiscCode(Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;)V

    .line 252
    .end local v0    # "caption":Lcom/google/android/exoplayer/text/eia608/ClosedCaption;
    .end local v2    # "captionCtrl":Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;
    :cond_2
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 258
    .restart local v0    # "caption":Lcom/google/android/exoplayer/text/eia608/ClosedCaption;
    .restart local v2    # "captionCtrl":Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;
    :cond_3
    invoke-virtual {v2}, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;->isPreambleAddressCode()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 259
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->handlePreambleAddressCode()V

    goto :goto_2

    .line 262
    .end local v2    # "captionCtrl":Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;
    :cond_4
    check-cast v0, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionText;

    .end local v0    # "caption":Lcom/google/android/exoplayer/text/eia608/ClosedCaption;
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->handleText(Lcom/google/android/exoplayer/text/eia608/ClosedCaptionText;)V

    goto :goto_2

    .line 266
    :cond_5
    iget v4, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionMode:I

    const/4 v5, 0x1

    if-eq v4, v5, :cond_6

    iget v4, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionMode:I

    const/4 v5, 0x3

    if-ne v4, v5, :cond_0

    .line 267
    :cond_6
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->getDisplayCaption()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->caption:Ljava/lang/String;

    goto :goto_0
.end method

.method private getDisplayCaption()Ljava/lang/String;
    .locals 12

    .prologue
    const/4 v6, 0x0

    const/4 v11, -0x1

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 350
    iget-object v9, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 351
    .local v0, "buildLength":I
    if-nez v0, :cond_1

    .line 374
    :cond_0
    :goto_0
    return-object v6

    .line 355
    :cond_1
    iget-object v9, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    add-int/lit8 v10, v0, -0x1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v9

    const/16 v10, 0xa

    if-ne v9, v10, :cond_3

    move v2, v7

    .line 356
    .local v2, "endsWithNewline":Z
    :goto_1
    if-ne v0, v7, :cond_2

    if-nez v2, :cond_0

    .line 360
    :cond_2
    if-eqz v2, :cond_4

    add-int/lit8 v1, v0, -0x1

    .line 361
    .local v1, "endIndex":I
    :goto_2
    iget v6, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionMode:I

    if-eq v6, v7, :cond_5

    .line 362
    iget-object v6, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v6, v8, v1}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .end local v1    # "endIndex":I
    .end local v2    # "endsWithNewline":Z
    :cond_3
    move v2, v8

    .line 355
    goto :goto_1

    .restart local v2    # "endsWithNewline":Z
    :cond_4
    move v1, v0

    .line 360
    goto :goto_2

    .line 365
    .restart local v1    # "endIndex":I
    :cond_5
    const/4 v5, 0x0

    .line 366
    .local v5, "startIndex":I
    move v4, v1

    .line 367
    .local v4, "searchBackwardFromIndex":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_3
    iget v6, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionRowCount:I

    if-ge v3, v6, :cond_6

    if-eq v4, v11, :cond_6

    .line 368
    iget-object v6, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    const-string v7, "\n"

    add-int/lit8 v9, v4, -0x1

    invoke-virtual {v6, v7, v9}, Ljava/lang/StringBuilder;->lastIndexOf(Ljava/lang/String;I)I

    move-result v4

    .line 367
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 370
    :cond_6
    if-eq v4, v11, :cond_7

    .line 371
    add-int/lit8 v5, v4, 0x1

    .line 373
    :cond_7
    iget-object v6, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v6, v8, v5}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 374
    iget-object v6, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    sub-int v7, v1, v5

    invoke-virtual {v6, v8, v7}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v6

    goto :goto_0
.end method

.method private handleMiscCode(Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;)V
    .locals 5
    .param p1, "captionCtrl"    # Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x3

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 278
    iget-byte v0, p1, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;->cc2:B

    packed-switch v0, :pswitch_data_0

    .line 299
    :pswitch_0
    iget v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionMode:I

    if-nez v0, :cond_1

    .line 321
    :cond_0
    :goto_0
    return-void

    .line 280
    :pswitch_1
    iput v4, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionRowCount:I

    .line 281
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->setCaptionMode(I)V

    goto :goto_0

    .line 284
    :pswitch_2
    iput v3, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionRowCount:I

    .line 285
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->setCaptionMode(I)V

    goto :goto_0

    .line 288
    :pswitch_3
    const/4 v0, 0x4

    iput v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionRowCount:I

    .line 289
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->setCaptionMode(I)V

    goto :goto_0

    .line 292
    :pswitch_4
    invoke-direct {p0, v4}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->setCaptionMode(I)V

    goto :goto_0

    .line 295
    :pswitch_5
    invoke-direct {p0, v3}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->setCaptionMode(I)V

    goto :goto_0

    .line 303
    :cond_1
    iget-byte v0, p1, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;->cc2:B

    packed-switch v0, :pswitch_data_1

    goto :goto_0

    .line 305
    :pswitch_6
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->caption:Ljava/lang/String;

    .line 306
    iget v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionMode:I

    if-eq v0, v1, :cond_2

    iget v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionMode:I

    if-ne v0, v3, :cond_0

    .line 307
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_0

    .line 311
    :pswitch_7
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_0

    .line 314
    :pswitch_8
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->getDisplayCaption()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->caption:Ljava/lang/String;

    .line 315
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_0

    .line 318
    :pswitch_9
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->maybeAppendNewline()V

    goto :goto_0

    .line 278
    :pswitch_data_0
    .packed-switch 0x20
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_5
    .end packed-switch

    .line 303
    :pswitch_data_1
    .packed-switch 0x2c
        :pswitch_6
        :pswitch_9
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method private handlePreambleAddressCode()V
    .locals 0

    .prologue
    .line 325
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->maybeAppendNewline()V

    .line 326
    return-void
.end method

.method private handleText(Lcom/google/android/exoplayer/text/eia608/ClosedCaptionText;)V
    .locals 2
    .param p1, "captionText"    # Lcom/google/android/exoplayer/text/eia608/ClosedCaptionText;

    .prologue
    .line 272
    iget v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionMode:I

    if-eqz v0, :cond_0

    .line 273
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionText;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    :cond_0
    return-void
.end method

.method private invokeRenderer(Ljava/lang/String;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 207
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->lastRenderedCaption:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/google/android/exoplayer/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 217
    :goto_0
    return-void

    .line 211
    :cond_0
    iput-object p1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->lastRenderedCaption:Ljava/lang/String;

    .line 212
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->textRendererHandler:Landroid/os/Handler;

    if-eqz v0, :cond_1

    .line 213
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->textRendererHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 215
    :cond_1
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->invokeRendererInternal(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private invokeRendererInternal(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 231
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->textRenderer:Lcom/google/android/exoplayer/text/TextRenderer;

    invoke-interface {v0, p1}, Lcom/google/android/exoplayer/text/TextRenderer;->onText(Ljava/lang/String;)V

    .line 232
    return-void
.end method

.method private isSamplePending()Z
    .locals 4

    .prologue
    .line 383
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-wide v0, v0, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private maybeAppendNewline()V
    .locals 4

    .prologue
    const/16 v3, 0xa

    .line 343
    iget-object v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 344
    .local v0, "buildLength":I
    if-lez v0, :cond_0

    iget-object v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    if-eq v1, v3, :cond_0

    .line 345
    iget-object v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 347
    :cond_0
    return-void
.end method

.method private maybeParsePendingSample()V
    .locals 8

    .prologue
    .line 235
    iget-object v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-wide v2, v1, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    iget-wide v4, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->currentPositionUs:J

    const-wide/32 v6, 0x4c4b40

    add-long/2addr v4, v6

    cmp-long v1, v2, v4

    if-lez v1, :cond_1

    .line 244
    :cond_0
    :goto_0
    return-void

    .line 239
    :cond_1
    iget-object v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->eia608Parser:Lcom/google/android/exoplayer/text/eia608/Eia608Parser;

    iget-object v2, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->parse(Lcom/google/android/exoplayer/SampleHolder;)Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;

    move-result-object v0

    .line 240
    .local v0, "holder":Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->clearPendingSample()V

    .line 241
    if-eqz v0, :cond_0

    .line 242
    iget-object v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->pendingCaptionLists:Ljava/util/TreeSet;

    invoke-virtual {v1, v0}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private seekToInternal(J)V
    .locals 3
    .param p1, "positionUs"    # J

    .prologue
    const/4 v1, 0x0

    .line 124
    iput-wide p1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->currentPositionUs:J

    .line 125
    iput-boolean v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->inputStreamEnded:Z

    .line 126
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->pendingCaptionLists:Ljava/util/TreeSet;

    invoke-virtual {v0}, Ljava/util/TreeSet;->clear()V

    .line 127
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->clearPendingSample()V

    .line 128
    const/4 v0, 0x4

    iput v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionRowCount:I

    .line 129
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->setCaptionMode(I)V

    .line 130
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->invokeRenderer(Ljava/lang/String;)V

    .line 131
    return-void
.end method

.method private setCaptionMode(I)V
    .locals 2
    .param p1, "captionMode"    # I

    .prologue
    .line 329
    iget v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionMode:I

    if-ne v0, p1, :cond_1

    .line 340
    :cond_0
    :goto_0
    return-void

    .line 333
    :cond_1
    iput p1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionMode:I

    .line 335
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 336
    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    if-nez p1, :cond_0

    .line 338
    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->caption:Ljava/lang/String;

    goto :goto_0
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
    :try_start_0
    iget-object v3, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

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
    iget-object v3, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v3}, Lcom/google/android/exoplayer/SampleSource;->getTrackCount()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 103
    iget-object v3, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->eia608Parser:Lcom/google/android/exoplayer/text/eia608/Eia608Parser;

    iget-object v4, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v4, v1}, Lcom/google/android/exoplayer/SampleSource;->getTrackInfo(I)Lcom/google/android/exoplayer/TrackInfo;

    move-result-object v4

    iget-object v4, v4, Lcom/google/android/exoplayer/TrackInfo;->mimeType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->canParse(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 104
    iput v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->trackIndex:I

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
    .locals 11
    .param p1, "positionUs"    # J
    .param p3, "elapsedRealtimeUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 136
    iput-wide p1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->currentPositionUs:J

    .line 138
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v0, p1, p2}, Lcom/google/android/exoplayer/SampleSource;->continueBuffering(J)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 143
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->isSamplePending()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 144
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->maybeParsePendingSample()V

    .line 147
    :cond_0
    iget-boolean v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->inputStreamEnded:Z

    if-eqz v0, :cond_2

    const/4 v9, -0x1

    .line 148
    .local v9, "result":I
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->isSamplePending()Z

    move-result v0

    if-nez v0, :cond_5

    const/4 v0, -0x3

    if-ne v9, v0, :cond_5

    .line 150
    :try_start_1
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->trackIndex:I

    iget-object v4, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    iget-object v5, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    const/4 v6, 0x0

    move-wide v2, p1

    invoke-interface/range {v0 .. v6}, Lcom/google/android/exoplayer/SampleSource;->readData(IJLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;Z)I

    move-result v9

    .line 151
    const/4 v0, -0x3

    if-ne v9, v0, :cond_3

    .line 152
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->maybeParsePendingSample()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 156
    :catch_0
    move-exception v7

    .line 157
    .local v7, "e":Ljava/io/IOException;
    new-instance v0, Lcom/google/android/exoplayer/ExoPlaybackException;

    invoke-direct {v0, v7}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 139
    .end local v7    # "e":Ljava/io/IOException;
    .end local v9    # "result":I
    :catch_1
    move-exception v7

    .line 140
    .restart local v7    # "e":Ljava/io/IOException;
    new-instance v0, Lcom/google/android/exoplayer/ExoPlaybackException;

    invoke-direct {v0, v7}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 147
    .end local v7    # "e":Ljava/io/IOException;
    :cond_2
    const/4 v9, -0x3

    goto :goto_0

    .line 153
    .restart local v9    # "result":I
    :cond_3
    const/4 v0, -0x1

    if-ne v9, v0, :cond_1

    .line 154
    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->inputStreamEnded:Z
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 167
    :cond_4
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->pendingCaptionLists:Ljava/util/TreeSet;

    invoke-virtual {v0}, Ljava/util/TreeSet;->pollFirst()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;

    .line 168
    .local v8, "nextCaptionList":Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;
    invoke-direct {p0, v8}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->consumeCaptionList(Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;)V

    .line 170
    iget-boolean v0, v8, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;->decodeOnly:Z

    if-nez v0, :cond_5

    .line 171
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->caption:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->invokeRenderer(Ljava/lang/String;)V

    .line 161
    .end local v8    # "nextCaptionList":Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;
    :cond_5
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->pendingCaptionLists:Ljava/util/TreeSet;

    invoke-virtual {v0}, Ljava/util/TreeSet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    .line 162
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->pendingCaptionLists:Ljava/util/TreeSet;

    invoke-virtual {v0}, Ljava/util/TreeSet;->first()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;

    iget-wide v0, v0, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;->timeUs:J

    iget-wide v2, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->currentPositionUs:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_4

    .line 174
    :cond_6
    return-void
.end method

.method protected getBufferedPositionUs()J
    .locals 2

    .prologue
    .line 193
    const-wide/16 v0, -0x3

    return-wide v0
.end method

.method protected getCurrentPositionUs()J
    .locals 2

    .prologue
    .line 188
    iget-wide v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->currentPositionUs:J

    return-wide v0
.end method

.method protected getDurationUs()J
    .locals 2

    .prologue
    .line 183
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->trackIndex:I

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/SampleSource;->getTrackInfo(I)Lcom/google/android/exoplayer/TrackInfo;

    move-result-object v0

    iget-wide v0, v0, Lcom/google/android/exoplayer/TrackInfo;->durationUs:J

    return-wide v0
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 222
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 227
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 224
    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->invokeRendererInternal(Ljava/lang/String;)V

    .line 225
    const/4 v0, 0x1

    goto :goto_0

    .line 222
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method protected isEnded()Z
    .locals 1

    .prologue
    .line 198
    iget-boolean v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->inputStreamEnded:Z

    return v0
.end method

.method protected isReady()Z
    .locals 1

    .prologue
    .line 203
    const/4 v0, 0x1

    return v0
.end method

.method protected onDisabled()V
    .locals 2

    .prologue
    .line 178
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->trackIndex:I

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/SampleSource;->disable(I)V

    .line 179
    return-void
.end method

.method protected onEnabled(JZ)V
    .locals 3
    .param p1, "positionUs"    # J
    .param p3, "joining"    # Z

    .prologue
    .line 113
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->trackIndex:I

    invoke-interface {v0, v1, p1, p2}, Lcom/google/android/exoplayer/SampleSource;->enable(IJ)V

    .line 114
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->seekToInternal(J)V

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
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v0, p1, p2}, Lcom/google/android/exoplayer/SampleSource;->seekToUs(J)V

    .line 120
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->seekToInternal(J)V

    .line 121
    return-void
.end method
