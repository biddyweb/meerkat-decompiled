.class Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;
.super Ljava/lang/Object;
.source "FragmentedMp4Builder.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createMdat(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;I)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Mdat"
.end annotation


# instance fields
.field parent:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

.field size_:J

.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;

.field final synthetic val$endSample:J

.field final synthetic val$i:I

.field final synthetic val$startSample:J

.field final synthetic val$track:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;I)V
    .locals 2
    .param p1, "this$0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 233
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;

    iput-wide p2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->val$startSample:J

    iput-wide p4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->val$endSample:J

    iput-object p6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->val$track:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    iput p7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->val$i:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 235
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->size_:J

    return-void
.end method


# virtual methods
.method public getBox(Ljava/nio/channels/WritableByteChannel;)V
    .locals 10
    .param p1, "writableByteChannel"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 264
    const/16 v1, 0x8

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 265
    .local v0, "header":Ljava/nio/ByteBuffer;
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->getSize()J

    move-result-wide v2

    invoke-static {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v1

    int-to-long v2, v1

    invoke-static {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 266
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->fourCCtoBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 267
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 268
    invoke-interface {p1, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 270
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->val$startSample:J

    iget-wide v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->val$endSample:J

    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->val$track:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    iget v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->val$i:I

    invoke-virtual/range {v1 .. v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->getSamples(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;I)Ljava/util/List;

    move-result-object v9

    .line 271
    .local v9, "samples":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    .line 272
    .local v8, "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    invoke-interface {v8, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->writeTo(Ljava/nio/channels/WritableByteChannel;)V

    goto :goto_0

    .line 276
    .end local v8    # "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    :cond_0
    return-void
.end method

.method public getOffset()J
    .locals 2

    .prologue
    .line 246
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Doesn\'t have any meaning for programmatically created boxes"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    .locals 1

    .prologue
    .line 238
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->parent:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    return-object v0
.end method

.method public getSize()J
    .locals 10

    .prologue
    .line 250
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->size_:J

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    iget-wide v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->size_:J

    .line 256
    :goto_0
    return-wide v8

    .line 251
    :cond_0
    const-wide/16 v8, 0x8

    .line 252
    .local v8, "size":J
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->val$startSample:J

    iget-wide v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->val$endSample:J

    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->val$track:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    iget v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->val$i:I

    invoke-virtual/range {v1 .. v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->getSamples(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;I)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    .line 253
    .local v0, "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->getSize()J

    move-result-wide v2

    add-long/2addr v8, v2

    .line 254
    goto :goto_1

    .line 255
    .end local v0    # "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    :cond_1
    iput-wide v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->size_:J

    goto :goto_0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 260
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
    .line 280
    return-void
.end method

.method public setParent(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;)V
    .locals 0
    .param p1, "parent"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    .prologue
    .line 242
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;->parent:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    .line 243
    return-void
.end method
