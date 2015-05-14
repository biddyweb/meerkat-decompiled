.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "SampleSizeBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "stsz"


# instance fields
.field sampleCount:I

.field private sampleSize:J

.field private sampleSizes:[J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    const-string v0, "stsz"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 35
    const/4 v0, 0x0

    new-array v0, v0, [J

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSizes:[J

    .line 41
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 90
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 91
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSize:J

    .line 92
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleCount:I

    .line 94
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSize:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    .line 95
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleCount:I

    new-array v1, v1, [J

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSizes:[J

    .line 97
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleCount:I

    if-ge v0, v1, :cond_0

    .line 98
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSizes:[J

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    aput-wide v2, v1, v0

    .line 97
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 101
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 105
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 106
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSize:J

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 108
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSize:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 109
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSizes:[J

    array-length v2, v2

    int-to-long v2, v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 110
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSizes:[J

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v4, :cond_1

    aget-wide v0, v3, v2

    .line 111
    .local v0, "sampleSize1":J
    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 110
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 114
    .end local v0    # "sampleSize1":J
    :cond_0
    iget v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleCount:I

    int-to-long v2, v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 117
    :cond_1
    return-void
.end method

.method protected getContentSize()J
    .locals 4

    .prologue
    .line 85
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSize:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSizes:[J

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x4

    :goto_0
    add-int/lit8 v0, v0, 0xc

    int-to-long v0, v0

    return-wide v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSampleCount()J
    .locals 4

    .prologue
    .line 68
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSize:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 69
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleCount:I

    int-to-long v0, v0

    .line 71
    :goto_0
    return-wide v0

    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSizes:[J

    array-length v0, v0

    int-to-long v0, v0

    goto :goto_0
.end method

.method public getSampleSize()J
    .locals 2

    .prologue
    .line 51
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSize:J

    return-wide v0
.end method

.method public getSampleSizeAtIndex(I)J
    .locals 4
    .param p1, "index"    # I

    .prologue
    .line 60
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSize:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 61
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSize:J

    .line 63
    :goto_0
    return-wide v0

    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSizes:[J

    aget-wide v0, v0, p1

    goto :goto_0
.end method

.method public getSampleSizes()[J
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSizes:[J

    return-object v0
.end method

.method public setSampleSize(J)V
    .locals 1
    .param p1, "sampleSize"    # J

    .prologue
    .line 55
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSize:J

    .line 56
    return-void
.end method

.method public setSampleSizes([J)V
    .locals 0
    .param p1, "sampleSizes"    # [J

    .prologue
    .line 81
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->sampleSizes:[J

    .line 82
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SampleSizeBox[sampleSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->getSampleSize()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";sampleCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->getSampleCount()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
