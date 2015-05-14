.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "TrickPlayBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;
    }
.end annotation


# static fields
.field public static final TYPE:Ljava/lang/String; = "trik"


# instance fields
.field private entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    const-string v0, "trik"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox;->entries:Ljava/util/List;

    .line 31
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 3
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 89
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 90
    :goto_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-lez v0, :cond_0

    .line 91
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox;->entries:Ljava/util/List;

    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v2

    invoke-direct {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;-><init>(I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 93
    :cond_0
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 3
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 97
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 98
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;

    .line 99
    .local v0, "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;
    # getter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;->value:I
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;->access$000(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;)I

    move-result v2

    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    goto :goto_0

    .line 101
    .end local v0    # "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;
    :cond_0
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 84
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

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
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 38
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox;->entries:Ljava/util/List;

    return-object v0
.end method

.method public setEntries(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p1, "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;>;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox;->entries:Ljava/util/List;

    .line 35
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "TrickPlayBox"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    const-string v1, "{entries="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox;->entries:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 108
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 109
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
