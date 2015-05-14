.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "SubSampleInformationBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;
    }
.end annotation


# static fields
.field public static final TYPE:Ljava/lang/String; = "subs"


# instance fields
.field private entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    const-string v0, "subs"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;->entries:Ljava/util/List;

    .line 48
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 10
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 81
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 83
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    .line 85
    .local v2, "entryCount":J
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    int-to-long v8, v1

    cmp-long v7, v8, v2

    if-gez v7, :cond_2

    .line 86
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;-><init>()V

    .line 87
    .local v0, "SubSampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    invoke-virtual {v0, v8, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;->setSampleDelta(J)V

    .line 88
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v5

    .line 89
    .local v5, "subsampleCount":I
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_1
    if-ge v4, v5, :cond_1

    .line 90
    new-instance v6, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;

    invoke-direct {v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;-><init>()V

    .line 91
    .local v6, "subsampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;->getVersion()I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_0

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    :goto_2
    invoke-virtual {v6, v8, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;->setSubsampleSize(J)V

    .line 92
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v7

    invoke-virtual {v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;->setSubsamplePriority(I)V

    .line 93
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v7

    invoke-virtual {v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;->setDiscardable(I)V

    .line 94
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;->setReserved(J)V

    .line 95
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;->getSubsampleEntries()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 91
    :cond_0
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v7

    int-to-long v8, v7

    goto :goto_2

    .line 97
    .end local v6    # "subsampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;
    :cond_1
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;->entries:Ljava/util/List;

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 100
    .end local v0    # "SubSampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;
    .end local v4    # "j":I
    .end local v5    # "subsampleCount":I
    :cond_2
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 8
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 104
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 105
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;->entries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    int-to-long v4, v3

    invoke-static {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 106
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;->entries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;

    .line 107
    .local v0, "subSampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;->getSampleDelta()J

    move-result-wide v4

    invoke-static {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 108
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;->getSubsampleCount()I

    move-result v4

    invoke-static {p1, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 109
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;->getSubsampleEntries()Ljava/util/List;

    move-result-object v1

    .line 110
    .local v1, "subsampleEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;

    .line 111
    .local v2, "subsampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;->getVersion()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1

    .line 112
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;->getSubsampleSize()J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 116
    :goto_1
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;->getSubsamplePriority()I

    move-result v5

    invoke-static {p1, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 117
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;->getDiscardable()I

    move-result v5

    invoke-static {p1, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 118
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;->getReserved()J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    goto :goto_0

    .line 114
    :cond_1
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;->getSubsampleSize()J

    move-result-wide v6

    invoke-static {v6, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v5

    invoke-static {p1, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    goto :goto_1

    .line 121
    .end local v0    # "subSampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;
    .end local v1    # "subsampleEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;>;"
    .end local v2    # "subsampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;
    :cond_2
    return-void
.end method

.method protected getContentSize()J
    .locals 12

    .prologue
    const-wide/16 v10, 0x4

    const-wide/16 v8, 0x2

    .line 60
    const-wide/16 v2, 0x8

    .line 62
    .local v2, "size":J
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;->entries:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;

    .line 63
    .local v0, "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;
    add-long/2addr v2, v10

    .line 64
    add-long/2addr v2, v8

    .line 65
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;->getSubsampleEntries()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v1, v5, :cond_0

    .line 67
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;->getVersion()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1

    .line 68
    add-long/2addr v2, v10

    .line 72
    :goto_1
    add-long/2addr v2, v8

    .line 73
    add-long/2addr v2, v10

    .line 65
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 70
    :cond_1
    add-long/2addr v2, v8

    goto :goto_1

    .line 76
    .end local v0    # "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;
    .end local v1    # "j":I
    :cond_2
    return-wide v2
.end method

.method public getEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 51
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;->entries:Ljava/util/List;

    return-object v0
.end method

.method public setEntries(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p1, "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;>;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;->entries:Ljava/util/List;

    .line 56
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 125
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SubSampleInformationBox{entryCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;->entries:Ljava/util/List;

    .line 126
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", entries="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;->entries:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
