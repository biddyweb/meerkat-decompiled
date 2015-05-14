.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataReferenceBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "AppleDataReferenceBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "rdrf"


# instance fields
.field private dataReference:Ljava/lang/String;

.field private dataReferenceSize:I

.field private dataReferenceType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    const-string v0, "rdrf"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 40
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 49
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataReferenceBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 50
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->read4cc(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataReferenceBox;->dataReferenceType:Ljava/lang/String;

    .line 51
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataReferenceBox;->dataReferenceSize:I

    .line 52
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataReferenceBox;->dataReferenceSize:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataReferenceBox;->dataReference:Ljava/lang/String;

    .line 53
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 57
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataReferenceBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 58
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataReferenceBox;->dataReferenceType:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->fourCCtoBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 59
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataReferenceBox;->dataReferenceSize:I

    int-to-long v0, v0

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 60
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataReferenceBox;->dataReference:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 61
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 44
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataReferenceBox;->dataReferenceSize:I

    add-int/lit8 v0, v0, 0xc

    int-to-long v0, v0

    return-wide v0
.end method

.method public getDataReference()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataReferenceBox;->dataReference:Ljava/lang/String;

    return-object v0
.end method

.method public getDataReferenceSize()J
    .locals 2

    .prologue
    .line 64
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataReferenceBox;->dataReferenceSize:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public getDataReferenceType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataReferenceBox;->dataReferenceType:Ljava/lang/String;

    return-object v0
.end method
