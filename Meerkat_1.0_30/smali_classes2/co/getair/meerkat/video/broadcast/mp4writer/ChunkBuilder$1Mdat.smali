.class Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;
.super Ljava/lang/Object;
.source "ChunkBuilder.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder;->createMdat(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Mdat"
.end annotation


# instance fields
.field parent:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

.field size_:J

.field final synthetic val$audioTrack:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

.field final synthetic val$videoTrack:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 169
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->val$videoTrack:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    iput-object p2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->val$audioTrack:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 171
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->size_:J

    return-void
.end method


# virtual methods
.method public getBox(Ljava/nio/channels/WritableByteChannel;)V
    .locals 5
    .param p1, "writableByteChannel"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 197
    const/16 v1, 0x8

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 198
    .local v0, "header":Ljava/nio/ByteBuffer;
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->getSize()J

    move-result-wide v2

    invoke-static {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v1

    int-to-long v2, v1

    invoke-static {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 199
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->fourCCtoBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 200
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 201
    invoke-interface {p1, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 202
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->val$videoTrack:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getData()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 203
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->val$videoTrack:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getData()Ljava/nio/ByteBuffer;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->val$videoTrack:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getSize()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 204
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->val$videoTrack:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getData()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 205
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->val$audioTrack:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getData()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 206
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->val$audioTrack:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getData()Ljava/nio/ByteBuffer;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->val$audioTrack:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getSize()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 207
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->val$audioTrack:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getData()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 208
    invoke-interface {p1}, Ljava/nio/channels/WritableByteChannel;->close()V

    .line 210
    return-void
.end method

.method public getOffset()J
    .locals 2

    .prologue
    .line 182
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Doesn\'t have any meaning for programmatically created boxes"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    .locals 1

    .prologue
    .line 174
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->parent:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    return-object v0
.end method

.method public getSize()J
    .locals 6

    .prologue
    .line 186
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->size_:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->size_:J

    .line 189
    :goto_0
    return-wide v0

    .line 187
    :cond_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->val$videoTrack:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getSize()I

    move-result v2

    add-int/lit8 v2, v2, 0x8

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->val$audioTrack:Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getSize()I

    move-result v3

    add-int/2addr v2, v3

    int-to-long v0, v2

    .line 188
    .local v0, "size":J
    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->size_:J

    goto :goto_0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 193
    const-string v0, "mdat"

    return-object v0
.end method

.method public parse(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/nio/ByteBuffer;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V
    .locals 0
    .param p1, "fileChannel"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .param p2, "header"    # Ljava/nio/ByteBuffer;
    .param p3, "contentSize"    # J
    .param p5, "boxParser"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 214
    return-void
.end method

.method public setParent(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;)V
    .locals 0
    .param p1, "parent"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    .prologue
    .line 178
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;->parent:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    .line 179
    return-void
.end method
