.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "SegmentIndexBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;
    }
.end annotation


# static fields
.field public static final TYPE:Ljava/lang/String; = "sidx"


# instance fields
.field earliestPresentationTime:J

.field entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;",
            ">;"
        }
    .end annotation
.end field

.field firstOffset:J

.field referenceId:J

.field reserved:I

.field timeScale:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 55
    const-string v0, "sidx"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->entries:Ljava/util/List;

    .line 56
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 7
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v6, 0x1

    .line 101
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 102
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    iput-wide v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->referenceId:J

    .line 103
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    iput-wide v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->timeScale:J

    .line 104
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->getVersion()I

    move-result v4

    if-nez v4, :cond_0

    .line 105
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    iput-wide v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->earliestPresentationTime:J

    .line 106
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    iput-wide v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->firstOffset:J

    .line 111
    :goto_0
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v4

    iput v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->reserved:I

    .line 112
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v3

    .line 113
    .local v3, "numEntries":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v3, :cond_1

    .line 114
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;

    invoke-direct {v0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    .line 115
    .local v0, "b":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;-><init>()V

    .line 116
    .local v1, "e":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;
    invoke-virtual {v0, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    int-to-byte v4, v4

    invoke-virtual {v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;->setReferenceType(B)V

    .line 117
    const/16 v4, 0x1f

    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    invoke-virtual {v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;->setReferencedSize(I)V

    .line 118
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;->setSubsegmentDuration(J)V

    .line 119
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;

    .end local v0    # "b":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;
    invoke-direct {v0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    .line 120
    .restart local v0    # "b":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;
    invoke-virtual {v0, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    int-to-byte v4, v4

    invoke-virtual {v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;->setStartsWithSap(B)V

    .line 121
    const/4 v4, 0x3

    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    int-to-byte v4, v4

    invoke-virtual {v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;->setSapType(B)V

    .line 122
    const/16 v4, 0x1c

    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    invoke-virtual {v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;->setSapDeltaTime(I)V

    .line 123
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->entries:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 108
    .end local v0    # "b":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;
    .end local v1    # "e":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;
    .end local v2    # "i":I
    .end local v3    # "numEntries":I
    :cond_0
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt64(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    iput-wide v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->earliestPresentationTime:J

    .line 109
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt64(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    iput-wide v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->firstOffset:J

    goto :goto_0

    .line 125
    .restart local v2    # "i":I
    .restart local v3    # "numEntries":I
    :cond_1
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 7
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v6, 0x1

    .line 74
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 75
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->referenceId:J

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 76
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->timeScale:J

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 77
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->getVersion()I

    move-result v2

    if-nez v2, :cond_0

    .line 78
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->earliestPresentationTime:J

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 79
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->firstOffset:J

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 84
    :goto_0
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->reserved:I

    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 85
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 86
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;

    .line 87
    .local v1, "entry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;

    invoke-direct {v0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    .line 88
    .local v0, "b":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;
    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;->getReferenceType()B

    move-result v3

    invoke-virtual {v0, v3, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 89
    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;->getReferencedSize()I

    move-result v3

    const/16 v4, 0x1f

    invoke-virtual {v0, v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 90
    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;->getSubsegmentDuration()J

    move-result-wide v4

    invoke-static {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 91
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;

    .end local v0    # "b":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;
    invoke-direct {v0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    .line 92
    .restart local v0    # "b":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;
    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;->getStartsWithSap()B

    move-result v3

    invoke-virtual {v0, v3, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 93
    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;->getSapType()B

    move-result v3

    const/4 v4, 0x3

    invoke-virtual {v0, v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 94
    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;->getSapDeltaTime()I

    move-result v3

    const/16 v4, 0x1c

    invoke-virtual {v0, v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    goto :goto_1

    .line 81
    .end local v0    # "b":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;
    .end local v1    # "entry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;
    :cond_0
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->earliestPresentationTime:J

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    .line 82
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->firstOffset:J

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    goto :goto_0

    .line 97
    :cond_1
    return-void
.end method

.method protected getContentSize()J
    .locals 6

    .prologue
    const-wide/16 v2, 0x4

    const-wide/16 v4, 0x2

    .line 60
    const-wide/16 v0, 0x4

    .line 61
    .local v0, "size":J
    add-long/2addr v0, v2

    .line 62
    add-long/2addr v0, v2

    .line 63
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->getVersion()I

    move-result v2

    if-nez v2, :cond_0

    const-wide/16 v2, 0x8

    :goto_0
    add-long/2addr v0, v2

    .line 64
    add-long/2addr v0, v4

    .line 65
    add-long/2addr v0, v4

    .line 67
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    mul-int/lit8 v2, v2, 0xc

    int-to-long v2, v2

    add-long/2addr v0, v2

    .line 69
    return-wide v0

    .line 63
    :cond_0
    const-wide/16 v2, 0x10

    goto :goto_0
.end method

.method public getEarliestPresentationTime()J
    .locals 2

    .prologue
    .line 153
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->earliestPresentationTime:J

    return-wide v0
.end method

.method public getEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 129
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->entries:Ljava/util/List;

    return-object v0
.end method

.method public getFirstOffset()J
    .locals 2

    .prologue
    .line 161
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->firstOffset:J

    return-wide v0
.end method

.method public getReferenceId()J
    .locals 2

    .prologue
    .line 137
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->referenceId:J

    return-wide v0
.end method

.method public getReserved()I
    .locals 1

    .prologue
    .line 169
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->reserved:I

    return v0
.end method

.method public getTimeScale()J
    .locals 2

    .prologue
    .line 145
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->timeScale:J

    return-wide v0
.end method

.method public setEarliestPresentationTime(J)V
    .locals 1
    .param p1, "earliestPresentationTime"    # J

    .prologue
    .line 157
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->earliestPresentationTime:J

    .line 158
    return-void
.end method

.method public setEntries(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 133
    .local p1, "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox$Entry;>;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->entries:Ljava/util/List;

    .line 134
    return-void
.end method

.method public setFirstOffset(J)V
    .locals 1
    .param p1, "firstOffset"    # J

    .prologue
    .line 165
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->firstOffset:J

    .line 166
    return-void
.end method

.method public setReferenceId(J)V
    .locals 1
    .param p1, "referenceId"    # J

    .prologue
    .line 141
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->referenceId:J

    .line 142
    return-void
.end method

.method public setReserved(I)V
    .locals 0
    .param p1, "reserved"    # I

    .prologue
    .line 173
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->reserved:I

    .line 174
    return-void
.end method

.method public setTimeScale(J)V
    .locals 1
    .param p1, "timeScale"    # J

    .prologue
    .line 149
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->timeScale:J

    .line 150
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 299
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SegmentIndexBox{entries="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->entries:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", referenceId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->referenceId:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", timeScale="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->timeScale:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", earliestPresentationTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->earliestPresentationTime:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", firstOffset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->firstOffset:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", reserved="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26244/SegmentIndexBox;->reserved:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
