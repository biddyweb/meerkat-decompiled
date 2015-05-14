.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "SampleToChunkBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;
    }
.end annotation


# static fields
.field public static final TYPE:Ljava/lang/String; = "stsc"


# instance fields
.field entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    const-string v0, "stsc"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 39
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;->entries:Ljava/util/List;

    .line 45
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 10
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 61
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 63
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v0

    .line 64
    .local v0, "entryCount":I
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;->entries:Ljava/util/List;

    .line 65
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    if-ge v8, v0, :cond_0

    .line 66
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;->entries:Ljava/util/List;

    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;

    .line 67
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    .line 68
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    .line 69
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v6

    invoke-direct/range {v1 .. v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;-><init>(JJJ)V

    .line 66
    invoke-interface {v9, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 71
    :cond_0
    return-void
.end method

.method public blowup(I)[J
    .locals 10
    .param p1, "chunkCount"    # I

    .prologue
    .line 96
    new-array v4, p1, [J

    .line 97
    .local v4, "numberOfSamples":[J
    const/4 v3, 0x0

    .line 98
    .local v3, "j":I
    new-instance v5, Ljava/util/LinkedList;

    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;->entries:Ljava/util/List;

    invoke-direct {v5, v6}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 99
    .local v5, "sampleToChunkEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;>;"
    invoke-static {v5}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 100
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 101
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;>;"
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;

    .line 103
    .local v0, "currentEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;
    array-length v1, v4

    .local v1, "i":I
    :goto_0
    const/4 v6, 0x1

    if-le v1, v6, :cond_1

    .line 104
    add-int/lit8 v6, v1, -0x1

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;->getSamplesPerChunk()J

    move-result-wide v8

    aput-wide v8, v4, v6

    .line 105
    int-to-long v6, v1

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;->getFirstChunk()J

    move-result-wide v8

    cmp-long v6, v6, v8

    if-nez v6, :cond_0

    .line 106
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "currentEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;

    .line 103
    .restart local v0    # "currentEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 109
    :cond_1
    const/4 v6, 0x0

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;->getSamplesPerChunk()J

    move-result-wide v8

    aput-wide v8, v4, v6

    .line 110
    return-object v4
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 75
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 76
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    int-to-long v2, v1

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 77
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;

    .line 78
    .local v0, "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;->getFirstChunk()J

    move-result-wide v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 79
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;->getSamplesPerChunk()J

    move-result-wide v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 80
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;->getSampleDescriptionIndex()J

    move-result-wide v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    goto :goto_0

    .line 82
    .end local v0    # "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;
    :cond_0
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 56
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0xc

    add-int/lit8 v0, v0, 0x8

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
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;->entries:Ljava/util/List;

    return-object v0
.end method

.method public setEntries(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p1, "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;>;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;->entries:Ljava/util/List;

    .line 53
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SampleToChunkBox[entryCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
