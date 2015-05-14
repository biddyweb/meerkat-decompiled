.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "ClassificationBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "clsf"


# instance fields
.field private classificationEntity:Ljava/lang/String;

.field private classificationInfo:Ljava/lang/String;

.field private classificationTableIndex:I

.field private language:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    const-string v0, "clsf"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 42
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 83
    const/4 v1, 0x4

    new-array v0, v1, [B

    .line 84
    .local v0, "cE":[B
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 85
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->bytesToFourCC([B)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->classificationEntity:Ljava/lang/String;

    .line 86
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->classificationTableIndex:I

    .line 87
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readIso639(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->language:Ljava/lang/String;

    .line 88
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->classificationInfo:Ljava/lang/String;

    .line 89
    return-void
.end method

.method public getClassificationEntity()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->classificationEntity:Ljava/lang/String;

    return-object v0
.end method

.method public getClassificationInfo()Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->classificationInfo:Ljava/lang/String;

    return-object v0
.end method

.method public getClassificationTableIndex()I
    .locals 1

    .prologue
    .line 53
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->classificationTableIndex:I

    return v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 93
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->classificationEntity:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->fourCCtoBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 94
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->classificationTableIndex:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 95
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->language:Ljava/lang/String;

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeIso639(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 96
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->classificationInfo:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 97
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 98
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 77
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->classificationInfo:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x8

    add-int/lit8 v0, v0, 0x1

    int-to-long v0, v0

    return-wide v0
.end method

.method public getLanguage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->language:Ljava/lang/String;

    return-object v0
.end method

.method public setClassificationEntity(Ljava/lang/String;)V
    .locals 0
    .param p1, "classificationEntity"    # Ljava/lang/String;

    .prologue
    .line 61
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->classificationEntity:Ljava/lang/String;

    .line 62
    return-void
.end method

.method public setClassificationInfo(Ljava/lang/String;)V
    .locals 0
    .param p1, "classificationInfo"    # Ljava/lang/String;

    .prologue
    .line 73
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->classificationInfo:Ljava/lang/String;

    .line 74
    return-void
.end method

.method public setClassificationTableIndex(I)V
    .locals 0
    .param p1, "classificationTableIndex"    # I

    .prologue
    .line 65
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->classificationTableIndex:I

    .line 66
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .locals 0
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 69
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->language:Ljava/lang/String;

    .line 70
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 103
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const-string v1, "ClassificationBox[language="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    const-string v1, "classificationEntity="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->getClassificationEntity()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    const-string v1, ";classificationTableIndex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->getClassificationTableIndex()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 106
    const-string v1, ";language="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    const-string v1, ";classificationInfo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ClassificationBox;->getClassificationInfo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
