.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "TrackHeaderBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "tkhd"


# instance fields
.field private alternateGroup:I

.field private creationTime:Ljava/util/Date;

.field private duration:J

.field private height:D

.field private layer:I

.field private matrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

.field private modificationTime:Ljava/util/Date;

.field private trackId:J

.field private volume:F

.field private width:D


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 56
    const-string v0, "tkhd"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 50
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;->ROTATE_0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->matrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    .line 58
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 113
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 114
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getVersion()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 115
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt64(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(J)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->creationTime:Ljava/util/Date;

    .line 116
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt64(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(J)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->modificationTime:Ljava/util/Date;

    .line 117
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->trackId:J

    .line 118
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    .line 119
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->duration:J

    .line 120
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->duration:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    .line 121
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "The tracks duration is bigger than Long.MAX_VALUE"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 125
    :cond_0
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(J)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->creationTime:Ljava/util/Date;

    .line 126
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(J)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->modificationTime:Ljava/util/Date;

    .line 127
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->trackId:J

    .line 128
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    .line 129
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->duration:J

    .line 131
    :cond_1
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    .line 132
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    .line 133
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->layer:I

    .line 134
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->alternateGroup:I

    .line 135
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readFixedPoint88(Ljava/nio/ByteBuffer;)F

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->volume:F

    .line 136
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    .line 137
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;->fromByteBuffer(Ljava/nio/ByteBuffer;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->matrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    .line 138
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readFixedPoint1616(Ljava/nio/ByteBuffer;)D

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->width:D

    .line 139
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readFixedPoint1616(Ljava/nio/ByteBuffer;)D

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->height:D

    .line 140
    return-void
.end method

.method public getAlternateGroup()I
    .locals 1

    .prologue
    .line 81
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->alternateGroup:I

    return v0
.end method

.method public getContent(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    const-wide/16 v4, 0x0

    .line 143
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 144
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getVersion()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 145
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->creationTime:Ljava/util/Date;

    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(Ljava/util/Date;)J

    move-result-wide v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    .line 146
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->modificationTime:Ljava/util/Date;

    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(Ljava/util/Date;)J

    move-result-wide v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    .line 147
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->trackId:J

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 148
    invoke-static {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 149
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->duration:J

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    .line 157
    :goto_0
    invoke-static {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 158
    invoke-static {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 159
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->layer:I

    invoke-static {p1, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 160
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->alternateGroup:I

    invoke-static {p1, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 161
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->volume:F

    float-to-double v2, v1

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeFixedPoint88(Ljava/nio/ByteBuffer;D)V

    .line 162
    const/4 v1, 0x0

    invoke-static {p1, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 163
    const/4 v0, 0x0

    .line 164
    .local v0, "i":I
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->matrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    invoke-virtual {v1, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;->getContent(Ljava/nio/ByteBuffer;)V

    .line 166
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->width:D

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeFixedPoint1616(Ljava/nio/ByteBuffer;D)V

    .line 167
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->height:D

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeFixedPoint1616(Ljava/nio/ByteBuffer;D)V

    .line 168
    return-void

    .line 151
    .end local v0    # "i":I
    :cond_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->creationTime:Ljava/util/Date;

    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(Ljava/util/Date;)J

    move-result-wide v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 152
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->modificationTime:Ljava/util/Date;

    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(Ljava/util/Date;)J

    move-result-wide v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 153
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->trackId:J

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 154
    invoke-static {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 155
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->duration:J

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    goto :goto_0
.end method

.method protected getContentSize()J
    .locals 4

    .prologue
    .line 101
    const-wide/16 v0, 0x4

    .line 102
    .local v0, "contentSize":J
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getVersion()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 103
    const-wide/16 v2, 0x20

    add-long/2addr v0, v2

    .line 107
    :goto_0
    const-wide/16 v2, 0x3c

    add-long/2addr v0, v2

    .line 108
    return-wide v0

    .line 105
    :cond_0
    const-wide/16 v2, 0x14

    add-long/2addr v0, v2

    goto :goto_0
.end method

.method public getCreationTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->creationTime:Ljava/util/Date;

    return-object v0
.end method

.method public getDuration()J
    .locals 2

    .prologue
    .line 73
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->duration:J

    return-wide v0
.end method

.method public getHeight()D
    .locals 2

    .prologue
    .line 97
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->height:D

    return-wide v0
.end method

.method public getLayer()I
    .locals 1

    .prologue
    .line 77
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->layer:I

    return v0
.end method

.method public getMatrix()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->matrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    return-object v0
.end method

.method public getModificationTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->modificationTime:Ljava/util/Date;

    return-object v0
.end method

.method public getTrackId()J
    .locals 2

    .prologue
    .line 69
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->trackId:J

    return-wide v0
.end method

.method public getVolume()F
    .locals 1

    .prologue
    .line 85
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->volume:F

    return v0
.end method

.method public getWidth()D
    .locals 2

    .prologue
    .line 93
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->width:D

    return-wide v0
.end method

.method public isEnabled()Z
    .locals 1

    .prologue
    .line 248
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getFlags()I

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

.method public isInMovie()Z
    .locals 1

    .prologue
    .line 252
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isInPoster()Z
    .locals 1

    .prologue
    .line 260
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x8

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isInPreview()Z
    .locals 1

    .prologue
    .line 256
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x4

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setAlternateGroup(I)V
    .locals 0
    .param p1, "alternateGroup"    # I

    .prologue
    .line 227
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->alternateGroup:I

    .line 228
    return-void
.end method

.method public setCreationTime(Ljava/util/Date;)V
    .locals 4
    .param p1, "creationTime"    # Ljava/util/Date;

    .prologue
    .line 197
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->creationTime:Ljava/util/Date;

    .line 198
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(Ljava/util/Date;)J

    move-result-wide v0

    const-wide v2, 0x100000000L

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    .line 199
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setVersion(I)V

    .line 201
    :cond_0
    return-void
.end method

.method public setDuration(J)V
    .locals 3
    .param p1, "duration"    # J

    .prologue
    .line 216
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->duration:J

    .line 217
    const-wide v0, 0x100000000L

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 218
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setFlags(I)V

    .line 220
    :cond_0
    return-void
.end method

.method public setEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 264
    if-eqz p1, :cond_0

    .line 265
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getFlags()I

    move-result v0

    or-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setFlags(I)V

    .line 269
    :goto_0
    return-void

    .line 267
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, -0x2

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setFlags(I)V

    goto :goto_0
.end method

.method public setHeight(D)V
    .locals 1
    .param p1, "height"    # D

    .prologue
    .line 243
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->height:D

    .line 244
    return-void
.end method

.method public setInMovie(Z)V
    .locals 1
    .param p1, "inMovie"    # Z

    .prologue
    .line 272
    if-eqz p1, :cond_0

    .line 273
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getFlags()I

    move-result v0

    or-int/lit8 v0, v0, 0x2

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setFlags(I)V

    .line 277
    :goto_0
    return-void

    .line 275
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, -0x3

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setFlags(I)V

    goto :goto_0
.end method

.method public setInPoster(Z)V
    .locals 1
    .param p1, "inPoster"    # Z

    .prologue
    .line 288
    if-eqz p1, :cond_0

    .line 289
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getFlags()I

    move-result v0

    or-int/lit8 v0, v0, 0x8

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setFlags(I)V

    .line 293
    :goto_0
    return-void

    .line 291
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, -0x9

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setFlags(I)V

    goto :goto_0
.end method

.method public setInPreview(Z)V
    .locals 1
    .param p1, "inPreview"    # Z

    .prologue
    .line 280
    if-eqz p1, :cond_0

    .line 281
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getFlags()I

    move-result v0

    or-int/lit8 v0, v0, 0x4

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setFlags(I)V

    .line 285
    :goto_0
    return-void

    .line 283
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, -0x5

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setFlags(I)V

    goto :goto_0
.end method

.method public setLayer(I)V
    .locals 0
    .param p1, "layer"    # I

    .prologue
    .line 223
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->layer:I

    .line 224
    return-void
.end method

.method public setMatrix(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;)V
    .locals 0
    .param p1, "matrix"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    .prologue
    .line 235
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->matrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    .line 236
    return-void
.end method

.method public setModificationTime(Ljava/util/Date;)V
    .locals 4
    .param p1, "modificationTime"    # Ljava/util/Date;

    .prologue
    .line 204
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->modificationTime:Ljava/util/Date;

    .line 205
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(Ljava/util/Date;)J

    move-result-wide v0

    const-wide v2, 0x100000000L

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    .line 206
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setVersion(I)V

    .line 209
    :cond_0
    return-void
.end method

.method public setTrackId(J)V
    .locals 1
    .param p1, "trackId"    # J

    .prologue
    .line 212
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->trackId:J

    .line 213
    return-void
.end method

.method public setVolume(F)V
    .locals 0
    .param p1, "volume"    # F

    .prologue
    .line 231
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->volume:F

    .line 232
    return-void
.end method

.method public setWidth(D)V
    .locals 1
    .param p1, "width"    # D

    .prologue
    .line 239
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->width:D

    .line 240
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 171
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 172
    .local v0, "result":Ljava/lang/StringBuilder;
    const-string v1, "TrackHeaderBox["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    const-string v1, "creationTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getCreationTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 174
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    const-string v1, "modificationTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getModificationTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 176
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    const-string v1, "trackId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getTrackId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 178
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    const-string v1, "duration="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getDuration()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 180
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    const-string v1, "layer="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getLayer()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 182
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    const-string v1, "alternateGroup="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getAlternateGroup()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 184
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    const-string v1, "volume="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getVolume()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 186
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    const-string v1, "matrix="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->matrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 188
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    const-string v1, "width="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getWidth()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 190
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    const-string v1, "height="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getHeight()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 192
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
