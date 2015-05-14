.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/Ovc1VisualSampleEntryImpl;
.super Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;
.source "Ovc1VisualSampleEntryImpl.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "ovc1"


# instance fields
.field private vc1Content:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    const-string v0, "ovc1"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;-><init>(Ljava/lang/String;)V

    .line 18
    const/4 v0, 0x0

    new-array v0, v0, [B

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/Ovc1VisualSampleEntryImpl;->vc1Content:[B

    .line 23
    return-void
.end method


# virtual methods
.method public getBox(Ljava/nio/channels/WritableByteChannel;)V
    .locals 2
    .param p1, "writableByteChannel"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 46
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/Ovc1VisualSampleEntryImpl;->getHeader()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 47
    const/16 v1, 0x8

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 48
    .local v0, "byteBuffer":Ljava/nio/ByteBuffer;
    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 49
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/Ovc1VisualSampleEntryImpl;->dataReferenceIndex:I

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 50
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 51
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/Ovc1VisualSampleEntryImpl;->vc1Content:[B

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 52
    return-void
.end method

.method public getSize()J
    .locals 8

    .prologue
    const-wide/16 v2, 0x8

    .line 56
    iget-boolean v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/Ovc1VisualSampleEntryImpl;->largeBox:Z

    if-nez v4, :cond_0

    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/Ovc1VisualSampleEntryImpl;->vc1Content:[B

    array-length v4, v4

    add-int/lit8 v4, v4, 0x10

    int-to-long v4, v4

    const-wide v6, 0x100000000L

    cmp-long v4, v4, v6

    if-ltz v4, :cond_1

    :cond_0
    const-wide/16 v0, 0x10

    .line 57
    .local v0, "header":J
    :goto_0
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/Ovc1VisualSampleEntryImpl;->vc1Content:[B

    array-length v4, v4

    int-to-long v4, v4

    add-long/2addr v4, v0

    add-long/2addr v2, v4

    return-wide v2

    .end local v0    # "header":J
    :cond_1
    move-wide v0, v2

    .line 56
    goto :goto_0
.end method

.method public getVc1Content()[B
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/Ovc1VisualSampleEntryImpl;->vc1Content:[B

    return-object v0
.end method

.method public parse(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/nio/ByteBuffer;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V
    .locals 3
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .param p2, "header"    # Ljava/nio/ByteBuffer;
    .param p3, "contentSize"    # J
    .param p5, "boxParser"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 35
    invoke-static {p3, p4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v1

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 36
    .local v0, "byteBuffer":Ljava/nio/ByteBuffer;
    invoke-interface {p1, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    .line 37
    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 38
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/Ovc1VisualSampleEntryImpl;->dataReferenceIndex:I

    .line 39
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    new-array v1, v1, [B

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/Ovc1VisualSampleEntryImpl;->vc1Content:[B

    .line 40
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/Ovc1VisualSampleEntryImpl;->vc1Content:[B

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 41
    return-void
.end method

.method public setVc1Content([B)V
    .locals 0
    .param p1, "vc1Content"    # [B

    .prologue
    .line 30
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/Ovc1VisualSampleEntryImpl;->vc1Content:[B

    .line 31
    return-void
.end method
