.class public abstract Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDataBox;
.source "AppleVariableSignedIntegerBox.java"


# instance fields
.field intLength:I

.field value:J


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 13
    const/16 v0, 0xf

    invoke-direct {p0, p1, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDataBox;-><init>(Ljava/lang/String;I)V

    .line 17
    const/4 v0, 0x1

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;->intLength:I

    .line 14
    return-void
.end method


# virtual methods
.method protected getDataLength()I
    .locals 1

    .prologue
    .line 68
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;->intLength:I

    return v0
.end method

.method public getIntLength()I
    .locals 1

    .prologue
    .line 20
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;->intLength:I

    return v0
.end method

.method public getValue()J
    .locals 2

    .prologue
    .line 29
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;->isParsed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 31
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;->parseDetails()V

    .line 33
    :cond_0
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;->value:J

    return-wide v0
.end method

.method protected parseData(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "data"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 61
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    .line 62
    .local v0, "intLength":I
    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReaderVariable;->read(Ljava/nio/ByteBuffer;I)J

    move-result-wide v2

    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;->value:J

    .line 63
    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;->intLength:I

    .line 64
    return-void
.end method

.method public setIntLength(I)V
    .locals 0
    .param p1, "intLength"    # I

    .prologue
    .line 24
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;->intLength:I

    .line 25
    return-void
.end method

.method public setValue(J)V
    .locals 5
    .param p1, "value"    # J

    .prologue
    const/4 v3, 0x3

    const/4 v2, 0x2

    .line 38
    const-wide/16 v0, 0x7f

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    const-wide/16 v0, -0x80

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    .line 39
    const/4 v0, 0x1

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;->intLength:I

    .line 48
    :goto_0
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;->value:J

    .line 49
    return-void

    .line 40
    :cond_0
    const-wide/16 v0, 0x7fff

    cmp-long v0, p1, v0

    if-gtz v0, :cond_1

    const-wide/16 v0, -0x8000

    cmp-long v0, p1, v0

    if-lez v0, :cond_1

    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;->intLength:I

    if-ge v0, v2, :cond_1

    .line 41
    iput v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;->intLength:I

    goto :goto_0

    .line 42
    :cond_1
    const-wide/32 v0, 0x7fffff

    cmp-long v0, p1, v0

    if-gtz v0, :cond_2

    const-wide/32 v0, -0x800000

    cmp-long v0, p1, v0

    if-lez v0, :cond_2

    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;->intLength:I

    if-ge v0, v3, :cond_2

    .line 43
    iput v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;->intLength:I

    goto :goto_0

    .line 45
    :cond_2
    const/4 v0, 0x4

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;->intLength:I

    goto :goto_0
.end method

.method protected writeData()[B
    .locals 4

    .prologue
    .line 53
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;->getDataLength()I

    move-result v1

    .line 54
    .local v1, "dLength":I
    new-array v2, v1, [B

    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 55
    .local v0, "b":Ljava/nio/ByteBuffer;
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleVariableSignedIntegerBox;->value:J

    invoke-static {v2, v3, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriterVariable;->write(JLjava/nio/ByteBuffer;I)V

    .line 56
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    return-object v2
.end method
