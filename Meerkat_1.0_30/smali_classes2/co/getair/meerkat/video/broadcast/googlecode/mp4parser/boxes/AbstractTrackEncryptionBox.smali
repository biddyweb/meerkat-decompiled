.class public abstract Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "AbstractTrackEncryptionBox.java"


# instance fields
.field defaultAlgorithmId:I

.field defaultIvSize:I

.field default_KID:[B


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 22
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 55
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 56
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt24(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->defaultAlgorithmId:I

    .line 57
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->defaultIvSize:I

    .line 58
    const/16 v0, 0x10

    new-array v0, v0, [B

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->default_KID:[B

    .line 59
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->default_KID:[B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 60
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 77
    if-ne p0, p1, :cond_1

    .line 86
    :cond_0
    :goto_0
    return v1

    .line 78
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 80
    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;

    .line 82
    .local v0, "that":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;
    iget v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->defaultAlgorithmId:I

    iget v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->defaultAlgorithmId:I

    if-eq v3, v4, :cond_4

    move v1, v2

    goto :goto_0

    .line 83
    :cond_4
    iget v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->defaultIvSize:I

    iget v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->defaultIvSize:I

    if-eq v3, v4, :cond_5

    move v1, v2

    goto :goto_0

    .line 84
    :cond_5
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->default_KID:[B

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->default_KID:[B

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 64
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 65
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->defaultAlgorithmId:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt24(Ljava/nio/ByteBuffer;I)V

    .line 66
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->defaultIvSize:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 67
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->default_KID:[B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 68
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 72
    const-wide/16 v0, 0x18

    return-wide v0
.end method

.method public getDefaultAlgorithmId()I
    .locals 1

    .prologue
    .line 25
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->defaultAlgorithmId:I

    return v0
.end method

.method public getDefaultIvSize()I
    .locals 1

    .prologue
    .line 33
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->defaultIvSize:I

    return v0
.end method

.method public getDefault_KID()Ljava/util/UUID;
    .locals 6

    .prologue
    .line 41
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->default_KID:[B

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 42
    .local v0, "b":Ljava/nio/ByteBuffer;
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 43
    new-instance v1, Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v2

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v4

    invoke-direct {v1, v2, v3, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    return-object v1
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 91
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->defaultAlgorithmId:I

    .line 92
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->defaultIvSize:I

    add-int v0, v1, v2

    .line 93
    mul-int/lit8 v2, v0, 0x1f

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->default_KID:[B

    if-eqz v1, :cond_0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->default_KID:[B

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([B)I

    move-result v1

    :goto_0
    add-int v0, v2, v1

    .line 94
    return v0

    .line 93
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setDefaultAlgorithmId(I)V
    .locals 0
    .param p1, "defaultAlgorithmId"    # I

    .prologue
    .line 29
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->defaultAlgorithmId:I

    .line 30
    return-void
.end method

.method public setDefaultIvSize(I)V
    .locals 0
    .param p1, "defaultIvSize"    # I

    .prologue
    .line 37
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->defaultIvSize:I

    .line 38
    return-void
.end method

.method public setDefault_KID(Ljava/util/UUID;)V
    .locals 4
    .param p1, "uuid"    # Ljava/util/UUID;

    .prologue
    .line 47
    const/16 v1, 0x10

    new-array v1, v1, [B

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 48
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {p1}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 49
    invoke-virtual {p1}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 50
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractTrackEncryptionBox;->default_KID:[B

    .line 51
    return-void
.end method
