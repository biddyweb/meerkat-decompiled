.class public Lcom/google/android/exoplayer/text/eia608/Eia608Parser;
.super Ljava/lang/Object;
.source "Eia608Parser.java"


# static fields
.field private static final BASIC_CHARACTER_SET:[I

.field private static final COUNTRY_CODE:I = 0xb5

.field private static final PAYLOAD_TYPE_CC:I = 0x4

.field private static final PROVIDER_CODE:I = 0x31

.field private static final SPECIAL_CHARACTER_SET:[I

.field private static final USER_DATA_TYPE_CODE:I = 0x3

.field private static final USER_ID:I = 0x47413934


# instance fields
.field private final captions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/exoplayer/text/eia608/ClosedCaption;",
            ">;"
        }
    .end annotation
.end field

.field private final seiBuffer:Lcom/google/android/exoplayer/util/ParsableBitArray;

.field private final stringBuilder:Ljava/lang/StringBuilder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const/16 v0, 0x60

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->BASIC_CHARACTER_SET:[I

    .line 66
    const/16 v0, 0x10

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->SPECIAL_CHARACTER_SET:[I

    return-void

    .line 38
    nop

    :array_0
    .array-data 4
        0x20
        0x21
        0x22
        0x23
        0x24
        0x25
        0x26
        0x27
        0x28
        0x29
        0xe1
        0x2b
        0x2c
        0x2d
        0x2e
        0x2f
        0x30
        0x31
        0x32
        0x33
        0x34
        0x35
        0x36
        0x37
        0x38
        0x39
        0x3a
        0x3b
        0x3c
        0x3d
        0x3e
        0x3f
        0x40
        0x41
        0x42
        0x43
        0x44
        0x45
        0x46
        0x47
        0x48
        0x49
        0x4a
        0x4b
        0x4c
        0x4d
        0x4e
        0x4f
        0x50
        0x51
        0x52
        0x53
        0x54
        0x55
        0x56
        0x57
        0x58
        0x59
        0x5a
        0x5b
        0xe9
        0x5d
        0xed
        0xf3
        0xfa
        0x61
        0x62
        0x63
        0x64
        0x65
        0x66
        0x67
        0x68
        0x69
        0x6a
        0x6b
        0x6c
        0x6d
        0x6e
        0x6f
        0x70
        0x71
        0x72
        0x73
        0x74
        0x75
        0x76
        0x77
        0x78
        0x79
        0x7a
        0xe7
        0xf7
        0xd1
        0xf1
        0x25a0
    .end array-data

    .line 66
    :array_1
    .array-data 4
        0xae
        0xb0
        0xbd
        0xbf
        0x2122
        0xa2
        0xa3
        0x266a
        0xe0
        0x20
        0xe8
        0xe2
        0xea
        0xee
        0xf4
        0xfb
    .end array-data
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-direct {v0}, Lcom/google/android/exoplayer/util/ParsableBitArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableBitArray;

    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->stringBuilder:Ljava/lang/StringBuilder;

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->captions:Ljava/util/ArrayList;

    .line 93
    return-void
.end method

.method private static getChar(B)C
    .locals 2
    .param p0, "ccData"    # B

    .prologue
    .line 173
    and-int/lit8 v1, p0, 0x7f

    add-int/lit8 v0, v1, -0x20

    .line 174
    .local v0, "index":I
    sget-object v1, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->BASIC_CHARACTER_SET:[I

    aget v1, v1, v0

    int-to-char v1, v1

    return v1
.end method

.method private static getSpecialChar(B)C
    .locals 2
    .param p0, "ccData"    # B

    .prologue
    .line 178
    and-int/lit8 v0, p0, 0xf

    .line 179
    .local v0, "index":I
    sget-object v1, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->SPECIAL_CHARACTER_SET:[I

    aget v1, v1, v0

    int-to-char v1, v1

    return v1
.end method

.method public static inspectSeiMessage(IILcom/google/android/exoplayer/util/ParsableByteArray;)Z
    .locals 7
    .param p0, "payloadType"    # I
    .param p1, "payloadLength"    # I
    .param p2, "payload"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    const/4 v5, 0x0

    .line 194
    const/4 v6, 0x4

    if-ne p0, v6, :cond_0

    const/16 v6, 0x8

    if-ge p1, v6, :cond_1

    .line 203
    :cond_0
    :goto_0
    return v5

    .line 197
    :cond_1
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v2

    .line 198
    .local v2, "startPosition":I
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 199
    .local v0, "countryCode":I
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v1

    .line 200
    .local v1, "providerCode":I
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v4

    .line 201
    .local v4, "userIdentifier":I
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v3

    .line 202
    .local v3, "userDataTypeCode":I
    invoke-virtual {p2, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 203
    const/16 v6, 0xb5

    if-ne v0, v6, :cond_0

    const/16 v6, 0x31

    if-ne v1, v6, :cond_0

    const v6, 0x47413934

    if-ne v4, v6, :cond_0

    const/4 v6, 0x3

    if-ne v3, v6, :cond_0

    const/4 v5, 0x1

    goto :goto_0
.end method


# virtual methods
.method canParse(Ljava/lang/String;)Z
    .locals 1
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 96
    const-string v0, "application/eia-608"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method parse(Lcom/google/android/exoplayer/SampleHolder;)Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;
    .locals 11
    .param p1, "sampleHolder"    # Lcom/google/android/exoplayer/SampleHolder;

    .prologue
    .line 100
    iget v7, p1, Lcom/google/android/exoplayer/SampleHolder;->size:I

    const/16 v8, 0xa

    if-ge v7, v8, :cond_0

    .line 101
    const/4 v7, 0x0

    .line 169
    :goto_0
    return-object v7

    .line 104
    :cond_0
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->captions:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    .line 105
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->stringBuilder:Ljava/lang/StringBuilder;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 106
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableBitArray;

    iget-object v8, p1, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/google/android/exoplayer/util/ParsableBitArray;->reset([B)V

    .line 110
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v8, 0x43

    invoke-virtual {v7, v8}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 111
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v8, 0x5

    invoke-virtual {v7, v8}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v1

    .line 112
    .local v1, "ccCount":I
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v8, 0x8

    invoke-virtual {v7, v8}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 114
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    if-ge v6, v1, :cond_8

    .line 115
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v8, 0x5

    invoke-virtual {v7, v8}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 116
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v7}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBit()Z

    move-result v5

    .line 117
    .local v5, "ccValid":Z
    if-nez v5, :cond_2

    .line 118
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v8, 0x12

    invoke-virtual {v7, v8}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 114
    :cond_1
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 121
    :cond_2
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v8, 0x2

    invoke-virtual {v7, v8}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v4

    .line 122
    .local v4, "ccType":I
    if-eqz v4, :cond_3

    .line 123
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v8, 0x10

    invoke-virtual {v7, v8}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    goto :goto_2

    .line 126
    :cond_3
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 127
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v8, 0x7

    invoke-virtual {v7, v8}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v7

    int-to-byte v2, v7

    .line 128
    .local v2, "ccData1":B
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 129
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v8, 0x7

    invoke-virtual {v7, v8}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v7

    int-to-byte v3, v7

    .line 132
    .local v3, "ccData2":B
    if-nez v2, :cond_4

    if-eqz v3, :cond_1

    .line 137
    :cond_4
    const/16 v7, 0x11

    if-ne v2, v7, :cond_5

    and-int/lit8 v7, v3, 0x70

    const/16 v8, 0x30

    if-ne v7, v8, :cond_5

    .line 138
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->stringBuilder:Ljava/lang/StringBuilder;

    invoke-static {v3}, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->getSpecialChar(B)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 143
    :cond_5
    const/16 v7, 0x20

    if-ge v2, v7, :cond_7

    .line 144
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->stringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-lez v7, :cond_6

    .line 145
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->captions:Ljava/util/ArrayList;

    new-instance v8, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionText;

    iget-object v9, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->stringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionText;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 146
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->stringBuilder:Ljava/lang/StringBuilder;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 148
    :cond_6
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->captions:Ljava/util/ArrayList;

    new-instance v8, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;

    invoke-direct {v8, v2, v3}, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;-><init>(BB)V

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 153
    :cond_7
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->stringBuilder:Ljava/lang/StringBuilder;

    invoke-static {v2}, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->getChar(B)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 154
    if-eqz v3, :cond_1

    .line 155
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->stringBuilder:Ljava/lang/StringBuilder;

    invoke-static {v3}, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->getChar(B)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_2

    .line 159
    .end local v2    # "ccData1":B
    .end local v3    # "ccData2":B
    .end local v4    # "ccType":I
    .end local v5    # "ccValid":Z
    :cond_8
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->stringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-lez v7, :cond_9

    .line 160
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->captions:Ljava/util/ArrayList;

    new-instance v8, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionText;

    iget-object v9, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->stringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionText;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 163
    :cond_9
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->captions:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_a

    .line 164
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 167
    :cond_a
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->captions:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v0, v7, [Lcom/google/android/exoplayer/text/eia608/ClosedCaption;

    .line 168
    .local v0, "captionArray":[Lcom/google/android/exoplayer/text/eia608/ClosedCaption;
    iget-object v7, p0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->captions:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 169
    new-instance v7, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;

    iget-wide v8, p1, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    iget-boolean v10, p1, Lcom/google/android/exoplayer/SampleHolder;->decodeOnly:Z

    invoke-direct {v7, v8, v9, v10, v0}, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;-><init>(JZ[Lcom/google/android/exoplayer/text/eia608/ClosedCaption;)V

    goto/16 :goto_0
.end method
