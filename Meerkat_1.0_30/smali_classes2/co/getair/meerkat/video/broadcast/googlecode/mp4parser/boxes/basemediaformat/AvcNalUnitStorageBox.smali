.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/basemediaformat/AvcNalUnitStorageBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "AvcNalUnitStorageBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "avcn"


# instance fields
.field avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    const-string v0, "avcn"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;)V
    .locals 1
    .param p1, "avcConfigurationBox"    # Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

    .prologue
    .line 40
    const-string v0, "avcn"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 41
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->getavcDecoderConfigurationRecord()Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/basemediaformat/AvcNalUnitStorageBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    .line 42
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 80
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    invoke-direct {v0, p1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;-><init>(Ljava/nio/ByteBuffer;)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/basemediaformat/AvcNalUnitStorageBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    .line 81
    return-void
.end method

.method public getAvcDecoderConfigurationRecord()Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/basemediaformat/AvcNalUnitStorageBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    return-object v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 85
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/basemediaformat/AvcNalUnitStorageBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    invoke-virtual {v0, p1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->getContent(Ljava/nio/ByteBuffer;)V

    .line 86
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 75
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/basemediaformat/AvcNalUnitStorageBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->getContentSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public getLengthSizeMinusOne()I
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/basemediaformat/AvcNalUnitStorageBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->lengthSizeMinusOne:I

    return v0
.end method

.method public getPPS()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/basemediaformat/AvcNalUnitStorageBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->getPPS()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPictureParameterSetsAsStrings()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 70
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/basemediaformat/AvcNalUnitStorageBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->getPictureParameterSetsAsStrings()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSPS()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/basemediaformat/AvcNalUnitStorageBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->getSPS()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSequenceParameterSetExtsAsStrings()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 66
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/basemediaformat/AvcNalUnitStorageBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->getSequenceParameterSetExtsAsStrings()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSequenceParameterSetsAsStrings()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 62
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/basemediaformat/AvcNalUnitStorageBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->getSequenceParameterSetsAsStrings()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AvcNalUnitStorageBox{SPS="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/basemediaformat/AvcNalUnitStorageBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    .line 91
    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->getSequenceParameterSetsAsStrings()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",PPS="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/basemediaformat/AvcNalUnitStorageBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    .line 92
    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->getPictureParameterSetsAsStrings()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",lengthSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/basemediaformat/AvcNalUnitStorageBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iget v1, v1, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->lengthSizeMinusOne:I

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
