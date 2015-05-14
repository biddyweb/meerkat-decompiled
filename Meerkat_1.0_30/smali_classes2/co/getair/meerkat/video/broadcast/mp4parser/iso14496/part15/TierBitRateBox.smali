.class public Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "TierBitRateBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "tibr"


# instance fields
.field avgBitRate:J

.field baseBitRate:J

.field maxBitRate:J

.field tierAvgBitRate:J

.field tierBaseBitRate:J

.field tierMaxBitRate:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    const-string v0, "tibr"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 24
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 44
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->baseBitRate:J

    .line 45
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->maxBitRate:J

    .line 46
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->avgBitRate:J

    .line 47
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->tierBaseBitRate:J

    .line 48
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->tierMaxBitRate:J

    .line 49
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->tierAvgBitRate:J

    .line 50
    return-void
.end method

.method public getAvgBitRate()J
    .locals 2

    .prologue
    .line 69
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->avgBitRate:J

    return-wide v0
.end method

.method public getBaseBitRate()J
    .locals 2

    .prologue
    .line 53
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->baseBitRate:J

    return-wide v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 33
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->baseBitRate:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 34
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->maxBitRate:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 35
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->avgBitRate:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 36
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->tierBaseBitRate:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 37
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->tierMaxBitRate:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 38
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->tierAvgBitRate:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 40
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 28
    const-wide/16 v0, 0x18

    return-wide v0
.end method

.method public getMaxBitRate()J
    .locals 2

    .prologue
    .line 61
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->maxBitRate:J

    return-wide v0
.end method

.method public getTierAvgBitRate()J
    .locals 2

    .prologue
    .line 93
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->tierAvgBitRate:J

    return-wide v0
.end method

.method public getTierBaseBitRate()J
    .locals 2

    .prologue
    .line 77
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->tierBaseBitRate:J

    return-wide v0
.end method

.method public getTierMaxBitRate()J
    .locals 2

    .prologue
    .line 85
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->tierMaxBitRate:J

    return-wide v0
.end method

.method public setAvgBitRate(J)V
    .locals 1
    .param p1, "avgBitRate"    # J

    .prologue
    .line 73
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->avgBitRate:J

    .line 74
    return-void
.end method

.method public setBaseBitRate(J)V
    .locals 1
    .param p1, "baseBitRate"    # J

    .prologue
    .line 57
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->baseBitRate:J

    .line 58
    return-void
.end method

.method public setMaxBitRate(J)V
    .locals 1
    .param p1, "maxBitRate"    # J

    .prologue
    .line 65
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->maxBitRate:J

    .line 66
    return-void
.end method

.method public setTierAvgBitRate(J)V
    .locals 1
    .param p1, "tierAvgBitRate"    # J

    .prologue
    .line 97
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->tierAvgBitRate:J

    .line 98
    return-void
.end method

.method public setTierBaseBitRate(J)V
    .locals 1
    .param p1, "tierBaseBitRate"    # J

    .prologue
    .line 81
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->tierBaseBitRate:J

    .line 82
    return-void
.end method

.method public setTierMaxBitRate(J)V
    .locals 1
    .param p1, "tierMaxBitRate"    # J

    .prologue
    .line 89
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TierBitRateBox;->tierMaxBitRate:J

    .line 90
    return-void
.end method
