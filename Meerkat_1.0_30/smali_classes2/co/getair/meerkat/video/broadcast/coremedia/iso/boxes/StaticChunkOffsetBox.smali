.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;
.super Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffsetBox;
.source "StaticChunkOffsetBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "stco"


# instance fields
.field private chunkOffsets:[J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    const-string v0, "stco"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffsetBox;-><init>(Ljava/lang/String;)V

    .line 33
    const/4 v0, 0x0

    new-array v0, v0, [J

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;->chunkOffsets:[J

    .line 37
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 54
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 55
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v0

    .line 56
    .local v0, "entryCount":I
    new-array v2, v0, [J

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;->chunkOffsets:[J

    .line 57
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 58
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;->chunkOffsets:[J

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    aput-wide v4, v2, v1

    .line 57
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 61
    :cond_0
    return-void
.end method

.method public getChunkOffsets()[J
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;->chunkOffsets:[J

    return-object v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 5
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 65
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 66
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;->chunkOffsets:[J

    array-length v2, v2

    int-to-long v2, v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 67
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;->chunkOffsets:[J

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v4, :cond_0

    aget-wide v0, v3, v2

    .line 68
    .local v0, "chunkOffset":J
    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 67
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 70
    .end local v0    # "chunkOffset":J
    :cond_0
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 44
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;->chunkOffsets:[J

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x8

    int-to-long v0, v0

    return-wide v0
.end method

.method public setChunkOffsets([J)V
    .locals 0
    .param p1, "chunkOffsets"    # [J

    .prologue
    .line 49
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;->chunkOffsets:[J

    .line 50
    return-void
.end method
