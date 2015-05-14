.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/adobe/ActionMessageFormat0SampleEntryBox;
.super Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;
.source "ActionMessageFormat0SampleEntryBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "amf0"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    const-string v0, "amf0"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;-><init>(Ljava/lang/String;)V

    .line 22
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
    .line 35
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/adobe/ActionMessageFormat0SampleEntryBox;->getHeader()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 36
    const/16 v1, 0x8

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 37
    .local v0, "bb":Ljava/nio/ByteBuffer;
    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 38
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/adobe/ActionMessageFormat0SampleEntryBox;->dataReferenceIndex:I

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 39
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 40
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/adobe/ActionMessageFormat0SampleEntryBox;->writeContainer(Ljava/nio/channels/WritableByteChannel;)V

    .line 41
    return-void
.end method

.method public getSize()J
    .locals 10

    .prologue
    .line 45
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/adobe/ActionMessageFormat0SampleEntryBox;->getContainerSize()J

    move-result-wide v0

    .line 46
    .local v0, "s":J
    const-wide/16 v2, 0x8

    .line 47
    .local v2, "t":J
    add-long v6, v0, v2

    iget-boolean v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/adobe/ActionMessageFormat0SampleEntryBox;->largeBox:Z

    if-nez v4, :cond_0

    add-long v4, v0, v2

    const-wide v8, 0x100000000L

    cmp-long v4, v4, v8

    if-ltz v4, :cond_1

    :cond_0
    const/16 v4, 0x10

    :goto_0
    int-to-long v4, v4

    add-long/2addr v4, v6

    return-wide v4

    :cond_1
    const/16 v4, 0x8

    goto :goto_0
.end method

.method public parse(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/nio/ByteBuffer;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V
    .locals 5
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
    .line 26
    const/16 v1, 0x8

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 27
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-interface {p1, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    .line 28
    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 29
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/adobe/ActionMessageFormat0SampleEntryBox;->dataReferenceIndex:I

    .line 30
    const-wide/16 v2, 0x8

    sub-long v2, p3, v2

    invoke-virtual {p0, p1, v2, v3, p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/adobe/ActionMessageFormat0SampleEntryBox;->initContainer(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V

    .line 31
    return-void
.end method
