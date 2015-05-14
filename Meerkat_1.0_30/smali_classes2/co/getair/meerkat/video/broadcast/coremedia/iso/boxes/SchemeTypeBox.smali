.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "SchemeTypeBox.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final TYPE:Ljava/lang/String; = "schm"


# instance fields
.field schemeType:Ljava/lang/String;

.field schemeUri:Ljava/lang/String;

.field schemeVersion:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-class v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    const-string v0, "schm"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 36
    const-string v0, "    "

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->schemeType:Ljava/lang/String;

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->schemeUri:Ljava/lang/String;

    .line 42
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 75
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 76
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->read4cc(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->schemeType:Ljava/lang/String;

    .line 77
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->schemeVersion:J

    .line 78
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 79
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->schemeUri:Ljava/lang/String;

    .line 81
    :cond_0
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 85
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 86
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->schemeType:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->fourCCtoBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 87
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->schemeVersion:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 88
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 89
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->schemeUri:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 91
    :cond_0
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 70
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->schemeUri:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    :goto_0
    add-int/lit8 v0, v0, 0xc

    int-to-long v0, v0

    return-wide v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSchemeType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->schemeType:Ljava/lang/String;

    return-object v0
.end method

.method public getSchemeUri()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->schemeUri:Ljava/lang/String;

    return-object v0
.end method

.method public getSchemeVersion()J
    .locals 2

    .prologue
    .line 49
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->schemeVersion:J

    return-wide v0
.end method

.method public setSchemeType(Ljava/lang/String;)V
    .locals 2
    .param p1, "schemeType"    # Ljava/lang/String;

    .prologue
    .line 57
    sget-boolean v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "SchemeType may not be null or not 4 bytes long"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 58
    :cond_1
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->schemeType:Ljava/lang/String;

    .line 59
    return-void
.end method

.method public setSchemeUri(Ljava/lang/String;)V
    .locals 0
    .param p1, "schemeUri"    # Ljava/lang/String;

    .prologue
    .line 66
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->schemeUri:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public setSchemeVersion(I)V
    .locals 2
    .param p1, "schemeVersion"    # I

    .prologue
    .line 62
    int-to-long v0, p1

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->schemeVersion:J

    .line 63
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const-string v1, "Schema Type Box["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    const-string v1, "schemeUri="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->schemeUri:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    const-string v1, "schemeType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->schemeType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    const-string v1, "schemeVersion="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->schemeVersion:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
