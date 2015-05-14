.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;
.source "H264TrackImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;,
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$ByteBufferBackedInputStream;,
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;
    }
.end annotation


# static fields
.field private static final LOG:Ljava/util/logging/Logger;


# instance fields
.field currentPictureParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;

.field currentSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

.field private determineFrameRate:Z

.field firstPictureParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;

.field firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

.field frameNrInGop:I

.field private frametick:I

.field private height:I

.field private lang:Ljava/lang/String;

.field pictureParameterRangeMap:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap",
            "<",
            "Ljava/lang/Integer;",
            "[B>;"
        }
    .end annotation
.end field

.field ppsIdToPps:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;",
            ">;"
        }
    .end annotation
.end field

.field ppsIdToPpsBytes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "[B>;"
        }
    .end annotation
.end field

.field sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

.field private samples:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation
.end field

.field private seiMessage:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;

.field seqParameterRangeMap:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap",
            "<",
            "Ljava/lang/Integer;",
            "[B>;"
        }
    .end annotation
.end field

.field spsIdToSps:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;",
            ">;"
        }
    .end annotation
.end field

.field spsIdToSpsBytes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "[B>;"
        }
    .end annotation
.end field

.field private timescale:J

.field private width:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-class v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->LOG:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V
    .locals 1
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    const-string v0, "eng"

    invoke-direct {p0, p1, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/lang/String;)V

    .line 108
    return-void
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/lang/String;)V
    .locals 7
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .param p2, "lang"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    const-wide/16 v4, -0x1

    const/4 v6, -0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/lang/String;JI)V

    .line 104
    return-void
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/lang/String;JI)V
    .locals 3
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .param p2, "lang"    # Ljava/lang/String;
    .param p3, "timescale"    # J
    .param p5, "frametick"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 89
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V

    .line 36
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->spsIdToSpsBytes:Ljava/util/Map;

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->spsIdToSps:Ljava/util/Map;

    .line 38
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->ppsIdToPpsBytes:Ljava/util/Map;

    .line 39
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->ppsIdToPps:Ljava/util/Map;

    .line 46
    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    .line 47
    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstPictureParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;

    .line 49
    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->currentSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    .line 50
    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->currentPictureParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;

    .line 52
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->seqParameterRangeMap:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    .line 53
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->pictureParameterRangeMap:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    .line 62
    iput v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->frameNrInGop:I

    .line 63
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->determineFrameRate:Z

    .line 64
    const-string v0, "eng"

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->lang:Ljava/lang/String;

    .line 90
    iput-object p2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->lang:Ljava/lang/String;

    .line 91
    iput-wide p3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->timescale:J

    .line 92
    iput p5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->frametick:I

    .line 93
    const-wide/16 v0, 0x0

    cmp-long v0, p3, v0

    if-lez v0, :cond_0

    if-lez p5, :cond_0

    .line 94
    iput-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->determineFrameRate:Z

    .line 97
    :cond_0
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;

    invoke-direct {v0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->parse(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;)V

    .line 98
    return-void
.end method

.method static synthetic access$000()Ljava/util/logging/Logger;
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->LOG:Ljava/util/logging/Logger;

    return-object v0
.end method

.method private configureFramerate()V
    .locals 8

    .prologue
    const-wide/32 v6, 0x15f90

    const/16 v4, 0xbcc

    .line 487
    iget-boolean v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->determineFrameRate:Z

    if-eqz v0, :cond_1

    .line 488
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    if-eqz v0, :cond_2

    .line 489
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->time_scale:I

    shr-int/lit8 v0, v0, 0x1

    int-to-long v0, v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->timescale:J

    .line 490
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->num_units_in_tick:I

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->frametick:I

    .line 491
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->timescale:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->frametick:I

    if-nez v0, :cond_1

    .line 493
    :cond_0
    iput-wide v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->timescale:J

    .line 494
    iput v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->frametick:I

    .line 502
    :cond_1
    :goto_0
    return-void

    .line 498
    :cond_2
    iput-wide v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->timescale:J

    .line 499
    iput v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->frametick:I

    goto :goto_0
.end method

.method private createSample(Ljava/util/List;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p1, "buffered":Ljava/util/List;, "Ljava/util/List<Ljava/nio/ByteBuffer;>;"
    const/4 v11, 0x0

    .line 387
    const/16 v7, 0x16

    .line 389
    .local v7, "stdpValue":I
    const/4 v0, 0x0

    .line 390
    .local v0, "IdrPicFlag":Z
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_0
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/nio/ByteBuffer;

    .line 391
    .local v3, "nal":Ljava/nio/ByteBuffer;
    invoke-virtual {v3, v11}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v8

    .line 392
    .local v8, "type":I
    and-int/lit8 v4, v8, 0x1f

    .line 393
    .local v4, "nal_unit_type":I
    const/4 v10, 0x5

    if-ne v4, v10, :cond_0

    .line 394
    const/4 v0, 0x1

    goto :goto_0

    .line 398
    .end local v3    # "nal":Ljava/nio/ByteBuffer;
    .end local v4    # "nal_unit_type":I
    .end local v8    # "type":I
    :cond_1
    if-eqz v0, :cond_2

    .line 399
    add-int/lit8 v7, v7, 0x10

    .line 402
    :cond_2
    new-instance v10, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$ByteBufferBackedInputStream;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-interface {p1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/nio/ByteBuffer;

    invoke-direct {v10, p0, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$ByteBufferBackedInputStream;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;Ljava/nio/ByteBuffer;)V

    invoke-static {v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->cleanBuffer(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v2

    .line 403
    .local v2, "bs":Ljava/io/InputStream;
    new-instance v6, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;

    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->spsIdToSps:Ljava/util/Map;

    iget-object v10, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->ppsIdToPps:Ljava/util/Map;

    invoke-direct {v6, v2, v9, v10, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;-><init>(Ljava/io/InputStream;Ljava/util/Map;Ljava/util/Map;Z)V

    .line 404
    .local v6, "sh":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;
    iget-object v9, v6, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->slice_type:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;

    sget-object v10, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;->B:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;

    if-ne v9, v10, :cond_3

    .line 405
    add-int/lit8 v7, v7, 0x4

    .line 407
    :cond_3
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->createSampleObject(Ljava/util/List;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    move-result-object v1

    .line 409
    .local v1, "bb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 411
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->seiMessage:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;

    if-eqz v9, :cond_4

    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->seiMessage:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;

    iget v9, v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->n_frames:I

    if-nez v9, :cond_5

    .line 412
    :cond_4
    iput v11, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->frameNrInGop:I

    .line 414
    :cond_5
    const/4 v5, 0x0

    .line 415
    .local v5, "offset":I
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->seiMessage:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;

    if-eqz v9, :cond_8

    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->seiMessage:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;

    iget-boolean v9, v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->clock_timestamp_flag:Z

    if-eqz v9, :cond_8

    .line 416
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->seiMessage:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;

    iget v9, v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->n_frames:I

    iget v10, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->frameNrInGop:I

    sub-int v5, v9, v10

    .line 420
    :cond_6
    :goto_1
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->ctts:Ljava/util/List;

    new-instance v10, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;

    const/4 v11, 0x1

    iget v12, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->frametick:I

    mul-int/2addr v12, v5

    invoke-direct {v10, v11, v12}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;-><init>(II)V

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 421
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->sdtp:Ljava/util/List;

    new-instance v10, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;

    invoke-direct {v10, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;-><init>(I)V

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 422
    iget v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->frameNrInGop:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->frameNrInGop:I

    .line 424
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->samples:Ljava/util/List;

    invoke-interface {v9, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 425
    if-eqz v0, :cond_7

    .line 426
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->stss:Ljava/util/List;

    iget-object v10, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->samples:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 429
    :cond_7
    return-void

    .line 417
    :cond_8
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->seiMessage:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;

    if-eqz v9, :cond_6

    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->seiMessage:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;

    iget-boolean v9, v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->removal_delay_flag:Z

    if-eqz v9, :cond_6

    .line 418
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->seiMessage:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;

    iget v9, v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->dpb_removal_delay:I

    div-int/lit8 v5, v9, 0x2

    goto :goto_1
.end method

.method private handlePPS(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "data"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 432
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$ByteBufferBackedInputStream;

    invoke-direct {v1, p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$ByteBufferBackedInputStream;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;Ljava/nio/ByteBuffer;)V

    .line 433
    .local v1, "is":Ljava/io/InputStream;
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    .line 435
    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;->read(Ljava/io/InputStream;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;

    move-result-object v0

    .line 436
    .local v0, "_pictureParameterSet":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstPictureParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;

    if-nez v4, :cond_0

    .line 437
    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstPictureParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;

    .line 440
    :cond_0
    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->currentPictureParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;

    .line 442
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->toArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v3

    .line 443
    .local v3, "ppsBytes":[B
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->ppsIdToPpsBytes:Ljava/util/Map;

    iget v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;->pic_parameter_set_id:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    .line 446
    .local v2, "oldPpsSameId":[B
    if-eqz v2, :cond_1

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v4

    if-nez v4, :cond_1

    .line 447
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "OMG - I got two SPS with same ID but different settings! (AVC3 is the solution)"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 449
    :cond_1
    if-nez v2, :cond_2

    .line 450
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->pictureParameterRangeMap:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->samples:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->put(Ljava/lang/Comparable;Ljava/lang/Object;)Ljava/lang/Object;

    .line 452
    :cond_2
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->ppsIdToPpsBytes:Ljava/util/Map;

    iget v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;->pic_parameter_set_id:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 453
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->ppsIdToPps:Ljava/util/Map;

    iget v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;->pic_parameter_set_id:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 457
    return-void
.end method

.method private handleSPS(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "data"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 460
    new-instance v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$ByteBufferBackedInputStream;

    invoke-direct {v4, p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$ByteBufferBackedInputStream;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;Ljava/nio/ByteBuffer;)V

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->cleanBuffer(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v3

    .line 461
    .local v3, "spsInputStream":Ljava/io/InputStream;
    invoke-virtual {v3}, Ljava/io/InputStream;->read()I

    .line 462
    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->read(Ljava/io/InputStream;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    move-result-object v0

    .line 463
    .local v0, "_seqParameterSet":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    if-nez v4, :cond_0

    .line 464
    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    .line 465
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->configureFramerate()V

    .line 467
    :cond_0
    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->currentSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    .line 469
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->toArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v2

    .line 470
    .local v2, "spsBytes":[B
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->spsIdToSpsBytes:Ljava/util/Map;

    iget v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->seq_parameter_set_id:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    .line 471
    .local v1, "oldSpsSameId":[B
    if-eqz v1, :cond_1

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v4

    if-nez v4, :cond_1

    .line 472
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "OMG - I got two SPS with same ID but different settings!"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 474
    :cond_1
    if-eqz v1, :cond_2

    .line 475
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->seqParameterRangeMap:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->samples:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->put(Ljava/lang/Comparable;Ljava/lang/Object;)Ljava/lang/Object;

    .line 477
    :cond_2
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->spsIdToSpsBytes:Ljava/util/Map;

    iget v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->seq_parameter_set_id:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 478
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->spsIdToSps:Ljava/util/Map;

    iget v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->seq_parameter_set_id:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 483
    return-void
.end method

.method private parse(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;)V
    .locals 8
    .param p1, "la"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/high16 v6, 0x4052000000000000L    # 72.0

    const/4 v5, 0x1

    const/4 v3, 0x0

    .line 114
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->samples:Ljava/util/List;

    .line 115
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->readSamples(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 116
    new-instance v2, Ljava/io/IOException;

    invoke-direct {v2}, Ljava/io/IOException;-><init>()V

    throw v2

    .line 119
    :cond_0
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->readVariables()Z

    move-result v2

    if-nez v2, :cond_1

    .line 120
    new-instance v2, Ljava/io/IOException;

    invoke-direct {v2}, Ljava/io/IOException;-><init>()V

    throw v2

    .line 123
    :cond_1
    new-instance v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-direct {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;-><init>()V

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    .line 124
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;

    const-string v2, "avc1"

    invoke-direct {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;-><init>(Ljava/lang/String;)V

    .line 125
    .local v1, "visualSampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setDataReferenceIndex(I)V

    .line 126
    const/16 v2, 0x18

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setDepth(I)V

    .line 127
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setFrameCount(I)V

    .line 128
    invoke-virtual {v1, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setHorizresolution(D)V

    .line 129
    invoke-virtual {v1, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setVertresolution(D)V

    .line 130
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->width:I

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setWidth(I)V

    .line 131
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->height:I

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setHeight(I)V

    .line 132
    const-string v2, "Meerkat AVC"

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setCompressorname(Ljava/lang/String;)V

    .line 134
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;-><init>()V

    .line 136
    .local v0, "avcConfigurationBox":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;
    new-instance v2, Ljava/util/ArrayList;

    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->spsIdToSpsBytes:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v2}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->setSequenceParameterSets(Ljava/util/List;)V

    .line 137
    new-instance v2, Ljava/util/ArrayList;

    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->ppsIdToPpsBytes:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v2}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->setPictureParameterSets(Ljava/util/List;)V

    .line 138
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->level_idc:I

    invoke-virtual {v0, v2}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->setAvcLevelIndication(I)V

    .line 139
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->profile_idc:I

    invoke-virtual {v0, v2}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->setAvcProfileIndication(I)V

    .line 140
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->bit_depth_luma_minus8:I

    invoke-virtual {v0, v2}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->setBitDepthLumaMinus8(I)V

    .line 141
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->bit_depth_chroma_minus8:I

    invoke-virtual {v0, v2}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->setBitDepthChromaMinus8(I)V

    .line 142
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-object v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->chroma_format_idc:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;->getId()I

    move-result v2

    invoke-virtual {v0, v2}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->setChromaFormat(I)V

    .line 143
    invoke-virtual {v0, v5}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->setConfigurationVersion(I)V

    .line 144
    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->setLengthSizeMinusOne(I)V

    .line 147
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-boolean v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_0_flag:Z

    if-eqz v2, :cond_3

    const/16 v2, 0x80

    :goto_0
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-boolean v4, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_1_flag:Z

    if-eqz v4, :cond_4

    const/16 v4, 0x40

    :goto_1
    add-int/2addr v4, v2

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-boolean v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_2_flag:Z

    if-eqz v2, :cond_5

    const/16 v2, 0x20

    :goto_2
    add-int/2addr v4, v2

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-boolean v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_3_flag:Z

    if-eqz v2, :cond_6

    const/16 v2, 0x10

    :goto_3
    add-int/2addr v2, v4

    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-boolean v4, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_4_flag:Z

    if-eqz v4, :cond_2

    const/16 v3, 0x8

    :cond_2
    add-int/2addr v2, v3

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-wide v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->reserved_zero_2bits:J

    const-wide/16 v6, 0x3

    and-long/2addr v4, v6

    long-to-int v3, v4

    add-int/2addr v2, v3

    invoke-virtual {v0, v2}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->setProfileCompatibility(I)V

    .line 156
    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 157
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-virtual {v2, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 159
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setCreationTime(Ljava/util/Date;)V

    .line 160
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setModificationTime(Ljava/util/Date;)V

    .line 161
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->lang:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setLanguage(Ljava/lang/String;)V

    .line 162
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    iget-wide v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->timescale:J

    invoke-virtual {v2, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setTimescale(J)V

    .line 163
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    iget v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->width:I

    int-to-double v4, v3

    invoke-virtual {v2, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setWidth(D)V

    .line 164
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    iget v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->height:I

    int-to-double v4, v3

    invoke-virtual {v2, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setHeight(D)V

    .line 165
    return-void

    :cond_3
    move v2, v3

    .line 147
    goto :goto_0

    :cond_4
    move v4, v3

    goto :goto_1

    :cond_5
    move v2, v3

    goto :goto_2

    :cond_6
    move v2, v3

    goto :goto_3
.end method

.method private readSamples(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;)Z
    .locals 10
    .param p1, "la"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 217
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 299
    .local v0, "buffered":Ljava/util/List;, "Ljava/util/List<Ljava/nio/ByteBuffer;>;"
    const/4 v2, 0x0

    .line 303
    .local v2, "fvnd":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;
    :goto_0
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->findNextNal(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;)Ljava/nio/ByteBuffer;

    move-result-object v3

    .local v3, "nal":Ljava/nio/ByteBuffer;
    if-eqz v3, :cond_6

    .line 304
    const/4 v7, 0x0

    invoke-virtual {v3, v7}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v6

    .line 305
    .local v6, "type":I
    shr-int/lit8 v7, v6, 0x5

    and-int/lit8 v4, v7, 0x3

    .line 306
    .local v4, "nal_ref_idc":I
    and-int/lit8 v5, v6, 0x1f

    .line 310
    .local v5, "nal_unit_type":I
    packed-switch v5, :pswitch_data_0

    .line 372
    :pswitch_0
    sget-object v7, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unknown NAL unit type: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 316
    :pswitch_1
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;

    invoke-direct {v1, p0, v3, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;Ljava/nio/ByteBuffer;II)V

    .line 317
    .local v1, "current":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;
    if-nez v2, :cond_1

    .line 318
    move-object v2, v1

    .line 325
    :cond_0
    :goto_1
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v7

    check-cast v7, Ljava/nio/ByteBuffer;

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 319
    :cond_1
    invoke-virtual {v2, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->isFirstInNew(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 321
    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->createSample(Ljava/util/List;)V

    .line 322
    const/4 v2, 0x0

    .line 323
    move-object v2, v1

    goto :goto_1

    .line 330
    .end local v1    # "current":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;
    :pswitch_2
    if-eqz v2, :cond_2

    .line 332
    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->createSample(Ljava/util/List;)V

    .line 333
    const/4 v2, 0x0

    .line 335
    :cond_2
    new-instance v7, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;

    new-instance v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$ByteBufferBackedInputStream;

    invoke-direct {v8, p0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$ByteBufferBackedInputStream;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;Ljava/nio/ByteBuffer;)V

    invoke-static {v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->cleanBuffer(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v8

    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->currentSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    invoke-direct {v7, p0, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;Ljava/io/InputStream;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;)V

    iput-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->seiMessage:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;

    .line 336
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 340
    :pswitch_3
    if-eqz v2, :cond_3

    .line 342
    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->createSample(Ljava/util/List;)V

    .line 343
    const/4 v2, 0x0

    .line 345
    :cond_3
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 348
    :pswitch_4
    if-eqz v2, :cond_4

    .line 350
    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->createSample(Ljava/util/List;)V

    .line 351
    const/4 v2, 0x0

    .line 353
    :cond_4
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v7

    check-cast v7, Ljava/nio/ByteBuffer;

    invoke-direct {p0, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->handleSPS(Ljava/nio/ByteBuffer;)V

    goto :goto_0

    .line 356
    :pswitch_5
    if-eqz v2, :cond_5

    .line 358
    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->createSample(Ljava/util/List;)V

    .line 359
    const/4 v2, 0x0

    .line 361
    :cond_5
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v7

    check-cast v7, Ljava/nio/ByteBuffer;

    invoke-direct {p0, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->handlePPS(Ljava/nio/ByteBuffer;)V

    goto/16 :goto_0

    .line 369
    :pswitch_6
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "Sequence parameter set extension is not yet handled. Needs TLC."

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 379
    .end local v4    # "nal_ref_idc":I
    .end local v5    # "nal_unit_type":I
    .end local v6    # "type":I
    :cond_6
    :pswitch_7
    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->createSample(Ljava/util/List;)V

    .line 380
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->samples:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    new-array v7, v7, [J

    iput-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->decodingTimes:[J

    .line 381
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->decodingTimes:[J

    iget v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->frametick:I

    int-to-long v8, v8

    invoke-static {v7, v8, v9}, Ljava/util/Arrays;->fill([JJ)V

    .line 382
    const/4 v7, 0x1

    return v7

    .line 310
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_4
        :pswitch_5
        :pswitch_3
        :pswitch_7
        :pswitch_7
        :pswitch_0
        :pswitch_6
    .end packed-switch
.end method

.method private readVariables()Z
    .locals 7

    .prologue
    .line 183
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget v4, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->pic_width_in_mbs_minus1:I

    add-int/lit8 v4, v4, 0x1

    mul-int/lit8 v4, v4, 0x10

    iput v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->width:I

    .line 184
    const/4 v3, 0x2

    .line 185
    .local v3, "mult":I
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-boolean v4, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_mbs_only_flag:Z

    if-eqz v4, :cond_0

    .line 186
    const/4 v3, 0x1

    .line 188
    :cond_0
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget v4, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->pic_height_in_map_units_minus1:I

    add-int/lit8 v4, v4, 0x1

    mul-int/lit8 v4, v4, 0x10

    mul-int/2addr v4, v3

    iput v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->height:I

    .line 189
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-boolean v4, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_cropping_flag:Z

    if-eqz v4, :cond_3

    .line 190
    const/4 v0, 0x0

    .line 191
    .local v0, "chromaArrayType":I
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-boolean v4, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->residual_color_transform_flag:Z

    if-nez v4, :cond_1

    .line 192
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-object v4, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->chroma_format_idc:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;->getId()I

    move-result v0

    .line 194
    :cond_1
    const/4 v1, 0x1

    .line 195
    .local v1, "cropUnitX":I
    move v2, v3

    .line 196
    .local v2, "cropUnitY":I
    if-eqz v0, :cond_2

    .line 197
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-object v4, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->chroma_format_idc:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;->getSubWidth()I

    move-result v1

    .line 198
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-object v4, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->chroma_format_idc:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;->getSubHeight()I

    move-result v4

    mul-int v2, v4, v3

    .line 201
    :cond_2
    iget v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->width:I

    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget v5, v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_crop_left_offset:I

    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget v6, v6, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_crop_right_offset:I

    add-int/2addr v5, v6

    mul-int/2addr v5, v1

    sub-int/2addr v4, v5

    iput v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->width:I

    .line 202
    iget v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->height:I

    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget v5, v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_crop_top_offset:I

    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->firstSeqParameterSet:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget v6, v6, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_crop_bottom_offset:I

    add-int/2addr v5, v6

    mul-int/2addr v5, v2

    sub-int/2addr v4, v5

    iput v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->height:I

    .line 204
    .end local v0    # "chromaArrayType":I
    .end local v1    # "cropUnitX":I
    .end local v2    # "cropUnitY":I
    :cond_3
    const/4 v4, 0x1

    return v4
.end method


# virtual methods
.method public getHandler()Ljava/lang/String;
    .locals 1

    .prologue
    .line 175
    const-string v0, "vide"

    return-object v0
.end method

.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    return-object v0
.end method

.method public getSamples()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation

    .prologue
    .line 179
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->samples:Ljava/util/List;

    return-object v0
.end method
