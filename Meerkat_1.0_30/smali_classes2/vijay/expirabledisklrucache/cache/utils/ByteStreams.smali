.class public final Lvijay/expirabledisklrucache/cache/utils/ByteStreams;
.super Ljava/lang/Object;
.source "ByteStreams.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;,
        Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;,
        Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataInputStream;,
        Lvijay/expirabledisklrucache/cache/utils/ByteStreams$FastByteArrayOutputStream;
    }
.end annotation


# static fields
.field private static final BUF_SIZE:I = 0x2000

.field private static final NULL_OUTPUT_STREAM:Ljava/io/OutputStream;

.field private static final ZERO_COPY_CHUNK_SIZE:I = 0x80000


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 540
    new-instance v0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$1;

    invoke-direct {v0}, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$1;-><init>()V

    sput-object v0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams;->NULL_OUTPUT_STREAM:Ljava/io/OutputStream;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    .locals 6
    .param p0, "from"    # Ljava/io/InputStream;
    .param p1, "to"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    invoke-static {p0}, Lvijay/expirabledisklrucache/cache/utils/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    invoke-static {p1}, Lvijay/expirabledisklrucache/cache/utils/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    const/16 v4, 0x2000

    new-array v0, v4, [B

    .line 90
    .local v0, "buf":[B
    const-wide/16 v2, 0x0

    .line 92
    .local v2, "total":J
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 93
    .local v1, "r":I
    const/4 v4, -0x1

    if-ne v1, v4, :cond_0

    .line 99
    return-wide v2

    .line 96
    :cond_0
    const/4 v4, 0x0

    invoke-virtual {p1, v0, v4, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 97
    int-to-long v4, v1

    add-long/2addr v2, v4

    .line 98
    goto :goto_0
.end method

.method public static copy(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/channels/WritableByteChannel;)J
    .locals 14
    .param p0, "from"    # Ljava/nio/channels/ReadableByteChannel;
    .param p1, "to"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    invoke-static {p0}, Lvijay/expirabledisklrucache/cache/utils/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    invoke-static {p1}, Lvijay/expirabledisklrucache/cache/utils/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    instance-of v4, p0, Ljava/nio/channels/FileChannel;

    if-eqz v4, :cond_2

    move-object v1, p0

    .line 116
    check-cast v1, Ljava/nio/channels/FileChannel;

    .line 117
    .local v1, "sourceChannel":Ljava/nio/channels/FileChannel;
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->position()J

    move-result-wide v10

    .line 118
    .local v10, "oldPosition":J
    move-wide v2, v10

    .line 121
    .local v2, "position":J
    :cond_0
    const-wide/32 v4, 0x80000

    move-object v6, p1

    invoke-virtual/range {v1 .. v6}, Ljava/nio/channels/FileChannel;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J

    move-result-wide v8

    .line 122
    .local v8, "copied":J
    add-long/2addr v2, v8

    .line 123
    invoke-virtual {v1, v2, v3}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 124
    const-wide/16 v4, 0x0

    cmp-long v4, v8, v4

    if-gtz v4, :cond_0

    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v4

    cmp-long v4, v2, v4

    if-ltz v4, :cond_0

    .line 125
    sub-long v12, v2, v10

    .line 137
    .end local v1    # "sourceChannel":Ljava/nio/channels/FileChannel;
    .end local v2    # "position":J
    .end local v8    # "copied":J
    .end local v10    # "oldPosition":J
    :cond_1
    return-wide v12

    .line 128
    :cond_2
    const/16 v4, 0x2000

    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 129
    .local v0, "buf":Ljava/nio/ByteBuffer;
    const-wide/16 v12, 0x0

    .line 130
    .local v12, "total":J
    :goto_0
    invoke-interface {p0, v0}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_1

    .line 131
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 132
    :goto_1
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 133
    invoke-interface {p1, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v12, v4

    goto :goto_1

    .line 135
    :cond_3
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    goto :goto_0
.end method

.method public static limit(Ljava/io/InputStream;J)Ljava/io/InputStream;
    .locals 1
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "limit"    # J

    .prologue
    .line 579
    new-instance v0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;

    invoke-direct {v0, p0, p1, p2}, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;-><init>(Ljava/io/InputStream;J)V

    return-object v0
.end method

.method public static newDataInput(Ljava/io/ByteArrayInputStream;)Lvijay/expirabledisklrucache/cache/utils/ByteArrayDataInput;
    .locals 2
    .param p0, "byteArrayInputStream"    # Ljava/io/ByteArrayInputStream;

    .prologue
    .line 237
    new-instance v1, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataInputStream;

    invoke-static {p0}, Lvijay/expirabledisklrucache/cache/utils/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, v0}, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataInputStream;-><init>(Ljava/io/ByteArrayInputStream;)V

    return-object v1
.end method

.method public static newDataInput([B)Lvijay/expirabledisklrucache/cache/utils/ByteArrayDataInput;
    .locals 1
    .param p0, "bytes"    # [B

    .prologue
    .line 212
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-static {v0}, Lvijay/expirabledisklrucache/cache/utils/ByteStreams;->newDataInput(Ljava/io/ByteArrayInputStream;)Lvijay/expirabledisklrucache/cache/utils/ByteArrayDataInput;

    move-result-object v0

    return-object v0
.end method

.method public static newDataInput([BI)Lvijay/expirabledisklrucache/cache/utils/ByteArrayDataInput;
    .locals 2
    .param p0, "bytes"    # [B
    .param p1, "start"    # I

    .prologue
    .line 223
    array-length v0, p0

    invoke-static {p1, v0}, Lvijay/expirabledisklrucache/cache/utils/Preconditions;->checkPositionIndex(II)I

    .line 224
    new-instance v0, Ljava/io/ByteArrayInputStream;

    array-length v1, p0

    sub-int/2addr v1, p1

    invoke-direct {v0, p0, p1, v1}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    invoke-static {v0}, Lvijay/expirabledisklrucache/cache/utils/ByteStreams;->newDataInput(Ljava/io/ByteArrayInputStream;)Lvijay/expirabledisklrucache/cache/utils/ByteArrayDataInput;

    move-result-object v0

    return-object v0
.end method

.method public static newDataOutput()Lvijay/expirabledisklrucache/cache/utils/ByteArrayDataOutput;
    .locals 1

    .prologue
    .line 374
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-static {v0}, Lvijay/expirabledisklrucache/cache/utils/ByteStreams;->newDataOutput(Ljava/io/ByteArrayOutputStream;)Lvijay/expirabledisklrucache/cache/utils/ByteArrayDataOutput;

    move-result-object v0

    return-object v0
.end method

.method public static newDataOutput(I)Lvijay/expirabledisklrucache/cache/utils/ByteArrayDataOutput;
    .locals 5
    .param p0, "size"    # I

    .prologue
    .line 386
    if-gez p0, :cond_0

    .line 387
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid size: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 389
    :cond_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    invoke-static {v0}, Lvijay/expirabledisklrucache/cache/utils/ByteStreams;->newDataOutput(Ljava/io/ByteArrayOutputStream;)Lvijay/expirabledisklrucache/cache/utils/ByteArrayDataOutput;

    move-result-object v0

    return-object v0
.end method

.method public static newDataOutput(Ljava/io/ByteArrayOutputStream;)Lvijay/expirabledisklrucache/cache/utils/ByteArrayDataOutput;
    .locals 2
    .param p0, "byteArrayOutputSteam"    # Ljava/io/ByteArrayOutputStream;

    .prologue
    .line 408
    new-instance v1, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;

    invoke-static {p0}, Lvijay/expirabledisklrucache/cache/utils/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1, v0}, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;-><init>(Ljava/io/ByteArrayOutputStream;)V

    return-object v1
.end method

.method public static nullOutputStream()Ljava/io/OutputStream;
    .locals 1

    .prologue
    .line 566
    sget-object v0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams;->NULL_OUTPUT_STREAM:Ljava/io/OutputStream;

    return-object v0
.end method

.method public static read(Ljava/io/InputStream;[BII)I
    .locals 4
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 765
    invoke-static {p0}, Lvijay/expirabledisklrucache/cache/utils/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 766
    invoke-static {p1}, Lvijay/expirabledisklrucache/cache/utils/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 767
    if-gez p3, :cond_0

    .line 768
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    const-string v3, "len is negative"

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 770
    :cond_0
    const/4 v1, 0x0

    .line 771
    .local v1, "total":I
    :goto_0
    if-ge v1, p3, :cond_1

    .line 772
    add-int v2, p2, v1

    sub-int v3, p3, v1

    invoke-virtual {p0, p1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 773
    .local v0, "result":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_2

    .line 778
    .end local v0    # "result":I
    :cond_1
    return v1

    .line 776
    .restart local v0    # "result":I
    :cond_2
    add-int/2addr v1, v0

    .line 777
    goto :goto_0
.end method

.method public static readBytes(Ljava/io/InputStream;Lvijay/expirabledisklrucache/cache/utils/ByteProcessor;)Ljava/lang/Object;
    .locals 3
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Lvijay/expirabledisklrucache/cache/utils/ByteProcessor",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 728
    .local p1, "processor":Lvijay/expirabledisklrucache/cache/utils/ByteProcessor;, "Lvijay/expirabledisklrucache/cache/utils/ByteProcessor<TT;>;"
    invoke-static {p0}, Lvijay/expirabledisklrucache/cache/utils/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 729
    invoke-static {p1}, Lvijay/expirabledisklrucache/cache/utils/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 731
    const/16 v2, 0x2000

    new-array v0, v2, [B

    .line 734
    .local v0, "buf":[B
    :cond_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 735
    .local v1, "read":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    const/4 v2, 0x0

    invoke-interface {p1, v0, v2, v1}, Lvijay/expirabledisklrucache/cache/utils/ByteProcessor;->processBytes([BII)Z

    move-result v2

    if-nez v2, :cond_0

    .line 736
    :cond_1
    invoke-interface {p1}, Lvijay/expirabledisklrucache/cache/utils/ByteProcessor;->getResult()Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public static readFully(Ljava/io/InputStream;[B)V
    .locals 2
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 661
    const/4 v0, 0x0

    array-length v1, p1

    invoke-static {p0, p1, v0, v1}, Lvijay/expirabledisklrucache/cache/utils/ByteStreams;->readFully(Ljava/io/InputStream;[BII)V

    .line 662
    return-void
.end method

.method public static readFully(Ljava/io/InputStream;[BII)V
    .locals 4
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 680
    invoke-static {p0, p1, p2, p3}, Lvijay/expirabledisklrucache/cache/utils/ByteStreams;->read(Ljava/io/InputStream;[BII)I

    move-result v0

    .line 681
    .local v0, "read":I
    if-eq v0, p3, :cond_0

    .line 682
    new-instance v1, Ljava/io/EOFException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "reached end of stream after reading "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bytes; "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bytes expected"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 685
    :cond_0
    return-void
.end method

.method public static skipFully(Ljava/io/InputStream;J)V
    .locals 11
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    .line 700
    move-wide v4, p1

    .line 701
    .local v4, "toSkip":J
    :goto_0
    cmp-long v6, p1, v8

    if-lez v6, :cond_2

    .line 702
    invoke-virtual {p0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 703
    .local v0, "amt":J
    cmp-long v6, v0, v8

    if-nez v6, :cond_1

    .line 705
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v6

    const/4 v7, -0x1

    if-ne v6, v7, :cond_0

    .line 706
    sub-long v2, v4, p1

    .line 707
    .local v2, "skipped":J
    new-instance v6, Ljava/io/EOFException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "reached end of stream after skipping "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " bytes; "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " bytes expected"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 710
    .end local v2    # "skipped":J
    :cond_0
    const-wide/16 v6, 0x1

    sub-long/2addr p1, v6

    goto :goto_0

    .line 712
    :cond_1
    sub-long/2addr p1, v0

    goto :goto_0

    .line 715
    .end local v0    # "amt":J
    :cond_2
    return-void
.end method

.method public static toByteArray(Ljava/io/InputStream;)[B
    .locals 2
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 150
    .local v0, "out":Ljava/io/ByteArrayOutputStream;
    invoke-static {p0, v0}, Lvijay/expirabledisklrucache/cache/utils/ByteStreams;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    .line 151
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method static toByteArray(Ljava/io/InputStream;I)[B
    .locals 10
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "expectedSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v7, -0x1

    .line 162
    new-array v1, p1, [B

    .line 163
    .local v1, "bytes":[B
    move v5, p1

    .line 165
    .local v5, "remaining":I
    :goto_0
    if-lez v5, :cond_2

    .line 166
    sub-int v2, p1, v5

    .line 167
    .local v2, "off":I
    invoke-virtual {p0, v1, v2, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    .line 168
    .local v4, "read":I
    if-ne v4, v7, :cond_1

    .line 171
    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v1

    .line 190
    .end local v1    # "bytes":[B
    .end local v2    # "off":I
    .end local v4    # "read":I
    :cond_0
    :goto_1
    return-object v1

    .line 173
    .restart local v1    # "bytes":[B
    .restart local v2    # "off":I
    .restart local v4    # "read":I
    :cond_1
    sub-int/2addr v5, v4

    .line 174
    goto :goto_0

    .line 177
    .end local v2    # "off":I
    .end local v4    # "read":I
    :cond_2
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 178
    .local v0, "b":I
    if-eq v0, v7, :cond_0

    .line 183
    new-instance v3, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$FastByteArrayOutputStream;

    const/4 v7, 0x0

    invoke-direct {v3, v7}, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$FastByteArrayOutputStream;-><init>(Lvijay/expirabledisklrucache/cache/utils/ByteStreams$1;)V

    .line 184
    .local v3, "out":Lvijay/expirabledisklrucache/cache/utils/ByteStreams$FastByteArrayOutputStream;
    invoke-virtual {v3, v0}, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$FastByteArrayOutputStream;->write(I)V

    .line 185
    invoke-static {p0, v3}, Lvijay/expirabledisklrucache/cache/utils/ByteStreams;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    .line 187
    array-length v7, v1

    invoke-virtual {v3}, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$FastByteArrayOutputStream;->size()I

    move-result v8

    add-int/2addr v7, v8

    new-array v6, v7, [B

    .line 188
    .local v6, "result":[B
    array-length v7, v1

    invoke-static {v1, v9, v6, v9, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 189
    array-length v7, v1

    invoke-virtual {v3, v6, v7}, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$FastByteArrayOutputStream;->writeTo([BI)V

    move-object v1, v6

    .line 190
    goto :goto_1
.end method
