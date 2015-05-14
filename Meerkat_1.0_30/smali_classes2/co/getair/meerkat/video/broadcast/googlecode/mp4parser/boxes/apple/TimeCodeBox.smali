.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "TimeCodeBox.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;


# static fields
.field public static final TYPE:Ljava/lang/String; = "tmcd"


# instance fields
.field dataReferenceIndex:I

.field flags:J

.field frameDuration:I

.field numberOfFrames:I

.field reserved1:I

.field reserved2:I

.field rest:[B

.field timeScale:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    const-string v0, "tmcd"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 38
    const/4 v0, 0x0

    new-array v0, v0, [B

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->rest:[B

    .line 42
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 68
    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 69
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->dataReferenceIndex:I

    .line 70
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->reserved1:I

    .line 71
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->flags:J

    .line 73
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->timeScale:I

    .line 74
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->frameDuration:I

    .line 75
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->numberOfFrames:I

    .line 76
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt24(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->reserved2:I

    .line 77
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    new-array v0, v0, [B

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->rest:[B

    .line 78
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->rest:[B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 79
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "bb"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 53
    const/4 v0, 0x6

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 54
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->dataReferenceIndex:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 55
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->reserved1:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 56
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->flags:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 57
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->timeScale:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 58
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->frameDuration:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 59
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->numberOfFrames:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 60
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->reserved2:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt24(Ljava/nio/ByteBuffer;I)V

    .line 61
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->rest:[B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 63
    return-void

    .line 53
    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 47
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->rest:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1c

    int-to-long v0, v0

    return-wide v0
.end method

.method public getDataReferenceIndex()I
    .locals 1

    .prologue
    .line 82
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->dataReferenceIndex:I

    return v0
.end method

.method public getFlags()J
    .locals 2

    .prologue
    .line 143
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->flags:J

    return-wide v0
.end method

.method public getFrameDuration()I
    .locals 1

    .prologue
    .line 111
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->frameDuration:I

    return v0
.end method

.method public getNumberOfFrames()I
    .locals 1

    .prologue
    .line 119
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->numberOfFrames:I

    return v0
.end method

.method public getReserved1()I
    .locals 1

    .prologue
    .line 127
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->reserved1:I

    return v0
.end method

.method public getReserved2()I
    .locals 1

    .prologue
    .line 135
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->reserved2:I

    return v0
.end method

.method public getRest()[B
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->rest:[B

    return-object v0
.end method

.method public getTimeScale()I
    .locals 1

    .prologue
    .line 103
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->timeScale:I

    return v0
.end method

.method public setDataReferenceIndex(I)V
    .locals 0
    .param p1, "dataReferenceIndex"    # I

    .prologue
    .line 86
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->dataReferenceIndex:I

    .line 87
    return-void
.end method

.method public setFlags(J)V
    .locals 1
    .param p1, "flags"    # J

    .prologue
    .line 147
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->flags:J

    .line 148
    return-void
.end method

.method public setFrameDuration(I)V
    .locals 0
    .param p1, "frameDuration"    # I

    .prologue
    .line 115
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->frameDuration:I

    .line 116
    return-void
.end method

.method public setNumberOfFrames(I)V
    .locals 0
    .param p1, "numberOfFrames"    # I

    .prologue
    .line 123
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->numberOfFrames:I

    .line 124
    return-void
.end method

.method public setReserved1(I)V
    .locals 0
    .param p1, "reserved1"    # I

    .prologue
    .line 131
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->reserved1:I

    .line 132
    return-void
.end method

.method public setReserved2(I)V
    .locals 0
    .param p1, "reserved2"    # I

    .prologue
    .line 139
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->reserved2:I

    .line 140
    return-void
.end method

.method public setRest([B)V
    .locals 0
    .param p1, "rest"    # [B

    .prologue
    .line 155
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->rest:[B

    .line 156
    return-void
.end method

.method public setTimeScale(I)V
    .locals 0
    .param p1, "timeScale"    # I

    .prologue
    .line 107
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->timeScale:I

    .line 108
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TimeCodeBox{timeScale="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->timeScale:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", frameDuration="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->frameDuration:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", numberOfFrames="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->numberOfFrames:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", reserved1="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->reserved1:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", reserved2="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->reserved2:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", flags="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TimeCodeBox;->flags:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
