.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;
.super Ljava/lang/Object;
.source "H265TrackImplOld.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$LookAhead;,
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;,
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;
    }
.end annotation


# static fields
.field public static final AUD_NUT:I = 0x23

.field private static final BLA_N_LP:I = 0x12

.field private static final BLA_W_LP:I = 0x10

.field private static final BLA_W_RADL:I = 0x11

.field private static final BUFFER:J = 0x100000L

.field private static final CRA_NUT:I = 0x15

.field private static final IDR_N_LP:I = 0x14

.field private static final IDR_W_RADL:I = 0x13

.field public static final PPS_NUT:I = 0x22

.field public static final PREFIX_SEI_NUT:I = 0x27

.field private static final RADL_N:I = 0x6

.field private static final RADL_R:I = 0x7

.field private static final RASL_N:I = 0x8

.field private static final RASL_R:I = 0x9

.field public static final RSV_NVCL41:I = 0x29

.field public static final RSV_NVCL42:I = 0x2a

.field public static final RSV_NVCL43:I = 0x2b

.field public static final RSV_NVCL44:I = 0x2c

.field public static final SPS_NUT:I = 0x21

.field private static final STSA_N:I = 0x4

.field private static final STSA_R:I = 0x5

.field private static final TRAIL_N:I = 0x0

.field private static final TRAIL_R:I = 0x1

.field private static final TSA_N:I = 0x2

.field private static final TSA_R:I = 0x3

.field public static final UNSPEC48:I = 0x30

.field public static final UNSPEC49:I = 0x31

.field public static final UNSPEC50:I = 0x32

.field public static final UNSPEC51:I = 0x33

.field public static final UNSPEC52:I = 0x34

.field public static final UNSPEC53:I = 0x35

.field public static final UNSPEC54:I = 0x36

.field public static final UNSPEC55:I = 0x37

.field public static final VPS_NUT:I = 0x20


# instance fields
.field pictureParamterSets:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/Long;",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field samples:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation
.end field

.field sequenceParamterSets:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/Long;",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field syncSamples:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field videoParamterSets:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/Long;",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V
    .locals 18
    .param p1, "ds"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v12, Ljava/util/LinkedHashMap;

    invoke-direct {v12}, Ljava/util/LinkedHashMap;-><init>()V

    move-object/from16 v0, p0

    iput-object v12, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->videoParamterSets:Ljava/util/LinkedHashMap;

    .line 62
    new-instance v12, Ljava/util/LinkedHashMap;

    invoke-direct {v12}, Ljava/util/LinkedHashMap;-><init>()V

    move-object/from16 v0, p0

    iput-object v12, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->sequenceParamterSets:Ljava/util/LinkedHashMap;

    .line 63
    new-instance v12, Ljava/util/LinkedHashMap;

    invoke-direct {v12}, Ljava/util/LinkedHashMap;-><init>()V

    move-object/from16 v0, p0

    iput-object v12, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->pictureParamterSets:Ljava/util/LinkedHashMap;

    .line 64
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v12, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->syncSamples:Ljava/util/List;

    .line 65
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v12, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->samples:Ljava/util/List;

    .line 68
    new-instance v7, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$LookAhead;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v7, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$LookAhead;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V

    .line 70
    .local v7, "la":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$LookAhead;
    const-wide/16 v10, 0x1

    .line 71
    .local v10, "sampleNo":J
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 72
    .local v3, "accessUnit":Ljava/util/List;, "Ljava/util/List<Ljava/nio/ByteBuffer;>;"
    const/4 v4, 0x0

    .line 75
    .local v4, "accessUnitNalType":I
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->findNextNal(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$LookAhead;)Ljava/nio/ByteBuffer;

    move-result-object v8

    .local v8, "nal":Ljava/nio/ByteBuffer;
    if-eqz v8, :cond_4

    .line 77
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->getNalUnitHeader(Ljava/nio/ByteBuffer;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;

    move-result-object v9

    .line 81
    .local v9, "nalUnitHeader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;
    iget v12, v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;->nalUnitType:I

    packed-switch v12, :pswitch_data_0

    .line 92
    :goto_1
    iget v12, v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;->nalUnitType:I

    const/16 v13, 0x20

    if-ge v12, v13, :cond_1

    .line 93
    iget v4, v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;->nalUnitType:I

    .line 97
    :cond_1
    iget v12, v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;->nalUnitType:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v8, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->isFirstOfAU(ILjava/nio/ByteBuffer;Ljava/util/List;)Z

    move-result v12

    if-eqz v12, :cond_3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_3

    .line 99
    sget-object v12, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v13, "##########################"

    invoke-virtual {v12, v13}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 100
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_2

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/nio/ByteBuffer;

    .line 101
    .local v5, "byteBuffer":Ljava/nio/ByteBuffer;
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->getNalUnitHeader(Ljava/nio/ByteBuffer;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;

    move-result-object v2

    .line 102
    .local v2, "_nalUnitHeader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;
    sget-object v13, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v14, "type: %3d - layer: %3d - tempId: %3d - size: %3d"

    const/4 v15, 0x4

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    iget v0, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;->nalUnitType:I

    move/from16 v17, v0

    .line 103
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    iget v0, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;->nuhLayerId:I

    move/from16 v17, v0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x2

    iget v0, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;->nuhTemporalIdPlusOne:I

    move/from16 v17, v0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x3

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->limit()I

    move-result v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    .line 102
    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2

    .line 83
    .end local v2    # "_nalUnitHeader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;
    .end local v5    # "byteBuffer":Ljava/nio/ByteBuffer;
    :pswitch_0
    move-object/from16 v0, p0

    iget-object v12, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->videoParamterSets:Ljava/util/LinkedHashMap;

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-virtual {v12, v13, v8}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 86
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v12, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->sequenceParamterSets:Ljava/util/LinkedHashMap;

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-virtual {v12, v13, v8}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    .line 89
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->pictureParamterSets:Ljava/util/LinkedHashMap;

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-virtual {v12, v13, v8}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    .line 106
    :cond_2
    sget-object v12, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v13, "                          ##########################"

    invoke-virtual {v12, v13}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 107
    move-object/from16 v0, p0

    iget-object v12, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->samples:Ljava/util/List;

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->createSample(Ljava/util/List;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    move-result-object v13

    invoke-interface {v12, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 109
    const-wide/16 v12, 0x1

    add-long/2addr v10, v12

    .line 111
    :cond_3
    invoke-interface {v3, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    const/16 v12, 0x10

    if-lt v4, v12, :cond_0

    const/16 v12, 0x15

    if-gt v4, v12, :cond_0

    .line 113
    move-object/from16 v0, p0

    iget-object v12, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->syncSamples:Ljava/util/List;

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-interface {v12, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 119
    .end local v9    # "nalUnitHeader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;
    :cond_4
    sget-object v12, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v13, ""

    invoke-virtual {v12, v13}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 120
    new-instance v6, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;

    invoke-direct {v6}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;-><init>()V

    .line 122
    .local v6, "hvcC":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;
    invoke-direct/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->getArrays()Ljava/util/List;

    move-result-object v12

    invoke-virtual {v6, v12}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->setArrays(Ljava/util/List;)V

    .line 123
    const/4 v12, 0x0

    invoke-virtual {v6, v12}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord;->setAvgFrameRate(I)V

    .line 124
    return-void

    .line 81
    :pswitch_data_0
    .packed-switch 0x20
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private findNextNal(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$LookAhead;)Ljava/nio/ByteBuffer;
    .locals 2
    .param p1, "la"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$LookAhead;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$LookAhead;->nextThreeEquals001()Z

    move-result v1

    if-nez v1, :cond_0

    .line 133
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$LookAhead;->discardByte()V

    goto :goto_0

    .line 141
    :catch_0
    move-exception v0

    .line 142
    .local v0, "e":Ljava/io/EOFException;
    const/4 v1, 0x0

    .end local v0    # "e":Ljava/io/EOFException;
    :goto_1
    return-object v1

    .line 135
    :cond_0
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$LookAhead;->discardNext3AndMarkStart()V

    .line 137
    :goto_2
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$LookAhead;->nextThreeEquals000or001orEof()Z

    move-result v1

    if-nez v1, :cond_1

    .line 138
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$LookAhead;->discardByte()V

    goto :goto_2

    .line 140
    :cond_1
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$LookAhead;->getNal()Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_1
.end method

.method private getArrays()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x21

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 340
    new-instance v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;

    invoke-direct {v4}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;-><init>()V

    .line 341
    .local v4, "vpsArray":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;
    iput-boolean v8, v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->array_completeness:Z

    .line 342
    const/16 v5, 0x20

    iput v5, v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->nal_unit_type:I

    .line 343
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->nalUnits:Ljava/util/List;

    .line 344
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->videoParamterSets:Ljava/util/LinkedHashMap;

    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 345
    .local v0, "byteBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    new-array v2, v6, [B

    .line 346
    .local v2, "ps":[B
    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 347
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 348
    iget-object v6, v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->nalUnits:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 351
    .end local v0    # "byteBuffer":Ljava/nio/ByteBuffer;
    .end local v2    # "ps":[B
    :cond_0
    new-instance v3, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;

    invoke-direct {v3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;-><init>()V

    .line 352
    .local v3, "spsArray":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;
    iput-boolean v8, v3, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->array_completeness:Z

    .line 353
    iput v9, v3, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->nal_unit_type:I

    .line 354
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, v3, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->nalUnits:Ljava/util/List;

    .line 355
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->sequenceParamterSets:Ljava/util/LinkedHashMap;

    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 356
    .restart local v0    # "byteBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    new-array v2, v6, [B

    .line 357
    .restart local v2    # "ps":[B
    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 358
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 359
    iget-object v6, v3, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->nalUnits:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 362
    .end local v0    # "byteBuffer":Ljava/nio/ByteBuffer;
    .end local v2    # "ps":[B
    :cond_1
    new-instance v1, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;-><init>()V

    .line 363
    .local v1, "ppsArray":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;
    iput-boolean v8, v1, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->array_completeness:Z

    .line 364
    iput v9, v1, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->nal_unit_type:I

    .line 365
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, v1, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->nalUnits:Ljava/util/List;

    .line 366
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->pictureParamterSets:Ljava/util/LinkedHashMap;

    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 367
    .restart local v0    # "byteBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    new-array v2, v6, [B

    .line 368
    .restart local v2    # "ps":[B
    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 369
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 370
    iget-object v6, v1, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->nalUnits:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 372
    .end local v0    # "byteBuffer":Ljava/nio/ByteBuffer;
    .end local v2    # "ps":[B
    :cond_2
    const/4 v5, 0x3

    new-array v5, v5, [Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;

    aput-object v4, v5, v7

    aput-object v3, v5, v8

    const/4 v6, 0x2

    aput-object v1, v5, v6

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    return-object v5
.end method

.method private hrd_parameters(ZILco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)V
    .locals 22
    .param p1, "commonInfPresentFlag"    # Z
    .param p2, "maxNumSubLayersMinus1"    # I
    .param p3, "r"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 269
    const/4 v15, 0x0

    .line 270
    .local v15, "nal_hrd_parameters_present_flag":Z
    const/16 v19, 0x0

    .line 271
    .local v19, "vcl_hrd_parameters_present_flag":Z
    const/16 v17, 0x0

    .line 272
    .local v17, "sub_pic_hrd_params_present_flag":Z
    if-eqz p1, :cond_3

    .line 273
    const-string v20, "nal_hrd_parameters_present_flag"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v15

    .line 274
    const-string v20, "vcl_hrd_parameters_present_flag"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v19

    .line 275
    if-nez v15, :cond_0

    if-eqz v19, :cond_3

    .line 276
    :cond_0
    const-string v20, "sub_pic_hrd_params_present_flag"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v17

    .line 277
    if-eqz v17, :cond_1

    .line 278
    const/16 v20, 0x8

    const-string v21, "tick_divisor_minus2"

    move-object/from16 v0, p3

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v18

    .line 279
    .local v18, "tick_divisor_minus2":I
    const/16 v20, 0x5

    const-string v21, "du_cpb_removal_delay_increment_length_minus1"

    move-object/from16 v0, p3

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    .line 280
    .local v8, "du_cpb_removal_delay_increment_length_minus1":I
    const-string v20, "sub_pic_cpb_params_in_pic_timing_sei_flag"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v16

    .line 281
    .local v16, "sub_pic_cpb_params_in_pic_timing_sei_flag":Z
    const/16 v20, 0x5

    const-string v21, "dpb_output_delay_du_length_minus1"

    move-object/from16 v0, p3

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    .line 284
    .end local v8    # "du_cpb_removal_delay_increment_length_minus1":I
    .end local v16    # "sub_pic_cpb_params_in_pic_timing_sei_flag":Z
    .end local v18    # "tick_divisor_minus2":I
    :cond_1
    const/16 v20, 0x4

    const-string v21, "bit_rate_scale"

    move-object/from16 v0, p3

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v5

    .line 285
    .local v5, "bit_rate_scale":I
    const/16 v20, 0x4

    const-string v21, "cpb_size_scale"

    move-object/from16 v0, p3

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v7

    .line 286
    .local v7, "cpb_size_scale":I
    if-eqz v17, :cond_2

    .line 287
    const/16 v20, 0x4

    const-string v21, "cpb_size_du_scale"

    move-object/from16 v0, p3

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    .line 289
    :cond_2
    const/16 v20, 0x5

    const-string v21, "initial_cpb_removal_delay_length_minus1"

    move-object/from16 v0, p3

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v13

    .line 290
    .local v13, "initial_cpb_removal_delay_length_minus1":I
    const/16 v20, 0x5

    const-string v21, "au_cpb_removal_delay_length_minus1"

    move-object/from16 v0, p3

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v4

    .line 291
    .local v4, "au_cpb_removal_delay_length_minus1":I
    const/16 v20, 0x5

    const-string v21, "dpb_output_delay_length_minus1"

    move-object/from16 v0, p3

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    .line 294
    .end local v4    # "au_cpb_removal_delay_length_minus1":I
    .end local v5    # "bit_rate_scale":I
    .end local v7    # "cpb_size_scale":I
    .end local v13    # "initial_cpb_removal_delay_length_minus1":I
    :cond_3
    move/from16 v0, p2

    new-array v10, v0, [Z

    .line 295
    .local v10, "fixed_pic_rate_general_flag":[Z
    move/from16 v0, p2

    new-array v11, v0, [Z

    .line 296
    .local v11, "fixed_pic_rate_within_cvs_flag":[Z
    move/from16 v0, p2

    new-array v14, v0, [Z

    .line 297
    .local v14, "low_delay_hrd_flag":[Z
    move/from16 v0, p2

    new-array v6, v0, [I

    .line 298
    .local v6, "cpb_cnt_minus1":[I
    move/from16 v0, p2

    new-array v9, v0, [I

    .line 299
    .local v9, "elemental_duration_in_tc_minus1":[I
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_0
    move/from16 v0, p2

    if-gt v12, v0, :cond_9

    .line 300
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "fixed_pic_rate_general_flag["

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "]"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v20

    aput-boolean v20, v10, v12

    .line 301
    aget-boolean v20, v10, v12

    if-nez v20, :cond_4

    .line 302
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "fixed_pic_rate_within_cvs_flag["

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "]"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v20

    aput-boolean v20, v11, v12

    .line 304
    :cond_4
    aget-boolean v20, v11, v12

    if-eqz v20, :cond_8

    .line 305
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "elemental_duration_in_tc_minus1["

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "]"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v20

    aput v20, v9, v12

    .line 309
    :goto_1
    aget-boolean v20, v14, v12

    if-nez v20, :cond_5

    .line 310
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "cpb_cnt_minus1["

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "]"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v20

    aput v20, v6, v12

    .line 312
    :cond_5
    if-eqz v15, :cond_6

    .line 313
    aget v20, v6, v12

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v17

    move-object/from16 v3, p3

    invoke-virtual {v0, v12, v1, v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->sub_layer_hrd_parameters(IIZLco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)V

    .line 315
    :cond_6
    if-eqz v19, :cond_7

    .line 316
    aget v20, v6, v12

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v17

    move-object/from16 v3, p3

    invoke-virtual {v0, v12, v1, v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->sub_layer_hrd_parameters(IIZLco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)V

    .line 299
    :cond_7
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_0

    .line 307
    :cond_8
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "low_delay_hrd_flag["

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "]"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v20

    aput-boolean v20, v14, v12

    goto :goto_1

    .line 320
    :cond_9
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 3
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;

    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/FileDataSourceImpl;

    const-string v2, "c:\\content\\test-UHD-HEVC_01_FMV_Med_track1.hvc"

    invoke-direct {v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/FileDataSourceImpl;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V

    .line 128
    return-void
.end method


# virtual methods
.method protected createSample(Ljava/util/List;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;)",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;"
        }
    .end annotation

    .prologue
    .line 444
    .local p1, "nals":Ljava/util/List;, "Ljava/util/List<Ljava/nio/ByteBuffer;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    mul-int/lit8 v5, v5, 0x4

    new-array v4, v5, [B

    .line 445
    .local v4, "sizeInfo":[B
    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 446
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

    .line 447
    .local v0, "b":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v6

    invoke-virtual {v3, v6}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    goto :goto_0

    .line 450
    .end local v0    # "b":Ljava/nio/ByteBuffer;
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    mul-int/lit8 v5, v5, 0x2

    new-array v1, v5, [Ljava/nio/ByteBuffer;

    .line 452
    .local v1, "data":[Ljava/nio/ByteBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_1

    .line 453
    mul-int/lit8 v5, v2, 0x2

    mul-int/lit8 v6, v2, 0x4

    const/4 v7, 0x4

    invoke-static {v4, v6, v7}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v6

    aput-object v6, v1, v5

    .line 454
    mul-int/lit8 v5, v2, 0x2

    add-int/lit8 v6, v5, 0x1

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/nio/ByteBuffer;

    aput-object v5, v1, v6

    .line 452
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 457
    :cond_1
    new-instance v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/SampleImpl;

    invoke-direct {v5, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/SampleImpl;-><init>([Ljava/nio/ByteBuffer;)V

    return-object v5
.end method

.method public getFrameRate(Ljava/nio/ByteBuffer;)I
    .locals 31
    .param p1, "vps"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 208
    new-instance v7, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;

    new-instance v29, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/ByteBufferByteChannel;

    const/16 v28, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v28

    check-cast v28, Ljava/nio/ByteBuffer;

    move-object/from16 v0, v29

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/ByteBufferByteChannel;-><init>(Ljava/nio/ByteBuffer;)V

    invoke-static/range {v29 .. v29}, Ljava/nio/channels/Channels;->newInputStream(Ljava/nio/channels/ReadableByteChannel;)Ljava/io/InputStream;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-direct {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;-><init>(Ljava/io/InputStream;)V

    .line 209
    .local v7, "r":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;
    const/16 v28, 0x4

    const-string v29, "vps_parameter_set_id"

    move/from16 v0, v28

    move-object/from16 v1, v29

    invoke-virtual {v7, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v17

    .line 210
    .local v17, "vps_parameter_set_id":I
    const/16 v28, 0x2

    const-string v29, "vps_reserved_three_2bits"

    move/from16 v0, v28

    move-object/from16 v1, v29

    invoke-virtual {v7, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v22

    .line 211
    .local v22, "vps_reserved_three_2bits":I
    const/16 v28, 0x6

    const-string v29, "vps_max_layers_minus1"

    move/from16 v0, v28

    move-object/from16 v1, v29

    invoke-virtual {v7, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v12

    .line 212
    .local v12, "vps_max_layers_minus1":I
    const/16 v28, 0x3

    const-string v29, "vps_max_sub_layers_minus1"

    move/from16 v0, v28

    move-object/from16 v1, v29

    invoke-virtual {v7, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v14

    .line 213
    .local v14, "vps_max_sub_layers_minus1":I
    const-string v28, "vps_temporal_id_nesting_flag"

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v24

    .line 214
    .local v24, "vps_temporal_id_nesting_flag":Z
    const/16 v28, 0x10

    const-string v29, "vps_reserved_0xffff_16bits"

    move/from16 v0, v28

    move-object/from16 v1, v29

    invoke-virtual {v7, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v21

    .line 215
    .local v21, "vps_reserved_0xffff_16bits":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->profile_tier_level(ILco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)V

    .line 218
    const-string v28, "vps_sub_layer_ordering_info_present_flag"

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v23

    .line 219
    .local v23, "vps_sub_layer_ordering_info_present_flag":Z
    if-eqz v23, :cond_0

    const/16 v28, 0x0

    :goto_0
    move/from16 v0, v28

    new-array v9, v0, [I

    .line 220
    .local v9, "vps_max_dec_pic_buffering_minus1":[I
    if-eqz v23, :cond_1

    const/16 v28, 0x0

    :goto_1
    move/from16 v0, v28

    new-array v13, v0, [I

    .line 221
    .local v13, "vps_max_num_reorder_pics":[I
    if-eqz v23, :cond_2

    const/16 v28, 0x0

    :goto_2
    move/from16 v0, v28

    new-array v10, v0, [I

    .line 222
    .local v10, "vps_max_latency_increase_plus1":[I
    if-eqz v23, :cond_3

    const/4 v4, 0x0

    .local v4, "i":I
    :goto_3
    if-gt v4, v14, :cond_4

    .line 223
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "vps_max_dec_pic_buffering_minus1["

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "]"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v28

    aput v28, v9, v4

    .line 224
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "vps_max_dec_pic_buffering_minus1["

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "]"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v28

    aput v28, v13, v4

    .line 225
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "vps_max_dec_pic_buffering_minus1["

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "]"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v28

    aput v28, v10, v4

    .line 222
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .end local v4    # "i":I
    .end local v9    # "vps_max_dec_pic_buffering_minus1":[I
    .end local v10    # "vps_max_latency_increase_plus1":[I
    .end local v13    # "vps_max_num_reorder_pics":[I
    :cond_0
    move/from16 v28, v14

    .line 219
    goto/16 :goto_0

    .restart local v9    # "vps_max_dec_pic_buffering_minus1":[I
    :cond_1
    move/from16 v28, v14

    .line 220
    goto/16 :goto_1

    .restart local v13    # "vps_max_num_reorder_pics":[I
    :cond_2
    move/from16 v28, v14

    .line 221
    goto :goto_2

    .restart local v10    # "vps_max_latency_increase_plus1":[I
    :cond_3
    move v4, v14

    .line 222
    goto :goto_3

    .line 227
    .restart local v4    # "i":I
    :cond_4
    const/16 v28, 0x6

    const-string v29, "vps_max_layer_id"

    move/from16 v0, v28

    move-object/from16 v1, v29

    invoke-virtual {v7, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v11

    .line 228
    .local v11, "vps_max_layer_id":I
    const-string v28, "vps_num_layer_sets_minus1"

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v16

    .line 229
    .local v16, "vps_num_layer_sets_minus1":I
    move/from16 v0, v16

    filled-new-array {v0, v11}, [I

    move-result-object v28

    sget-object v29, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v29

    move-object/from16 v1, v28

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [[Z

    .line 230
    .local v6, "layer_id_included_flag":[[Z
    const/4 v4, 0x1

    :goto_4
    move/from16 v0, v16

    if-gt v4, v0, :cond_6

    .line 231
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_5
    if-gt v5, v11, :cond_5

    .line 232
    aget-object v28, v6, v4

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "layer_id_included_flag["

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, "]["

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, "]"

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v29

    aput-boolean v29, v28, v5

    .line 231
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 230
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 235
    .end local v5    # "j":I
    :cond_6
    const-string v28, "vps_timing_info_present_flag"

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v25

    .line 236
    .local v25, "vps_timing_info_present_flag":Z
    if-eqz v25, :cond_9

    .line 237
    const/16 v28, 0x20

    const-string v29, "vps_num_units_in_tick"

    move/from16 v0, v28

    move-object/from16 v1, v29

    invoke-virtual {v7, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v28

    move/from16 v0, v28

    int-to-long v0, v0

    move-wide/from16 v18, v0

    .line 238
    .local v18, "vps_num_units_in_tick":J
    const/16 v28, 0x20

    const-string v29, "vps_time_scale"

    move/from16 v0, v28

    move-object/from16 v1, v29

    invoke-virtual {v7, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v28

    move/from16 v0, v28

    int-to-long v0, v0

    move-wide/from16 v26, v0

    .line 239
    .local v26, "vps_time_scale":J
    const-string v28, "vps_poc_proportional_to_timing_flag"

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v20

    .line 240
    .local v20, "vps_poc_proportional_to_timing_flag":Z
    if-eqz v20, :cond_7

    .line 241
    const-string v28, "vps_num_ticks_poc_diff_one_minus1"

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    .line 243
    :cond_7
    const-string v28, "vps_num_hrd_parameters"

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v15

    .line 244
    .local v15, "vps_num_hrd_parameters":I
    new-array v3, v15, [I

    .line 245
    .local v3, "hrd_layer_set_idx":[I
    new-array v2, v15, [Z

    .line 246
    .local v2, "cprms_present_flag":[Z
    const/4 v4, 0x0

    :goto_6
    if-ge v4, v15, :cond_9

    .line 247
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "hrd_layer_set_idx["

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "]"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v28

    aput v28, v3, v4

    .line 248
    if-lez v4, :cond_8

    .line 249
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "cprms_present_flag["

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "]"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v28

    aput-boolean v28, v2, v4

    .line 254
    :goto_7
    aget-boolean v28, v2, v4

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-direct {v0, v1, v14, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->hrd_parameters(ZILco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)V

    .line 246
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    .line 251
    :cond_8
    const/16 v28, 0x0

    const/16 v29, 0x1

    aput-boolean v29, v2, v28

    goto :goto_7

    .line 258
    .end local v2    # "cprms_present_flag":[Z
    .end local v3    # "hrd_layer_set_idx":[I
    .end local v15    # "vps_num_hrd_parameters":I
    .end local v18    # "vps_num_units_in_tick":J
    .end local v20    # "vps_poc_proportional_to_timing_flag":Z
    .end local v26    # "vps_time_scale":J
    :cond_9
    const-string v28, "vps_extension_flag"

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v8

    .line 259
    .local v8, "vps_extension_flag":Z
    if-eqz v8, :cond_a

    .line 260
    :goto_8
    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->moreRBSPData()Z

    move-result v28

    if-eqz v28, :cond_a

    .line 261
    const-string v28, "vps_extension_data_flag"

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    goto :goto_8

    .line 264
    :cond_a
    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readTrailingBits()V

    .line 265
    const/16 v28, 0x0

    return v28
.end method

.method public getNalUnitHeader(Ljava/nio/ByteBuffer;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;
    .locals 3
    .param p1, "nal"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 431
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 432
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v1

    .line 435
    .local v1, "nal_unit_header":I
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;-><init>()V

    .line 436
    .local v0, "nalUnitHeader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;
    const v2, 0x8000

    and-int/2addr v2, v1

    shr-int/lit8 v2, v2, 0xf

    iput v2, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;->forbiddenZeroFlag:I

    .line 437
    and-int/lit16 v2, v1, 0x7e00

    shr-int/lit8 v2, v2, 0x9

    iput v2, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;->nalUnitType:I

    .line 438
    and-int/lit16 v2, v1, 0x1f8

    shr-int/lit8 v2, v2, 0x3

    iput v2, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;->nuhLayerId:I

    .line 439
    and-int/lit8 v2, v1, 0x7

    iput v2, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;->nuhTemporalIdPlusOne:I

    .line 440
    return-object v0
.end method

.method isFirstOfAU(ILjava/nio/ByteBuffer;Ljava/util/List;)Z
    .locals 7
    .param p1, "nalUnitType"    # I
    .param p2, "nalUnit"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/nio/ByteBuffer;",
            "Ljava/util/List",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p3, "accessUnit":Ljava/util/List;, "Ljava/util/List<Ljava/nio/ByteBuffer;>;"
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 376
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 427
    :goto_0
    return v4

    .line 379
    :cond_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {p3, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/nio/ByteBuffer;

    invoke-virtual {p0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;->getNalUnitHeader(Ljava/nio/ByteBuffer;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;

    move-result-object v3

    iget v3, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$NalUnitHeader;->nalUnitType:I

    const/16 v6, 0x1f

    if-gt v3, v6, :cond_2

    move v2, v4

    .line 380
    .local v2, "vclPresentInCurrentAU":Z
    :goto_1
    packed-switch p1, :pswitch_data_0

    .line 402
    :cond_1
    :pswitch_0
    packed-switch p1, :pswitch_data_1

    :pswitch_1
    move v4, v5

    .line 427
    goto :goto_0

    .end local v2    # "vclPresentInCurrentAU":Z
    :cond_2
    move v2, v5

    .line 379
    goto :goto_1

    .line 398
    .restart local v2    # "vclPresentInCurrentAU":Z
    :pswitch_2
    if-eqz v2, :cond_1

    goto :goto_0

    .line 419
    :pswitch_3
    const/16 v3, 0x32

    new-array v0, v3, [B

    .line 420
    .local v0, "b":[B
    invoke-virtual {p2, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 421
    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 422
    const/4 v3, 0x2

    invoke-virtual {p2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 423
    invoke-static {p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v1

    .line 425
    .local v1, "firstRsbp8Bit":I
    if-eqz v2, :cond_3

    and-int/lit16 v3, v1, 0x80

    if-lez v3, :cond_3

    move v3, v4

    :goto_2
    move v4, v3

    goto :goto_0

    :cond_3
    move v3, v5

    goto :goto_2

    .line 380
    :pswitch_data_0
    .packed-switch 0x20
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch

    .line 402
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method

.method public profile_tier_level(ILco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)V
    .locals 31
    .param p1, "maxNumSubLayersMinus1"    # I
    .param p2, "r"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 148
    const/16 v28, 0x2

    const-string v29, "general_profile_space "

    move-object/from16 v0, p2

    move/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v10

    .line 149
    .local v10, "general_profile_space":I
    const-string v28, "general_tier_flag"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v14

    .line 150
    .local v14, "general_tier_flag":Z
    const/16 v28, 0x5

    const-string v29, "general_profile_idc"

    move-object/from16 v0, p2

    move/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v9

    .line 151
    .local v9, "general_profile_idc":I
    const/16 v28, 0x20

    move/from16 v0, v28

    new-array v8, v0, [Z

    .line 152
    .local v8, "general_profile_compatibility_flag":[Z
    const/16 v16, 0x0

    .local v16, "j":I
    :goto_0
    const/16 v28, 0x20

    move/from16 v0, v16

    move/from16 v1, v28

    if-ge v0, v1, :cond_0

    .line 153
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "general_profile_compatibility_flag["

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "]"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v28

    aput-boolean v28, v8, v16

    .line 152
    add-int/lit8 v16, v16, 0x1

    goto :goto_0

    .line 155
    :cond_0
    const-string v28, "general_progressive_source_flag"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v11

    .line 156
    .local v11, "general_progressive_source_flag":Z
    const-string v28, "general_interlaced_source_flag"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    .line 157
    .local v5, "general_interlaced_source_flag":Z
    const-string v28, "general_non_packed_constraint_flag"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v7

    .line 158
    .local v7, "general_non_packed_constraint_flag":Z
    const-string v28, "general_frame_only_constraint_flag"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v4

    .line 160
    .local v4, "general_frame_only_constraint_flag":Z
    const/16 v28, 0x2c

    const-string v29, "general_reserved_zero_44bits"

    move-object/from16 v0, p2

    move/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v28

    move/from16 v0, v28

    int-to-long v12, v0

    .line 161
    .local v12, "general_reserved_zero_44bits":J
    const/16 v28, 0x8

    const-string v29, "general_level_idc"

    move-object/from16 v0, p2

    move/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v6

    .line 163
    .local v6, "general_level_idc":I
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v24, v0

    .line 164
    .local v24, "sub_layer_profile_present_flag":[Z
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v20, v0

    .line 165
    .local v20, "sub_layer_level_present_flag":[Z
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_1
    move/from16 v0, p1

    if-ge v15, v0, :cond_1

    .line 166
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "sub_layer_profile_present_flag["

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "]"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v28

    aput-boolean v28, v24, v15

    .line 167
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "sub_layer_level_present_flag["

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "]"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v28

    aput-boolean v28, v20, v15

    .line 165
    add-int/lit8 v15, v15, 0x1

    goto :goto_1

    .line 169
    :cond_1
    if-lez p1, :cond_2

    .line 170
    move/from16 v15, p1

    :goto_2
    const/16 v28, 0x8

    move/from16 v0, v28

    if-ge v15, v0, :cond_2

    .line 171
    const/16 v28, 0x2

    const-string v29, "reserved_zero_2bits"

    move-object/from16 v0, p2

    move/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    .line 170
    add-int/lit8 v15, v15, 0x1

    goto :goto_2

    .line 176
    :cond_2
    move/from16 v0, p1

    new-array v0, v0, [I

    move-object/from16 v25, v0

    .line 177
    .local v25, "sub_layer_profile_space":[I
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v27, v0

    .line 178
    .local v27, "sub_layer_tier_flag":[Z
    move/from16 v0, p1

    new-array v0, v0, [I

    move-object/from16 v23, v0

    .line 179
    .local v23, "sub_layer_profile_idc":[I
    const/16 v28, 0x20

    move/from16 v0, p1

    move/from16 v1, v28

    filled-new-array {v0, v1}, [I

    move-result-object v28

    sget-object v29, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v29

    move-object/from16 v1, v28

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, [[Z

    .line 180
    .local v22, "sub_layer_profile_compatibility_flag":[[Z
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v26, v0

    .line 182
    .local v26, "sub_layer_progressive_source_flag":[Z
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v18, v0

    .line 183
    .local v18, "sub_layer_interlaced_source_flag":[Z
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v21, v0

    .line 184
    .local v21, "sub_layer_non_packed_constraint_flag":[Z
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v17, v0

    .line 185
    .local v17, "sub_layer_frame_only_constraint_flag":[Z
    move/from16 v0, p1

    new-array v0, v0, [I

    move-object/from16 v19, v0

    .line 187
    .local v19, "sub_layer_level_idc":[I
    const/4 v15, 0x0

    :goto_3
    move/from16 v0, p1

    if-ge v15, v0, :cond_6

    .line 188
    aget-boolean v28, v24, v15

    if-eqz v28, :cond_4

    .line 189
    const/16 v28, 0x2

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "sub_layer_profile_space["

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, "]"

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, p2

    move/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v28

    aput v28, v25, v15

    .line 190
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "sub_layer_tier_flag["

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "]"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v28

    aput-boolean v28, v27, v15

    .line 191
    const/16 v28, 0x5

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "sub_layer_profile_idc["

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, "]"

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, p2

    move/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v28

    aput v28, v23, v15

    .line 192
    const/16 v16, 0x0

    :goto_4
    const/16 v28, 0x20

    move/from16 v0, v16

    move/from16 v1, v28

    if-ge v0, v1, :cond_3

    .line 193
    aget-object v28, v22, v15

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "sub_layer_profile_compatibility_flag["

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, "]["

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, "]"

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v29

    aput-boolean v29, v28, v16

    .line 192
    add-int/lit8 v16, v16, 0x1

    goto :goto_4

    .line 195
    :cond_3
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "sub_layer_progressive_source_flag["

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "]"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v28

    aput-boolean v28, v26, v15

    .line 196
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "sub_layer_interlaced_source_flag["

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "]"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v28

    aput-boolean v28, v18, v15

    .line 197
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "sub_layer_non_packed_constraint_flag["

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "]"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v28

    aput-boolean v28, v21, v15

    .line 198
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "sub_layer_frame_only_constraint_flag["

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "]"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v28

    aput-boolean v28, v17, v15

    .line 199
    const/16 v28, 0x2c

    const-string v29, "reserved"

    move-object/from16 v0, p2

    move/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    .line 201
    :cond_4
    aget-boolean v28, v20, v15

    if-eqz v28, :cond_5

    .line 202
    const/16 v28, 0x8

    const-string v29, "sub_layer_level_idc"

    move-object/from16 v0, p2

    move/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v28

    aput v28, v19, v15

    .line 187
    :cond_5
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_3

    .line 204
    :cond_6
    return-void
.end method

.method sub_layer_hrd_parameters(IIZLco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)V
    .locals 8
    .param p1, "subLayerId"    # I
    .param p2, "cpbCnt"    # I
    .param p3, "sub_pic_hrd_params_present_flag"    # Z
    .param p4, "r"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 323
    new-array v1, p2, [I

    .line 324
    .local v1, "bit_rate_value_minus1":[I
    new-array v4, p2, [I

    .line 325
    .local v4, "cpb_size_value_minus1":[I
    new-array v3, p2, [I

    .line 326
    .local v3, "cpb_size_du_value_minus1":[I
    new-array v0, p2, [I

    .line 327
    .local v0, "bit_rate_du_value_minus1":[I
    new-array v2, p2, [Z

    .line 328
    .local v2, "cbr_flag":[Z
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-gt v5, p2, :cond_1

    .line 329
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "bit_rate_value_minus1["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p4, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v6

    aput v6, v1, v5

    .line 330
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "cpb_size_value_minus1["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p4, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v6

    aput v6, v4, v5

    .line 331
    if-eqz p3, :cond_0

    .line 332
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "cpb_size_du_value_minus1["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p4, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v6

    aput v6, v3, v5

    .line 333
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "bit_rate_du_value_minus1["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p4, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v6

    aput v6, v0, v5

    .line 335
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "cbr_flag["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p4, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v6

    aput-boolean v6, v2, v5

    .line 328
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 337
    :cond_1
    return-void
.end method
