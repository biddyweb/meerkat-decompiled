.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "TimeToSampleBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final TYPE:Ljava/lang/String; = "stts"

.field static cache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;",
            ">;",
            "Ljava/lang/ref/SoftReference",
            "<[J>;>;"
        }
    .end annotation
.end field


# instance fields
.field entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    const-class v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->$assertionsDisabled:Z

    .line 130
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->cache:Ljava/util/Map;

    return-void

    .line 48
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 54
    const-string v0, "stts"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 51
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->entries:Ljava/util/List;

    .line 55
    return-void
.end method

.method public static declared-synchronized blowupTimeToSamples(Ljava/util/List;)[J
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;",
            ">;)[J"
        }
    .end annotation

    .prologue
    .line 140
    .local p0, "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;>;"
    const-class v12, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;

    monitor-enter v12

    :try_start_0
    sget-object v9, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->cache:Ljava/util/Map;

    move-object/from16 v0, p0

    invoke-interface {v9, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/SoftReference;

    .local v2, "cacheEntry":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<[J>;"
    if-eqz v2, :cond_0

    .line 142
    invoke-virtual {v2}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .local v3, "cacheVal":[J
    if-eqz v3, :cond_0

    .line 162
    .end local v3    # "cacheVal":[J
    :goto_0
    monitor-exit v12

    return-object v3

    .line 146
    :cond_0
    const-wide/16 v10, 0x0

    .line 147
    .local v10, "numOfSamples":J
    :try_start_1
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_1

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;

    .line 148
    .local v7, "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getCount()J

    move-result-wide v14

    add-long/2addr v10, v14

    .line 149
    goto :goto_1

    .line 150
    .end local v7    # "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    :cond_1
    sget-boolean v9, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->$assertionsDisabled:Z

    if-nez v9, :cond_2

    const-wide/32 v14, 0x7fffffff

    cmp-long v9, v10, v14

    if-lez v9, :cond_2

    new-instance v9, Ljava/lang/AssertionError;

    invoke-direct {v9}, Ljava/lang/AssertionError;-><init>()V

    throw v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 140
    .end local v2    # "cacheEntry":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<[J>;"
    .end local v10    # "numOfSamples":J
    :catchall_0
    move-exception v9

    monitor-exit v12

    throw v9

    .line 151
    .restart local v2    # "cacheEntry":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<[J>;"
    .restart local v10    # "numOfSamples":J
    :cond_2
    long-to-int v9, v10

    :try_start_2
    new-array v6, v9, [J

    .line 153
    .local v6, "decodingTime":[J
    const/4 v4, 0x0

    .line 156
    .local v4, "current":I
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_4

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;

    .line 157
    .restart local v7    # "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    const/4 v8, 0x0

    .local v8, "i":I
    move v5, v4

    .end local v4    # "current":I
    .local v5, "current":I
    :goto_3
    int-to-long v14, v8

    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getCount()J

    move-result-wide v16

    cmp-long v13, v14, v16

    if-gez v13, :cond_3

    .line 158
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "current":I
    .restart local v4    # "current":I
    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getDelta()J

    move-result-wide v14

    aput-wide v14, v6, v5

    .line 157
    add-int/lit8 v8, v8, 0x1

    move v5, v4

    .end local v4    # "current":I
    .restart local v5    # "current":I
    goto :goto_3

    :cond_3
    move v4, v5

    .line 160
    .end local v5    # "current":I
    .restart local v4    # "current":I
    goto :goto_2

    .line 161
    .end local v7    # "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    .end local v8    # "i":I
    :cond_4
    sget-object v9, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->cache:Ljava/util/Map;

    new-instance v13, Ljava/lang/ref/SoftReference;

    invoke-direct {v13, v6}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    move-object/from16 v0, p0

    invoke-interface {v9, v0, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v3, v6

    .line 162
    goto :goto_0
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 8
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 63
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 64
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v0

    .line 65
    .local v0, "entryCount":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->entries:Ljava/util/List;

    .line 67
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 68
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->entries:Ljava/util/List;

    new-instance v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v6

    invoke-direct {v3, v4, v5, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;-><init>(JJ)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 71
    :cond_0
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 75
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 76
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    int-to-long v2, v1

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 77
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;

    .line 78
    .local v0, "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getCount()J

    move-result-wide v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 79
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getDelta()J

    move-result-wide v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    goto :goto_0

    .line 81
    .end local v0    # "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    :cond_0
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 58
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x8

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
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 84
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->entries:Ljava/util/List;

    return-object v0
.end method

.method public setEntries(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 88
    .local p1, "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;>;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->entries:Ljava/util/List;

    .line 89
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TimeToSampleBox[entryCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->entries:Ljava/util/List;

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
