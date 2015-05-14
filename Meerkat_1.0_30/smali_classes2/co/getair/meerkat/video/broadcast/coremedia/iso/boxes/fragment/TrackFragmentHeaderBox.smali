.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "TrackFragmentHeaderBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "tfhd"


# instance fields
.field private baseDataOffset:J

.field private defaultBaseIsMoof:Z

.field private defaultSampleDuration:J

.field private defaultSampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

.field private defaultSampleSize:J

.field private durationIsEmpty:Z

.field private sampleDescriptionIndex:J

.field private trackId:J


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, -0x1

    .line 51
    const-string v0, "tfhd"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 42
    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->baseDataOffset:J

    .line 44
    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultSampleDuration:J

    .line 45
    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultSampleSize:J

    .line 52
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 5
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    const/high16 v4, 0x20000

    const/high16 v3, 0x10000

    const/4 v2, 0x1

    .line 101
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 102
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->trackId:J

    .line 103
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v2, :cond_0

    .line 104
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt64(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->baseDataOffset:J

    .line 106
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 107
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->sampleDescriptionIndex:J

    .line 109
    :cond_1
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x8

    const/16 v1, 0x8

    if-ne v0, v1, :cond_2

    .line 110
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultSampleDuration:J

    .line 112
    :cond_2
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_3

    .line 113
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultSampleSize:J

    .line 115
    :cond_3
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_4

    .line 116
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    invoke-direct {v0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;-><init>(Ljava/nio/ByteBuffer;)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultSampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    .line 118
    :cond_4
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    and-int/2addr v0, v3

    if-ne v0, v3, :cond_5

    .line 119
    iput-boolean v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->durationIsEmpty:Z

    .line 121
    :cond_5
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    and-int/2addr v0, v4

    if-ne v0, v4, :cond_6

    .line 122
    iput-boolean v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultBaseIsMoof:Z

    .line 124
    :cond_6
    return-void
.end method

.method public getBaseDataOffset()J
    .locals 2

    .prologue
    .line 151
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->baseDataOffset:J

    return-wide v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 79
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 80
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->trackId:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 82
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 83
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getBaseDataOffset()J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    .line 85
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 86
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getSampleDescriptionIndex()J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 88
    :cond_1
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x8

    const/16 v1, 0x8

    if-ne v0, v1, :cond_2

    .line 89
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getDefaultSampleDuration()J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 91
    :cond_2
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_3

    .line 92
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getDefaultSampleSize()J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 94
    :cond_3
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_4

    .line 95
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultSampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    invoke-virtual {v0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->getContent(Ljava/nio/ByteBuffer;)V

    .line 97
    :cond_4
    return-void
.end method

.method protected getContentSize()J
    .locals 8

    .prologue
    const-wide/16 v6, 0x4

    .line 56
    const-wide/16 v2, 0x8

    .line 57
    .local v2, "size":J
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    .line 58
    .local v0, "flags":I
    and-int/lit8 v1, v0, 0x1

    const/4 v4, 0x1

    if-ne v1, v4, :cond_0

    .line 59
    const-wide/16 v4, 0x8

    add-long/2addr v2, v4

    .line 61
    :cond_0
    and-int/lit8 v1, v0, 0x2

    const/4 v4, 0x2

    if-ne v1, v4, :cond_1

    .line 62
    add-long/2addr v2, v6

    .line 64
    :cond_1
    and-int/lit8 v1, v0, 0x8

    const/16 v4, 0x8

    if-ne v1, v4, :cond_2

    .line 65
    add-long/2addr v2, v6

    .line 67
    :cond_2
    and-int/lit8 v1, v0, 0x10

    const/16 v4, 0x10

    if-ne v1, v4, :cond_3

    .line 68
    add-long/2addr v2, v6

    .line 70
    :cond_3
    and-int/lit8 v1, v0, 0x20

    const/16 v4, 0x20

    if-ne v1, v4, :cond_4

    .line 71
    add-long/2addr v2, v6

    .line 73
    :cond_4
    return-wide v2
.end method

.method public getDefaultSampleDuration()J
    .locals 2

    .prologue
    .line 159
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultSampleDuration:J

    return-wide v0
.end method

.method public getDefaultSampleFlags()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultSampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    return-object v0
.end method

.method public getDefaultSampleSize()J
    .locals 2

    .prologue
    .line 163
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultSampleSize:J

    return-wide v0
.end method

.method public getSampleDescriptionIndex()J
    .locals 2

    .prologue
    .line 155
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->sampleDescriptionIndex:J

    return-wide v0
.end method

.method public getTrackId()J
    .locals 2

    .prologue
    .line 147
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->trackId:J

    return-wide v0
.end method

.method public hasBaseDataOffset()Z
    .locals 1

    .prologue
    .line 127
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasDefaultSampleDuration()Z
    .locals 1

    .prologue
    .line 135
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasDefaultSampleFlags()Z
    .locals 1

    .prologue
    .line 143
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x20

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasDefaultSampleSize()Z
    .locals 1

    .prologue
    .line 139
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasSampleDescriptionIndex()Z
    .locals 1

    .prologue
    .line 131
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isDefaultBaseIsMoof()Z
    .locals 1

    .prologue
    .line 175
    iget-boolean v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultBaseIsMoof:Z

    return v0
.end method

.method public isDurationIsEmpty()Z
    .locals 1

    .prologue
    .line 171
    iget-boolean v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->durationIsEmpty:Z

    return v0
.end method

.method public setBaseDataOffset(J)V
    .locals 3
    .param p1, "baseDataOffset"    # J

    .prologue
    .line 183
    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 184
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    const v1, 0x7ffffffe

    and-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setFlags(I)V

    .line 188
    :goto_0
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->baseDataOffset:J

    .line 189
    return-void

    .line 186
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    or-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setFlags(I)V

    goto :goto_0
.end method

.method public setDefaultBaseIsMoof(Z)V
    .locals 2
    .param p1, "defaultBaseIsMoof"    # Z

    .prologue
    .line 221
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    const/high16 v1, 0x20000

    or-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setFlags(I)V

    .line 222
    iput-boolean p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultBaseIsMoof:Z

    .line 223
    return-void
.end method

.method public setDefaultSampleDuration(J)V
    .locals 1
    .param p1, "defaultSampleDuration"    # J

    .prologue
    .line 201
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    or-int/lit8 v0, v0, 0x8

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setFlags(I)V

    .line 202
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultSampleDuration:J

    .line 203
    return-void
.end method

.method public setDefaultSampleFlags(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;)V
    .locals 1
    .param p1, "defaultSampleFlags"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    .prologue
    .line 211
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    or-int/lit8 v0, v0, 0x20

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setFlags(I)V

    .line 212
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultSampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    .line 213
    return-void
.end method

.method public setDefaultSampleSize(J)V
    .locals 1
    .param p1, "defaultSampleSize"    # J

    .prologue
    .line 206
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    or-int/lit8 v0, v0, 0x10

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setFlags(I)V

    .line 207
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultSampleSize:J

    .line 208
    return-void
.end method

.method public setDurationIsEmpty(Z)V
    .locals 2
    .param p1, "durationIsEmpty"    # Z

    .prologue
    .line 216
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    const/high16 v1, 0x10000

    or-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setFlags(I)V

    .line 217
    iput-boolean p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->durationIsEmpty:Z

    .line 218
    return-void
.end method

.method public setSampleDescriptionIndex(J)V
    .locals 3
    .param p1, "sampleDescriptionIndex"    # J

    .prologue
    .line 192
    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 193
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    const v1, 0x7ffffffd

    and-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setFlags(I)V

    .line 197
    :goto_0
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->sampleDescriptionIndex:J

    .line 198
    return-void

    .line 195
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getFlags()I

    move-result v0

    or-int/lit8 v0, v0, 0x2

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setFlags(I)V

    goto :goto_0
.end method

.method public setTrackId(J)V
    .locals 1
    .param p1, "trackId"    # J

    .prologue
    .line 179
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->trackId:J

    .line 180
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 227
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 228
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "TrackFragmentHeaderBox"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    const-string v1, "{trackId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->trackId:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 230
    const-string v1, ", baseDataOffset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->baseDataOffset:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 231
    const-string v1, ", sampleDescriptionIndex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->sampleDescriptionIndex:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 232
    const-string v1, ", defaultSampleDuration="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultSampleDuration:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 233
    const-string v1, ", defaultSampleSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultSampleSize:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 234
    const-string v1, ", defaultSampleFlags="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultSampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 235
    const-string v1, ", durationIsEmpty="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->durationIsEmpty:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 236
    const-string v1, ", defaultBaseIsMoof="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->defaultBaseIsMoof:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 237
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 238
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
