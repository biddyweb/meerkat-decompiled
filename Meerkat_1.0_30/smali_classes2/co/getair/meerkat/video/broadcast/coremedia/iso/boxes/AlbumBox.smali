.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "AlbumBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "albm"


# instance fields
.field private albumTitle:Ljava/lang/String;

.field private language:Ljava/lang/String;

.field private trackNumber:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    const-string v0, "albm"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 42
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 81
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 82
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readIso639(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->language:Ljava/lang/String;

    .line 83
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->albumTitle:Ljava/lang/String;

    .line 85
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-lez v0, :cond_0

    .line 86
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->trackNumber:I

    .line 90
    :goto_0
    return-void

    .line 88
    :cond_0
    const/4 v0, -0x1

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->trackNumber:I

    goto :goto_0
.end method

.method public getAlbumTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->albumTitle:Ljava/lang/String;

    return-object v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 94
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 95
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->language:Ljava/lang/String;

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeIso639(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 96
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->albumTitle:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 97
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 98
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->trackNumber:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 99
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->trackNumber:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 101
    :cond_0
    return-void
.end method

.method protected getContentSize()J
    .locals 3

    .prologue
    .line 76
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->albumTitle:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x6

    add-int/lit8 v1, v0, 0x1

    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->trackNumber:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    const/4 v0, 0x0

    :goto_0
    add-int/2addr v0, v1

    int-to-long v0, v0

    return-wide v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getLanguage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->language:Ljava/lang/String;

    return-object v0
.end method

.method public getTrackNumber()I
    .locals 1

    .prologue
    .line 60
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->trackNumber:I

    return v0
.end method

.method public setAlbumTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "albumTitle"    # Ljava/lang/String;

    .prologue
    .line 68
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->albumTitle:Ljava/lang/String;

    .line 69
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .locals 0
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 64
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->language:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public setTrackNumber(I)V
    .locals 0
    .param p1, "trackNumber"    # I

    .prologue
    .line 72
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->trackNumber:I

    .line 73
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const-string v1, "AlbumBox[language="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ";"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    const-string v1, "albumTitle="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->getAlbumTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->trackNumber:I

    if-ltz v1, :cond_0

    .line 108
    const-string v1, ";trackNumber="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AlbumBox;->getTrackNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    :cond_0
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
