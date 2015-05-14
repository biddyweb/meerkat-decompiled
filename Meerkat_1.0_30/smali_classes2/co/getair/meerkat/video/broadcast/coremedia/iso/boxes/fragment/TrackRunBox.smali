.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "TrackRunBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    }
.end annotation


# static fields
.field public static final TYPE:Ljava/lang/String; = "trun"


# instance fields
.field private dataOffset:I

.field private entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private firstSampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 142
    const-string v0, "trun"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->entries:Ljava/util/List;

    .line 143
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 207
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 208
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    .line 210
    .local v2, "sampleCount":J
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v4

    and-int/lit8 v4, v4, 0x1

    const/4 v5, 0x1

    if-ne v4, v5, :cond_5

    .line 211
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    invoke-static {v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v4

    iput v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->dataOffset:I

    .line 215
    :goto_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v4

    and-int/lit8 v4, v4, 0x4

    const/4 v5, 0x4

    if-ne v4, v5, :cond_0

    .line 216
    new-instance v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    invoke-direct {v4, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;-><init>(Ljava/nio/ByteBuffer;)V

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->firstSampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    .line 219
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    int-to-long v4, v1

    cmp-long v4, v4, v2

    if-gez v4, :cond_6

    .line 220
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;-><init>()V

    .line 221
    .local v0, "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v4

    and-int/lit16 v4, v4, 0x100

    const/16 v5, 0x100

    if-ne v4, v5, :cond_1

    .line 222
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    # setter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleDuration:J
    invoke-static {v0, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->access$002(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;J)J

    .line 224
    :cond_1
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v4

    and-int/lit16 v4, v4, 0x200

    const/16 v5, 0x200

    if-ne v4, v5, :cond_2

    .line 225
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    # setter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleSize:J
    invoke-static {v0, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->access$102(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;J)J

    .line 227
    :cond_2
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v4

    and-int/lit16 v4, v4, 0x400

    const/16 v5, 0x400

    if-ne v4, v5, :cond_3

    .line 228
    new-instance v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    invoke-direct {v4, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;-><init>(Ljava/nio/ByteBuffer;)V

    # setter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    invoke-static {v0, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->access$202(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    .line 230
    :cond_3
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v4

    and-int/lit16 v4, v4, 0x800

    const/16 v5, 0x800

    if-ne v4, v5, :cond_4

    .line 231
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v4

    int-to-long v4, v4

    # setter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleCompositionTimeOffset:J
    invoke-static {v0, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->access$302(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;J)J

    .line 233
    :cond_4
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->entries:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 219
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 213
    .end local v0    # "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    .end local v1    # "i":I
    :cond_5
    const/4 v4, -0x1

    iput v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->dataOffset:I

    goto :goto_0

    .line 236
    .restart local v1    # "i":I
    :cond_6
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 174
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 175
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    int-to-long v2, v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 176
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v1

    .line 178
    .local v1, "flags":I
    and-int/lit8 v2, v1, 0x1

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 179
    iget v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->dataOffset:I

    int-to-long v2, v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 181
    :cond_0
    and-int/lit8 v2, v1, 0x4

    const/4 v3, 0x4

    if-ne v2, v3, :cond_1

    .line 182
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->firstSampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    invoke-virtual {v2, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->getContent(Ljava/nio/ByteBuffer;)V

    .line 185
    :cond_1
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;

    .line 186
    .local v0, "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    and-int/lit16 v3, v1, 0x100

    const/16 v4, 0x100

    if-ne v3, v4, :cond_3

    .line 187
    # getter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleDuration:J
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->access$000(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;)J

    move-result-wide v4

    invoke-static {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 189
    :cond_3
    and-int/lit16 v3, v1, 0x200

    const/16 v4, 0x200

    if-ne v3, v4, :cond_4

    .line 190
    # getter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleSize:J
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->access$100(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;)J

    move-result-wide v4

    invoke-static {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 192
    :cond_4
    and-int/lit16 v3, v1, 0x400

    const/16 v4, 0x400

    if-ne v3, v4, :cond_5

    .line 193
    # getter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->access$200(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    move-result-object v3

    invoke-virtual {v3, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->getContent(Ljava/nio/ByteBuffer;)V

    .line 195
    :cond_5
    and-int/lit16 v3, v1, 0x800

    const/16 v4, 0x800

    if-ne v3, v4, :cond_2

    .line 196
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getVersion()I

    move-result v3

    if-nez v3, :cond_6

    .line 197
    # getter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleCompositionTimeOffset:J
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->access$300(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;)J

    move-result-wide v4

    invoke-static {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    goto :goto_0

    .line 199
    :cond_6
    # getter for: Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleCompositionTimeOffset:J
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->access$300(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;)J

    move-result-wide v4

    long-to-int v3, v4

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    goto :goto_0

    .line 203
    .end local v0    # "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    :cond_7
    return-void
.end method

.method protected getContentSize()J
    .locals 10

    .prologue
    const-wide/16 v8, 0x4

    .line 146
    const-wide/16 v4, 0x8

    .line 147
    .local v4, "size":J
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v2

    .line 149
    .local v2, "flags":I
    and-int/lit8 v3, v2, 0x1

    const/4 v6, 0x1

    if-ne v3, v6, :cond_0

    .line 150
    add-long/2addr v4, v8

    .line 152
    :cond_0
    and-int/lit8 v3, v2, 0x4

    const/4 v6, 0x4

    if-ne v3, v6, :cond_1

    .line 153
    add-long/2addr v4, v8

    .line 156
    :cond_1
    const-wide/16 v0, 0x0

    .line 157
    .local v0, "entrySize":J
    and-int/lit16 v3, v2, 0x100

    const/16 v6, 0x100

    if-ne v3, v6, :cond_2

    .line 158
    add-long/2addr v0, v8

    .line 160
    :cond_2
    and-int/lit16 v3, v2, 0x200

    const/16 v6, 0x200

    if-ne v3, v6, :cond_3

    .line 161
    add-long/2addr v0, v8

    .line 163
    :cond_3
    and-int/lit16 v3, v2, 0x400

    const/16 v6, 0x400

    if-ne v3, v6, :cond_4

    .line 164
    add-long/2addr v0, v8

    .line 166
    :cond_4
    and-int/lit16 v3, v2, 0x800

    const/16 v6, 0x800

    if-ne v3, v6, :cond_5

    .line 167
    add-long/2addr v0, v8

    .line 169
    :cond_5
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->entries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    int-to-long v6, v3

    mul-long/2addr v6, v0

    add-long/2addr v4, v6

    .line 170
    return-wide v4
.end method

.method public getDataOffset()I
    .locals 1

    .prologue
    .line 310
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->dataOffset:I

    return v0
.end method

.method public getEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 58
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->entries:Ljava/util/List;

    return-object v0
.end method

.method public getFirstSampleFlags()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    .locals 1

    .prologue
    .line 314
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->firstSampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    return-object v0
.end method

.method public getSampleCompositionTimeOffsets()[J
    .locals 4

    .prologue
    .line 130
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->isSampleCompositionTimeOffsetPresent()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 131
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    new-array v1, v2, [J

    .line 133
    .local v1, "result":[J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 134
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->entries:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->getSampleCompositionTimeOffset()J

    move-result-wide v2

    aput-wide v2, v1, v0

    .line 133
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 138
    .end local v0    # "i":I
    .end local v1    # "result":[J
    :cond_0
    const/4 v1, 0x0

    :cond_1
    return-object v1
.end method

.method public getSampleCount()J
    .locals 2

    .prologue
    .line 239
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public isDataOffsetPresent()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 243
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v1

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFirstSampleFlagsPresent()Z
    .locals 2

    .prologue
    .line 247
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x4

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSampleCompositionTimeOffsetPresent()Z
    .locals 2

    .prologue
    .line 264
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    and-int/lit16 v0, v0, 0x800

    const/16 v1, 0x800

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSampleDurationPresent()Z
    .locals 2

    .prologue
    .line 256
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    and-int/lit16 v0, v0, 0x100

    const/16 v1, 0x100

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSampleFlagsPresent()Z
    .locals 2

    .prologue
    .line 260
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    and-int/lit16 v0, v0, 0x400

    const/16 v1, 0x400

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSampleSizePresent()Z
    .locals 2

    .prologue
    .line 252
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    and-int/lit16 v0, v0, 0x200

    const/16 v1, 0x200

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setDataOffset(I)V
    .locals 2
    .param p1, "dataOffset"    # I

    .prologue
    .line 121
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 122
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    const v1, 0xfffffe

    and-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setFlags(I)V

    .line 126
    :goto_0
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->dataOffset:I

    .line 127
    return-void

    .line 124
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    or-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setFlags(I)V

    goto :goto_0
.end method

.method public setDataOffsetPresent(Z)V
    .locals 2
    .param p1, "v"    # Z

    .prologue
    .line 268
    if-eqz p1, :cond_0

    .line 269
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    or-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setFlags(I)V

    .line 273
    :goto_0
    return-void

    .line 271
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    const v1, 0xfffffe

    and-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setFlags(I)V

    goto :goto_0
.end method

.method public setEntries(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 343
    .local p1, "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;>;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->entries:Ljava/util/List;

    .line 344
    return-void
.end method

.method public setFirstSampleFlags(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;)V
    .locals 2
    .param p1, "firstSampleFlags"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    .prologue
    .line 318
    if-nez p1, :cond_0

    .line 319
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    const v1, 0xfffffb

    and-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setFlags(I)V

    .line 323
    :goto_0
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->firstSampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    .line 324
    return-void

    .line 321
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    or-int/lit8 v0, v0, 0x4

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setFlags(I)V

    goto :goto_0
.end method

.method public setSampleCompositionTimeOffsetPresent(Z)V
    .locals 2
    .param p1, "v"    # Z

    .prologue
    .line 301
    if-eqz p1, :cond_0

    .line 302
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    or-int/lit16 v0, v0, 0x800

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setFlags(I)V

    .line 307
    :goto_0
    return-void

    .line 304
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    const v1, 0xfff7ff

    and-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setFlags(I)V

    goto :goto_0
.end method

.method public setSampleDurationPresent(Z)V
    .locals 2
    .param p1, "v"    # Z

    .prologue
    .line 285
    if-eqz p1, :cond_0

    .line 286
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    or-int/lit16 v0, v0, 0x100

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setFlags(I)V

    .line 290
    :goto_0
    return-void

    .line 288
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    const v1, 0xfffeff

    and-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setFlags(I)V

    goto :goto_0
.end method

.method public setSampleFlagsPresent(Z)V
    .locals 2
    .param p1, "v"    # Z

    .prologue
    .line 293
    if-eqz p1, :cond_0

    .line 294
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    or-int/lit16 v0, v0, 0x400

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setFlags(I)V

    .line 298
    :goto_0
    return-void

    .line 296
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    const v1, 0xfffbff

    and-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setFlags(I)V

    goto :goto_0
.end method

.method public setSampleSizePresent(Z)V
    .locals 2
    .param p1, "v"    # Z

    .prologue
    .line 276
    if-eqz p1, :cond_0

    .line 277
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    or-int/lit16 v0, v0, 0x200

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setFlags(I)V

    .line 281
    :goto_0
    return-void

    .line 279
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFlags()I

    move-result v0

    const v1, 0xfffdff

    and-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setFlags(I)V

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 328
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 329
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "TrackRunBox"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    const-string v1, "{sampleCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 331
    const-string v1, ", dataOffset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->dataOffset:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 332
    const-string v1, ", dataOffsetPresent="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->isDataOffsetPresent()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 333
    const-string v1, ", sampleSizePresent="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->isSampleSizePresent()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 334
    const-string v1, ", sampleDurationPresent="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->isSampleDurationPresent()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 335
    const-string v1, ", sampleFlagsPresentPresent="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->isSampleFlagsPresent()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 336
    const-string v1, ", sampleCompositionTimeOffsetPresent="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->isSampleCompositionTimeOffsetPresent()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 337
    const-string v1, ", firstSampleFlags="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->firstSampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 338
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 339
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
