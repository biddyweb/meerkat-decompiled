.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "LocationInformationBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "loci"


# instance fields
.field private additionalNotes:Ljava/lang/String;

.field private altitude:D

.field private astronomicalBody:Ljava/lang/String;

.field private language:Ljava/lang/String;

.field private latitude:D

.field private longitude:D

.field private name:Ljava/lang/String;

.field private role:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    const-string v0, "loci"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 18
    const-string v0, ""

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->name:Ljava/lang/String;

    .line 23
    const-string v0, ""

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->astronomicalBody:Ljava/lang/String;

    .line 24
    const-string v0, ""

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->additionalNotes:Ljava/lang/String;

    .line 28
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 100
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 101
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readIso639(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->language:Ljava/lang/String;

    .line 102
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->name:Ljava/lang/String;

    .line 103
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->role:I

    .line 104
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readFixedPoint1616(Ljava/nio/ByteBuffer;)D

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->longitude:D

    .line 105
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readFixedPoint1616(Ljava/nio/ByteBuffer;)D

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->latitude:D

    .line 106
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readFixedPoint1616(Ljava/nio/ByteBuffer;)D

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->altitude:D

    .line 107
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->astronomicalBody:Ljava/lang/String;

    .line 108
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->additionalNotes:Ljava/lang/String;

    .line 109
    return-void
.end method

.method public getAdditionalNotes()Ljava/lang/String;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->additionalNotes:Ljava/lang/String;

    return-object v0
.end method

.method public getAltitude()D
    .locals 2

    .prologue
    .line 71
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->altitude:D

    return-wide v0
.end method

.method public getAstronomicalBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->astronomicalBody:Ljava/lang/String;

    return-object v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 3
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v2, 0x0

    .line 114
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 115
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->language:Ljava/lang/String;

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeIso639(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 116
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->name:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 117
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 118
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->role:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 119
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->longitude:D

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeFixedPoint1616(Ljava/nio/ByteBuffer;D)V

    .line 120
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->latitude:D

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeFixedPoint1616(Ljava/nio/ByteBuffer;D)V

    .line 121
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->altitude:D

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeFixedPoint1616(Ljava/nio/ByteBuffer;D)V

    .line 122
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->astronomicalBody:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 123
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 124
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->additionalNotes:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 125
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 126
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 95
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->name:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    array-length v0, v0

    add-int/lit8 v0, v0, 0x16

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->astronomicalBody:Ljava/lang/String;

    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v1

    array-length v1, v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->additionalNotes:Ljava/lang/String;

    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v1

    array-length v1, v1

    add-int/2addr v0, v1

    int-to-long v0, v0

    return-wide v0
.end method

.method public getLanguage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->language:Ljava/lang/String;

    return-object v0
.end method

.method public getLatitude()D
    .locals 2

    .prologue
    .line 63
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->latitude:D

    return-wide v0
.end method

.method public getLongitude()D
    .locals 2

    .prologue
    .line 55
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->longitude:D

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getRole()I
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->role:I

    return v0
.end method

.method public setAdditionalNotes(Ljava/lang/String;)V
    .locals 0
    .param p1, "additionalNotes"    # Ljava/lang/String;

    .prologue
    .line 91
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->additionalNotes:Ljava/lang/String;

    .line 92
    return-void
.end method

.method public setAltitude(D)V
    .locals 1
    .param p1, "altitude"    # D

    .prologue
    .line 75
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->altitude:D

    .line 76
    return-void
.end method

.method public setAstronomicalBody(Ljava/lang/String;)V
    .locals 0
    .param p1, "astronomicalBody"    # Ljava/lang/String;

    .prologue
    .line 83
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->astronomicalBody:Ljava/lang/String;

    .line 84
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .locals 0
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 35
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->language:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public setLatitude(D)V
    .locals 1
    .param p1, "latitude"    # D

    .prologue
    .line 67
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->latitude:D

    .line 68
    return-void
.end method

.method public setLongitude(D)V
    .locals 1
    .param p1, "longitude"    # D

    .prologue
    .line 59
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->longitude:D

    .line 60
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 43
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->name:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public setRole(I)V
    .locals 0
    .param p1, "role"    # I

    .prologue
    .line 51
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/threegpp26244/LocationInformationBox;->role:I

    .line 52
    return-void
.end method
