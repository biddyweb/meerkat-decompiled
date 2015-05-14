.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/AlbumArtistBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "AlbumArtistBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "albr"


# instance fields
.field private albumArtist:Ljava/lang/String;

.field private language:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    const-string v0, "albr"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 40
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 64
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/AlbumArtistBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 65
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readIso639(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/AlbumArtistBox;->language:Ljava/lang/String;

    .line 66
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/AlbumArtistBox;->albumArtist:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public getAlbumArtist()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/AlbumArtistBox;->albumArtist:Ljava/lang/String;

    return-object v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 70
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/AlbumArtistBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 71
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/AlbumArtistBox;->language:Ljava/lang/String;

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeIso639(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 72
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/AlbumArtistBox;->albumArtist:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 73
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 74
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 59
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/AlbumArtistBox;->albumArtist:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x6

    add-int/lit8 v0, v0, 0x1

    int-to-long v0, v0

    return-wide v0
.end method

.method public getLanguage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/AlbumArtistBox;->language:Ljava/lang/String;

    return-object v0
.end method

.method public setAlbumArtist(Ljava/lang/String;)V
    .locals 0
    .param p1, "albumArtist"    # Ljava/lang/String;

    .prologue
    .line 55
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/AlbumArtistBox;->albumArtist:Ljava/lang/String;

    .line 56
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .locals 0
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 51
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/AlbumArtistBox;->language:Ljava/lang/String;

    .line 52
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AlbumArtistBox[language="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/AlbumArtistBox;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";albumArtist="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/AlbumArtistBox;->getAlbumArtist()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
