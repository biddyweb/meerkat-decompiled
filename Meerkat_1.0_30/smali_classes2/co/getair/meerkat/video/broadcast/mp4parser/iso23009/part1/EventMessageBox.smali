.class public Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "EventMessageBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "emsg"


# instance fields
.field eventDuration:J

.field id:J

.field messageData:[B

.field presentationTimeDelta:J

.field schemeIdUri:Ljava/lang/String;

.field timescale:J

.field value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    const-string v0, "emsg"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 27
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 31
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 32
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->schemeIdUri:Ljava/lang/String;

    .line 33
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->value:Ljava/lang/String;

    .line 34
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->timescale:J

    .line 35
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->presentationTimeDelta:J

    .line 36
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->eventDuration:J

    .line 37
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->id:J

    .line 38
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    new-array v0, v0, [B

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->messageData:[B

    .line 39
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->messageData:[B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 40
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 44
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 45
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->schemeIdUri:Ljava/lang/String;

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUtf8String(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 46
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->value:Ljava/lang/String;

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUtf8String(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 47
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->timescale:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 48
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->presentationTimeDelta:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 49
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->eventDuration:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 50
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->id:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 51
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->messageData:[B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 52
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 56
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->schemeIdUri:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x16

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->value:Ljava/lang/String;

    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->messageData:[B

    array-length v1, v1

    add-int/2addr v0, v1

    int-to-long v0, v0

    return-wide v0
.end method

.method public getEventDuration()J
    .locals 2

    .prologue
    .line 92
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->eventDuration:J

    return-wide v0
.end method

.method public getId()J
    .locals 2

    .prologue
    .line 100
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->id:J

    return-wide v0
.end method

.method public getMessageData()[B
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->messageData:[B

    return-object v0
.end method

.method public getPresentationTimeDelta()J
    .locals 2

    .prologue
    .line 84
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->presentationTimeDelta:J

    return-wide v0
.end method

.method public getSchemeIdUri()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->schemeIdUri:Ljava/lang/String;

    return-object v0
.end method

.method public getTimescale()J
    .locals 2

    .prologue
    .line 76
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->timescale:J

    return-wide v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->value:Ljava/lang/String;

    return-object v0
.end method

.method public setEventDuration(J)V
    .locals 1
    .param p1, "eventDuration"    # J

    .prologue
    .line 96
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->eventDuration:J

    .line 97
    return-void
.end method

.method public setId(J)V
    .locals 1
    .param p1, "id"    # J

    .prologue
    .line 104
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->id:J

    .line 105
    return-void
.end method

.method public setMessageData([B)V
    .locals 0
    .param p1, "messageData"    # [B

    .prologue
    .line 112
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->messageData:[B

    .line 113
    return-void
.end method

.method public setPresentationTimeDelta(J)V
    .locals 1
    .param p1, "presentationTimeDelta"    # J

    .prologue
    .line 88
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->presentationTimeDelta:J

    .line 89
    return-void
.end method

.method public setSchemeIdUri(Ljava/lang/String;)V
    .locals 0
    .param p1, "schemeIdUri"    # Ljava/lang/String;

    .prologue
    .line 64
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->schemeIdUri:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public setTimescale(J)V
    .locals 1
    .param p1, "timescale"    # J

    .prologue
    .line 80
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->timescale:J

    .line 81
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 72
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23009/part1/EventMessageBox;->value:Ljava/lang/String;

    .line 73
    return-void
.end method
