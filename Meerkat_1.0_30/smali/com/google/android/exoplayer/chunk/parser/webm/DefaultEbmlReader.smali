.class final Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;
.super Ljava/lang/Object;
.source "DefaultEbmlReader.java"

# interfaces
.implements Lcom/google/android/exoplayer/chunk/parser/webm/EbmlReader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader$MasterElement;
    }
.end annotation


# static fields
.field private static final MAX_INTEGER_ELEMENT_SIZE_BYTES:I = 0x8

.field private static final STATE_BEGIN_READING:I = 0x0

.field private static final STATE_FINISHED_READING:I = 0x2

.field private static final STATE_READ_CONTENTS:I = 0x1

.field private static final VALID_FLOAT32_ELEMENT_SIZE_BYTES:I = 0x4

.field private static final VALID_FLOAT64_ELEMENT_SIZE_BYTES:I = 0x8

.field private static final VARINT_LENGTH_MASKS:[I


# instance fields
.field private bytesRead:J

.field private bytesState:I

.field private elementContentSize:J

.field private elementContentSizeState:I

.field private elementId:I

.field private elementIdState:I

.field private elementOffset:J

.field private eventHandler:Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;

.field private final masterElementsStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader$MasterElement;",
            ">;"
        }
    .end annotation
.end field

.field private state:I

.field private stringBytes:[B

.field private final tempByteArray:[B

.field private varintBytesLength:I

.field private varintBytesState:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->VARINT_LENGTH_MASKS:[I

    return-void

    :array_0
    .array-data 4
        0x80
        0x40
        0x20
        0x10
        0x8
        0x4
        0x2
        0x1
    .end array-data
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const/16 v0, 0x8

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->tempByteArray:[B

    .line 62
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->masterElementsStack:Ljava/util/Stack;

    .line 538
    return-void
.end method

.method private getTempByteArrayValue(IZ)J
    .locals 8
    .param p1, "byteLength"    # I
    .param p2, "removeLengthMask"    # Z

    .prologue
    .line 523
    if-eqz p2, :cond_0

    .line 524
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->tempByteArray:[B

    const/4 v4, 0x0

    aget-byte v5, v1, v4

    sget-object v6, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->VARINT_LENGTH_MASKS:[I

    iget v7, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->varintBytesLength:I

    add-int/lit8 v7, v7, -0x1

    aget v6, v6, v7

    xor-int/lit8 v6, v6, -0x1

    and-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v1, v4

    .line 526
    :cond_0
    const-wide/16 v2, 0x0

    .line 527
    .local v2, "varint":J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_1

    .line 529
    const/16 v1, 0x8

    shl-long v4, v2, v1

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->tempByteArray:[B

    aget-byte v1, v1, v0

    and-int/lit16 v1, v1, 0xff

    int-to-long v6, v1

    or-long v2, v4, v6

    .line 527
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 531
    :cond_1
    return-wide v2
.end method

.method private prepareForNextElement()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 311
    iput v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->state:I

    .line 312
    iput v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementIdState:I

    .line 313
    iput v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSizeState:I

    .line 314
    iget-wide v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesRead:J

    iput-wide v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementOffset:J

    .line 315
    return-void
.end method

.method private readBytesInternal(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;Ljava/nio/ByteBuffer;I)I
    .locals 4
    .param p1, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    .param p2, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .param p3, "totalBytes"    # I

    .prologue
    .line 436
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesState:I

    if-nez v2, :cond_0

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    if-le p3, v2, :cond_0

    .line 437
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Byte buffer not large enough"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 439
    :cond_0
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesState:I

    if-lt v2, p3, :cond_1

    .line 440
    const/4 v2, 0x0

    .line 444
    :goto_0
    return v2

    .line 442
    :cond_1
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesState:I

    sub-int v1, p3, v2

    .line 443
    .local v1, "remainingBytes":I
    invoke-interface {p1, p2, v1}, Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;->read(Ljava/nio/ByteBuffer;I)I

    move-result v0

    .line 444
    .local v0, "additionalBytesRead":I
    invoke-direct {p0, v0, p3}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->updateBytesState(II)I

    move-result v2

    goto :goto_0
.end method

.method private readBytesInternal(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;[BI)I
    .locals 4
    .param p1, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    .param p2, "byteArray"    # [B
    .param p3, "totalBytes"    # I

    .prologue
    .line 461
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesState:I

    if-nez v2, :cond_0

    array-length v2, p2

    if-le p3, v2, :cond_0

    .line 462
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Byte array not large enough"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 464
    :cond_0
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesState:I

    if-lt v2, p3, :cond_1

    .line 465
    const/4 v2, 0x0

    .line 469
    :goto_0
    return v2

    .line 467
    :cond_1
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesState:I

    sub-int v1, p3, v2

    .line 468
    .local v1, "remainingBytes":I
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesState:I

    invoke-interface {p1, p2, v2, v1}, Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;->read([BII)I

    move-result v0

    .line 469
    .local v0, "additionalBytesRead":I
    invoke-direct {p0, v0, p3}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->updateBytesState(II)I

    move-result v2

    goto :goto_0
.end method

.method private readElementContentSize(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)I
    .locals 5
    .param p1, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v1, 0x0

    .line 356
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSizeState:I

    if-ne v2, v4, :cond_1

    move v0, v1

    .line 369
    :cond_0
    :goto_0
    return v0

    .line 359
    :cond_1
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSizeState:I

    if-nez v2, :cond_2

    .line 360
    iput v1, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->varintBytesState:I

    .line 361
    iput v3, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSizeState:I

    .line 363
    :cond_2
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->readVarintBytes(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)I

    move-result v0

    .line 364
    .local v0, "result":I
    if-nez v0, :cond_0

    .line 367
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->varintBytesLength:I

    invoke-direct {p0, v2, v3}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->getTempByteArrayValue(IZ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    .line 368
    iput v4, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSizeState:I

    move v0, v1

    .line 369
    goto :goto_0
.end method

.method private readElementId(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)I
    .locals 5
    .param p1, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;

    .prologue
    const/4 v4, 0x2

    const/4 v1, 0x0

    .line 327
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementIdState:I

    if-ne v2, v4, :cond_1

    move v0, v1

    .line 341
    :cond_0
    :goto_0
    return v0

    .line 330
    :cond_1
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementIdState:I

    if-nez v2, :cond_2

    .line 331
    iput v1, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->varintBytesState:I

    .line 332
    const/4 v2, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementIdState:I

    .line 334
    :cond_2
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->readVarintBytes(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)I

    move-result v0

    .line 335
    .local v0, "result":I
    if-nez v0, :cond_0

    .line 339
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->varintBytesLength:I

    invoke-direct {p0, v2, v1}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->getTempByteArrayValue(IZ)J

    move-result-wide v2

    long-to-int v2, v2

    iput v2, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementId:I

    .line 340
    iput v4, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementIdState:I

    move v0, v1

    .line 341
    goto :goto_0
.end method

.method private readVarintBytes(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)I
    .locals 8
    .param p1, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;

    .prologue
    const/4 v7, 0x1

    const/4 v6, -0x1

    const/4 v3, 0x0

    .line 385
    iget v4, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->varintBytesState:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_1

    move v2, v3

    .line 419
    :cond_0
    :goto_0
    return v2

    .line 390
    :cond_1
    iget v4, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->varintBytesState:I

    if-nez v4, :cond_4

    .line 391
    iput v3, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesState:I

    .line 392
    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->tempByteArray:[B

    invoke-direct {p0, p1, v4, v7}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->readBytesInternal(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;[BI)I

    move-result v2

    .line 393
    .local v2, "result":I
    if-nez v2, :cond_0

    .line 396
    iput v7, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->varintBytesState:I

    .line 398
    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->tempByteArray:[B

    aget-byte v4, v4, v3

    and-int/lit16 v0, v4, 0xff

    .line 399
    .local v0, "firstByte":I
    iput v6, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->varintBytesLength:I

    .line 400
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    sget-object v4, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->VARINT_LENGTH_MASKS:[I

    array-length v4, v4

    if-ge v1, v4, :cond_2

    .line 401
    sget-object v4, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->VARINT_LENGTH_MASKS:[I

    aget v4, v4, v1

    and-int/2addr v4, v0

    if-eqz v4, :cond_3

    .line 402
    add-int/lit8 v4, v1, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->varintBytesLength:I

    .line 406
    :cond_2
    iget v4, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->varintBytesLength:I

    if-ne v4, v6, :cond_4

    .line 407
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No valid varint length mask found at bytesRead = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v6, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesRead:J

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 400
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 413
    .end local v0    # "firstByte":I
    .end local v1    # "i":I
    .end local v2    # "result":I
    :cond_4
    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->tempByteArray:[B

    iget v5, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->varintBytesLength:I

    invoke-direct {p0, p1, v4, v5}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->readBytesInternal(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;[BI)I

    move-result v2

    .line 414
    .restart local v2    # "result":I
    if-nez v2, :cond_0

    move v2, v3

    .line 419
    goto :goto_0
.end method

.method private skipBytesInternal(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;I)I
    .locals 3
    .param p1, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    .param p2, "totalBytes"    # I

    .prologue
    .line 485
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesState:I

    if-lt v2, p2, :cond_0

    .line 486
    const/4 v2, 0x0

    .line 490
    :goto_0
    return v2

    .line 488
    :cond_0
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesState:I

    sub-int v1, p2, v2

    .line 489
    .local v1, "remainingBytes":I
    invoke-interface {p1, v1}, Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;->skip(I)I

    move-result v0

    .line 490
    .local v0, "additionalBytesRead":I
    invoke-direct {p0, v0, p2}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->updateBytesState(II)I

    move-result v2

    goto :goto_0
.end method

.method private updateBytesState(II)I
    .locals 4
    .param p1, "additionalBytesRead"    # I
    .param p2, "totalBytes"    # I

    .prologue
    .line 502
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 503
    const/4 v0, 0x2

    .line 510
    :goto_0
    return v0

    .line 505
    :cond_0
    iget v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesState:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesState:I

    .line 506
    iget-wide v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesRead:J

    int-to-long v2, p1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesRead:J

    .line 507
    iget v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesState:I

    if-ge v0, p2, :cond_1

    .line 508
    const/4 v0, 0x1

    goto :goto_0

    .line 510
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getBytesRead()J
    .locals 2

    .prologue
    .line 259
    iget-wide v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesRead:J

    return-wide v0
.end method

.method public read(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)I
    .locals 32
    .param p1, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 139
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->eventHandler:Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    :goto_0
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 141
    :goto_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->masterElementsStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesRead:J

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->masterElementsStack:Ljava/util/Stack;

    .line 142
    invoke-virtual {v2}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader$MasterElement;

    # getter for: Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader$MasterElement;->elementEndOffsetBytes:J
    invoke-static {v2}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader$MasterElement;->access$000(Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader$MasterElement;)J

    move-result-wide v2

    cmp-long v2, v4, v2

    if-ltz v2, :cond_2

    .line 143
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->eventHandler:Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->masterElementsStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader$MasterElement;

    # getter for: Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader$MasterElement;->elementId:I
    invoke-static {v2}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader$MasterElement;->access$100(Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader$MasterElement;)I

    move-result v2

    invoke-interface {v3, v2}, Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;->onMasterElementEnd(I)V

    .line 144
    const/16 v19, 0x0

    .line 247
    :cond_0
    :goto_2
    return v19

    .line 139
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 147
    :cond_2
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->state:I

    if-nez v2, :cond_4

    .line 148
    invoke-direct/range {p0 .. p1}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->readElementId(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)I

    move-result v19

    .line 149
    .local v19, "idResult":I
    if-nez v19, :cond_0

    .line 152
    invoke-direct/range {p0 .. p1}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->readElementContentSize(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)I

    move-result v23

    .line 153
    .local v23, "sizeResult":I
    if-eqz v23, :cond_3

    move/from16 v19, v23

    .line 154
    goto :goto_2

    .line 156
    :cond_3
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->state:I

    .line 157
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesState:I

    .line 160
    .end local v19    # "idResult":I
    .end local v23    # "sizeResult":I
    :cond_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->eventHandler:Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementId:I

    invoke-interface {v2, v3}, Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;->getElementType(I)I

    move-result v29

    .line 161
    .local v29, "type":I
    packed-switch v29, :pswitch_data_0

    .line 252
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid element type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v29

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 163
    :pswitch_0
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesRead:J

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementOffset:J

    sub-long/2addr v2, v4

    long-to-int v6, v2

    .line 164
    .local v6, "masterHeaderSize":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->masterElementsStack:Ljava/util/Stack;

    new-instance v3, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader$MasterElement;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementId:I

    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesRead:J

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    add-long/2addr v8, v10

    const/4 v5, 0x0

    invoke-direct {v3, v4, v8, v9, v5}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader$MasterElement;-><init>(IJLcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader$1;)V

    invoke-virtual {v2, v3}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    .line 165
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->eventHandler:Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementId:I

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementOffset:J

    move-object/from16 v0, p0

    iget-wide v7, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    invoke-interface/range {v2 .. v8}, Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;->onMasterElementStart(IJIJ)V

    .line 167
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->prepareForNextElement()V

    .line 168
    const/16 v19, 0x0

    goto/16 :goto_2

    .line 170
    .end local v6    # "masterHeaderSize":I
    :pswitch_1
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    const-wide/16 v4, 0x8

    cmp-long v2, v2, v4

    if-lez v2, :cond_5

    .line 171
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid integer size "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 173
    :cond_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->tempByteArray:[B

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    long-to-int v3, v4

    .line 174
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->readBytesInternal(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;[BI)I

    move-result v22

    .line 175
    .local v22, "intResult":I
    if-eqz v22, :cond_6

    move/from16 v19, v22

    .line 176
    goto/16 :goto_2

    .line 178
    :cond_6
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    long-to-int v2, v2

    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->getTempByteArrayValue(IZ)J

    move-result-wide v24

    .line 179
    .local v24, "intValue":J
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->eventHandler:Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementId:I

    move-wide/from16 v0, v24

    invoke-interface {v2, v3, v0, v1}, Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;->onIntegerElement(IJ)V

    .line 180
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->prepareForNextElement()V

    .line 181
    const/16 v19, 0x0

    goto/16 :goto_2

    .line 183
    .end local v22    # "intResult":I
    .end local v24    # "intValue":J
    :pswitch_2
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    const-wide/16 v4, 0x4

    cmp-long v2, v2, v4

    if-eqz v2, :cond_7

    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    const-wide/16 v4, 0x8

    cmp-long v2, v2, v4

    if-eqz v2, :cond_7

    .line 185
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid float size "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 187
    :cond_7
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->tempByteArray:[B

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    long-to-int v3, v4

    .line 188
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->readBytesInternal(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;[BI)I

    move-result v18

    .line 189
    .local v18, "floatResult":I
    if-eqz v18, :cond_8

    move/from16 v19, v18

    .line 190
    goto/16 :goto_2

    .line 192
    :cond_8
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    long-to-int v2, v2

    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->getTempByteArrayValue(IZ)J

    move-result-wide v30

    .line 194
    .local v30, "valueBits":J
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    const-wide/16 v4, 0x4

    cmp-long v2, v2, v4

    if-nez v2, :cond_9

    .line 195
    move-wide/from16 v0, v30

    long-to-int v2, v0

    invoke-static {v2}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v2

    float-to-double v0, v2

    move-wide/from16 v20, v0

    .line 199
    .local v20, "floatValue":D
    :goto_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->eventHandler:Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementId:I

    move-wide/from16 v0, v20

    invoke-interface {v2, v3, v0, v1}, Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;->onFloatElement(ID)V

    .line 200
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->prepareForNextElement()V

    .line 201
    const/16 v19, 0x0

    goto/16 :goto_2

    .line 197
    .end local v20    # "floatValue":D
    :cond_9
    invoke-static/range {v30 .. v31}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v20

    .restart local v20    # "floatValue":D
    goto :goto_3

    .line 203
    .end local v18    # "floatResult":I
    .end local v20    # "floatValue":D
    .end local v30    # "valueBits":J
    :pswitch_3
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    const-wide/32 v4, 0x7fffffff

    cmp-long v2, v2, v4

    if-lez v2, :cond_a

    .line 204
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "String element size "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is larger than MAX_INT"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 207
    :cond_a
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->stringBytes:[B

    if-nez v2, :cond_b

    .line 208
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    long-to-int v2, v2

    new-array v2, v2, [B

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->stringBytes:[B

    .line 210
    :cond_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->stringBytes:[B

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    long-to-int v3, v4

    .line 211
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->readBytesInternal(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;[BI)I

    move-result v27

    .line 212
    .local v27, "stringResult":I
    if-eqz v27, :cond_c

    move/from16 v19, v27

    .line 213
    goto/16 :goto_2

    .line 215
    :cond_c
    new-instance v28, Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->stringBytes:[B

    const-string v3, "UTF-8"

    invoke-static {v3}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v3

    move-object/from16 v0, v28

    invoke-direct {v0, v2, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 216
    .local v28, "stringValue":Ljava/lang/String;
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->stringBytes:[B

    .line 217
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->eventHandler:Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementId:I

    move-object/from16 v0, v28

    invoke-interface {v2, v3, v0}, Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;->onStringElement(ILjava/lang/String;)V

    .line 218
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->prepareForNextElement()V

    .line 219
    const/16 v19, 0x0

    goto/16 :goto_2

    .line 221
    .end local v27    # "stringResult":I
    .end local v28    # "stringValue":Ljava/lang/String;
    :pswitch_4
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    const-wide/32 v4, 0x7fffffff

    cmp-long v2, v2, v4

    if-lez v2, :cond_d

    .line 222
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Binary element size "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is larger than MAX_INT"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 225
    :cond_d
    invoke-interface/range {p1 .. p1}, Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;->getAvailableByteCount()J

    move-result-wide v2

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_e

    .line 226
    const/16 v19, 0x1

    goto/16 :goto_2

    .line 228
    :cond_e
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesRead:J

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementOffset:J

    sub-long/2addr v2, v4

    long-to-int v12, v2

    .line 229
    .local v12, "binaryHeaderSize":I
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->eventHandler:Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;

    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementId:I

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementOffset:J

    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    long-to-int v13, v2

    move-object/from16 v14, p1

    invoke-interface/range {v8 .. v14}, Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;->onBinaryElement(IJIILcom/google/android/exoplayer/upstream/NonBlockingInputStream;)Z

    move-result v15

    .line 231
    .local v15, "consumed":Z
    if-eqz v15, :cond_10

    .line 232
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementOffset:J

    int-to-long v4, v12

    add-long/2addr v2, v4

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    add-long v16, v2, v4

    .line 233
    .local v16, "expectedBytesRead":J
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesRead:J

    cmp-long v2, v16, v2

    if-eqz v2, :cond_f

    .line 234
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Incorrect total bytes read. Expected "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, v16

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " but actually "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesRead:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 237
    :cond_f
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->prepareForNextElement()V

    .line 239
    .end local v16    # "expectedBytesRead":J
    :cond_10
    const/16 v19, 0x0

    goto/16 :goto_2

    .line 241
    .end local v12    # "binaryHeaderSize":I
    .end local v15    # "consumed":Z
    :pswitch_5
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    const-wide/32 v4, 0x7fffffff

    cmp-long v2, v2, v4

    if-lez v2, :cond_11

    .line 242
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown element size "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is larger than MAX_INT"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 245
    :cond_11
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->elementContentSize:J

    long-to-int v2, v2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->skipBytesInternal(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;I)I

    move-result v26

    .line 246
    .local v26, "skipResult":I
    if-eqz v26, :cond_12

    move/from16 v19, v26

    .line 247
    goto/16 :goto_2

    .line 249
    :cond_12
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->prepareForNextElement()V

    goto/16 :goto_1

    .line 161
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_4
        :pswitch_2
    .end packed-switch
.end method

.method public readBytes(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;Ljava/nio/ByteBuffer;I)V
    .locals 3
    .param p1, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    .param p2, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .param p3, "totalBytes"    # I

    .prologue
    .line 281
    const/4 v1, 0x0

    iput v1, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesState:I

    .line 282
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->readBytesInternal(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;Ljava/nio/ByteBuffer;I)I

    move-result v0

    .line 283
    .local v0, "result":I
    if-eqz v0, :cond_0

    .line 284
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Couldn\'t read bytes into buffer"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 286
    :cond_0
    return-void
.end method

.method public readBytes(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;[BI)V
    .locals 3
    .param p1, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    .param p2, "byteArray"    # [B
    .param p3, "totalBytes"    # I

    .prologue
    .line 290
    const/4 v1, 0x0

    iput v1, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesState:I

    .line 291
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->readBytesInternal(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;[BI)I

    move-result v0

    .line 292
    .local v0, "result":I
    if-eqz v0, :cond_0

    .line 293
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Couldn\'t read bytes into array"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 295
    :cond_0
    return-void
.end method

.method public readVarint(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)J
    .locals 4
    .param p1, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;

    .prologue
    .line 271
    const/4 v1, 0x0

    iput v1, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->varintBytesState:I

    .line 272
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->readVarintBytes(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)I

    move-result v0

    .line 273
    .local v0, "result":I
    if-eqz v0, :cond_0

    .line 274
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Couldn\'t read varint"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 276
    :cond_0
    iget v1, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->varintBytesLength:I

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->getTempByteArrayValue(IZ)J

    move-result-wide v2

    return-wide v2
.end method

.method public reset()V
    .locals 2

    .prologue
    .line 264
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->prepareForNextElement()V

    .line 265
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->masterElementsStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->clear()V

    .line 266
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesRead:J

    .line 267
    return-void
.end method

.method public setEventHandler(Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;)V
    .locals 0
    .param p1, "eventHandler"    # Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;

    .prologue
    .line 134
    iput-object p1, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->eventHandler:Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;

    .line 135
    return-void
.end method

.method public skipBytes(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;I)V
    .locals 3
    .param p1, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    .param p2, "totalBytes"    # I

    .prologue
    .line 299
    const/4 v1, 0x0

    iput v1, p0, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->bytesState:I

    .line 300
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/chunk/parser/webm/DefaultEbmlReader;->skipBytesInternal(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;I)I

    move-result v0

    .line 301
    .local v0, "result":I
    if-eqz v0, :cond_0

    .line 302
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Couldn\'t skip bytes"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 304
    :cond_0
    return-void
.end method
