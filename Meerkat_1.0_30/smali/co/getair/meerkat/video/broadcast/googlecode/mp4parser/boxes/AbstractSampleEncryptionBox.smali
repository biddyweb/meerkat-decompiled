.class public abstract Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "AbstractSampleEncryptionBox.java"


# instance fields
.field protected algorithmId:I

.field entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;",
            ">;"
        }
    .end annotation
.end field

.field protected ivSize:I

.field protected kid:[B


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    const/4 v0, -0x1

    .line 26
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 20
    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->algorithmId:I

    .line 21
    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->ivSize:I

    .line 22
    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->kid:[B

    .line 23
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->entries:Ljava/util/List;

    .line 27
    return-void

    .line 22
    :array_0
    .array-data 1
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
    .end array-data
.end method

.method private parseEntries(Ljava/nio/ByteBuffer;JI)Ljava/util/List;
    .locals 16
    .param p1, "content"    # Ljava/nio/ByteBuffer;
    .param p2, "numOfEntries"    # J
    .param p4, "ivSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            "JI)",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;",
            ">;"
        }
    .end annotation

    .prologue
    .line 65
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .local v2, "_entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;>;"
    move-wide/from16 v8, p2

    .local v8, "remainingNumOfEntries":J
    move-wide v10, v8

    .line 68
    .end local v8    # "remainingNumOfEntries":J
    .local v10, "remainingNumOfEntries":J
    :goto_0
    const-wide/16 v12, 0x1

    sub-long v8, v10, v12

    .end local v10    # "remainingNumOfEntries":J
    .restart local v8    # "remainingNumOfEntries":J
    const-wide/16 v12, 0x0

    cmp-long v7, v10, v12

    if-lez v7, :cond_1

    .line 69
    :try_start_0
    new-instance v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    invoke-direct {v4}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;-><init>()V

    .line 70
    .local v4, "e":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
    move/from16 v0, p4

    new-array v7, v0, [B

    iput-object v7, v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->iv:[B

    .line 71
    iget-object v7, v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->iv:[B

    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 72
    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->getFlags()I

    move-result v7

    and-int/lit8 v7, v7, 0x2

    if-lez v7, :cond_0

    .line 73
    invoke-static/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v6

    .line 74
    .local v6, "numOfPairs":I
    new-array v7, v6, [Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    iput-object v7, v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    .line 75
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    iget-object v7, v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    array-length v7, v7

    if-ge v5, v7, :cond_0

    .line 76
    iget-object v7, v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    .line 77
    invoke-static/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v12

    .line 78
    invoke-static/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v14

    .line 76
    invoke-virtual {v4, v12, v14, v15}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->createPair(IJ)Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    move-result-object v12

    aput-object v12, v7, v5

    .line 75
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 80
    .end local v5    # "i":I
    .end local v6    # "numOfPairs":I
    :cond_0
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    move-wide v10, v8

    .line 81
    .end local v8    # "remainingNumOfEntries":J
    .restart local v10    # "remainingNumOfEntries":J
    goto :goto_0

    .line 82
    .end local v4    # "e":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
    .end local v10    # "remainingNumOfEntries":J
    .restart local v8    # "remainingNumOfEntries":J
    :catch_0
    move-exception v3

    .line 83
    .local v3, "bue":Ljava/nio/BufferUnderflowException;
    const/4 v2, 0x0

    .line 85
    .end local v2    # "_entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;>;"
    .end local v3    # "bue":Ljava/nio/BufferUnderflowException;
    :cond_1
    return-object v2
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    const/16 v5, 0x10

    .line 38
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 40
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->getFlags()I

    move-result v4

    and-int/lit8 v4, v4, 0x1

    if-lez v4, :cond_0

    .line 41
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt24(Ljava/nio/ByteBuffer;)I

    move-result v4

    iput v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->algorithmId:I

    .line 42
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v4

    iput v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->ivSize:I

    .line 43
    new-array v4, v5, [B

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->kid:[B

    .line 44
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->kid:[B

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 47
    :cond_0
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    .line 48
    .local v0, "numOfEntries":J
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 49
    .local v2, "parseEight":Ljava/nio/ByteBuffer;
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 51
    .local v3, "parseSixteen":Ljava/nio/ByteBuffer;
    const/16 v4, 0x8

    invoke-direct {p0, v2, v0, v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->parseEntries(Ljava/nio/ByteBuffer;JI)Ljava/util/List;

    move-result-object v4

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->entries:Ljava/util/List;

    .line 52
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->entries:Ljava/util/List;

    if-nez v4, :cond_1

    .line 53
    invoke-direct {p0, v3, v0, v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->parseEntries(Ljava/nio/ByteBuffer;JI)Ljava/util/List;

    move-result-object v4

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->entries:Ljava/util/List;

    .line 54
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 58
    :goto_0
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->entries:Ljava/util/List;

    if-nez v4, :cond_2

    .line 59
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "Cannot parse SampleEncryptionBox"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 56
    :cond_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_0

    .line 62
    :cond_2
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 163
    if-ne p0, p1, :cond_1

    .line 185
    :cond_0
    :goto_0
    return v1

    .line 166
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 167
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 170
    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;

    .line 172
    .local v0, "that":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;
    iget v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->algorithmId:I

    iget v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->algorithmId:I

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 173
    goto :goto_0

    .line 175
    :cond_4
    iget v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->ivSize:I

    iget v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->ivSize:I

    if-eq v3, v4, :cond_5

    move v1, v2

    .line 176
    goto :goto_0

    .line 178
    :cond_5
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->entries:Ljava/util/List;

    if-eqz v3, :cond_7

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->entries:Ljava/util/List;

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->entries:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    :cond_6
    move v1, v2

    .line 179
    goto :goto_0

    .line 178
    :cond_7
    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->entries:Ljava/util/List;

    if-nez v3, :cond_6

    .line 181
    :cond_8
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->kid:[B

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->kid:[B

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 182
    goto :goto_0
.end method

.method public getBox(Ljava/nio/channels/WritableByteChannel;)V
    .locals 0
    .param p1, "os"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 158
    invoke-super {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;->getBox(Ljava/nio/channels/WritableByteChannel;)V

    .line 159
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 8
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 118
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 119
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->isOverrideTrackEncryptionBoxParameters()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 120
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->algorithmId:I

    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt24(Ljava/nio/ByteBuffer;I)V

    .line 121
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->ivSize:I

    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 122
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->kid:[B

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 124
    :cond_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    int-to-long v2, v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 125
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    .line 126
    .local v0, "entry":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->getSize()I

    move-result v2

    if-lez v2, :cond_1

    .line 127
    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->iv:[B

    array-length v2, v2

    const/16 v4, 0x8

    if-eq v2, v4, :cond_2

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->iv:[B

    array-length v2, v2

    const/16 v4, 0x10

    if-eq v2, v4, :cond_2

    .line 128
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "IV must be either 8 or 16 bytes"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 130
    :cond_2
    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->iv:[B

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 131
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->isSubSampleEncryption()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 132
    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    array-length v2, v2

    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 133
    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    array-length v5, v4

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v5, :cond_1

    aget-object v1, v4, v2

    .line 134
    .local v1, "pair":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;
    invoke-interface {v1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;->clear()I

    move-result v6

    invoke-static {p1, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 135
    invoke-interface {v1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;->encrypted()J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 133
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 140
    .end local v0    # "entry":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
    .end local v1    # "pair":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;
    :cond_3
    return-void
.end method

.method protected getContentSize()J
    .locals 8

    .prologue
    const-wide/16 v6, 0x4

    .line 144
    const-wide/16 v0, 0x4

    .line 145
    .local v0, "contentSize":J
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->isOverrideTrackEncryptionBoxParameters()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 146
    add-long/2addr v0, v6

    .line 147
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->kid:[B

    array-length v3, v3

    int-to-long v4, v3

    add-long/2addr v0, v4

    .line 149
    :cond_0
    add-long/2addr v0, v6

    .line 150
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->entries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    .line 151
    .local v2, "entry":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->getSize()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v0, v4

    .line 152
    goto :goto_0

    .line 153
    .end local v2    # "entry":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
    :cond_1
    return-wide v0
.end method

.method public getEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;",
            ">;"
        }
    .end annotation

    .prologue
    .line 90
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->entries:Ljava/util/List;

    return-object v0
.end method

.method public getEntrySizes()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Short;",
            ">;"
        }
    .end annotation

    .prologue
    .line 198
    new-instance v1, Ljava/util/ArrayList;

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->entries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 199
    .local v1, "entrySizes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Short;>;"
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->entries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    .line 200
    .local v0, "entry":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->iv:[B

    array-length v4, v4

    int-to-short v2, v4

    .line 201
    .local v2, "size":S
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->isSubSampleEncryption()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 202
    add-int/lit8 v4, v2, 0x2

    int-to-short v2, v4

    .line 203
    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    array-length v4, v4

    mul-int/lit8 v4, v4, 0x6

    add-int/2addr v4, v2

    int-to-short v2, v4

    .line 205
    :cond_0
    invoke-static {v2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 207
    .end local v0    # "entry":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
    .end local v2    # "size":S
    :cond_1
    return-object v1
.end method

.method public getOffsetToFirstIV()I
    .locals 6

    .prologue
    .line 30
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->getSize()J

    move-result-wide v2

    const-wide v4, 0x100000000L

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    const/16 v0, 0x10

    .line 31
    .local v0, "offset":I
    :goto_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->isOverrideTrackEncryptionBoxParameters()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->kid:[B

    array-length v1, v1

    add-int/lit8 v1, v1, 0x4

    :goto_1
    add-int/2addr v0, v1

    .line 32
    add-int/lit8 v0, v0, 0x4

    .line 33
    return v0

    .line 30
    .end local v0    # "offset":I
    :cond_0
    const/16 v0, 0x8

    goto :goto_0

    .line 31
    .restart local v0    # "offset":I
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 190
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->algorithmId:I

    .line 191
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->ivSize:I

    add-int v0, v1, v3

    .line 192
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->kid:[B

    if-eqz v1, :cond_1

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->kid:[B

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([B)I

    move-result v1

    :goto_0
    add-int v0, v3, v1

    .line 193
    mul-int/lit8 v1, v0, 0x1f

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->entries:Ljava/util/List;

    if-eqz v3, :cond_0

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->hashCode()I

    move-result v2

    :cond_0
    add-int v0, v1, v2

    .line 194
    return v0

    :cond_1
    move v1, v2

    .line 192
    goto :goto_0
.end method

.method protected isOverrideTrackEncryptionBoxParameters()Z
    .locals 1
    .annotation runtime Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/annotations/DoNotParseDetail;
    .end annotation

    .prologue
    .line 113
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSubSampleEncryption()Z
    .locals 1
    .annotation runtime Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/annotations/DoNotParseDetail;
    .end annotation

    .prologue
    .line 99
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setEntries(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 94
    .local p1, "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;>;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->entries:Ljava/util/List;

    .line 95
    return-void
.end method

.method public setSubSampleEncryption(Z)V
    .locals 2
    .param p1, "b"    # Z
    .annotation runtime Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/annotations/DoNotParseDetail;
    .end annotation

    .prologue
    .line 104
    if-eqz p1, :cond_0

    .line 105
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->getFlags()I

    move-result v0

    or-int/lit8 v0, v0, 0x2

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->setFlags(I)V

    .line 109
    :goto_0
    return-void

    .line 107
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->getFlags()I

    move-result v0

    const v1, 0xfffffd

    and-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;->setFlags(I)V

    goto :goto_0
.end method
