.class Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;
.super Lcom/google/android/exoplayer/hls/parser/TsExtractor$TsPayloadReader;
.source "TsExtractor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/hls/parser/TsExtractor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PesReader"
.end annotation


# static fields
.field private static final HEADER_SIZE:I = 0x9

.field private static final MAX_HEADER_EXTENSION_SIZE:I = 0x5

.field private static final STATE_FINDING_HEADER:I = 0x0

.field private static final STATE_READING_BODY:I = 0x3

.field private static final STATE_READING_HEADER:I = 0x1

.field private static final STATE_READING_HEADER_EXTENSION:I = 0x2


# instance fields
.field private bodyStarted:Z

.field private bytesRead:I

.field private extendedHeaderLength:I

.field private payloadSize:I

.field private final pesPayloadReader:Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;

.field private final pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

.field private ptsFlag:Z

.field private state:I

.field final synthetic this$0:Lcom/google/android/exoplayer/hls/parser/TsExtractor;

.field private timeUs:J


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/hls/parser/TsExtractor;Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;)V
    .locals 2
    .param p2, "pesPayloadReader"    # Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;

    .prologue
    .line 405
    iput-object p1, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->this$0:Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/hls/parser/TsExtractor$TsPayloadReader;-><init>(Lcom/google/android/exoplayer/hls/parser/TsExtractor$1;)V

    .line 406
    iput-object p2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesPayloadReader:Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;

    .line 407
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v1, 0x9

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableBitArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    .line 408
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->state:I

    .line 409
    return-void
.end method

.method private continueRead(Lcom/google/android/exoplayer/util/ParsableByteArray;[BI)Z
    .locals 4
    .param p1, "source"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "target"    # [B
    .param p3, "targetLength"    # I

    .prologue
    const/4 v1, 0x1

    .line 495
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v2

    iget v3, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->bytesRead:I

    sub-int v3, p3, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 496
    .local v0, "bytesToRead":I
    if-gtz v0, :cond_1

    .line 504
    :cond_0
    :goto_0
    return v1

    .line 498
    :cond_1
    if-nez p2, :cond_2

    .line 499
    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 503
    :goto_1
    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->bytesRead:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->bytesRead:I

    .line 504
    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->bytesRead:I

    if-eq v2, p3, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 501
    :cond_2
    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->bytesRead:I

    invoke-virtual {p1, p2, v2, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    goto :goto_1
.end method

.method private parseHeader()Z
    .locals 8

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v7, -0x1

    const/16 v6, 0x8

    .line 508
    iget-object v4, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v4, v2}, Lcom/google/android/exoplayer/util/ParsableBitArray;->setPosition(I)V

    .line 509
    iget-object v4, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v5, 0x18

    invoke-virtual {v4, v5}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v1

    .line 510
    .local v1, "startCodePrefix":I
    if-eq v1, v3, :cond_0

    .line 511
    const-string v3, "TsExtractor"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unexpected start code prefix: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 512
    iput v7, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->payloadSize:I

    .line 533
    :goto_0
    return v2

    .line 516
    :cond_0
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v2, v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 517
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v4, 0x10

    invoke-virtual {v2, v4}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v0

    .line 520
    .local v0, "packetLength":I
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v2, v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 521
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBit()Z

    move-result v2

    iput-boolean v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->ptsFlag:Z

    .line 524
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v4, 0x7

    invoke-virtual {v2, v4}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 525
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v2, v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v2

    iput v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->extendedHeaderLength:I

    .line 527
    if-nez v0, :cond_1

    .line 528
    iput v7, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->payloadSize:I

    :goto_1
    move v2, v3

    .line 533
    goto :goto_0

    .line 530
    :cond_1
    add-int/lit8 v2, v0, 0x6

    add-int/lit8 v2, v2, -0x9

    iget v4, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->extendedHeaderLength:I

    sub-int/2addr v2, v4

    iput v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->payloadSize:I

    goto :goto_1
.end method

.method private parseHeaderExtension()V
    .locals 7

    .prologue
    const/16 v6, 0xf

    const/4 v5, 0x1

    .line 537
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer/util/ParsableBitArray;->setPosition(I)V

    .line 538
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->timeUs:J

    .line 539
    iget-boolean v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->ptsFlag:Z

    if-eqz v2, :cond_0

    .line 540
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 541
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBitsLong(I)J

    move-result-wide v2

    const/16 v4, 0x1e

    shl-long v0, v2, v4

    .line 542
    .local v0, "pts":J
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v2, v5}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 543
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v2, v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBitsLong(I)J

    move-result-wide v2

    shl-long/2addr v2, v6

    or-long/2addr v0, v2

    .line 544
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v2, v5}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 545
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v2, v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBitsLong(I)J

    move-result-wide v2

    or-long/2addr v0, v2

    .line 546
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v2, v5}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 547
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->this$0:Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    invoke-virtual {v2, v0, v1}, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->ptsToTimeUs(J)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->timeUs:J

    .line 549
    .end local v0    # "pts":J
    :cond_0
    return-void
.end method

.method private setState(I)V
    .locals 1
    .param p1, "state"    # I

    .prologue
    .line 481
    iput p1, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->state:I

    .line 482
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->bytesRead:I

    .line 483
    return-void
.end method


# virtual methods
.method public consume(Lcom/google/android/exoplayer/util/ParsableByteArray;Z)V
    .locals 9
    .param p1, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "payloadUnitStartIndicator"    # Z

    .prologue
    const/4 v8, -0x1

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 413
    if-eqz p2, :cond_1

    .line 414
    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->state:I

    packed-switch v2, :pswitch_data_0

    .line 436
    :cond_0
    :goto_0
    :pswitch_0
    invoke-direct {p0, v4}, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->setState(I)V

    .line 439
    :cond_1
    :goto_1
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v2

    if-lez v2, :cond_7

    .line 440
    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->state:I

    packed-switch v2, :pswitch_data_1

    goto :goto_1

    .line 442
    :pswitch_1
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    goto :goto_1

    .line 420
    :pswitch_2
    const-string v2, "TsExtractor"

    const-string v5, "Unexpected start indicator reading extended header"

    invoke-static {v2, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 427
    :pswitch_3
    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->payloadSize:I

    if-eq v2, v8, :cond_2

    .line 428
    const-string v2, "TsExtractor"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected start indicator: expected "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->payloadSize:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " more bytes"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 431
    :cond_2
    iget-boolean v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->bodyStarted:Z

    if-eqz v2, :cond_0

    .line 432
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesPayloadReader:Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;->packetFinished()V

    goto :goto_0

    .line 445
    :pswitch_4
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableBitArray;->getData()[B

    move-result-object v2

    const/16 v5, 0x9

    invoke-direct {p0, p1, v2, v5}, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->continueRead(Lcom/google/android/exoplayer/util/ParsableByteArray;[BI)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 446
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->parseHeader()Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v2, 0x2

    :goto_2
    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->setState(I)V

    goto :goto_1

    :cond_3
    move v2, v3

    goto :goto_2

    .line 450
    :pswitch_5
    const/4 v2, 0x5

    iget v5, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->extendedHeaderLength:I

    invoke-static {v2, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 452
    .local v1, "readLength":I
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableBitArray;->getData()[B

    move-result-object v2

    invoke-direct {p0, p1, v2, v1}, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->continueRead(Lcom/google/android/exoplayer/util/ParsableByteArray;[BI)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x0

    iget v5, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->extendedHeaderLength:I

    .line 453
    invoke-direct {p0, p1, v2, v5}, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->continueRead(Lcom/google/android/exoplayer/util/ParsableByteArray;[BI)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 454
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->parseHeaderExtension()V

    .line 455
    iput-boolean v3, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->bodyStarted:Z

    .line 456
    const/4 v2, 0x3

    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->setState(I)V

    goto/16 :goto_1

    .line 460
    .end local v1    # "readLength":I
    :pswitch_6
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v1

    .line 461
    .restart local v1    # "readLength":I
    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->payloadSize:I

    if-ne v2, v8, :cond_5

    move v0, v3

    .line 462
    .local v0, "padding":I
    :goto_3
    if-lez v0, :cond_4

    .line 463
    sub-int/2addr v1, v0

    .line 464
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v2

    add-int/2addr v2, v1

    invoke-virtual {p1, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setLimit(I)V

    .line 466
    :cond_4
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesPayloadReader:Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;

    iget-wide v6, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->timeUs:J

    iget-boolean v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->bodyStarted:Z

    if-nez v2, :cond_6

    move v2, v4

    :goto_4
    invoke-virtual {v5, p1, v6, v7, v2}, Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;->consume(Lcom/google/android/exoplayer/util/ParsableByteArray;JZ)V

    .line 467
    iput-boolean v4, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->bodyStarted:Z

    .line 468
    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->payloadSize:I

    if-eq v2, v8, :cond_1

    .line 469
    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->payloadSize:I

    sub-int/2addr v2, v1

    iput v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->payloadSize:I

    .line 470
    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->payloadSize:I

    if-nez v2, :cond_1

    .line 471
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->pesPayloadReader:Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;->packetFinished()V

    .line 472
    invoke-direct {p0, v4}, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->setState(I)V

    goto/16 :goto_1

    .line 461
    .end local v0    # "padding":I
    :cond_5
    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;->payloadSize:I

    sub-int v0, v1, v2

    goto :goto_3

    .restart local v0    # "padding":I
    :cond_6
    move v2, v3

    .line 466
    goto :goto_4

    .line 478
    .end local v0    # "padding":I
    .end local v1    # "readLength":I
    :cond_7
    return-void

    .line 414
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch

    .line 440
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method
