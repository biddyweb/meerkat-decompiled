.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "ContentInformationBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox$BrandEntry;
    }
.end annotation


# static fields
.field public static final TYPE:Ljava/lang/String; = "cinf"


# instance fields
.field brandEntries:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field codecs:Ljava/lang/String;

.field idEntries:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field languages:Ljava/lang/String;

.field mimeSubtypeName:Ljava/lang/String;

.field profileLevelIdc:Ljava/lang/String;

.field protection:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 50
    const-string v0, "cinf"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 46
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->brandEntries:Ljava/util/Map;

    .line 47
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->idEntries:Ljava/util/Map;

    .line 51
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 7
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 98
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 99
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->mimeSubtypeName:Ljava/lang/String;

    .line 100
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->profileLevelIdc:Ljava/lang/String;

    .line 101
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->codecs:Ljava/lang/String;

    .line 102
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->protection:Ljava/lang/String;

    .line 103
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->languages:Ljava/lang/String;

    .line 104
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v0

    .local v0, "brandEntryCount":I
    move v1, v0

    .line 105
    .end local v0    # "brandEntryCount":I
    .local v1, "brandEntryCount":I
    :goto_0
    add-int/lit8 v0, v1, -0x1

    .end local v1    # "brandEntryCount":I
    .restart local v0    # "brandEntryCount":I
    if-lez v1, :cond_0

    .line 106
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->brandEntries:Ljava/util/Map;

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v5

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v1, v0

    .end local v0    # "brandEntryCount":I
    .restart local v1    # "brandEntryCount":I
    goto :goto_0

    .line 108
    .end local v1    # "brandEntryCount":I
    .restart local v0    # "brandEntryCount":I
    :cond_0
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v2

    .local v2, "idEntryCount":I
    move v3, v2

    .line 109
    .end local v2    # "idEntryCount":I
    .local v3, "idEntryCount":I
    :goto_1
    add-int/lit8 v2, v3, -0x1

    .end local v3    # "idEntryCount":I
    .restart local v2    # "idEntryCount":I
    if-lez v3, :cond_1

    .line 110
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->idEntries:Ljava/util/Map;

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v5

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v3, v2

    .end local v2    # "idEntryCount":I
    .restart local v3    # "idEntryCount":I
    goto :goto_1

    .line 112
    .end local v3    # "idEntryCount":I
    .restart local v2    # "idEntryCount":I
    :cond_1
    return-void
.end method

.method public getBrandEntries()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 185
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->brandEntries:Ljava/util/Map;

    return-object v0
.end method

.method public getCodecs()Ljava/lang/String;
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->codecs:Ljava/lang/String;

    return-object v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 77
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 78
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->mimeSubtypeName:Ljava/lang/String;

    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeZeroTermUtf8String(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 79
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->profileLevelIdc:Ljava/lang/String;

    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeZeroTermUtf8String(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 80
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->codecs:Ljava/lang/String;

    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeZeroTermUtf8String(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 81
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->protection:Ljava/lang/String;

    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeZeroTermUtf8String(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 82
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->languages:Ljava/lang/String;

    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeZeroTermUtf8String(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 83
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->brandEntries:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 84
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->brandEntries:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 85
    .local v0, "brandEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeZeroTermUtf8String(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 86
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeZeroTermUtf8String(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    goto :goto_0

    .line 88
    .end local v0    # "brandEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->idEntries:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 89
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->idEntries:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 90
    .local v1, "idEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeZeroTermUtf8String(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 91
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeZeroTermUtf8String(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    goto :goto_1

    .line 94
    .end local v1    # "idEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    return-void
.end method

.method protected getContentSize()J
    .locals 10

    .prologue
    const-wide/16 v8, 0x1

    .line 55
    const-wide/16 v2, 0x4

    .line 56
    .local v2, "size":J
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->mimeSubtypeName:Ljava/lang/String;

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    int-to-long v4, v4

    add-long/2addr v2, v4

    .line 57
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->profileLevelIdc:Ljava/lang/String;

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    int-to-long v4, v4

    add-long/2addr v2, v4

    .line 58
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->codecs:Ljava/lang/String;

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    int-to-long v4, v4

    add-long/2addr v2, v4

    .line 59
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->protection:Ljava/lang/String;

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    int-to-long v4, v4

    add-long/2addr v2, v4

    .line 60
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->languages:Ljava/lang/String;

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    int-to-long v4, v4

    add-long/2addr v2, v4

    .line 61
    add-long/2addr v2, v8

    .line 62
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->brandEntries:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 63
    .local v0, "brandEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    int-to-long v6, v4

    add-long/2addr v2, v6

    .line 64
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    int-to-long v6, v4

    add-long/2addr v2, v6

    .line 65
    goto :goto_0

    .line 66
    .end local v0    # "brandEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    add-long/2addr v2, v8

    .line 67
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->idEntries:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 68
    .local v1, "idEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    int-to-long v6, v4

    add-long/2addr v2, v6

    .line 69
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    int-to-long v6, v4

    add-long/2addr v2, v6

    .line 71
    goto :goto_1

    .line 72
    .end local v1    # "idEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    return-wide v2
.end method

.method public getIdEntries()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 193
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->idEntries:Ljava/util/Map;

    return-object v0
.end method

.method public getLanguages()Ljava/lang/String;
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->languages:Ljava/lang/String;

    return-object v0
.end method

.method public getMimeSubtypeName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->mimeSubtypeName:Ljava/lang/String;

    return-object v0
.end method

.method public getProfileLevelIdc()Ljava/lang/String;
    .locals 1

    .prologue
    .line 153
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->profileLevelIdc:Ljava/lang/String;

    return-object v0
.end method

.method public getProtection()Ljava/lang/String;
    .locals 1

    .prologue
    .line 169
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->protection:Ljava/lang/String;

    return-object v0
.end method

.method public setBrandEntries(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 189
    .local p1, "brandEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->brandEntries:Ljava/util/Map;

    .line 190
    return-void
.end method

.method public setCodecs(Ljava/lang/String;)V
    .locals 0
    .param p1, "codecs"    # Ljava/lang/String;

    .prologue
    .line 165
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->codecs:Ljava/lang/String;

    .line 166
    return-void
.end method

.method public setIdEntries(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 197
    .local p1, "idEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->idEntries:Ljava/util/Map;

    .line 198
    return-void
.end method

.method public setLanguages(Ljava/lang/String;)V
    .locals 0
    .param p1, "languages"    # Ljava/lang/String;

    .prologue
    .line 181
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->languages:Ljava/lang/String;

    .line 182
    return-void
.end method

.method public setMimeSubtypeName(Ljava/lang/String;)V
    .locals 0
    .param p1, "mimeSubtypeName"    # Ljava/lang/String;

    .prologue
    .line 149
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->mimeSubtypeName:Ljava/lang/String;

    .line 150
    return-void
.end method

.method public setProfileLevelIdc(Ljava/lang/String;)V
    .locals 0
    .param p1, "profileLevelIdc"    # Ljava/lang/String;

    .prologue
    .line 157
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->profileLevelIdc:Ljava/lang/String;

    .line 158
    return-void
.end method

.method public setProtection(Ljava/lang/String;)V
    .locals 0
    .param p1, "protection"    # Ljava/lang/String;

    .prologue
    .line 173
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/ContentInformationBox;->protection:Ljava/lang/String;

    .line 174
    return-void
.end method
