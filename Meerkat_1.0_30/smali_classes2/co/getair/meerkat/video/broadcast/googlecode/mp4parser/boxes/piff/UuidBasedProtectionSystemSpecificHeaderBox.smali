.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "UuidBasedProtectionSystemSpecificHeaderBox.java"


# static fields
.field public static USER_TYPE:[B


# instance fields
.field protectionSpecificHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;

.field systemId:Ljava/util/UUID;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->USER_TYPE:[B

    return-void

    :array_0
    .array-data 1
        -0x30t
        -0x76t
        0x4ft
        0x18t
        0x10t
        -0xdt
        0x4at
        -0x7et
        -0x4at
        -0x38t
        0x32t
        -0x28t
        -0x55t
        -0x5ft
        -0x7dt
        -0x2dt
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 33
    const-string v0, "uuid"

    sget-object v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->USER_TYPE:[B

    invoke-direct {p0, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;[B)V

    .line 34
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 59
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 60
    const/16 v2, 0x10

    new-array v1, v2, [B

    .line 61
    .local v1, "systemIdBytes":[B
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 62
    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/UUIDConverter;->convert([B)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->systemId:Ljava/util/UUID;

    .line 63
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v0

    .line 64
    .local v0, "dataSize":I
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->systemId:Ljava/util/UUID;

    invoke-static {v2, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;->createFor(Ljava/util/UUID;Ljava/nio/ByteBuffer;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;

    move-result-object v2

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->protectionSpecificHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;

    .line 65
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 48
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 49
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->systemId:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    .line 50
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->systemId:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    .line 51
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->protectionSpecificHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;->getData()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 52
    .local v0, "data":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 53
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    int-to-long v2, v1

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 54
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 55
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 38
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->protectionSpecificHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;->getData()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    add-int/lit8 v0, v0, 0x18

    int-to-long v0, v0

    return-wide v0
.end method

.method public getProtectionSpecificHeader()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->protectionSpecificHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;

    return-object v0
.end method

.method public getProtectionSpecificHeaderString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->protectionSpecificHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSystemId()Ljava/util/UUID;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->systemId:Ljava/util/UUID;

    return-object v0
.end method

.method public getSystemIdString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->systemId:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUserType()[B
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->USER_TYPE:[B

    return-object v0
.end method

.method public setProtectionSpecificHeader(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;)V
    .locals 0
    .param p1, "protectionSpecificHeader"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;

    .prologue
    .line 88
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->protectionSpecificHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;

    .line 89
    return-void
.end method

.method public setSystemId(Ljava/util/UUID;)V
    .locals 0
    .param p1, "systemId"    # Ljava/util/UUID;

    .prologue
    .line 72
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->systemId:Ljava/util/UUID;

    .line 73
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "UuidBasedProtectionSystemSpecificHeaderBox"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    const-string v1, "{systemId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->systemId:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    const-string v1, ", dataSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/UuidBasedProtectionSystemSpecificHeaderBox;->protectionSpecificHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;->getData()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
