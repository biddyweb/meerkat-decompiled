.class public Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "TierInfoBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "tiri"


# instance fields
.field constantFrameRate:I

.field discardable:I

.field frameRate:I

.field levelIndication:I

.field profileIndication:I

.field profile_compatibility:I

.field reserved1:I

.field reserved2:I

.field tierID:I

.field visualHeight:I

.field visualWidth:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 25
    const-string v0, "tiri"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 16
    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->reserved1:I

    .line 21
    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->reserved2:I

    .line 26
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 52
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->tierID:I

    .line 54
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->profileIndication:I

    .line 55
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->profile_compatibility:I

    .line 56
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->levelIndication:I

    .line 57
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->reserved1:I

    .line 59
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->visualWidth:I

    .line 60
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->visualHeight:I

    .line 61
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 62
    .local v0, "a":I
    and-int/lit16 v1, v0, 0xc0

    shr-int/lit8 v1, v1, 0x6

    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->discardable:I

    .line 63
    and-int/lit8 v1, v0, 0x30

    shr-int/lit8 v1, v1, 0x4

    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->constantFrameRate:I

    .line 64
    and-int/lit8 v1, v0, 0xf

    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->reserved2:I

    .line 65
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->frameRate:I

    .line 67
    return-void
.end method

.method public getConstantFrameRate()I
    .locals 1

    .prologue
    .line 134
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->constantFrameRate:I

    return v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 35
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->tierID:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 37
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->profileIndication:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 38
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->profile_compatibility:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 39
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->levelIndication:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 40
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->reserved1:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 42
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->visualWidth:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 43
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->visualHeight:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 45
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->discardable:I

    shl-int/lit8 v0, v0, 0x6

    iget v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->constantFrameRate:I

    shl-int/lit8 v1, v1, 0x4

    add-int/2addr v0, v1

    iget v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->reserved2:I

    add-int/2addr v0, v1

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 47
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->frameRate:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 48
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 30
    const-wide/16 v0, 0xd

    return-wide v0
.end method

.method public getDiscardable()I
    .locals 1

    .prologue
    .line 126
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->discardable:I

    return v0
.end method

.method public getFrameRate()I
    .locals 1

    .prologue
    .line 150
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->frameRate:I

    return v0
.end method

.method public getLevelIndication()I
    .locals 1

    .prologue
    .line 94
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->levelIndication:I

    return v0
.end method

.method public getProfileIndication()I
    .locals 1

    .prologue
    .line 78
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->profileIndication:I

    return v0
.end method

.method public getProfile_compatibility()I
    .locals 1

    .prologue
    .line 86
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->profile_compatibility:I

    return v0
.end method

.method public getReserved1()I
    .locals 1

    .prologue
    .line 102
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->reserved1:I

    return v0
.end method

.method public getReserved2()I
    .locals 1

    .prologue
    .line 142
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->reserved2:I

    return v0
.end method

.method public getTierID()I
    .locals 1

    .prologue
    .line 70
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->tierID:I

    return v0
.end method

.method public getVisualHeight()I
    .locals 1

    .prologue
    .line 118
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->visualHeight:I

    return v0
.end method

.method public getVisualWidth()I
    .locals 1

    .prologue
    .line 110
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->visualWidth:I

    return v0
.end method

.method public setConstantFrameRate(I)V
    .locals 0
    .param p1, "constantFrameRate"    # I

    .prologue
    .line 138
    iput p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->constantFrameRate:I

    .line 139
    return-void
.end method

.method public setDiscardable(I)V
    .locals 0
    .param p1, "discardable"    # I

    .prologue
    .line 130
    iput p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->discardable:I

    .line 131
    return-void
.end method

.method public setFrameRate(I)V
    .locals 0
    .param p1, "frameRate"    # I

    .prologue
    .line 154
    iput p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->frameRate:I

    .line 155
    return-void
.end method

.method public setLevelIndication(I)V
    .locals 0
    .param p1, "levelIndication"    # I

    .prologue
    .line 98
    iput p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->levelIndication:I

    .line 99
    return-void
.end method

.method public setProfileIndication(I)V
    .locals 0
    .param p1, "profileIndication"    # I

    .prologue
    .line 82
    iput p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->profileIndication:I

    .line 83
    return-void
.end method

.method public setProfile_compatibility(I)V
    .locals 0
    .param p1, "profile_compatibility"    # I

    .prologue
    .line 90
    iput p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->profile_compatibility:I

    .line 91
    return-void
.end method

.method public setReserved1(I)V
    .locals 0
    .param p1, "reserved1"    # I

    .prologue
    .line 106
    iput p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->reserved1:I

    .line 107
    return-void
.end method

.method public setReserved2(I)V
    .locals 0
    .param p1, "reserved2"    # I

    .prologue
    .line 146
    iput p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->reserved2:I

    .line 147
    return-void
.end method

.method public setTierID(I)V
    .locals 0
    .param p1, "tierID"    # I

    .prologue
    .line 74
    iput p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->tierID:I

    .line 75
    return-void
.end method

.method public setVisualHeight(I)V
    .locals 0
    .param p1, "visualHeight"    # I

    .prologue
    .line 122
    iput p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->visualHeight:I

    .line 123
    return-void
.end method

.method public setVisualWidth(I)V
    .locals 0
    .param p1, "visualWidth"    # I

    .prologue
    .line 114
    iput p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierInfoBox;->visualWidth:I

    .line 115
    return-void
.end method
