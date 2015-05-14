.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "SampleToGroupBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;
    }
.end annotation


# static fields
.field public static final TYPE:Ljava/lang/String; = "sbgp"


# instance fields
.field entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private groupingType:Ljava/lang/String;

.field private groupingTypeParameter:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 51
    const-string v0, "sbgp"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 48
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->entries:Ljava/util/List;

    .line 53
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 10
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 77
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 78
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->read4cc(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->groupingType:Ljava/lang/String;

    .line 79
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->getVersion()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    .line 80
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->read4cc(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->groupingTypeParameter:Ljava/lang/String;

    .line 82
    :cond_0
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    .local v0, "entryCount":J
    move-wide v2, v0

    .line 83
    .end local v0    # "entryCount":J
    .local v2, "entryCount":J
    :goto_0
    const-wide/16 v4, 0x1

    sub-long v0, v2, v4

    .end local v2    # "entryCount":J
    .restart local v0    # "entryCount":J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-lez v4, :cond_1

    .line 84
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->entries:Ljava/util/List;

    new-instance v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v6

    invoke-static {v6, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v6

    int-to-long v6, v6

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    invoke-static {v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v8

    invoke-direct {v5, v6, v7, v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;-><init>(JI)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-wide v2, v0

    .end local v0    # "entryCount":J
    .restart local v2    # "entryCount":J
    goto :goto_0

    .line 86
    .end local v2    # "entryCount":J
    .restart local v0    # "entryCount":J
    :cond_1
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 62
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 63
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->groupingType:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 64
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->getVersion()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 65
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->groupingTypeParameter:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 67
    :cond_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    int-to-long v2, v1

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 68
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;

    .line 69
    .local v0, "entry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;->getSampleCount()J

    move-result-wide v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 70
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;->getGroupDescriptionIndex()I

    move-result v2

    int-to-long v2, v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    goto :goto_0

    .line 73
    .end local v0    # "entry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;
    :cond_1
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 57
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->getVersion()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x8

    add-int/lit8 v0, v0, 0x10

    int-to-long v0, v0

    :goto_0
    return-wide v0

    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x8

    add-int/lit8 v0, v0, 0xc

    int-to-long v0, v0

    goto :goto_0
.end method

.method public getEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 167
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->entries:Ljava/util/List;

    return-object v0
.end method

.method public getGroupingType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->groupingType:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupingTypeParameter()Ljava/lang/String;
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->groupingTypeParameter:Ljava/lang/String;

    return-object v0
.end method

.method public setEntries(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 171
    .local p1, "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;>;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->entries:Ljava/util/List;

    .line 172
    return-void
.end method

.method public setGroupingType(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupingType"    # Ljava/lang/String;

    .prologue
    .line 155
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->groupingType:Ljava/lang/String;

    .line 156
    return-void
.end method

.method public setGroupingTypeParameter(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupingTypeParameter"    # Ljava/lang/String;

    .prologue
    .line 163
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->groupingTypeParameter:Ljava/lang/String;

    .line 164
    return-void
.end method
