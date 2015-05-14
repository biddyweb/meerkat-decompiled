.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;
.super Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;
.source "TextSampleEntry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;,
        Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;
    }
.end annotation


# static fields
.field public static final TYPE1:Ljava/lang/String; = "tx3g"

.field public static final TYPE_ENCRYPTED:Ljava/lang/String; = "enct"


# instance fields
.field private backgroundColorRgba:[I

.field private boxRecord:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;

.field private displayFlags:J

.field private horizontalJustification:I

.field private styleRecord:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;

.field private verticalJustification:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 58
    const-string v0, "tx3g"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;-><init>(Ljava/lang/String;)V

    .line 53
    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->backgroundColorRgba:[I

    .line 54
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->boxRecord:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;

    .line 55
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->styleRecord:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 62
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;-><init>(Ljava/lang/String;)V

    .line 53
    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->backgroundColorRgba:[I

    .line 54
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->boxRecord:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;

    .line 55
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->styleRecord:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;

    .line 63
    return-void
.end method


# virtual methods
.method public getBackgroundColorRgba()[I
    .locals 1

    .prologue
    .line 222
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->backgroundColorRgba:[I

    return-object v0
.end method

.method public getBox(Ljava/nio/channels/WritableByteChannel;)V
    .locals 4
    .param p1, "writableByteChannel"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->getHeader()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 94
    const/16 v1, 0x26

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 95
    .local v0, "byteBuffer":Ljava/nio/ByteBuffer;
    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 96
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->dataReferenceIndex:I

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 97
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    invoke-static {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 98
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->horizontalJustification:I

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 99
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->verticalJustification:I

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 100
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->backgroundColorRgba:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 101
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->backgroundColorRgba:[I

    const/4 v2, 0x1

    aget v1, v1, v2

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 102
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->backgroundColorRgba:[I

    const/4 v2, 0x2

    aget v1, v1, v2

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 103
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->backgroundColorRgba:[I

    const/4 v2, 0x3

    aget v1, v1, v2

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 104
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->boxRecord:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;

    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->getContent(Ljava/nio/ByteBuffer;)V

    .line 105
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->styleRecord:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;

    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;->getContent(Ljava/nio/ByteBuffer;)V

    .line 106
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 107
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->writeContainer(Ljava/nio/channels/WritableByteChannel;)V

    .line 108
    return-void
.end method

.method public getBoxRecord()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->boxRecord:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;

    return-object v0
.end method

.method public getHorizontalJustification()I
    .locals 1

    .prologue
    .line 206
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->horizontalJustification:I

    return v0
.end method

.method public getSize()J
    .locals 10

    .prologue
    .line 388
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->getContainerSize()J

    move-result-wide v0

    .line 389
    .local v0, "s":J
    const-wide/16 v2, 0x26

    .line 390
    .local v2, "t":J
    add-long v6, v0, v2

    iget-boolean v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->largeBox:Z

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

.method public getStyleRecord()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->styleRecord:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;

    return-object v0
.end method

.method public getVerticalJustification()I
    .locals 1

    .prologue
    .line 214
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->verticalJustification:I

    return v0
.end method

.method public isContinuousKaraoke()Z
    .locals 4

    .prologue
    const-wide/16 v2, 0x800

    .line 168
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    and-long/2addr v0, v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFillTextRegion()Z
    .locals 4

    .prologue
    const-wide/32 v2, 0x40000

    .line 193
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    and-long/2addr v0, v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isScrollDirection()Z
    .locals 4

    .prologue
    const-wide/16 v2, 0x180

    .line 156
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    and-long/2addr v0, v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isScrollIn()Z
    .locals 4

    .prologue
    const-wide/16 v2, 0x20

    .line 132
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    and-long/2addr v0, v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isScrollOut()Z
    .locals 4

    .prologue
    const-wide/16 v2, 0x40

    .line 144
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    and-long/2addr v0, v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isWriteTextVertically()Z
    .locals 4

    .prologue
    const-wide/32 v2, 0x20000

    .line 180
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    and-long/2addr v0, v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

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
    .line 71
    const/16 v1, 0x26

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 72
    .local v0, "content":Ljava/nio/ByteBuffer;
    invoke-interface {p1, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    .line 73
    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 74
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->dataReferenceIndex:I

    .line 75
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    .line 76
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->horizontalJustification:I

    .line 77
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->verticalJustification:I

    .line 78
    const/4 v1, 0x4

    new-array v1, v1, [I

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->backgroundColorRgba:[I

    .line 79
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->backgroundColorRgba:[I

    const/4 v2, 0x0

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v3

    aput v3, v1, v2

    .line 80
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->backgroundColorRgba:[I

    const/4 v2, 0x1

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v3

    aput v3, v1, v2

    .line 81
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->backgroundColorRgba:[I

    const/4 v2, 0x2

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v3

    aput v3, v1, v2

    .line 82
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->backgroundColorRgba:[I

    const/4 v2, 0x3

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v3

    aput v3, v1, v2

    .line 83
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;-><init>()V

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->boxRecord:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;

    .line 84
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->boxRecord:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;

    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->parse(Ljava/nio/ByteBuffer;)V

    .line 86
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;-><init>()V

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->styleRecord:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;

    .line 87
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->styleRecord:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;

    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;->parse(Ljava/nio/ByteBuffer;)V

    .line 88
    const-wide/16 v2, 0x26

    sub-long v2, p3, v2

    invoke-virtual {p0, p1, v2, v3, p5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->initContainer(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V

    .line 89
    return-void
.end method

.method public setBackgroundColorRgba([I)V
    .locals 0
    .param p1, "backgroundColorRgba"    # [I

    .prologue
    .line 226
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->backgroundColorRgba:[I

    .line 227
    return-void
.end method

.method public setBoxRecord(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;)V
    .locals 0
    .param p1, "boxRecord"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;

    .prologue
    .line 120
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->boxRecord:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;

    .line 121
    return-void
.end method

.method public setContinuousKaraoke(Z)V
    .locals 4
    .param p1, "continuousKaraoke"    # Z

    .prologue
    .line 172
    if-eqz p1, :cond_0

    .line 173
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    const-wide/16 v2, 0x800

    or-long/2addr v0, v2

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    .line 177
    :goto_0
    return-void

    .line 175
    :cond_0
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    const-wide/16 v2, -0x801

    and-long/2addr v0, v2

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    goto :goto_0
.end method

.method public setFillTextRegion(Z)V
    .locals 4
    .param p1, "fillTextRegion"    # Z

    .prologue
    .line 197
    if-eqz p1, :cond_0

    .line 198
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    const-wide/32 v2, 0x40000

    or-long/2addr v0, v2

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    .line 202
    :goto_0
    return-void

    .line 200
    :cond_0
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    const-wide/32 v2, -0x40001

    and-long/2addr v0, v2

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    goto :goto_0
.end method

.method public setHorizontalJustification(I)V
    .locals 0
    .param p1, "horizontalJustification"    # I

    .prologue
    .line 210
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->horizontalJustification:I

    .line 211
    return-void
.end method

.method public setScrollDirection(Z)V
    .locals 4
    .param p1, "scrollOutIn"    # Z

    .prologue
    .line 160
    if-eqz p1, :cond_0

    .line 161
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    const-wide/16 v2, 0x180

    or-long/2addr v0, v2

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    .line 165
    :goto_0
    return-void

    .line 163
    :cond_0
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    const-wide/16 v2, -0x181

    and-long/2addr v0, v2

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    goto :goto_0
.end method

.method public setScrollIn(Z)V
    .locals 4
    .param p1, "scrollIn"    # Z

    .prologue
    .line 136
    if-eqz p1, :cond_0

    .line 137
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    const-wide/16 v2, 0x20

    or-long/2addr v0, v2

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    .line 141
    :goto_0
    return-void

    .line 139
    :cond_0
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    const-wide/16 v2, -0x21

    and-long/2addr v0, v2

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    goto :goto_0
.end method

.method public setScrollOut(Z)V
    .locals 4
    .param p1, "scrollOutIn"    # Z

    .prologue
    .line 148
    if-eqz p1, :cond_0

    .line 149
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    const-wide/16 v2, 0x40

    or-long/2addr v0, v2

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    .line 153
    :goto_0
    return-void

    .line 151
    :cond_0
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    const-wide/16 v2, -0x41

    and-long/2addr v0, v2

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    goto :goto_0
.end method

.method public setStyleRecord(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;)V
    .locals 0
    .param p1, "styleRecord"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;

    .prologue
    .line 128
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->styleRecord:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;

    .line 129
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 66
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->type:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public setVerticalJustification(I)V
    .locals 0
    .param p1, "verticalJustification"    # I

    .prologue
    .line 218
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->verticalJustification:I

    .line 219
    return-void
.end method

.method public setWriteTextVertically(Z)V
    .locals 4
    .param p1, "writeTextVertically"    # Z

    .prologue
    .line 184
    if-eqz p1, :cond_0

    .line 185
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    const-wide/32 v2, 0x20000

    or-long/2addr v0, v2

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    .line 189
    :goto_0
    return-void

    .line 187
    :cond_0
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    const-wide/32 v2, -0x20001

    and-long/2addr v0, v2

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->displayFlags:J

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 112
    const-string v0, "TextSampleEntry"

    return-object v0
.end method
