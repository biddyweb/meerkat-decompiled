.class public final Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/BitRateBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "BitRateBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "btrt"


# instance fields
.field private avgBitrate:J

.field private bufferSizeDb:J

.field private maxBitrate:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 49
    const-string v0, "btrt"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 50
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 58
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/BitRateBox;->bufferSizeDb:J

    .line 59
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/BitRateBox;->maxBitrate:J

    .line 60
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/BitRateBox;->avgBitrate:J

    .line 61
    return-void
.end method

.method public getAvgBitrate()J
    .locals 2

    .prologue
    .line 107
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/BitRateBox;->avgBitrate:J

    return-wide v0
.end method

.method public getBufferSizeDb()J
    .locals 2

    .prologue
    .line 75
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/BitRateBox;->bufferSizeDb:J

    return-wide v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 65
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/BitRateBox;->bufferSizeDb:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 66
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/BitRateBox;->maxBitrate:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 67
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/BitRateBox;->avgBitrate:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 68
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 53
    const-wide/16 v0, 0xc

    return-wide v0
.end method

.method public getMaxBitrate()J
    .locals 2

    .prologue
    .line 91
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/BitRateBox;->maxBitrate:J

    return-wide v0
.end method

.method public setAvgBitrate(J)V
    .locals 1
    .param p1, "avgBitrate"    # J

    .prologue
    .line 115
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/BitRateBox;->avgBitrate:J

    .line 116
    return-void
.end method

.method public setBufferSizeDb(J)V
    .locals 1
    .param p1, "bufferSizeDb"    # J

    .prologue
    .line 83
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/BitRateBox;->bufferSizeDb:J

    .line 84
    return-void
.end method

.method public setMaxBitrate(J)V
    .locals 1
    .param p1, "maxBitrate"    # J

    .prologue
    .line 99
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/BitRateBox;->maxBitrate:J

    .line 100
    return-void
.end method
