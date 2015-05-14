.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "TrackFragmentRandomAccessBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;
    }
.end annotation


# static fields
.field public static final TYPE:Ljava/lang/String; = "tfra"


# instance fields
.field private entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private lengthSizeOfSampleNum:I

.field private lengthSizeOfTrafNum:I

.field private lengthSizeOfTrunNum:I

.field private reserved:I

.field private trackId:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x2

    .line 66
    const-string v0, "tfra"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 60
    iput v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfTrafNum:I

    .line 61
    iput v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfTrunNum:I

    .line 62
    iput v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfSampleNum:I

    .line 63
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->entries:Ljava/util/List;

    .line 67
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 8
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 87
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 88
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v6

    iput-wide v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->trackId:J

    .line 89
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    .line 90
    .local v4, "temp":J
    const/4 v6, 0x6

    shr-long v6, v4, v6

    long-to-int v6, v6

    iput v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->reserved:I

    .line 91
    const-wide/16 v6, 0x3f

    and-long/2addr v6, v4

    long-to-int v6, v6

    shr-int/lit8 v6, v6, 0x4

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfTrafNum:I

    .line 92
    const-wide/16 v6, 0xc

    and-long/2addr v6, v4

    long-to-int v6, v6

    shr-int/lit8 v6, v6, 0x2

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfTrunNum:I

    .line 93
    const-wide/16 v6, 0x3

    and-long/2addr v6, v4

    long-to-int v6, v6

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfSampleNum:I

    .line 94
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    .line 96
    .local v2, "numberOfEntries":J
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->entries:Ljava/util/List;

    .line 98
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    int-to-long v6, v1

    cmp-long v6, v6, v2

    if-gez v6, :cond_1

    .line 99
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;-><init>()V

    .line 100
    .local v0, "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->getVersion()I

    move-result v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_0

    .line 101
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt64(Ljava/nio/ByteBuffer;)J

    move-result-wide v6

    # setter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->time:J
    invoke-static {v0, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->access$002(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;J)J

    .line 102
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt64(Ljava/nio/ByteBuffer;)J

    move-result-wide v6

    # setter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->moofOffset:J
    invoke-static {v0, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->access$102(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;J)J

    .line 107
    :goto_1
    iget v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfTrafNum:I

    invoke-static {p1, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReaderVariable;->read(Ljava/nio/ByteBuffer;I)J

    move-result-wide v6

    # setter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->trafNumber:J
    invoke-static {v0, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->access$202(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;J)J

    .line 108
    iget v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfTrunNum:I

    invoke-static {p1, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReaderVariable;->read(Ljava/nio/ByteBuffer;I)J

    move-result-wide v6

    # setter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->trunNumber:J
    invoke-static {v0, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->access$302(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;J)J

    .line 109
    iget v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfSampleNum:I

    invoke-static {p1, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReaderVariable;->read(Ljava/nio/ByteBuffer;I)J

    move-result-wide v6

    # setter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->sampleNumber:J
    invoke-static {v0, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->access$402(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;J)J

    .line 111
    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->entries:Ljava/util/List;

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 104
    :cond_0
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v6

    # setter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->time:J
    invoke-static {v0, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->access$002(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;J)J

    .line 105
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v6

    # setter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->moofOffset:J
    invoke-static {v0, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->access$102(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;J)J

    goto :goto_1

    .line 114
    .end local v0    # "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;
    :cond_1
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 7
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 119
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 120
    iget-wide v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->trackId:J

    invoke-static {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 122
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->reserved:I

    shl-int/lit8 v1, v1, 0x6

    int-to-long v2, v1

    .line 123
    .local v2, "temp":J
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfTrafNum:I

    add-int/lit8 v1, v1, -0x1

    and-int/lit8 v1, v1, 0x3

    shl-int/lit8 v1, v1, 0x4

    int-to-long v4, v1

    or-long/2addr v2, v4

    .line 124
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfTrunNum:I

    add-int/lit8 v1, v1, -0x1

    and-int/lit8 v1, v1, 0x3

    shl-int/lit8 v1, v1, 0x2

    int-to-long v4, v1

    or-long/2addr v2, v4

    .line 125
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfSampleNum:I

    add-int/lit8 v1, v1, -0x1

    and-int/lit8 v1, v1, 0x3

    int-to-long v4, v1

    or-long/2addr v2, v4

    .line 126
    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 127
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    int-to-long v4, v1

    invoke-static {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 129
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;

    .line 130
    .local v0, "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->getVersion()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    .line 131
    # getter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->time:J
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->access$000(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;)J

    move-result-wide v4

    invoke-static {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    .line 132
    # getter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->moofOffset:J
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->access$100(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;)J

    move-result-wide v4

    invoke-static {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    .line 137
    :goto_1
    # getter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->trafNumber:J
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->access$200(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;)J

    move-result-wide v4

    iget v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfTrafNum:I

    invoke-static {v4, v5, p1, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriterVariable;->write(JLjava/nio/ByteBuffer;I)V

    .line 138
    # getter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->trunNumber:J
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->access$300(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;)J

    move-result-wide v4

    iget v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfTrunNum:I

    invoke-static {v4, v5, p1, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriterVariable;->write(JLjava/nio/ByteBuffer;I)V

    .line 139
    # getter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->sampleNumber:J
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->access$400(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;)J

    move-result-wide v4

    iget v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfSampleNum:I

    invoke-static {v4, v5, p1, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriterVariable;->write(JLjava/nio/ByteBuffer;I)V

    goto :goto_0

    .line 134
    :cond_0
    # getter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->time:J
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->access$000(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;)J

    move-result-wide v4

    invoke-static {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 135
    # getter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->moofOffset:J
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;->access$100(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;)J

    move-result-wide v4

    invoke-static {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    goto :goto_1

    .line 142
    .end local v0    # "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;
    :cond_1
    return-void
.end method

.method protected getContentSize()J
    .locals 4

    .prologue
    .line 71
    const-wide/16 v0, 0x4

    .line 72
    .local v0, "contentSize":J
    const-wide/16 v2, 0xc

    add-long/2addr v0, v2

    .line 73
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->getVersion()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 74
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    mul-int/lit8 v2, v2, 0x10

    int-to-long v2, v2

    add-long/2addr v0, v2

    .line 78
    :goto_0
    iget v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfTrafNum:I

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->entries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    mul-int/2addr v2, v3

    int-to-long v2, v2

    add-long/2addr v0, v2

    .line 79
    iget v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfTrunNum:I

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->entries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    mul-int/2addr v2, v3

    int-to-long v2, v2

    add-long/2addr v0, v2

    .line 80
    iget v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfSampleNum:I

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->entries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    mul-int/2addr v2, v3

    int-to-long v2, v2

    add-long/2addr v0, v2

    .line 81
    return-wide v0

    .line 76
    :cond_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    mul-int/lit8 v2, v2, 0x8

    int-to-long v2, v2

    add-long/2addr v0, v2

    goto :goto_0
.end method

.method public getEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 186
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->entries:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getLengthSizeOfSampleNum()I
    .locals 1

    .prologue
    .line 178
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfSampleNum:I

    return v0
.end method

.method public getLengthSizeOfTrafNum()I
    .locals 1

    .prologue
    .line 170
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfTrafNum:I

    return v0
.end method

.method public getLengthSizeOfTrunNum()I
    .locals 1

    .prologue
    .line 174
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfTrunNum:I

    return v0
.end method

.method public getNumberOfEntries()J
    .locals 2

    .prologue
    .line 182
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public getReserved()I
    .locals 1

    .prologue
    .line 166
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->reserved:I

    return v0
.end method

.method public getTrackId()J
    .locals 2

    .prologue
    .line 162
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->trackId:J

    return-wide v0
.end method

.method public setEntries(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 190
    .local p1, "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;>;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->entries:Ljava/util/List;

    .line 191
    return-void
.end method

.method public setLengthSizeOfSampleNum(I)V
    .locals 0
    .param p1, "lengthSizeOfSampleNum"    # I

    .prologue
    .line 158
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfSampleNum:I

    .line 159
    return-void
.end method

.method public setLengthSizeOfTrafNum(I)V
    .locals 0
    .param p1, "lengthSizeOfTrafNum"    # I

    .prologue
    .line 150
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfTrafNum:I

    .line 151
    return-void
.end method

.method public setLengthSizeOfTrunNum(I)V
    .locals 0
    .param p1, "lengthSizeOfTrunNum"    # I

    .prologue
    .line 154
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->lengthSizeOfTrunNum:I

    .line 155
    return-void
.end method

.method public setTrackId(J)V
    .locals 1
    .param p1, "trackId"    # J

    .prologue
    .line 146
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->trackId:J

    .line 147
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 291
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TrackFragmentRandomAccessBox{trackId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->trackId:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", entries="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->entries:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
