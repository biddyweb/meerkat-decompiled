.class public abstract Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/Utf8AppleDataBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDataBox;
.source "Utf8AppleDataBox.java"


# instance fields
.field value:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 17
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDataBox;-><init>(Ljava/lang/String;I)V

    .line 18
    return-void
.end method


# virtual methods
.method protected getDataLength()I
    .locals 2

    .prologue
    .line 40
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/Utf8AppleDataBox;->value:Ljava/lang/String;

    const-string v1, "UTF-8"

    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/Utf8AppleDataBox;->isParsed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 24
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/Utf8AppleDataBox;->parseDetails()V

    .line 26
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/Utf8AppleDataBox;->value:Ljava/lang/String;

    return-object v0
.end method

.method protected parseData(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "data"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 45
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/Utf8AppleDataBox;->value:Ljava/lang/String;

    .line 46
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 30
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/Utf8AppleDataBox;->value:Ljava/lang/String;

    .line 31
    return-void
.end method

.method public writeData()[B
    .locals 1
    .annotation runtime Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/annotations/DoNotParseDetail;
    .end annotation

    .prologue
    .line 35
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/Utf8AppleDataBox;->value:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method
