.class public Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "SampleAuxiliaryInformationOffsetsBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "saio"


# instance fields
.field private auxInfoType:Ljava/lang/String;

.field private auxInfoTypeParameter:Ljava/lang/String;

.field private offsets:[J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 59
    const-string v0, "saio"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 54
    const/4 v0, 0x0

    new-array v0, v0, [J

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->offsets:[J

    .line 60
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 87
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 89
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->getFlags()I

    move-result v2

    and-int/lit8 v2, v2, 0x1

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 90
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->read4cc(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->auxInfoType:Ljava/lang/String;

    .line 91
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->read4cc(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->auxInfoTypeParameter:Ljava/lang/String;

    .line 94
    :cond_0
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v0

    .line 95
    .local v0, "entryCount":I
    new-array v2, v0, [J

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->offsets:[J

    .line 97
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_2

    .line 98
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->getVersion()I

    move-result v2

    if-nez v2, :cond_1

    .line 99
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->offsets:[J

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    aput-wide v4, v2, v1

    .line 97
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 101
    :cond_1
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->offsets:[J

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt64(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    aput-wide v4, v2, v1

    goto :goto_1

    .line 104
    :cond_2
    return-void
.end method

.method public getAuxInfoType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->auxInfoType:Ljava/lang/String;

    return-object v0
.end method

.method public getAuxInfoTypeParameter()Ljava/lang/String;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->auxInfoTypeParameter:Ljava/lang/String;

    return-object v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 69
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 70
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->getFlags()I

    move-result v1

    and-int/lit8 v1, v1, 0x1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 71
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->auxInfoType:Ljava/lang/String;

    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->fourCCtoBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 72
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->auxInfoTypeParameter:Ljava/lang/String;

    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->fourCCtoBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 75
    :cond_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->offsets:[J

    array-length v1, v1

    int-to-long v2, v1

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 76
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->offsets:[J

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_2

    aget-wide v4, v2, v1

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 77
    .local v0, "offset":Ljava/lang/Long;
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->getVersion()I

    move-result v4

    if-nez v4, :cond_1

    .line 78
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-static {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 76
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 80
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-static {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    goto :goto_1

    .line 83
    .end local v0    # "offset":Ljava/lang/Long;
    :cond_2
    return-void
.end method

.method protected getContentSize()J
    .locals 3

    .prologue
    .line 64
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->getVersion()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->offsets:[J

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x4

    :goto_0
    add-int/lit8 v1, v0, 0x8

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    const/16 v0, 0x8

    :goto_1
    add-int/2addr v0, v1

    int-to-long v0, v0

    return-wide v0

    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->offsets:[J

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x8

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public getOffsets()[J
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->offsets:[J

    return-object v0
.end method

.method public setAuxInfoType(Ljava/lang/String;)V
    .locals 0
    .param p1, "auxInfoType"    # Ljava/lang/String;

    .prologue
    .line 112
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->auxInfoType:Ljava/lang/String;

    .line 113
    return-void
.end method

.method public setAuxInfoTypeParameter(Ljava/lang/String;)V
    .locals 0
    .param p1, "auxInfoTypeParameter"    # Ljava/lang/String;

    .prologue
    .line 120
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->auxInfoTypeParameter:Ljava/lang/String;

    .line 121
    return-void
.end method

.method public setOffsets([J)V
    .locals 0
    .param p1, "offsets"    # [J

    .prologue
    .line 128
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->offsets:[J

    .line 129
    return-void
.end method
