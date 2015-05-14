.class public Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "SampleAuxiliaryInformationSizesBox.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final TYPE:Ljava/lang/String; = "saiz"


# instance fields
.field private auxInfoType:Ljava/lang/String;

.field private auxInfoTypeParameter:Ljava/lang/String;

.field private defaultSampleInfoSize:S

.field private sampleCount:I

.field private sampleInfoSizes:[S


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const-class v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    const-string v0, "saiz"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 36
    const/4 v0, 0x0

    new-array v0, v0, [S

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->sampleInfoSizes:[S

    .line 43
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 88
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 89
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->getFlags()I

    move-result v1

    and-int/lit8 v1, v1, 0x1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 90
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->read4cc(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->auxInfoType:Ljava/lang/String;

    .line 91
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->read4cc(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->auxInfoTypeParameter:Ljava/lang/String;

    .line 94
    :cond_0
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v1

    int-to-short v1, v1

    iput-short v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->defaultSampleInfoSize:S

    .line 95
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->sampleCount:I

    .line 99
    iget-short v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->defaultSampleInfoSize:S

    if-nez v1, :cond_1

    .line 100
    iget v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->sampleCount:I

    new-array v1, v1, [S

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->sampleInfoSizes:[S

    .line 101
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->sampleCount:I

    if-ge v0, v1, :cond_1

    .line 102
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->sampleInfoSizes:[S

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v2

    int-to-short v2, v2

    aput-short v2, v1, v0

    .line 101
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 105
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method public getAuxInfoType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->auxInfoType:Ljava/lang/String;

    return-object v0
.end method

.method public getAuxInfoTypeParameter()Ljava/lang/String;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->auxInfoTypeParameter:Ljava/lang/String;

    return-object v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 68
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 69
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->getFlags()I

    move-result v1

    and-int/lit8 v1, v1, 0x1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 70
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->auxInfoType:Ljava/lang/String;

    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->fourCCtoBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 71
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->auxInfoTypeParameter:Ljava/lang/String;

    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->fourCCtoBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 74
    :cond_0
    iget-short v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->defaultSampleInfoSize:S

    invoke-static {p1, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 76
    iget-short v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->defaultSampleInfoSize:S

    if-nez v1, :cond_1

    .line 77
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->sampleInfoSizes:[S

    array-length v1, v1

    int-to-long v2, v1

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 78
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->sampleInfoSizes:[S

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_2

    aget-short v0, v2, v1

    .line 79
    .local v0, "sampleInfoSize":S
    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 78
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 82
    .end local v0    # "sampleInfoSize":S
    :cond_1
    iget v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->sampleCount:I

    int-to-long v2, v1

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 84
    :cond_2
    return-void
.end method

.method protected getContentSize()J
    .locals 4

    .prologue
    .line 47
    const/4 v0, 0x4

    .line 48
    .local v0, "size":I
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->getFlags()I

    move-result v1

    and-int/lit8 v1, v1, 0x1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 49
    add-int/lit8 v0, v0, 0x8

    .line 52
    :cond_0
    add-int/lit8 v0, v0, 0x5

    .line 53
    iget-short v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->defaultSampleInfoSize:S

    if-nez v1, :cond_1

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->sampleInfoSizes:[S

    array-length v1, v1

    :goto_0
    add-int/2addr v0, v1

    .line 54
    int-to-long v2, v0

    return-wide v2

    .line 53
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getDefaultSampleInfoSize()I
    .locals 1

    .prologue
    .line 124
    iget-short v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->defaultSampleInfoSize:S

    return v0
.end method

.method public getSampleCount()I
    .locals 1

    .prologue
    .line 141
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->sampleCount:I

    return v0
.end method

.method public getSampleInfoSizes()[S
    .locals 2

    .prologue
    .line 133
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->sampleInfoSizes:[S

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->sampleInfoSizes:[S

    array-length v1, v1

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([SI)[S

    move-result-object v0

    return-object v0
.end method

.method public getSize(I)S
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 58
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->getDefaultSampleInfoSize()I

    move-result v0

    if-nez v0, :cond_0

    .line 59
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->sampleInfoSizes:[S

    aget-short v0, v0, p1

    .line 61
    :goto_0
    return v0

    :cond_0
    iget-short v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->defaultSampleInfoSize:S

    goto :goto_0
.end method

.method public setAuxInfoType(Ljava/lang/String;)V
    .locals 0
    .param p1, "auxInfoType"    # Ljava/lang/String;

    .prologue
    .line 112
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->auxInfoType:Ljava/lang/String;

    .line 113
    return-void
.end method

.method public setAuxInfoTypeParameter(Ljava/lang/String;)V
    .locals 0
    .param p1, "auxInfoTypeParameter"    # Ljava/lang/String;

    .prologue
    .line 120
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->auxInfoTypeParameter:Ljava/lang/String;

    .line 121
    return-void
.end method

.method public setDefaultSampleInfoSize(I)V
    .locals 1
    .param p1, "defaultSampleInfoSize"    # I

    .prologue
    .line 128
    sget-boolean v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    const/16 v0, 0xff

    if-le p1, v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 129
    :cond_0
    int-to-short v0, p1

    iput-short v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->defaultSampleInfoSize:S

    .line 130
    return-void
.end method

.method public setSampleCount(I)V
    .locals 0
    .param p1, "sampleCount"    # I

    .prologue
    .line 145
    iput p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->sampleCount:I

    .line 146
    return-void
.end method

.method public setSampleInfoSizes([S)V
    .locals 1
    .param p1, "sampleInfoSizes"    # [S

    .prologue
    .line 137
    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([SI)[S

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->sampleInfoSizes:[S

    .line 138
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0x27

    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SampleAuxiliaryInformationSizesBox{defaultSampleInfoSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-short v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->defaultSampleInfoSize:S

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", sampleCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->sampleCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", auxInfoType=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->auxInfoType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", auxInfoTypeParameter=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->auxInfoTypeParameter:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
