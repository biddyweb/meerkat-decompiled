.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "MovieHeaderBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "mvhd"


# instance fields
.field private creationTime:Ljava/util/Date;

.field private currentTime:I

.field private duration:J

.field private matrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

.field private modificationTime:Ljava/util/Date;

.field private nextTrackId:J

.field private posterTime:I

.field private previewDuration:I

.field private previewTime:I

.field private rate:D

.field private selectionDuration:I

.field private selectionTime:I

.field private timescale:J

.field private volume:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 60
    const-string v0, "mvhd"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 44
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->rate:D

    .line 45
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->volume:F

    .line 46
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;->ROTATE_0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->matrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    .line 61
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 108
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 109
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->getVersion()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 110
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt64(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(J)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->creationTime:Ljava/util/Date;

    .line 111
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt64(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(J)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->modificationTime:Ljava/util/Date;

    .line 112
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->timescale:J

    .line 113
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt64(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->duration:J

    .line 120
    :goto_0
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readFixedPoint1616(Ljava/nio/ByteBuffer;)D

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->rate:D

    .line 121
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readFixedPoint88(Ljava/nio/ByteBuffer;)F

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->volume:F

    .line 122
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    .line 123
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    .line 124
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    .line 126
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;->fromByteBuffer(Ljava/nio/ByteBuffer;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->matrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    .line 128
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->previewTime:I

    .line 129
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->previewDuration:I

    .line 130
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->posterTime:I

    .line 131
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->selectionTime:I

    .line 132
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->selectionDuration:I

    .line 133
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->currentTime:I

    .line 135
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->nextTrackId:J

    .line 137
    return-void

    .line 115
    :cond_0
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(J)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->creationTime:Ljava/util/Date;

    .line 116
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(J)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->modificationTime:Ljava/util/Date;

    .line 117
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->timescale:J

    .line 118
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->duration:J

    goto :goto_0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    const-wide/16 v2, 0x0

    .line 164
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 165
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->getVersion()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 166
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->creationTime:Ljava/util/Date;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(Ljava/util/Date;)J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    .line 167
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->modificationTime:Ljava/util/Date;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(Ljava/util/Date;)J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    .line 168
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->timescale:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 169
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->duration:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    .line 176
    :goto_0
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->rate:D

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeFixedPoint1616(Ljava/nio/ByteBuffer;D)V

    .line 177
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->volume:F

    float-to-double v0, v0

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeFixedPoint88(Ljava/nio/ByteBuffer;D)V

    .line 178
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 179
    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 180
    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 182
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->matrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    invoke-virtual {v0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;->getContent(Ljava/nio/ByteBuffer;)V

    .line 184
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->previewTime:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 185
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->previewDuration:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 186
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->posterTime:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 187
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->selectionTime:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 188
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->selectionDuration:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 189
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->currentTime:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 191
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->nextTrackId:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 192
    return-void

    .line 171
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->creationTime:Ljava/util/Date;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(Ljava/util/Date;)J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 172
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->modificationTime:Ljava/util/Date;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(Ljava/util/Date;)J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 173
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->timescale:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 174
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->duration:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    goto :goto_0
.end method

.method protected getContentSize()J
    .locals 4

    .prologue
    .line 96
    const-wide/16 v0, 0x4

    .line 97
    .local v0, "contentSize":J
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->getVersion()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 98
    const-wide/16 v2, 0x1c

    add-long/2addr v0, v2

    .line 102
    :goto_0
    const-wide/16 v2, 0x50

    add-long/2addr v0, v2

    .line 103
    return-wide v0

    .line 100
    :cond_0
    const-wide/16 v2, 0x10

    add-long/2addr v0, v2

    goto :goto_0
.end method

.method public getCreationTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->creationTime:Ljava/util/Date;

    return-object v0
.end method

.method public getCurrentTime()I
    .locals 1

    .prologue
    .line 279
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->currentTime:I

    return v0
.end method

.method public getDuration()J
    .locals 2

    .prologue
    .line 76
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->duration:J

    return-wide v0
.end method

.method public getMatrix()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->matrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    return-object v0
.end method

.method public getModificationTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->modificationTime:Ljava/util/Date;

    return-object v0
.end method

.method public getNextTrackId()J
    .locals 2

    .prologue
    .line 92
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->nextTrackId:J

    return-wide v0
.end method

.method public getPosterTime()I
    .locals 1

    .prologue
    .line 255
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->posterTime:I

    return v0
.end method

.method public getPreviewDuration()I
    .locals 1

    .prologue
    .line 247
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->previewDuration:I

    return v0
.end method

.method public getPreviewTime()I
    .locals 1

    .prologue
    .line 239
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->previewTime:I

    return v0
.end method

.method public getRate()D
    .locals 2

    .prologue
    .line 80
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->rate:D

    return-wide v0
.end method

.method public getSelectionDuration()I
    .locals 1

    .prologue
    .line 271
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->selectionDuration:I

    return v0
.end method

.method public getSelectionTime()I
    .locals 1

    .prologue
    .line 263
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->selectionTime:I

    return v0
.end method

.method public getTimescale()J
    .locals 2

    .prologue
    .line 72
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->timescale:J

    return-wide v0
.end method

.method public getVolume()F
    .locals 1

    .prologue
    .line 84
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->volume:F

    return v0
.end method

.method public setCreationTime(Ljava/util/Date;)V
    .locals 4
    .param p1, "creationTime"    # Ljava/util/Date;

    .prologue
    .line 196
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->creationTime:Ljava/util/Date;

    .line 197
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(Ljava/util/Date;)J

    move-result-wide v0

    const-wide v2, 0x100000000L

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    .line 198
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setVersion(I)V

    .line 201
    :cond_0
    return-void
.end method

.method public setCurrentTime(I)V
    .locals 0
    .param p1, "currentTime"    # I

    .prologue
    .line 283
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->currentTime:I

    .line 284
    return-void
.end method

.method public setDuration(J)V
    .locals 3
    .param p1, "duration"    # J

    .prologue
    .line 216
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->duration:J

    .line 217
    const-wide v0, 0x100000000L

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 218
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setVersion(I)V

    .line 220
    :cond_0
    return-void
.end method

.method public setMatrix(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;)V
    .locals 0
    .param p1, "matrix"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    .prologue
    .line 231
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->matrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    .line 232
    return-void
.end method

.method public setModificationTime(Ljava/util/Date;)V
    .locals 4
    .param p1, "modificationTime"    # Ljava/util/Date;

    .prologue
    .line 204
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->modificationTime:Ljava/util/Date;

    .line 205
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/DateHelper;->convert(Ljava/util/Date;)J

    move-result-wide v0

    const-wide v2, 0x100000000L

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    .line 206
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setVersion(I)V

    .line 209
    :cond_0
    return-void
.end method

.method public setNextTrackId(J)V
    .locals 1
    .param p1, "nextTrackId"    # J

    .prologue
    .line 235
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->nextTrackId:J

    .line 236
    return-void
.end method

.method public setPosterTime(I)V
    .locals 0
    .param p1, "posterTime"    # I

    .prologue
    .line 259
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->posterTime:I

    .line 260
    return-void
.end method

.method public setPreviewDuration(I)V
    .locals 0
    .param p1, "previewDuration"    # I

    .prologue
    .line 251
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->previewDuration:I

    .line 252
    return-void
.end method

.method public setPreviewTime(I)V
    .locals 0
    .param p1, "previewTime"    # I

    .prologue
    .line 243
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->previewTime:I

    .line 244
    return-void
.end method

.method public setRate(D)V
    .locals 1
    .param p1, "rate"    # D

    .prologue
    .line 223
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->rate:D

    .line 224
    return-void
.end method

.method public setSelectionDuration(I)V
    .locals 0
    .param p1, "selectionDuration"    # I

    .prologue
    .line 275
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->selectionDuration:I

    .line 276
    return-void
.end method

.method public setSelectionTime(I)V
    .locals 0
    .param p1, "selectionTime"    # I

    .prologue
    .line 267
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->selectionTime:I

    .line 268
    return-void
.end method

.method public setTimescale(J)V
    .locals 1
    .param p1, "timescale"    # J

    .prologue
    .line 212
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->timescale:J

    .line 213
    return-void
.end method

.method public setVolume(F)V
    .locals 0
    .param p1, "volume"    # F

    .prologue
    .line 227
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->volume:F

    .line 228
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 140
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 141
    .local v0, "result":Ljava/lang/StringBuilder;
    const-string v1, "MovieHeaderBox["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    const-string v1, "creationTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->getCreationTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 143
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    const-string v1, "modificationTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->getModificationTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 145
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    const-string v1, "timescale="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->getTimescale()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 147
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    const-string v1, "duration="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->getDuration()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 149
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    const-string v1, "rate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->getRate()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 151
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    const-string v1, "volume="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->getVolume()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 153
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    const-string v1, "matrix="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->matrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 155
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    const-string v1, "nextTrackId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->getNextTrackId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 157
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
