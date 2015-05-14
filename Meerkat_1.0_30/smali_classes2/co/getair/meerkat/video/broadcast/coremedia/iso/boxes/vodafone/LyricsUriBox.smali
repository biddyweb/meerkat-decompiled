.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/LyricsUriBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "LyricsUriBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "lrcu"


# instance fields
.field private lyricsUri:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    const-string v0, "lrcu"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 37
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 53
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/LyricsUriBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 54
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/LyricsUriBox;->lyricsUri:Ljava/lang/String;

    .line 55
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 59
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/LyricsUriBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 60
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/LyricsUriBox;->lyricsUri:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 61
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 62
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 48
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/LyricsUriBox;->lyricsUri:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x5

    int-to-long v0, v0

    return-wide v0
.end method

.method public getLyricsUri()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/LyricsUriBox;->lyricsUri:Ljava/lang/String;

    return-object v0
.end method

.method public setLyricsUri(Ljava/lang/String;)V
    .locals 0
    .param p1, "lyricsUri"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/LyricsUriBox;->lyricsUri:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "LyricsUriBox[lyricsUri="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/vodafone/LyricsUriBox;->getLyricsUri()Ljava/lang/String;

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
