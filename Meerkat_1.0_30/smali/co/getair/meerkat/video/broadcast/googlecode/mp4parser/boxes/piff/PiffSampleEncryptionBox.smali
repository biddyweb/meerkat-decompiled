.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/PiffSampleEncryptionBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;
.source "PiffSampleEncryptionBox.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    const-string v0, "uuid"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;-><init>(Ljava/lang/String;)V

    .line 39
    return-void
.end method


# virtual methods
.method public getAlgorithmId()I
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/PiffSampleEncryptionBox;->algorithmId:I

    return v0
.end method

.method public getIvSize()I
    .locals 1

    .prologue
    .line 55
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/PiffSampleEncryptionBox;->ivSize:I

    return v0
.end method

.method public getKid()[B
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/PiffSampleEncryptionBox;->kid:[B

    return-object v0
.end method

.method public getUserType()[B
    .locals 1

    .prologue
    .line 43
    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    return-object v0

    :array_0
    .array-data 1
        -0x5et
        0x39t
        0x4ft
        0x52t
        0x5at
        -0x65t
        0x4ft
        0x14t
        -0x5et
        0x44t
        0x6ct
        0x42t
        0x7ct
        0x64t
        -0x73t
        -0xct
    .end array-data
.end method

.method public isOverrideTrackEncryptionBoxParameters()Z
    .locals 1
    .annotation runtime Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/annotations/DoNotParseDetail;
    .end annotation

    .prologue
    .line 72
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/PiffSampleEncryptionBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setAlgorithmId(I)V
    .locals 0
    .param p1, "algorithmId"    # I

    .prologue
    .line 51
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/PiffSampleEncryptionBox;->algorithmId:I

    .line 52
    return-void
.end method

.method public setIvSize(I)V
    .locals 0
    .param p1, "ivSize"    # I

    .prologue
    .line 59
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/PiffSampleEncryptionBox;->ivSize:I

    .line 60
    return-void
.end method

.method public setKid([B)V
    .locals 0
    .param p1, "kid"    # [B

    .prologue
    .line 67
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/PiffSampleEncryptionBox;->kid:[B

    .line 68
    return-void
.end method

.method public setOverrideTrackEncryptionBoxParameters(Z)V
    .locals 2
    .param p1, "b"    # Z
    .annotation runtime Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/annotations/DoNotParseDetail;
    .end annotation

    .prologue
    .line 78
    if-eqz p1, :cond_0

    .line 79
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/PiffSampleEncryptionBox;->getFlags()I

    move-result v0

    or-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/PiffSampleEncryptionBox;->setFlags(I)V

    .line 83
    :goto_0
    return-void

    .line 81
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/PiffSampleEncryptionBox;->getFlags()I

    move-result v0

    const v1, 0xfffffe

    and-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/PiffSampleEncryptionBox;->setFlags(I)V

    goto :goto_0
.end method
