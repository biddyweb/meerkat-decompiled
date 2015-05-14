.class Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder$1Mdat;
.super Ljava/lang/Object;
.source "MoovBuilder.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder;->createMdat(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Mdat"
.end annotation


# instance fields
.field parent:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

.field size_:J

.field final synthetic val$audioTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;

.field final synthetic val$videoTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 211
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder$1Mdat;->val$videoTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;

    iput-object p2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder$1Mdat;->val$audioTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 213
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder$1Mdat;->size_:J

    return-void
.end method


# virtual methods
.method public getBox(Ljava/nio/channels/WritableByteChannel;)V
    .locals 6
    .param p1, "writableByteChannel"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 245
    const/16 v3, 0x8

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 246
    .local v0, "header":Ljava/nio/ByteBuffer;
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder$1Mdat;->getSize()J

    move-result-wide v4

    invoke-static {v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v3

    int-to-long v4, v3

    invoke-static {v0, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 247
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder$1Mdat;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->fourCCtoBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 248
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 249
    invoke-interface {p1, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 251
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder$1Mdat;->val$videoTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->getSamples()Ljava/util/List;

    move-result-object v2

    .line 252
    .local v2, "samples":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    .line 253
    .local v1, "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    invoke-interface {v1, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->writeTo(Ljava/nio/channels/WritableByteChannel;)V

    goto :goto_0

    .line 255
    .end local v1    # "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    :cond_0
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder$1Mdat;->val$audioTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->getSamples()Ljava/util/List;

    move-result-object v2

    .line 256
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    .line 257
    .restart local v1    # "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    invoke-interface {v1, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->writeTo(Ljava/nio/channels/WritableByteChannel;)V

    goto :goto_1

    .line 260
    .end local v1    # "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    :cond_1
    invoke-interface {p1}, Ljava/nio/channels/WritableByteChannel;->close()V

    .line 261
    return-void
.end method

.method public getOffset()J
    .locals 2

    .prologue
    .line 224
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Doesn\'t have any meaning for programmatically created boxes"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    .locals 1

    .prologue
    .line 216
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder$1Mdat;->parent:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    return-object v0
.end method

.method public getSize()J
    .locals 8

    .prologue
    .line 228
    iget-wide v4, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder$1Mdat;->size_:J

    const-wide/16 v6, -0x1

    cmp-long v1, v4, v6

    if-eqz v1, :cond_0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder$1Mdat;->size_:J

    .line 237
    :goto_0
    return-wide v2

    .line 229
    :cond_0
    const-wide/16 v2, 0x8

    .line 230
    .local v2, "size":J
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder$1Mdat;->val$videoTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->getSamples()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    .line 231
    .local v0, "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->getSize()J

    move-result-wide v4

    add-long/2addr v2, v4

    .line 232
    goto :goto_1

    .line 233
    .end local v0    # "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    :cond_1
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder$1Mdat;->val$audioTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->getSamples()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    .line 234
    .restart local v0    # "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->getSize()J

    move-result-wide v4

    add-long/2addr v2, v4

    .line 235
    goto :goto_2

    .line 236
    .end local v0    # "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    :cond_2
    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder$1Mdat;->size_:J

    goto :goto_0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 241
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
    .line 265
    return-void
.end method

.method public setParent(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;)V
    .locals 0
    .param p1, "parent"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    .prologue
    .line 220
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder$1Mdat;->parent:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    .line 221
    return-void
.end method
