.class public abstract Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;
.source "AbstractH26XTrack.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;
    }
.end annotation


# static fields
.field static BUFFER:I


# instance fields
.field protected ctts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

.field protected decodingTimes:[J

.field protected sdtp:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;",
            ">;"
        }
    .end annotation
.end field

.field protected stss:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const v0, 0x3fffc00

    sput v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;->BUFFER:I

    return-void
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V
    .locals 1
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    .prologue
    .line 42
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;-><init>(Ljava/lang/String;)V

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;->ctts:Ljava/util/List;

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;->sdtp:Ljava/util/List;

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;->stss:Ljava/util/List;

    .line 32
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    .line 43
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    .line 45
    return-void
.end method

.method static cleanBuffer(Ljava/io/InputStream;)Ljava/io/InputStream;
    .locals 1
    .param p0, "is"    # Ljava/io/InputStream;

    .prologue
    .line 186
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CleanInputStream;

    invoke-direct {v0, p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CleanInputStream;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method

.method protected static toArray(Ljava/nio/ByteBuffer;)[B
    .locals 3
    .param p0, "buf"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 190
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object p0

    .line 191
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    new-array v0, v1, [B

    .line 192
    .local v0, "b":[B
    const/4 v1, 0x0

    array-length v2, v0

    invoke-virtual {p0, v0, v1, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 193
    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 197
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->close()V

    .line 198
    return-void
.end method

.method protected createSampleObject(Ljava/util/List;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Ljava/nio/ByteBuffer;",
            ">;)",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;"
        }
    .end annotation

    .prologue
    .line 148
    .local p1, "nals":Ljava/util/List;, "Ljava/util/List<+Ljava/nio/ByteBuffer;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    mul-int/lit8 v5, v5, 0x4

    new-array v4, v5, [B

    .line 149
    .local v4, "sizeInfo":[B
    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 150
    .local v3, "sizeBuf":Ljava/nio/ByteBuffer;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 151
    .local v0, "b":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v6

    invoke-virtual {v3, v6}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    goto :goto_0

    .line 154
    .end local v0    # "b":Ljava/nio/ByteBuffer;
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    mul-int/lit8 v5, v5, 0x2

    new-array v1, v5, [Ljava/nio/ByteBuffer;

    .line 156
    .local v1, "data":[Ljava/nio/ByteBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_1

    .line 157
    mul-int/lit8 v5, v2, 0x2

    mul-int/lit8 v6, v2, 0x4

    const/4 v7, 0x4

    invoke-static {v4, v6, v7}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v6

    aput-object v6, v1, v5

    .line 158
    mul-int/lit8 v5, v2, 0x2

    add-int/lit8 v6, v5, 0x1

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/nio/ByteBuffer;

    aput-object v5, v1, v6

    .line 156
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 161
    :cond_1
    new-instance v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/SampleImpl;

    invoke-direct {v5, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/SampleImpl;-><init>([Ljava/nio/ByteBuffer;)V

    return-object v5
.end method

.method protected findNextNal(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;)Ljava/nio/ByteBuffer;
    .locals 2
    .param p1, "la"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;->nextThreeEquals001()Z

    move-result v1

    if-nez v1, :cond_0

    .line 126
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;->discardByte()V

    goto :goto_0

    .line 134
    :catch_0
    move-exception v0

    .line 135
    .local v0, "e":Ljava/io/EOFException;
    const/4 v1, 0x0

    .end local v0    # "e":Ljava/io/EOFException;
    :goto_1
    return-object v1

    .line 128
    :cond_0
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;->discardNext3AndMarkStart()V

    .line 130
    :goto_2
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;->nextThreeEquals000or001orEof()Z

    move-result v1

    if-nez v1, :cond_1

    .line 131
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;->discardByte()V

    goto :goto_2

    .line 133
    :cond_1
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;->getNal()Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_1
.end method

.method public getCompositionTimeEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 169
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;->ctts:Ljava/util/List;

    return-object v0
.end method

.method public getSampleDependencies()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 181
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;->sdtp:Ljava/util/List;

    return-object v0
.end method

.method public getSampleDurations()[J
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;->decodingTimes:[J

    return-object v0
.end method

.method public getSyncSamples()[J
    .locals 4

    .prologue
    .line 173
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;->stss:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    new-array v1, v2, [J

    .line 174
    .local v1, "returns":[J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;->stss:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 175
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;->stss:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v2, v2

    aput-wide v2, v1, v0

    .line 174
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 177
    :cond_0
    return-object v1
.end method

.method public getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    return-object v0
.end method

.method public setSampleDurations([J)V
    .locals 0
    .param p1, "sampleDurations"    # [J

    .prologue
    .line 48
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;->decodingTimes:[J

    .line 49
    return-void
.end method
