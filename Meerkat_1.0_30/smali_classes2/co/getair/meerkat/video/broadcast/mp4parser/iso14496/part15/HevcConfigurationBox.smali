.class public Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "HevcConfigurationBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "hvcC"


# instance fields
.field private hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    const-string v0, "hvcC"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 18
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    .line 19
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 33
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    invoke-virtual {v0, p1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->parse(Ljava/nio/ByteBuffer;)V

    .line 34
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 46
    if-ne p0, p1, :cond_1

    .line 54
    :cond_0
    :goto_0
    return v1

    .line 47
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

    .line 49
    check-cast v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;

    .line 51
    .local v0, "that":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 52
    goto :goto_0

    .line 51
    :cond_4
    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public getArrays()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;",
            ">;"
        }
    .end annotation

    .prologue
    .line 133
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->arrays:Ljava/util/List;

    return-object v0
.end method

.method public getAvgFrameRate()I
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->avgFrameRate:I

    return v0
.end method

.method public getBitDepthChromaMinus8()I
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->bitDepthChromaMinus8:I

    return v0
.end method

.method public getBitDepthLumaMinus8()I
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->bitDepthLumaMinus8:I

    return v0
.end method

.method public getChromaFormat()I
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->chromaFormat:I

    return v0
.end method

.method public getConfigurationVersion()I
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->configurationVersion:I

    return v0
.end method

.method public getConstantFrameRate()I
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->constantFrameRate:I

    return v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 28
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    invoke-virtual {v0, p1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->write(Ljava/nio/ByteBuffer;)V

    .line 29
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 23
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->getSize()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public getGeneral_constraint_indicator_flags()J
    .locals 2

    .prologue
    .line 85
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget-wide v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->general_constraint_indicator_flags:J

    return-wide v0
.end method

.method public getGeneral_level_idc()I
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->general_level_idc:I

    return v0
.end method

.method public getGeneral_profile_compatibility_flags()J
    .locals 2

    .prologue
    .line 81
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget-wide v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->general_profile_compatibility_flags:J

    return-wide v0
.end method

.method public getGeneral_profile_idc()I
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->general_profile_idc:I

    return v0
.end method

.method public getGeneral_profile_space()I
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->general_profile_space:I

    return v0
.end method

.method public getHevcDecoderConfigurationRecord()Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    return-object v0
.end method

.method public getLengthSizeMinusOne()I
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->lengthSizeMinusOne:I

    return v0
.end method

.method public getMin_spatial_segmentation_idc()I
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->min_spatial_segmentation_idc:I

    return v0
.end method

.method public getNumTemporalLayers()I
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->numTemporalLayers:I

    return v0
.end method

.method public getParallelismType()I
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->parallelismType:I

    return v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->hashCode()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isGeneral_tier_flag()Z
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget-boolean v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->general_tier_flag:Z

    return v0
.end method

.method public isTemporalIdNested()Z
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    iget-boolean v0, v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->temporalIdNested:Z

    return v0
.end method

.method public setHevcDecoderConfigurationRecord(Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;)V
    .locals 0
    .param p1, "hevcDecoderConfigurationRecord"    # Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    .prologue
    .line 41
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->hevcDecoderConfigurationRecord:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    .line 42
    return-void
.end method
