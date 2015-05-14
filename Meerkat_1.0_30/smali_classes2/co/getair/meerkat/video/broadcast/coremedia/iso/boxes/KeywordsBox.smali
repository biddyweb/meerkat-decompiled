.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/KeywordsBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "KeywordsBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "kywd"


# instance fields
.field private keywords:[Ljava/lang/String;

.field private language:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    const-string v0, "kywd"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 38
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 66
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/KeywordsBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 67
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readIso639(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/KeywordsBox;->language:Ljava/lang/String;

    .line 68
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v1

    .line 69
    .local v1, "keywordCount":I
    new-array v2, v1, [Ljava/lang/String;

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/KeywordsBox;->keywords:[Ljava/lang/String;

    .line 70
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 71
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    .line 72
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/KeywordsBox;->keywords:[Ljava/lang/String;

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    .line 70
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 74
    :cond_0
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 5
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 78
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/KeywordsBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 79
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/KeywordsBox;->language:Ljava/lang/String;

    invoke-static {p1, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeIso639(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 80
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/KeywordsBox;->keywords:[Ljava/lang/String;

    array-length v1, v1

    invoke-static {p1, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 81
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/KeywordsBox;->keywords:[Ljava/lang/String;

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v0, v2, v1

    .line 82
    .local v0, "keyword":Ljava/lang/String;
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-static {p1, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 83
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 81
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 85
    .end local v0    # "keyword":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method protected getContentSize()J
    .locals 8

    .prologue
    .line 57
    const-wide/16 v0, 0x7

    .line 58
    .local v0, "contentSize":J
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/KeywordsBox;->keywords:[Ljava/lang/String;

    array-length v5, v4

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v5, :cond_0

    aget-object v2, v4, v3

    .line 59
    .local v2, "keyword":Ljava/lang/String;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    add-int/lit8 v6, v6, 0x1

    int-to-long v6, v6

    add-long/2addr v0, v6

    .line 58
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 61
    .end local v2    # "keyword":Ljava/lang/String;
    :cond_0
    return-wide v0
.end method

.method public getKeywords()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/KeywordsBox;->keywords:[Ljava/lang/String;

    return-object v0
.end method

.method public getLanguage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/KeywordsBox;->language:Ljava/lang/String;

    return-object v0
.end method

.method public setKeywords([Ljava/lang/String;)V
    .locals 0
    .param p1, "keywords"    # [Ljava/lang/String;

    .prologue
    .line 53
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/KeywordsBox;->keywords:[Ljava/lang/String;

    .line 54
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .locals 0
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 49
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/KeywordsBox;->language:Ljava/lang/String;

    .line 50
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 88
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 89
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const-string v2, "KeywordsBox[language="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/KeywordsBox;->getLanguage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 90
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/KeywordsBox;->keywords:[Ljava/lang/String;

    array-length v2, v2

    if-ge v1, v2, :cond_0

    .line 91
    const-string v2, ";keyword"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/KeywordsBox;->keywords:[Ljava/lang/String;

    aget-object v3, v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 90
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 93
    :cond_0
    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 94
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
