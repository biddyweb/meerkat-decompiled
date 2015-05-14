.class public Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;
.super Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;
.source "XMLSubtitleSampleEntry.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "stpp"


# instance fields
.field private auxiliaryMimeTypes:Ljava/lang/String;

.field private namespace:Ljava/lang/String;

.field private schemaLocation:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    const-string v0, "stpp"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;-><init>(Ljava/lang/String;)V

    .line 17
    const-string v0, ""

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->namespace:Ljava/lang/String;

    .line 18
    const-string v0, ""

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->schemaLocation:Ljava/lang/String;

    .line 19
    const-string v0, ""

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->auxiliaryMimeTypes:Ljava/lang/String;

    .line 23
    return-void
.end method


# virtual methods
.method public getAuxiliaryMimeTypes()Ljava/lang/String;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->auxiliaryMimeTypes:Ljava/lang/String;

    return-object v0
.end method

.method public getBox(Ljava/nio/channels/WritableByteChannel;)V
    .locals 3
    .param p1, "writableByteChannel"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->getHeader()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 60
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->namespace:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x8

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->schemaLocation:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->auxiliaryMimeTypes:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x3

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 61
    .local v0, "byteBuffer":Ljava/nio/ByteBuffer;
    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 62
    iget v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->dataReferenceIndex:I

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 63
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->namespace:Ljava/lang/String;

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeZeroTermUtf8String(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 64
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->schemaLocation:Ljava/lang/String;

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeZeroTermUtf8String(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 65
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->auxiliaryMimeTypes:Ljava/lang/String;

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeZeroTermUtf8String(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 66
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 67
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->writeContainer(Ljava/nio/channels/WritableByteChannel;)V

    .line 68
    return-void
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->namespace:Ljava/lang/String;

    return-object v0
.end method

.method public getSchemaLocation()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->schemaLocation:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()J
    .locals 10

    .prologue
    .line 27
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->getContainerSize()J

    move-result-wide v0

    .line 28
    .local v0, "s":J
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->namespace:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x8

    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->schemaLocation:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->auxiliaryMimeTypes:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    add-int/lit8 v4, v4, 0x3

    int-to-long v2, v4

    .line 29
    .local v2, "t":J
    add-long v6, v0, v2

    iget-boolean v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->largeBox:Z

    if-nez v4, :cond_0

    add-long v4, v0, v2

    const-wide/16 v8, 0x8

    add-long/2addr v4, v8

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
    .locals 9
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
    .line 34
    const/16 v4, 0x8

    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 35
    .local v0, "byteBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-interface {p1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    .line 36
    const/4 v4, 0x6

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 37
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v4

    iput v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->dataReferenceIndex:I

    .line 39
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position()J

    move-result-wide v2

    .line 40
    .local v2, "start":J
    const/16 v4, 0x400

    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 42
    .local v1, "content":Ljava/nio/ByteBuffer;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-interface {p1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    .line 43
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->namespace:Ljava/lang/String;

    .line 44
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->namespace:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v4, v2

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    invoke-interface {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position(J)V

    .line 46
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-interface {p1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    .line 47
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->schemaLocation:Ljava/lang/String;

    .line 48
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->namespace:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v4, v2

    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->schemaLocation:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    const-wide/16 v6, 0x2

    add-long/2addr v4, v6

    invoke-interface {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position(J)V

    .line 50
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-interface {p1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    .line 51
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->auxiliaryMimeTypes:Ljava/lang/String;

    .line 52
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->namespace:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v4, v2

    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->schemaLocation:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->auxiliaryMimeTypes:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    const-wide/16 v6, 0x3

    add-long/2addr v4, v6

    invoke-interface {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position(J)V

    .line 54
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->namespace:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->schemaLocation:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->auxiliaryMimeTypes:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    add-int/lit8 v4, v4, 0x3

    int-to-long v4, v4

    sub-long v4, p3, v4

    invoke-virtual {p0, p1, v4, v5, p5}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->initContainer(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V

    .line 55
    return-void
.end method

.method public setAuxiliaryMimeTypes(Ljava/lang/String;)V
    .locals 0
    .param p1, "auxiliaryMimeTypes"    # Ljava/lang/String;

    .prologue
    .line 91
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->auxiliaryMimeTypes:Ljava/lang/String;

    .line 92
    return-void
.end method

.method public setNamespace(Ljava/lang/String;)V
    .locals 0
    .param p1, "namespace"    # Ljava/lang/String;

    .prologue
    .line 75
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->namespace:Ljava/lang/String;

    .line 76
    return-void
.end method

.method public setSchemaLocation(Ljava/lang/String;)V
    .locals 0
    .param p1, "schemaLocation"    # Ljava/lang/String;

    .prologue
    .line 83
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->schemaLocation:Ljava/lang/String;

    .line 84
    return-void
.end method
