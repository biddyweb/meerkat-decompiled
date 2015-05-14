.class public Lcom/google/android/exoplayer/metadata/Id3Parser;
.super Ljava/lang/Object;
.source "Id3Parser.java"

# interfaces
.implements Lcom/google/android/exoplayer/metadata/MetadataParser;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/exoplayer/metadata/MetadataParser",
        "<",
        "Ljava/util/Map",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getCharsetName(I)Ljava/lang/String;
    .locals 1
    .param p0, "encodingByte"    # I

    .prologue
    .line 144
    packed-switch p0, :pswitch_data_0

    .line 154
    const-string v0, "ISO-8859-1"

    :goto_0
    return-object v0

    .line 146
    :pswitch_0
    const-string v0, "ISO-8859-1"

    goto :goto_0

    .line 148
    :pswitch_1
    const-string v0, "UTF-16"

    goto :goto_0

    .line 150
    :pswitch_2
    const-string v0, "UTF-16BE"

    goto :goto_0

    .line 152
    :pswitch_3
    const-string v0, "UTF-8"

    goto :goto_0

    .line 144
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private static indexOf([BIB)I
    .locals 2
    .param p0, "data"    # [B
    .param p1, "fromIndex"    # I
    .param p2, "key"    # B

    .prologue
    .line 84
    move v0, p1

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 85
    aget-byte v1, p0, v0

    if-ne v1, p2, :cond_0

    .line 89
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 84
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 89
    :cond_1
    array-length v0, p0

    goto :goto_1
.end method

.method private static indexOfNot([BIB)I
    .locals 2
    .param p0, "data"    # [B
    .param p1, "fromIndex"    # I
    .param p2, "key"    # B

    .prologue
    .line 93
    move v0, p1

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 94
    aget-byte v1, p0, v0

    if-eq v1, p2, :cond_0

    .line 98
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 93
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 98
    :cond_1
    array-length v0, p0

    goto :goto_1
.end method

.method private static parseId3Header(Lcom/google/android/exoplayer/util/ParsableByteArray;)I
    .locals 12
    .param p0, "id3Buffer"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x2

    .line 109
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v2

    .line 110
    .local v2, "id1":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v3

    .line 111
    .local v3, "id2":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v4

    .line 112
    .local v4, "id3":I
    const/16 v6, 0x49

    if-ne v2, v6, :cond_0

    const/16 v6, 0x44

    if-ne v3, v6, :cond_0

    const/16 v6, 0x33

    if-eq v4, v6, :cond_1

    .line 113
    :cond_0
    new-instance v6, Lcom/google/android/exoplayer/ParserException;

    const-string v7, "Unexpected ID3 file identifier, expected \"ID3\", actual \"%c%c%c\"."

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    .line 114
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v11

    .line 113
    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 116
    :cond_1
    invoke-virtual {p0, v11}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 118
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v1

    .line 119
    .local v1, "flags":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readSynchSafeInt()I

    move-result v5

    .line 122
    .local v5, "id3Size":I
    and-int/lit8 v6, v1, 0x2

    if-eqz v6, :cond_3

    .line 123
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readSynchSafeInt()I

    move-result v0

    .line 124
    .local v0, "extendedHeaderSize":I
    const/4 v6, 0x4

    if-le v0, v6, :cond_2

    .line 125
    add-int/lit8 v6, v0, -0x4

    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 127
    :cond_2
    sub-int/2addr v5, v0

    .line 131
    .end local v0    # "extendedHeaderSize":I
    :cond_3
    and-int/lit8 v6, v1, 0x8

    if-eqz v6, :cond_4

    .line 132
    add-int/lit8 v5, v5, -0xa

    .line 135
    :cond_4
    return v5
.end method


# virtual methods
.method public canParse(Ljava/lang/String;)Z
    .locals 1
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 34
    const-string v0, "application/id3"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic parse([BI)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 30
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer/metadata/Id3Parser;->parse([BI)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public parse([BI)Ljava/util/Map;
    .locals 24
    .param p1, "data"    # [B
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BI)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 40
    new-instance v15, Ljava/util/HashMap;

    invoke-direct {v15}, Ljava/util/HashMap;-><init>()V

    .line 41
    .local v15, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v13, Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-direct {v13, v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>([BI)V

    .line 42
    .local v13, "id3Data":Lcom/google/android/exoplayer/util/ParsableByteArray;
    invoke-static {v13}, Lcom/google/android/exoplayer/metadata/Id3Parser;->parseId3Header(Lcom/google/android/exoplayer/util/ParsableByteArray;)I

    move-result v14

    .line 44
    .local v14, "id3Size":I
    :goto_0
    if-lez v14, :cond_0

    .line 45
    invoke-virtual {v13}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v8

    .line 46
    .local v8, "frameId0":I
    invoke-virtual {v13}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v9

    .line 47
    .local v9, "frameId1":I
    invoke-virtual {v13}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v10

    .line 48
    .local v10, "frameId2":I
    invoke-virtual {v13}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v11

    .line 49
    .local v11, "frameId3":I
    invoke-virtual {v13}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readSynchSafeInt()I

    move-result v12

    .line 50
    .local v12, "frameSize":I
    const/16 v20, 0x1

    move/from16 v0, v20

    if-gt v12, v0, :cond_1

    .line 80
    .end local v8    # "frameId0":I
    .end local v9    # "frameId1":I
    .end local v10    # "frameId2":I
    .end local v11    # "frameId3":I
    .end local v12    # "frameSize":I
    :cond_0
    invoke-static {v15}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v20

    return-object v20

    .line 55
    .restart local v8    # "frameId0":I
    .restart local v9    # "frameId1":I
    .restart local v10    # "frameId2":I
    .restart local v11    # "frameId3":I
    .restart local v12    # "frameSize":I
    :cond_1
    const/16 v20, 0x2

    move/from16 v0, v20

    invoke-virtual {v13, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 57
    const/16 v20, 0x54

    move/from16 v0, v20

    if-ne v8, v0, :cond_2

    const/16 v20, 0x58

    move/from16 v0, v20

    if-ne v9, v0, :cond_2

    const/16 v20, 0x58

    move/from16 v0, v20

    if-ne v10, v0, :cond_2

    const/16 v20, 0x58

    move/from16 v0, v20

    if-ne v11, v0, :cond_2

    .line 58
    invoke-virtual {v13}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v5

    .line 59
    .local v5, "encoding":I
    invoke-static {v5}, Lcom/google/android/exoplayer/metadata/Id3Parser;->getCharsetName(I)Ljava/lang/String;

    move-result-object v3

    .line 60
    .local v3, "charset":Ljava/lang/String;
    add-int/lit8 v20, v12, -0x1

    move/from16 v0, v20

    new-array v7, v0, [B

    .line 61
    .local v7, "frame":[B
    const/16 v20, 0x0

    add-int/lit8 v21, v12, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v13, v7, v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 63
    const/16 v20, 0x0

    const/16 v21, 0x0

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-static {v7, v0, v1}, Lcom/google/android/exoplayer/metadata/Id3Parser;->indexOf([BIB)I

    move-result v6

    .line 64
    .local v6, "firstZeroIndex":I
    new-instance v4, Ljava/lang/String;

    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-direct {v4, v7, v0, v6, v3}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 65
    .local v4, "description":Ljava/lang/String;
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-static {v7, v6, v0}, Lcom/google/android/exoplayer/metadata/Id3Parser;->indexOfNot([BIB)I

    move-result v19

    .line 66
    .local v19, "valueStartIndex":I
    const/16 v20, 0x0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v7, v0, v1}, Lcom/google/android/exoplayer/metadata/Id3Parser;->indexOf([BIB)I

    move-result v18

    .line 67
    .local v18, "valueEndIndex":I
    new-instance v17, Ljava/lang/String;

    sub-int v20, v18, v19

    move-object/from16 v0, v17

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v7, v1, v2, v3}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 69
    .local v17, "value":Ljava/lang/String;
    const-string v20, "TXXX"

    new-instance v21, Lcom/google/android/exoplayer/metadata/TxxxMetadata;

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-direct {v0, v4, v1}, Lcom/google/android/exoplayer/metadata/TxxxMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v15, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .end local v3    # "charset":Ljava/lang/String;
    .end local v4    # "description":Ljava/lang/String;
    .end local v5    # "encoding":I
    .end local v6    # "firstZeroIndex":I
    .end local v17    # "value":Ljava/lang/String;
    .end local v18    # "valueEndIndex":I
    .end local v19    # "valueStartIndex":I
    :goto_1
    add-int/lit8 v20, v12, 0xa

    sub-int v14, v14, v20

    .line 78
    goto/16 :goto_0

    .line 71
    .end local v7    # "frame":[B
    :cond_2
    const-string v20, "%c%c%c%c"

    const/16 v21, 0x4

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x2

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x3

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    .line 72
    .local v16, "type":Ljava/lang/String;
    new-array v7, v12, [B

    .line 73
    .restart local v7    # "frame":[B
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v13, v7, v0, v12}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 74
    move-object/from16 v0, v16

    invoke-interface {v15, v0, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method
