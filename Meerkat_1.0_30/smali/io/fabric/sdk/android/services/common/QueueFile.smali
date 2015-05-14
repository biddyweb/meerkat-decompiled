.class public Lio/fabric/sdk/android/services/common/QueueFile;
.super Ljava/lang/Object;
.source "QueueFile.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/fabric/sdk/android/services/common/QueueFile$ElementReader;,
        Lio/fabric/sdk/android/services/common/QueueFile$Element;,
        Lio/fabric/sdk/android/services/common/QueueFile$ElementInputStream;
    }
.end annotation


# static fields
.field static final HEADER_LENGTH:I = 0x10

.field private static final INITIAL_LENGTH:I = 0x1000

.field private static final LOGGER:Ljava/util/logging/Logger;


# instance fields
.field private final buffer:[B

.field private elementCount:I

.field fileLength:I

.field private first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

.field private last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

.field private final raf:Ljava/io/RandomAccessFile;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 58
    const-class v0, Lio/fabric/sdk/android/services/common/QueueFile;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/fabric/sdk/android/services/common/QueueFile;->LOGGER:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    const/16 v0, 0x10

    new-array v0, v0, [B

    iput-object v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->buffer:[B

    .line 112
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 113
    invoke-static {p1}, Lio/fabric/sdk/android/services/common/QueueFile;->initialize(Ljava/io/File;)V

    .line 115
    :cond_0
    invoke-static {p1}, Lio/fabric/sdk/android/services/common/QueueFile;->open(Ljava/io/File;)Ljava/io/RandomAccessFile;

    move-result-object v0

    iput-object v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    .line 116
    invoke-direct {p0}, Lio/fabric/sdk/android/services/common/QueueFile;->readHeader()V

    .line 117
    return-void
.end method

.method constructor <init>(Ljava/io/RandomAccessFile;)V
    .locals 1
    .param p1, "raf"    # Ljava/io/RandomAccessFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    const/16 v0, 0x10

    new-array v0, v0, [B

    iput-object v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->buffer:[B

    .line 121
    iput-object p1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    .line 122
    invoke-direct {p0}, Lio/fabric/sdk/android/services/common/QueueFile;->readHeader()V

    .line 123
    return-void
.end method

.method static synthetic access$100(Lio/fabric/sdk/android/services/common/QueueFile;I)I
    .locals 1
    .param p0, "x0"    # Lio/fabric/sdk/android/services/common/QueueFile;
    .param p1, "x1"    # I

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lio/fabric/sdk/android/services/common/QueueFile;->wrapPosition(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Ljava/lang/Object;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-static {p0, p1}, Lio/fabric/sdk/android/services/common/QueueFile;->nonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lio/fabric/sdk/android/services/common/QueueFile;I[BII)V
    .locals 0
    .param p0, "x0"    # Lio/fabric/sdk/android/services/common/QueueFile;
    .param p1, "x1"    # I
    .param p2, "x2"    # [B
    .param p3, "x3"    # I
    .param p4, "x4"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    invoke-direct {p0, p1, p2, p3, p4}, Lio/fabric/sdk/android/services/common/QueueFile;->ringRead(I[BII)V

    return-void
.end method

.method static synthetic access$400(Lio/fabric/sdk/android/services/common/QueueFile;)Ljava/io/RandomAccessFile;
    .locals 1
    .param p0, "x0"    # Lio/fabric/sdk/android/services/common/QueueFile;

    .prologue
    .line 57
    iget-object v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    return-object v0
.end method

.method private expandIfNecessary(I)V
    .locals 13
    .param p1, "dataLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 351
    add-int/lit8 v7, p1, 0x4

    .line 352
    .local v7, "elementLength":I
    invoke-direct {p0}, Lio/fabric/sdk/android/services/common/QueueFile;->remainingBytes()I

    move-result v12

    .line 353
    .local v12, "remainingBytes":I
    if-lt v12, v7, :cond_0

    .line 392
    :goto_0
    return-void

    .line 358
    :cond_0
    iget v11, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    .line 362
    .local v11, "previousLength":I
    :cond_1
    add-int/2addr v12, v11

    .line 363
    shl-int/lit8 v10, v11, 0x1

    .line 364
    .local v10, "newLength":I
    move v11, v10

    .line 365
    if-lt v12, v7, :cond_1

    .line 367
    invoke-direct {p0, v10}, Lio/fabric/sdk/android/services/common/QueueFile;->setLength(I)V

    .line 370
    iget-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v2, v2, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    add-int/lit8 v2, v2, 0x4

    iget-object v3, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v3, v3, Lio/fabric/sdk/android/services/common/QueueFile$Element;->length:I

    add-int/2addr v2, v3

    invoke-direct {p0, v2}, Lio/fabric/sdk/android/services/common/QueueFile;->wrapPosition(I)I

    move-result v8

    .line 373
    .local v8, "endOfLastElement":I
    iget-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v2, v2, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    if-ge v8, v2, :cond_2

    .line 374
    iget-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    .line 375
    .local v1, "channel":Ljava/nio/channels/FileChannel;
    iget v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 376
    add-int/lit8 v0, v8, -0x4

    .line 377
    .local v0, "count":I
    const-wide/16 v2, 0x10

    int-to-long v4, v0

    move-object v6, v1

    invoke-virtual/range {v1 .. v6}, Ljava/nio/channels/FileChannel;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J

    move-result-wide v2

    int-to-long v4, v0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_2

    .line 378
    new-instance v2, Ljava/lang/AssertionError;

    const-string v3, "Copied insufficient number of bytes!"

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 383
    .end local v0    # "count":I
    .end local v1    # "channel":Ljava/nio/channels/FileChannel;
    :cond_2
    iget-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v2, v2, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    iget-object v3, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v3, v3, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    if-ge v2, v3, :cond_3

    .line 384
    iget v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    iget-object v3, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v3, v3, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    add-int/2addr v2, v3

    add-int/lit8 v9, v2, -0x10

    .line 385
    .local v9, "newLastPosition":I
    iget v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->elementCount:I

    iget-object v3, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v3, v3, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    invoke-direct {p0, v10, v2, v3, v9}, Lio/fabric/sdk/android/services/common/QueueFile;->writeHeader(IIII)V

    .line 386
    new-instance v2, Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget-object v3, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v3, v3, Lio/fabric/sdk/android/services/common/QueueFile$Element;->length:I

    invoke-direct {v2, v9, v3}, Lio/fabric/sdk/android/services/common/QueueFile$Element;-><init>(II)V

    iput-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    .line 391
    .end local v9    # "newLastPosition":I
    :goto_1
    iput v10, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    goto :goto_0

    .line 388
    :cond_3
    iget v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->elementCount:I

    iget-object v3, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v3, v3, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    iget-object v4, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v4, v4, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    invoke-direct {p0, v10, v2, v3, v4}, Lio/fabric/sdk/android/services/common/QueueFile;->writeHeader(IIII)V

    goto :goto_1
.end method

.method private static initialize(Ljava/io/File;)V
    .locals 6
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 193
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".tmp"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 194
    .local v2, "tempFile":Ljava/io/File;
    invoke-static {v2}, Lio/fabric/sdk/android/services/common/QueueFile;->open(Ljava/io/File;)Ljava/io/RandomAccessFile;

    move-result-object v1

    .line 196
    .local v1, "raf":Ljava/io/RandomAccessFile;
    const-wide/16 v4, 0x1000

    :try_start_0
    invoke-virtual {v1, v4, v5}, Ljava/io/RandomAccessFile;->setLength(J)V

    .line 197
    const-wide/16 v4, 0x0

    invoke-virtual {v1, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 198
    const/16 v3, 0x10

    new-array v0, v3, [B

    .line 199
    .local v0, "headerBuffer":[B
    const/4 v3, 0x4

    new-array v3, v3, [I

    fill-array-data v3, :array_0

    invoke-static {v0, v3}, Lio/fabric/sdk/android/services/common/QueueFile;->writeInts([B[I)V

    .line 200
    invoke-virtual {v1, v0}, Ljava/io/RandomAccessFile;->write([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 202
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V

    .line 206
    invoke-virtual {v2, p0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 207
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Rename failed!"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 202
    .end local v0    # "headerBuffer":[B
    :catchall_0
    move-exception v3

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V

    throw v3

    .line 209
    .restart local v0    # "headerBuffer":[B
    :cond_0
    return-void

    .line 199
    nop

    :array_0
    .array-data 4
        0x1000
        0x0
        0x0
        0x0
    .end array-data
.end method

.method private static nonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 437
    .local p0, "t":Ljava/lang/Object;, "TT;"
    if-nez p0, :cond_0

    .line 438
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 440
    :cond_0
    return-object p0
.end method

.method private static open(Ljava/io/File;)Ljava/io/RandomAccessFile;
    .locals 2
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 213
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "rwd"

    invoke-direct {v0, p0, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private readElement(I)Lio/fabric/sdk/android/services/common/QueueFile$Element;
    .locals 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    if-nez p1, :cond_0

    .line 184
    sget-object v0, Lio/fabric/sdk/android/services/common/QueueFile$Element;->NULL:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    .line 187
    :goto_0
    return-object v0

    .line 186
    :cond_0
    iget-object v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 187
    new-instance v0, Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v1

    invoke-direct {v0, p1, v1}, Lio/fabric/sdk/android/services/common/QueueFile$Element;-><init>(II)V

    goto :goto_0
.end method

.method private readHeader()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 155
    iget-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    const-wide/16 v4, 0x0

    invoke-virtual {v2, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 156
    iget-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    iget-object v3, p0, Lio/fabric/sdk/android/services/common/QueueFile;->buffer:[B

    invoke-virtual {v2, v3}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 157
    iget-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->buffer:[B

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lio/fabric/sdk/android/services/common/QueueFile;->readInt([BI)I

    move-result v2

    iput v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    .line 158
    iget v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    int-to-long v2, v2

    iget-object v4, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    .line 159
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "File is truncated. Expected length: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", Actual length: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 162
    :cond_0
    iget-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->buffer:[B

    const/4 v3, 0x4

    invoke-static {v2, v3}, Lio/fabric/sdk/android/services/common/QueueFile;->readInt([BI)I

    move-result v2

    iput v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->elementCount:I

    .line 163
    iget-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->buffer:[B

    const/16 v3, 0x8

    invoke-static {v2, v3}, Lio/fabric/sdk/android/services/common/QueueFile;->readInt([BI)I

    move-result v0

    .line 164
    .local v0, "firstOffset":I
    iget-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->buffer:[B

    const/16 v3, 0xc

    invoke-static {v2, v3}, Lio/fabric/sdk/android/services/common/QueueFile;->readInt([BI)I

    move-result v1

    .line 165
    .local v1, "lastOffset":I
    invoke-direct {p0, v0}, Lio/fabric/sdk/android/services/common/QueueFile;->readElement(I)Lio/fabric/sdk/android/services/common/QueueFile$Element;

    move-result-object v2

    iput-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    .line 166
    invoke-direct {p0, v1}, Lio/fabric/sdk/android/services/common/QueueFile;->readElement(I)Lio/fabric/sdk/android/services/common/QueueFile$Element;

    move-result-object v2

    iput-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    .line 167
    return-void
.end method

.method private static readInt([BI)I
    .locals 2
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 149
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x18

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    add-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    add-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    add-int/2addr v0, v1

    return v0
.end method

.method private remainingBytes()I
    .locals 2

    .prologue
    .line 337
    iget v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    invoke-virtual {p0}, Lio/fabric/sdk/android/services/common/QueueFile;->usedBytes()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method private ringRead(I[BII)V
    .locals 4
    .param p1, "position"    # I
    .param p2, "buffer"    # [B
    .param p3, "offset"    # I
    .param p4, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 253
    invoke-direct {p0, p1}, Lio/fabric/sdk/android/services/common/QueueFile;->wrapPosition(I)I

    move-result p1

    .line 254
    add-int v1, p1, p4

    iget v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    if-gt v1, v2, :cond_0

    .line 255
    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    int-to-long v2, p1

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 256
    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v1, p2, p3, p4}, Ljava/io/RandomAccessFile;->readFully([BII)V

    .line 266
    :goto_0
    return-void

    .line 260
    :cond_0
    iget v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    sub-int v0, v1, p1

    .line 261
    .local v0, "beforeEof":I
    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    int-to-long v2, p1

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 262
    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v1, p2, p3, v0}, Ljava/io/RandomAccessFile;->readFully([BII)V

    .line 263
    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    const-wide/16 v2, 0x10

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 264
    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    add-int v2, p3, v0

    sub-int v3, p4, v0

    invoke-virtual {v1, p2, v2, v3}, Ljava/io/RandomAccessFile;->readFully([BII)V

    goto :goto_0
.end method

.method private ringWrite(I[BII)V
    .locals 4
    .param p1, "position"    # I
    .param p2, "buffer"    # [B
    .param p3, "offset"    # I
    .param p4, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 230
    invoke-direct {p0, p1}, Lio/fabric/sdk/android/services/common/QueueFile;->wrapPosition(I)I

    move-result p1

    .line 231
    add-int v1, p1, p4

    iget v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    if-gt v1, v2, :cond_0

    .line 232
    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    int-to-long v2, p1

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 233
    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v1, p2, p3, p4}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 243
    :goto_0
    return-void

    .line 237
    :cond_0
    iget v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    sub-int v0, v1, p1

    .line 238
    .local v0, "beforeEof":I
    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    int-to-long v2, p1

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 239
    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v1, p2, p3, v0}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 240
    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    const-wide/16 v2, 0x10

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 241
    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    add-int v2, p3, v0

    sub-int v3, p4, v0

    invoke-virtual {v1, p2, v2, v3}, Ljava/io/RandomAccessFile;->write([BII)V

    goto :goto_0
.end method

.method private setLength(I)V
    .locals 4
    .param p1, "newLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 397
    iget-object v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Ljava/io/RandomAccessFile;->setLength(J)V

    .line 398
    iget-object v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 399
    return-void
.end method

.method private wrapPosition(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 218
    iget v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    if-ge p1, v0, :cond_0

    .end local p1    # "position":I
    :goto_0
    return p1

    .restart local p1    # "position":I
    :cond_0
    add-int/lit8 v0, p1, 0x10

    iget v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    sub-int p1, v0, v1

    goto :goto_0
.end method

.method private writeHeader(IIII)V
    .locals 4
    .param p1, "fileLength"    # I
    .param p2, "elementCount"    # I
    .param p3, "firstPosition"    # I
    .param p4, "lastPosition"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 176
    iget-object v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->buffer:[B

    const/4 v1, 0x4

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 v2, 0x1

    aput p2, v1, v2

    const/4 v2, 0x2

    aput p3, v1, v2

    const/4 v2, 0x3

    aput p4, v1, v2

    invoke-static {v0, v1}, Lio/fabric/sdk/android/services/common/QueueFile;->writeInts([B[I)V

    .line 177
    iget-object v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 178
    iget-object v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->buffer:[B

    invoke-virtual {v0, v1}, Ljava/io/RandomAccessFile;->write([B)V

    .line 179
    return-void
.end method

.method private static writeInt([BII)V
    .locals 2
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I
    .param p2, "value"    # I

    .prologue
    .line 129
    shr-int/lit8 v0, p2, 0x18

    int-to-byte v0, v0

    aput-byte v0, p0, p1

    .line 130
    add-int/lit8 v0, p1, 0x1

    shr-int/lit8 v1, p2, 0x10

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 131
    add-int/lit8 v0, p1, 0x2

    shr-int/lit8 v1, p2, 0x8

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 132
    add-int/lit8 v0, p1, 0x3

    int-to-byte v1, p2

    aput-byte v1, p0, v0

    .line 133
    return-void
.end method

.method private static varargs writeInts([B[I)V
    .locals 5
    .param p0, "buffer"    # [B
    .param p1, "values"    # [I

    .prologue
    .line 140
    const/4 v3, 0x0

    .line 141
    .local v3, "offset":I
    move-object v0, p1

    .local v0, "arr$":[I
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget v4, v0, v1

    .line 142
    .local v4, "value":I
    invoke-static {p0, v3, v4}, Lio/fabric/sdk/android/services/common/QueueFile;->writeInt([BII)V

    .line 143
    add-int/lit8 v3, v3, 0x4

    .line 141
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 145
    .end local v4    # "value":I
    :cond_0
    return-void
.end method


# virtual methods
.method public add([B)V
    .locals 2
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 274
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lio/fabric/sdk/android/services/common/QueueFile;->add([BII)V

    .line 275
    return-void
.end method

.method public declared-synchronized add([BII)V
    .locals 8
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 287
    monitor-enter p0

    :try_start_0
    const-string v4, "buffer"

    invoke-static {p1, v4}, Lio/fabric/sdk/android/services/common/QueueFile;->nonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 288
    or-int v4, p2, p3

    if-ltz v4, :cond_0

    array-length v4, p1

    sub-int/2addr v4, p2

    if-le p3, v4, :cond_1

    .line 289
    :cond_0
    new-instance v4, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v4}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 287
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 292
    :cond_1
    :try_start_1
    invoke-direct {p0, p3}, Lio/fabric/sdk/android/services/common/QueueFile;->expandIfNecessary(I)V

    .line 295
    invoke-virtual {p0}, Lio/fabric/sdk/android/services/common/QueueFile;->isEmpty()Z

    move-result v3

    .line 296
    .local v3, "wasEmpty":Z
    if-eqz v3, :cond_3

    const/16 v2, 0x10

    .line 297
    .local v2, "position":I
    :goto_0
    new-instance v1, Lio/fabric/sdk/android/services/common/QueueFile$Element;

    invoke-direct {v1, v2, p3}, Lio/fabric/sdk/android/services/common/QueueFile$Element;-><init>(II)V

    .line 300
    .local v1, "newLast":Lio/fabric/sdk/android/services/common/QueueFile$Element;
    iget-object v4, p0, Lio/fabric/sdk/android/services/common/QueueFile;->buffer:[B

    const/4 v5, 0x0

    invoke-static {v4, v5, p3}, Lio/fabric/sdk/android/services/common/QueueFile;->writeInt([BII)V

    .line 301
    iget v4, v1, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    iget-object v5, p0, Lio/fabric/sdk/android/services/common/QueueFile;->buffer:[B

    const/4 v6, 0x0

    const/4 v7, 0x4

    invoke-direct {p0, v4, v5, v6, v7}, Lio/fabric/sdk/android/services/common/QueueFile;->ringWrite(I[BII)V

    .line 304
    iget v4, v1, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    add-int/lit8 v4, v4, 0x4

    invoke-direct {p0, v4, p1, p2, p3}, Lio/fabric/sdk/android/services/common/QueueFile;->ringWrite(I[BII)V

    .line 307
    if-eqz v3, :cond_4

    iget v0, v1, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    .line 308
    .local v0, "firstPosition":I
    :goto_1
    iget v4, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    iget v5, p0, Lio/fabric/sdk/android/services/common/QueueFile;->elementCount:I

    add-int/lit8 v5, v5, 0x1

    iget v6, v1, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    invoke-direct {p0, v4, v5, v0, v6}, Lio/fabric/sdk/android/services/common/QueueFile;->writeHeader(IIII)V

    .line 309
    iput-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    .line 310
    iget v4, p0, Lio/fabric/sdk/android/services/common/QueueFile;->elementCount:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lio/fabric/sdk/android/services/common/QueueFile;->elementCount:I

    .line 311
    if-eqz v3, :cond_2

    .line 312
    iget-object v4, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iput-object v4, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 314
    :cond_2
    monitor-exit p0

    return-void

    .line 296
    .end local v0    # "firstPosition":I
    .end local v1    # "newLast":Lio/fabric/sdk/android/services/common/QueueFile$Element;
    .end local v2    # "position":I
    :cond_3
    :try_start_2
    iget-object v4, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v4, v4, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    add-int/lit8 v4, v4, 0x4

    iget-object v5, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v5, v5, Lio/fabric/sdk/android/services/common/QueueFile$Element;->length:I

    add-int/2addr v4, v5

    invoke-direct {p0, v4}, Lio/fabric/sdk/android/services/common/QueueFile;->wrapPosition(I)I

    move-result v2

    goto :goto_0

    .line 307
    .restart local v1    # "newLast":Lio/fabric/sdk/android/services/common/QueueFile$Element;
    .restart local v2    # "position":I
    :cond_4
    iget-object v4, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v0, v4, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method

.method public declared-synchronized clear()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x1000

    .line 514
    monitor-enter p0

    const/16 v0, 0x1000

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_0
    invoke-direct {p0, v0, v1, v2, v3}, Lio/fabric/sdk/android/services/common/QueueFile;->writeHeader(IIII)V

    .line 515
    const/4 v0, 0x0

    iput v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->elementCount:I

    .line 516
    sget-object v0, Lio/fabric/sdk/android/services/common/QueueFile$Element;->NULL:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iput-object v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    .line 517
    sget-object v0, Lio/fabric/sdk/android/services/common/QueueFile$Element;->NULL:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iput-object v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    .line 518
    iget v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    if-le v0, v4, :cond_0

    .line 519
    const/16 v0, 0x1000

    invoke-direct {p0, v0}, Lio/fabric/sdk/android/services/common/QueueFile;->setLength(I)V

    .line 520
    :cond_0
    const/16 v0, 0x1000

    iput v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 521
    monitor-exit p0

    return-void

    .line 514
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 525
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 526
    monitor-exit p0

    return-void

    .line 525
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized forEach(Lio/fabric/sdk/android/services/common/QueueFile$ElementReader;)V
    .locals 5
    .param p1, "reader"    # Lio/fabric/sdk/android/services/common/QueueFile$ElementReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 423
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v2, v3, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    .line 424
    .local v2, "position":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v3, p0, Lio/fabric/sdk/android/services/common/QueueFile;->elementCount:I

    if-ge v1, v3, :cond_0

    .line 425
    invoke-direct {p0, v2}, Lio/fabric/sdk/android/services/common/QueueFile;->readElement(I)Lio/fabric/sdk/android/services/common/QueueFile$Element;

    move-result-object v0

    .line 426
    .local v0, "current":Lio/fabric/sdk/android/services/common/QueueFile$Element;
    new-instance v3, Lio/fabric/sdk/android/services/common/QueueFile$ElementInputStream;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v0, v4}, Lio/fabric/sdk/android/services/common/QueueFile$ElementInputStream;-><init>(Lio/fabric/sdk/android/services/common/QueueFile;Lio/fabric/sdk/android/services/common/QueueFile$Element;Lio/fabric/sdk/android/services/common/QueueFile$1;)V

    iget v4, v0, Lio/fabric/sdk/android/services/common/QueueFile$Element;->length:I

    invoke-interface {p1, v3, v4}, Lio/fabric/sdk/android/services/common/QueueFile$ElementReader;->read(Ljava/io/InputStream;I)V

    .line 427
    iget v3, v0, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    add-int/lit8 v3, v3, 0x4

    iget v4, v0, Lio/fabric/sdk/android/services/common/QueueFile$Element;->length:I

    add-int/2addr v3, v4

    invoke-direct {p0, v3}, Lio/fabric/sdk/android/services/common/QueueFile;->wrapPosition(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    .line 424
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 429
    .end local v0    # "current":Lio/fabric/sdk/android/services/common/QueueFile$Element;
    :cond_0
    monitor-exit p0

    return-void

    .line 423
    .end local v1    # "i":I
    .end local v2    # "position":I
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public hasSpaceFor(II)Z
    .locals 1
    .param p1, "dataSizeBytes"    # I
    .param p2, "maxSizeBytes"    # I

    .prologue
    .line 533
    invoke-virtual {p0}, Lio/fabric/sdk/android/services/common/QueueFile;->usedBytes()I

    move-result v0

    add-int/lit8 v0, v0, 0x4

    add-int/2addr v0, p1

    if-gt v0, p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized isEmpty()Z
    .locals 1

    .prologue
    .line 342
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->elementCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized peek(Lio/fabric/sdk/android/services/common/QueueFile$ElementReader;)V
    .locals 3
    .param p1, "reader"    # Lio/fabric/sdk/android/services/common/QueueFile$ElementReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 414
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->elementCount:I

    if-lez v0, :cond_0

    .line 415
    new-instance v0, Lio/fabric/sdk/android/services/common/QueueFile$ElementInputStream;

    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lio/fabric/sdk/android/services/common/QueueFile$ElementInputStream;-><init>(Lio/fabric/sdk/android/services/common/QueueFile;Lio/fabric/sdk/android/services/common/QueueFile$Element;Lio/fabric/sdk/android/services/common/QueueFile$1;)V

    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v1, v1, Lio/fabric/sdk/android/services/common/QueueFile$Element;->length:I

    invoke-interface {p1, v0, v1}, Lio/fabric/sdk/android/services/common/QueueFile$ElementReader;->read(Ljava/io/InputStream;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 417
    :cond_0
    monitor-exit p0

    return-void

    .line 414
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized peek()[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 403
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lio/fabric/sdk/android/services/common/QueueFile;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-eqz v2, :cond_0

    .line 404
    const/4 v0, 0x0

    .line 409
    :goto_0
    monitor-exit p0

    return-object v0

    .line 406
    :cond_0
    :try_start_1
    iget-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v1, v2, Lio/fabric/sdk/android/services/common/QueueFile$Element;->length:I

    .line 407
    .local v1, "length":I
    new-array v0, v1, [B

    .line 408
    .local v0, "data":[B
    iget-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v2, v2, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    add-int/lit8 v2, v2, 0x4

    const/4 v3, 0x0

    invoke-direct {p0, v2, v0, v3, v1}, Lio/fabric/sdk/android/services/common/QueueFile;->ringRead(I[BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 403
    .end local v0    # "data":[B
    .end local v1    # "length":I
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized remove()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 496
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lio/fabric/sdk/android/services/common/QueueFile;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 497
    new-instance v2, Ljava/util/NoSuchElementException;

    invoke-direct {v2}, Ljava/util/NoSuchElementException;-><init>()V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 496
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 499
    :cond_0
    :try_start_1
    iget v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->elementCount:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 500
    invoke-virtual {p0}, Lio/fabric/sdk/android/services/common/QueueFile;->clear()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 510
    :goto_0
    monitor-exit p0

    return-void

    .line 503
    :cond_1
    :try_start_2
    iget-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v2, v2, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    add-int/lit8 v2, v2, 0x4

    iget-object v3, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v3, v3, Lio/fabric/sdk/android/services/common/QueueFile$Element;->length:I

    add-int/2addr v2, v3

    invoke-direct {p0, v2}, Lio/fabric/sdk/android/services/common/QueueFile;->wrapPosition(I)I

    move-result v1

    .line 504
    .local v1, "newFirstPosition":I
    iget-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->buffer:[B

    const/4 v3, 0x0

    const/4 v4, 0x4

    invoke-direct {p0, v1, v2, v3, v4}, Lio/fabric/sdk/android/services/common/QueueFile;->ringRead(I[BII)V

    .line 505
    iget-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->buffer:[B

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lio/fabric/sdk/android/services/common/QueueFile;->readInt([BI)I

    move-result v0

    .line 506
    .local v0, "length":I
    iget v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    iget v3, p0, Lio/fabric/sdk/android/services/common/QueueFile;->elementCount:I

    add-int/lit8 v3, v3, -0x1

    iget-object v4, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v4, v4, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    invoke-direct {p0, v2, v3, v1, v4}, Lio/fabric/sdk/android/services/common/QueueFile;->writeHeader(IIII)V

    .line 507
    iget v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->elementCount:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->elementCount:I

    .line 508
    new-instance v2, Lio/fabric/sdk/android/services/common/QueueFile$Element;

    invoke-direct {v2, v1, v0}, Lio/fabric/sdk/android/services/common/QueueFile$Element;-><init>(II)V

    iput-object v2, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized size()I
    .locals 1

    .prologue
    .line 487
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->elementCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 538
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 539
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x5b

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 540
    const-string v2, "fileLength="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 541
    const-string v2, ", size="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lio/fabric/sdk/android/services/common/QueueFile;->elementCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 542
    const-string v2, ", first="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 543
    const-string v2, ", last="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 544
    const-string v2, ", element lengths=["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 546
    :try_start_0
    new-instance v2, Lio/fabric/sdk/android/services/common/QueueFile$1;

    invoke-direct {v2, p0, v0}, Lio/fabric/sdk/android/services/common/QueueFile$1;-><init>(Lio/fabric/sdk/android/services/common/QueueFile;Ljava/lang/StringBuilder;)V

    invoke-virtual {p0, v2}, Lio/fabric/sdk/android/services/common/QueueFile;->forEach(Lio/fabric/sdk/android/services/common/QueueFile$ElementReader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 562
    :goto_0
    const-string v2, "]]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 563
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 559
    :catch_0
    move-exception v1

    .line 560
    .local v1, "e":Ljava/io/IOException;
    sget-object v2, Lio/fabric/sdk/android/services/common/QueueFile;->LOGGER:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v4, "read error"

    invoke-virtual {v2, v3, v4, v1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public usedBytes()I
    .locals 2

    .prologue
    .line 318
    iget v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->elementCount:I

    if-nez v0, :cond_0

    .line 319
    const/16 v0, 0x10

    .line 329
    :goto_0
    return v0

    .line 322
    :cond_0
    iget-object v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v0, v0, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v1, v1, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    if-lt v0, v1, :cond_1

    .line 324
    iget-object v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v0, v0, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v1, v1, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v1, v1, Lio/fabric/sdk/android/services/common/QueueFile$Element;->length:I

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x10

    goto :goto_0

    .line 329
    :cond_1
    iget-object v0, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v0, v0, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    add-int/lit8 v0, v0, 0x4

    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->last:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v1, v1, Lio/fabric/sdk/android/services/common/QueueFile$Element;->length:I

    add-int/2addr v0, v1

    iget v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->fileLength:I

    add-int/2addr v0, v1

    iget-object v1, p0, Lio/fabric/sdk/android/services/common/QueueFile;->first:Lio/fabric/sdk/android/services/common/QueueFile$Element;

    iget v1, v1, Lio/fabric/sdk/android/services/common/QueueFile$Element;->position:I

    sub-int/2addr v0, v1

    goto :goto_0
.end method
