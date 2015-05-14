.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "AssetInformationBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox$Entry;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final TYPE:Ljava/lang/String; = "ainf"


# instance fields
.field apid:Ljava/lang/String;

.field profileVersion:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 46
    const-class v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 101
    const-string v0, "ainf"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 49
    const-string v0, ""

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->apid:Ljava/lang/String;

    .line 50
    const-string v0, "0000"

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->profileVersion:Ljava/lang/String;

    .line 102
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 125
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 126
    const/4 v0, 0x4

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->profileVersion:Ljava/lang/String;

    .line 127
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->apid:Ljava/lang/String;

    .line 128
    return-void
.end method

.method public getApid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->apid:Ljava/lang/String;

    return-object v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 3
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v2, 0x0

    .line 112
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 113
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->getVersion()I

    move-result v0

    if-nez v0, :cond_0

    .line 114
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->profileVersion:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {p1, v0, v2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 115
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->apid:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 116
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 120
    return-void

    .line 118
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ainf version "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->getVersion()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 106
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->apid:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x9

    int-to-long v0, v0

    return-wide v0
.end method

.method public getProfileVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->profileVersion:Ljava/lang/String;

    return-object v0
.end method

.method public isHidden()Z
    .locals 2
    .annotation runtime Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/annotations/DoNotParseDetail;
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 150
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->getFlags()I

    move-result v1

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setApid(Ljava/lang/String;)V
    .locals 0
    .param p1, "apid"    # Ljava/lang/String;

    .prologue
    .line 135
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->apid:Ljava/lang/String;

    .line 136
    return-void
.end method

.method public setHidden(Z)V
    .locals 2
    .param p1, "hidden"    # Z
    .annotation runtime Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/annotations/DoNotParseDetail;
    .end annotation

    .prologue
    .line 155
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->getFlags()I

    move-result v0

    .line 156
    .local v0, "flags":I
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->isHidden()Z

    move-result v1

    xor-int/2addr v1, p1

    if-eqz v1, :cond_0

    .line 157
    if-eqz p1, :cond_1

    .line 158
    or-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->setFlags(I)V

    .line 163
    :cond_0
    :goto_0
    return-void

    .line 160
    :cond_1
    const v1, 0xfffffe

    and-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->setFlags(I)V

    goto :goto_0
.end method

.method public setProfileVersion(Ljava/lang/String;)V
    .locals 2
    .param p1, "profileVersion"    # Ljava/lang/String;

    .prologue
    .line 143
    sget-boolean v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 144
    :cond_1
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/AssetInformationBox;->profileVersion:Ljava/lang/String;

    .line 145
    return-void
.end method
