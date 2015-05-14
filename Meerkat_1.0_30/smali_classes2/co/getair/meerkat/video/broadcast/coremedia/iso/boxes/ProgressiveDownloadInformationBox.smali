.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "ProgressiveDownloadInformationBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox$Entry;
    }
.end annotation


# static fields
.field public static final TYPE:Ljava/lang/String; = "pdin"


# instance fields
.field entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox$Entry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    const-string v0, "pdin"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 18
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox;->entries:Ljava/util/List;

    .line 22
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 48
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 49
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox;->entries:Ljava/util/List;

    .line 50
    :goto_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    const/16 v2, 0x8

    if-lt v1, v2, :cond_0

    .line 51
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox$Entry;

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    invoke-direct {v0, v2, v3, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox$Entry;-><init>(JJ)V

    .line 52
    .local v0, "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox$Entry;
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox;->entries:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 54
    .end local v0    # "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox$Entry;
    :cond_0
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 31
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 32
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox$Entry;

    .line 33
    .local v0, "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox$Entry;
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox$Entry;->getRate()J

    move-result-wide v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 34
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox$Entry;->getInitialDelay()J

    move-result-wide v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    goto :goto_0

    .line 36
    .end local v0    # "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox$Entry;
    :cond_0
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 26
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x8

    add-int/lit8 v0, v0, 0x4

    int-to-long v0, v0

    return-wide v0
.end method

.method public getEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 39
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox;->entries:Ljava/util/List;

    return-object v0
.end method

.method public setEntries(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox$Entry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p1, "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox$Entry;>;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox;->entries:Ljava/util/List;

    .line 44
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 113
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ProgressiveDownloadInfoBox{entries="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProgressiveDownloadInformationBox;->entries:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
