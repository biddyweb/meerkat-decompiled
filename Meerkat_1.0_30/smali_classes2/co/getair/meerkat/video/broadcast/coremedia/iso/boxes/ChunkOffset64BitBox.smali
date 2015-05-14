.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffset64BitBox;
.super Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffsetBox;
.source "ChunkOffset64BitBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "co64"


# instance fields
.field private chunkOffsets:[J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 19
    const-string v0, "co64"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffsetBox;-><init>(Ljava/lang/String;)V

    .line 20
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 39
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffset64BitBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 40
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v0

    .line 41
    .local v0, "entryCount":I
    new-array v2, v0, [J

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffset64BitBox;->chunkOffsets:[J

    .line 42
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 43
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffset64BitBox;->chunkOffsets:[J

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt64(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    aput-wide v4, v2, v1

    .line 42
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 45
    :cond_0
    return-void
.end method

.method public getChunkOffsets()[J
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffset64BitBox;->chunkOffsets:[J

    return-object v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 5
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 49
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffset64BitBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 50
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffset64BitBox;->chunkOffsets:[J

    array-length v2, v2

    int-to-long v2, v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 51
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffset64BitBox;->chunkOffsets:[J

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v4, :cond_0

    aget-wide v0, v3, v2

    .line 52
    .local v0, "chunkOffset":J
    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    .line 51
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 54
    .end local v0    # "chunkOffset":J
    :cond_0
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 34
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffset64BitBox;->chunkOffsets:[J

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x8

    add-int/lit8 v0, v0, 0x8

    int-to-long v0, v0

    return-wide v0
.end method

.method public setChunkOffsets([J)V
    .locals 0
    .param p1, "chunkOffsets"    # [J

    .prologue
    .line 29
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffset64BitBox;->chunkOffsets:[J

    .line 30
    return-void
.end method
