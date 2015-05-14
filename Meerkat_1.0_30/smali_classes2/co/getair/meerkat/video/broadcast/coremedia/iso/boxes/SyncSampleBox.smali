.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "SyncSampleBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "stss"


# instance fields
.field private sampleNumber:[J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 38
    const-string v0, "stss"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 39
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 56
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 57
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v0

    .line 59
    .local v0, "entryCount":I
    new-array v2, v0, [J

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;->sampleNumber:[J

    .line 60
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 61
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;->sampleNumber:[J

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    aput-wide v4, v2, v1

    .line 60
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 63
    :cond_0
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 5
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 67
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 69
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;->sampleNumber:[J

    array-length v2, v2

    int-to-long v2, v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 71
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;->sampleNumber:[J

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v4, :cond_0

    aget-wide v0, v3, v2

    .line 72
    .local v0, "aSampleNumber":J
    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 71
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 75
    .end local v0    # "aSampleNumber":J
    :cond_0
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 51
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;->sampleNumber:[J

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x8

    int-to-long v0, v0

    return-wide v0
.end method

.method public getSampleNumber()[J
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;->sampleNumber:[J

    return-object v0
.end method

.method public setSampleNumber([J)V
    .locals 0
    .param p1, "sampleNumber"    # [J

    .prologue
    .line 82
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;->sampleNumber:[J

    .line 83
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SyncSampleBox[entryCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;->sampleNumber:[J

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
