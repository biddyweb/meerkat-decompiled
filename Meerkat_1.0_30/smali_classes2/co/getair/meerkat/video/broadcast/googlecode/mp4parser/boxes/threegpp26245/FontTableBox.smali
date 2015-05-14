.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "FontTableBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;
    }
.end annotation


# static fields
.field public static final TYPE:Ljava/lang/String; = "ftab"


# instance fields
.field entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    const-string v0, "ftab"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 18
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox;->entries:Ljava/util/List;

    .line 22
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 36
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v2

    .line 37
    .local v2, "numberOfRecords":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 38
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;-><init>()V

    .line 39
    .local v0, "fr":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;
    invoke-virtual {v0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;->parse(Ljava/nio/ByteBuffer;)V

    .line 40
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox;->entries:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 42
    .end local v0    # "fr":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;
    :cond_0
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 3
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 46
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {p1, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 47
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;

    .line 48
    .local v0, "record":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;
    invoke-virtual {v0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;->getContent(Ljava/nio/ByteBuffer;)V

    goto :goto_0

    .line 50
    .end local v0    # "record":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;
    :cond_0
    return-void
.end method

.method protected getContentSize()J
    .locals 4

    .prologue
    .line 26
    const/4 v1, 0x2

    .line 27
    .local v1, "size":I
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;

    .line 28
    .local v0, "fontRecord":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;->getSize()I

    move-result v3

    add-int/2addr v1, v3

    .line 29
    goto :goto_0

    .line 30
    .end local v0    # "fontRecord":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;
    :cond_0
    int-to-long v2, v1

    return-wide v2
.end method

.method public getEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;",
            ">;"
        }
    .end annotation

    .prologue
    .line 53
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox;->entries:Ljava/util/List;

    return-object v0
.end method

.method public setEntries(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p1, "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;>;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox;->entries:Ljava/util/List;

    .line 58
    return-void
.end method
