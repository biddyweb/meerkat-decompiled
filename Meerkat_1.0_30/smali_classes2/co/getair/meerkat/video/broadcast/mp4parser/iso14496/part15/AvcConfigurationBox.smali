.class public final Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "AvcConfigurationBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "avcC"


# instance fields
.field public avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    const-string v0, "avcC"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 37
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    .line 42
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 142
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    invoke-direct {v0, p1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;-><init>(Ljava/nio/ByteBuffer;)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    .line 143
    return-void
.end method

.method public getAvcLevelIndication()I
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->avcLevelIndication:I

    return v0
.end method

.method public getAvcProfileIndication()I
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->avcProfileIndication:I

    return v0
.end method

.method public getBitDepthChromaMinus8()I
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->bitDepthChromaMinus8:I

    return v0
.end method

.method public getBitDepthLumaMinus8()I
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->bitDepthLumaMinus8:I

    return v0
.end method

.method public getChromaFormat()I
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->chromaFormat:I

    return v0
.end method

.method public getConfigurationVersion()I
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->configurationVersion:I

    return v0
.end method

.method public getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 154
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    invoke-virtual {v0, p1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->getContent(Ljava/nio/ByteBuffer;)V

    .line 155
    return-void
.end method

.method public getContentSize()J
    .locals 2

    .prologue
    .line 148
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->getContentSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public getLengthSizeMinusOne()I
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->lengthSizeMinusOne:I

    return v0
.end method

.method public getPPS()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->getPPS()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPictureParameterSets()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation

    .prologue
    .line 69
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->pictureParameterSets:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getProfileCompatibility()I
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->profileCompatibility:I

    return v0
.end method

.method public getSPS()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->getSPS()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSequenceParameterSetExts()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation

    .prologue
    .line 125
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->sequenceParameterSetExts:Ljava/util/List;

    return-object v0
.end method

.method public getSequenceParameterSets()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation

    .prologue
    .line 65
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->sequenceParameterSets:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getavcDecoderConfigurationRecord()Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    return-object v0
.end method

.method public hasExts()Z
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iget-boolean v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->hasExts:Z

    return v0
.end method

.method public setAvcLevelIndication(I)V
    .locals 1
    .param p1, "avcLevelIndication"    # I

    .prologue
    .line 85
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iput p1, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->avcLevelIndication:I

    .line 86
    return-void
.end method

.method public setAvcProfileIndication(I)V
    .locals 1
    .param p1, "avcProfileIndication"    # I

    .prologue
    .line 77
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iput p1, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->avcProfileIndication:I

    .line 78
    return-void
.end method

.method public setBitDepthChromaMinus8(I)V
    .locals 1
    .param p1, "bitDepthChromaMinus8"    # I

    .prologue
    .line 121
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iput p1, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->bitDepthChromaMinus8:I

    .line 122
    return-void
.end method

.method public setBitDepthLumaMinus8(I)V
    .locals 1
    .param p1, "bitDepthLumaMinus8"    # I

    .prologue
    .line 113
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iput p1, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->bitDepthLumaMinus8:I

    .line 114
    return-void
.end method

.method public setChromaFormat(I)V
    .locals 1
    .param p1, "chromaFormat"    # I

    .prologue
    .line 105
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iput p1, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->chromaFormat:I

    .line 106
    return-void
.end method

.method public setConfigurationVersion(I)V
    .locals 1
    .param p1, "configurationVersion"    # I

    .prologue
    .line 73
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iput p1, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->configurationVersion:I

    .line 74
    return-void
.end method

.method public setHasExts(Z)V
    .locals 1
    .param p1, "hasExts"    # Z

    .prologue
    .line 137
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iput-boolean p1, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->hasExts:Z

    .line 138
    return-void
.end method

.method public setLengthSizeMinusOne(I)V
    .locals 1
    .param p1, "lengthSizeMinusOne"    # I

    .prologue
    .line 89
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iput p1, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->lengthSizeMinusOne:I

    .line 90
    return-void
.end method

.method public setPictureParameterSets(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<[B>;)V"
        }
    .end annotation

    .prologue
    .line 97
    .local p1, "pictureParameterSets":Ljava/util/List;, "Ljava/util/List<[B>;"
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iput-object p1, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->pictureParameterSets:Ljava/util/List;

    .line 98
    return-void
.end method

.method public setProfileCompatibility(I)V
    .locals 1
    .param p1, "profileCompatibility"    # I

    .prologue
    .line 81
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iput p1, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->profileCompatibility:I

    .line 82
    return-void
.end method

.method public setSequenceParameterSetExts(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<[B>;)V"
        }
    .end annotation

    .prologue
    .line 129
    .local p1, "sequenceParameterSetExts":Ljava/util/List;, "Ljava/util/List<[B>;"
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iput-object p1, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->sequenceParameterSetExts:Ljava/util/List;

    .line 130
    return-void
.end method

.method public setSequenceParameterSets(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<[B>;)V"
        }
    .end annotation

    .prologue
    .line 93
    .local p1, "sequenceParameterSets":Ljava/util/List;, "Ljava/util/List<[B>;"
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    iput-object p1, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;->sequenceParameterSets:Ljava/util/List;

    .line 94
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 173
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AvcConfigurationBox{avcDecoderConfigurationRecord="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->avcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcDecoderConfigurationRecord;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
