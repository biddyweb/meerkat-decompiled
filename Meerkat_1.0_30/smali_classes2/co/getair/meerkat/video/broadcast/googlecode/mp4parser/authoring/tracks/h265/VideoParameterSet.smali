.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/VideoParameterSet;
.super Ljava/lang/Object;
.source "VideoParameterSet.java"


# instance fields
.field vps:Ljava/nio/ByteBuffer;

.field vps_parameter_set_id:I


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 30
    .param p1, "vps"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 15
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 16
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/VideoParameterSet;->vps:Ljava/nio/ByteBuffer;

    .line 17
    new-instance v7, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;

    new-instance v28, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/ByteBufferByteChannel;

    const/16 v27, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v27

    check-cast v27, Ljava/nio/ByteBuffer;

    move-object/from16 v0, v28

    move-object/from16 v1, v27

    invoke-direct {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/ByteBufferByteChannel;-><init>(Ljava/nio/ByteBuffer;)V

    invoke-static/range {v28 .. v28}, Ljava/nio/channels/Channels;->newInputStream(Ljava/nio/channels/ReadableByteChannel;)Ljava/io/InputStream;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-direct {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;-><init>(Ljava/io/InputStream;)V

    .line 18
    .local v7, "r":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;
    const/16 v27, 0x4

    const-string v28, "vps_parameter_set_id"

    move/from16 v0, v27

    move-object/from16 v1, v28

    invoke-virtual {v7, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v27

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/VideoParameterSet;->vps_parameter_set_id:I

    .line 19
    const/16 v27, 0x2

    const-string v28, "vps_reserved_three_2bits"

    move/from16 v0, v27

    move-object/from16 v1, v28

    invoke-virtual {v7, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v21

    .line 20
    .local v21, "vps_reserved_three_2bits":I
    const/16 v27, 0x6

    const-string v28, "vps_max_layers_minus1"

    move/from16 v0, v27

    move-object/from16 v1, v28

    invoke-virtual {v7, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v12

    .line 21
    .local v12, "vps_max_layers_minus1":I
    const/16 v27, 0x3

    const-string v28, "vps_max_sub_layers_minus1"

    move/from16 v0, v27

    move-object/from16 v1, v28

    invoke-virtual {v7, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v14

    .line 22
    .local v14, "vps_max_sub_layers_minus1":I
    const-string v27, "vps_temporal_id_nesting_flag"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v23

    .line 23
    .local v23, "vps_temporal_id_nesting_flag":Z
    const/16 v27, 0x10

    const-string v28, "vps_reserved_0xffff_16bits"

    move/from16 v0, v27

    move-object/from16 v1, v28

    invoke-virtual {v7, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v20

    .line 24
    .local v20, "vps_reserved_0xffff_16bits":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/VideoParameterSet;->profile_tier_level(ILco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)V

    .line 27
    const-string v27, "vps_sub_layer_ordering_info_present_flag"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v22

    .line 28
    .local v22, "vps_sub_layer_ordering_info_present_flag":Z
    if-eqz v22, :cond_0

    const/16 v27, 0x1

    :goto_0
    move/from16 v0, v27

    new-array v9, v0, [I

    .line 29
    .local v9, "vps_max_dec_pic_buffering_minus1":[I
    if-eqz v22, :cond_1

    const/16 v27, 0x1

    :goto_1
    move/from16 v0, v27

    new-array v13, v0, [I

    .line 30
    .local v13, "vps_max_num_reorder_pics":[I
    if-eqz v22, :cond_2

    const/16 v27, 0x1

    :goto_2
    move/from16 v0, v27

    new-array v10, v0, [I

    .line 31
    .local v10, "vps_max_latency_increase_plus1":[I
    if-eqz v22, :cond_3

    const/4 v4, 0x0

    .local v4, "i":I
    :goto_3
    if-gt v4, v14, :cond_4

    .line 32
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "vps_max_dec_pic_buffering_minus1["

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "]"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v27

    aput v27, v9, v4

    .line 33
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "vps_max_dec_pic_buffering_minus1["

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "]"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v27

    aput v27, v13, v4

    .line 34
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "vps_max_dec_pic_buffering_minus1["

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "]"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v27

    aput v27, v10, v4

    .line 31
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 28
    .end local v4    # "i":I
    .end local v9    # "vps_max_dec_pic_buffering_minus1":[I
    .end local v10    # "vps_max_latency_increase_plus1":[I
    .end local v13    # "vps_max_num_reorder_pics":[I
    :cond_0
    add-int/lit8 v27, v14, 0x1

    goto/16 :goto_0

    .line 29
    .restart local v9    # "vps_max_dec_pic_buffering_minus1":[I
    :cond_1
    add-int/lit8 v27, v14, 0x1

    goto/16 :goto_1

    .line 30
    .restart local v13    # "vps_max_num_reorder_pics":[I
    :cond_2
    add-int/lit8 v27, v14, 0x1

    goto :goto_2

    .restart local v10    # "vps_max_latency_increase_plus1":[I
    :cond_3
    move v4, v14

    .line 31
    goto :goto_3

    .line 36
    .restart local v4    # "i":I
    :cond_4
    const/16 v27, 0x6

    const-string v28, "vps_max_layer_id"

    move/from16 v0, v27

    move-object/from16 v1, v28

    invoke-virtual {v7, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v11

    .line 37
    .local v11, "vps_max_layer_id":I
    const-string v27, "vps_num_layer_sets_minus1"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v16

    .line 38
    .local v16, "vps_num_layer_sets_minus1":I
    move/from16 v0, v16

    filled-new-array {v0, v11}, [I

    move-result-object v27

    sget-object v28, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v28

    move-object/from16 v1, v27

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [[Z

    .line 39
    .local v6, "layer_id_included_flag":[[Z
    const/4 v4, 0x1

    :goto_4
    move/from16 v0, v16

    if-gt v4, v0, :cond_6

    .line 40
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_5
    if-gt v5, v11, :cond_5

    .line 41
    aget-object v27, v6, v4

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "layer_id_included_flag["

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "]["

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "]"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v28

    aput-boolean v28, v27, v5

    .line 40
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 39
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 44
    .end local v5    # "j":I
    :cond_6
    const-string v27, "vps_timing_info_present_flag"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v26

    .line 45
    .local v26, "vps_timing_info_present_flag":Z
    if-eqz v26, :cond_9

    .line 46
    const/16 v27, 0x20

    const-string v28, "vps_num_units_in_tick"

    move/from16 v0, v27

    move-object/from16 v1, v28

    invoke-virtual {v7, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v18, v0

    .line 47
    .local v18, "vps_num_units_in_tick":J
    const/16 v27, 0x20

    const-string v28, "vps_time_scale"

    move/from16 v0, v27

    move-object/from16 v1, v28

    invoke-virtual {v7, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v24, v0

    .line 48
    .local v24, "vps_time_scale":J
    const-string v27, "vps_poc_proportional_to_timing_flag"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v17

    .line 49
    .local v17, "vps_poc_proportional_to_timing_flag":Z
    if-eqz v17, :cond_7

    .line 50
    const-string v27, "vps_num_ticks_poc_diff_one_minus1"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    .line 52
    :cond_7
    const-string v27, "vps_num_hrd_parameters"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v15

    .line 53
    .local v15, "vps_num_hrd_parameters":I
    new-array v3, v15, [I

    .line 54
    .local v3, "hrd_layer_set_idx":[I
    new-array v2, v15, [Z

    .line 55
    .local v2, "cprms_present_flag":[Z
    const/4 v4, 0x0

    :goto_6
    if-ge v4, v15, :cond_9

    .line 56
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "hrd_layer_set_idx["

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "]"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v27

    aput v27, v3, v4

    .line 57
    if-lez v4, :cond_8

    .line 58
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "cprms_present_flag["

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "]"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v27

    aput-boolean v27, v2, v4

    .line 63
    :goto_7
    aget-boolean v27, v2, v4

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-direct {v0, v1, v14, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/VideoParameterSet;->hrd_parameters(ZILco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)V

    .line 55
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    .line 60
    :cond_8
    const/16 v27, 0x0

    const/16 v28, 0x1

    aput-boolean v28, v2, v27

    goto :goto_7

    .line 67
    .end local v2    # "cprms_present_flag":[Z
    .end local v3    # "hrd_layer_set_idx":[I
    .end local v15    # "vps_num_hrd_parameters":I
    .end local v17    # "vps_poc_proportional_to_timing_flag":Z
    .end local v18    # "vps_num_units_in_tick":J
    .end local v24    # "vps_time_scale":J
    :cond_9
    const-string v27, "vps_extension_flag"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v8

    .line 68
    .local v8, "vps_extension_flag":Z
    if-eqz v8, :cond_a

    .line 69
    :goto_8
    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->moreRBSPData()Z

    move-result v27

    if-eqz v27, :cond_a

    .line 70
    const-string v27, "vps_extension_data_flag"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    goto :goto_8

    .line 73
    :cond_a
    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readTrailingBits()V

    .line 75
    return-void
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
    .line 137
    const/4 v15, 0x0

    .line 138
    .local v15, "nal_hrd_parameters_present_flag":Z
    const/16 v19, 0x0

    .line 139
    .local v19, "vcl_hrd_parameters_present_flag":Z
    const/16 v17, 0x0

    .line 140
    .local v17, "sub_pic_hrd_params_present_flag":Z
    if-eqz p1, :cond_3

    .line 141
    const-string v20, "nal_hrd_parameters_present_flag"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v15

    .line 142
    const-string v20, "vcl_hrd_parameters_present_flag"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v19

    .line 143
    if-nez v15, :cond_0

    if-eqz v19, :cond_3

    .line 144
    :cond_0
    const-string v20, "sub_pic_hrd_params_present_flag"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v17

    .line 145
    if-eqz v17, :cond_1

    .line 146
    const/16 v20, 0x8

    const-string v21, "tick_divisor_minus2"

    move-object/from16 v0, p3

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v18

    .line 147
    .local v18, "tick_divisor_minus2":I
    const/16 v20, 0x5

    const-string v21, "du_cpb_removal_delay_increment_length_minus1"

    move-object/from16 v0, p3

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    .line 148
    .local v8, "du_cpb_removal_delay_increment_length_minus1":I
    const-string v20, "sub_pic_cpb_params_in_pic_timing_sei_flag"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v16

    .line 149
    .local v16, "sub_pic_cpb_params_in_pic_timing_sei_flag":Z
    const/16 v20, 0x5

    const-string v21, "dpb_output_delay_du_length_minus1"

    move-object/from16 v0, p3

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    .line 152
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

    .line 153
    .local v5, "bit_rate_scale":I
    const/16 v20, 0x4

    const-string v21, "cpb_size_scale"

    move-object/from16 v0, p3

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v7

    .line 154
    .local v7, "cpb_size_scale":I
    if-eqz v17, :cond_2

    .line 155
    const/16 v20, 0x4

    const-string v21, "cpb_size_du_scale"

    move-object/from16 v0, p3

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    .line 157
    :cond_2
    const/16 v20, 0x5

    const-string v21, "initial_cpb_removal_delay_length_minus1"

    move-object/from16 v0, p3

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v13

    .line 158
    .local v13, "initial_cpb_removal_delay_length_minus1":I
    const/16 v20, 0x5

    const-string v21, "au_cpb_removal_delay_length_minus1"

    move-object/from16 v0, p3

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v4

    .line 159
    .local v4, "au_cpb_removal_delay_length_minus1":I
    const/16 v20, 0x5

    const-string v21, "dpb_output_delay_length_minus1"

    move-object/from16 v0, p3

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    .line 162
    .end local v4    # "au_cpb_removal_delay_length_minus1":I
    .end local v5    # "bit_rate_scale":I
    .end local v7    # "cpb_size_scale":I
    .end local v13    # "initial_cpb_removal_delay_length_minus1":I
    :cond_3
    move/from16 v0, p2

    new-array v10, v0, [Z

    .line 163
    .local v10, "fixed_pic_rate_general_flag":[Z
    move/from16 v0, p2

    new-array v11, v0, [Z

    .line 164
    .local v11, "fixed_pic_rate_within_cvs_flag":[Z
    move/from16 v0, p2

    new-array v14, v0, [Z

    .line 165
    .local v14, "low_delay_hrd_flag":[Z
    move/from16 v0, p2

    new-array v6, v0, [I

    .line 166
    .local v6, "cpb_cnt_minus1":[I
    move/from16 v0, p2

    new-array v9, v0, [I

    .line 167
    .local v9, "elemental_duration_in_tc_minus1":[I
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_0
    move/from16 v0, p2

    if-gt v12, v0, :cond_9

    .line 168
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

    .line 169
    aget-boolean v20, v10, v12

    if-nez v20, :cond_4

    .line 170
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

    .line 172
    :cond_4
    aget-boolean v20, v11, v12

    if-eqz v20, :cond_8

    .line 173
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

    .line 177
    :goto_1
    aget-boolean v20, v14, v12

    if-nez v20, :cond_5

    .line 178
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

    .line 180
    :cond_5
    if-eqz v15, :cond_6

    .line 181
    aget v20, v6, v12

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v17

    move-object/from16 v3, p3

    invoke-virtual {v0, v12, v1, v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/VideoParameterSet;->sub_layer_hrd_parameters(IIZLco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)V

    .line 183
    :cond_6
    if-eqz v19, :cond_7

    .line 184
    aget v20, v6, v12

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v17

    move-object/from16 v3, p3

    invoke-virtual {v0, v12, v1, v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/VideoParameterSet;->sub_layer_hrd_parameters(IIZLco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)V

    .line 167
    :cond_7
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_0

    .line 175
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

    .line 188
    :cond_9
    return-void
.end method


# virtual methods
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
    .line 78
    const/16 v28, 0x2

    const-string v29, "general_profile_space "

    move-object/from16 v0, p2

    move/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v10

    .line 79
    .local v10, "general_profile_space":I
    const-string v28, "general_tier_flag"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v14

    .line 80
    .local v14, "general_tier_flag":Z
    const/16 v28, 0x5

    const-string v29, "general_profile_idc"

    move-object/from16 v0, p2

    move/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v9

    .line 81
    .local v9, "general_profile_idc":I
    const/16 v28, 0x20

    move/from16 v0, v28

    new-array v8, v0, [Z

    .line 82
    .local v8, "general_profile_compatibility_flag":[Z
    const/16 v16, 0x0

    .local v16, "j":I
    :goto_0
    const/16 v28, 0x20

    move/from16 v0, v16

    move/from16 v1, v28

    if-ge v0, v1, :cond_0

    .line 83
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

    .line 82
    add-int/lit8 v16, v16, 0x1

    goto :goto_0

    .line 85
    :cond_0
    const-string v28, "general_progressive_source_flag"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v11

    .line 86
    .local v11, "general_progressive_source_flag":Z
    const-string v28, "general_interlaced_source_flag"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    .line 87
    .local v5, "general_interlaced_source_flag":Z
    const-string v28, "general_non_packed_constraint_flag"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v7

    .line 88
    .local v7, "general_non_packed_constraint_flag":Z
    const-string v28, "general_frame_only_constraint_flag"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v4

    .line 90
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

    .line 91
    .local v12, "general_reserved_zero_44bits":J
    const/16 v28, 0x8

    const-string v29, "general_level_idc"

    move-object/from16 v0, p2

    move/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v6

    .line 93
    .local v6, "general_level_idc":I
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v24, v0

    .line 94
    .local v24, "sub_layer_profile_present_flag":[Z
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v20, v0

    .line 95
    .local v20, "sub_layer_level_present_flag":[Z
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_1
    move/from16 v0, p1

    if-ge v15, v0, :cond_1

    .line 96
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

    .line 97
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

    .line 95
    add-int/lit8 v15, v15, 0x1

    goto :goto_1

    .line 99
    :cond_1
    if-lez p1, :cond_2

    .line 100
    move/from16 v15, p1

    :goto_2
    const/16 v28, 0x8

    move/from16 v0, v28

    if-ge v15, v0, :cond_2

    .line 101
    const/16 v28, 0x2

    const-string v29, "reserved_zero_2bits"

    move-object/from16 v0, p2

    move/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    .line 100
    add-int/lit8 v15, v15, 0x1

    goto :goto_2

    .line 106
    :cond_2
    move/from16 v0, p1

    new-array v0, v0, [I

    move-object/from16 v25, v0

    .line 107
    .local v25, "sub_layer_profile_space":[I
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v27, v0

    .line 108
    .local v27, "sub_layer_tier_flag":[Z
    move/from16 v0, p1

    new-array v0, v0, [I

    move-object/from16 v23, v0

    .line 109
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

    .line 110
    .local v22, "sub_layer_profile_compatibility_flag":[[Z
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v26, v0

    .line 112
    .local v26, "sub_layer_progressive_source_flag":[Z
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v18, v0

    .line 113
    .local v18, "sub_layer_interlaced_source_flag":[Z
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v21, v0

    .line 114
    .local v21, "sub_layer_non_packed_constraint_flag":[Z
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v17, v0

    .line 115
    .local v17, "sub_layer_frame_only_constraint_flag":[Z
    move/from16 v0, p1

    new-array v0, v0, [I

    move-object/from16 v19, v0

    .line 117
    .local v19, "sub_layer_level_idc":[I
    const/4 v15, 0x0

    :goto_3
    move/from16 v0, p1

    if-ge v15, v0, :cond_6

    .line 118
    aget-boolean v28, v24, v15

    if-eqz v28, :cond_4

    .line 119
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

    .line 120
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

    .line 121
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

    .line 122
    const/16 v16, 0x0

    :goto_4
    const/16 v28, 0x20

    move/from16 v0, v16

    move/from16 v1, v28

    if-ge v0, v1, :cond_3

    .line 123
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

    .line 122
    add-int/lit8 v16, v16, 0x1

    goto :goto_4

    .line 125
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

    .line 126
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

    .line 127
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

    .line 128
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

    .line 129
    const/16 v28, 0x2c

    const-string v29, "reserved"

    move-object/from16 v0, p2

    move/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    .line 131
    :cond_4
    aget-boolean v28, v20, v15

    if-eqz v28, :cond_5

    .line 132
    const/16 v28, 0x8

    const-string v29, "sub_layer_level_idc"

    move-object/from16 v0, p2

    move/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v28

    aput v28, v19, v15

    .line 117
    :cond_5
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_3

    .line 134
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
    .line 191
    new-array v1, p2, [I

    .line 192
    .local v1, "bit_rate_value_minus1":[I
    new-array v4, p2, [I

    .line 193
    .local v4, "cpb_size_value_minus1":[I
    new-array v3, p2, [I

    .line 194
    .local v3, "cpb_size_du_value_minus1":[I
    new-array v0, p2, [I

    .line 195
    .local v0, "bit_rate_du_value_minus1":[I
    new-array v2, p2, [Z

    .line 196
    .local v2, "cbr_flag":[Z
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-gt v5, p2, :cond_1

    .line 197
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

    .line 198
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

    .line 199
    if-eqz p3, :cond_0

    .line 200
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

    .line 201
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

    .line 203
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

    .line 196
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 205
    :cond_1
    return-void
.end method

.method public toByteBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    .prologue
    .line 208
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/VideoParameterSet;->vps:Ljava/nio/ByteBuffer;

    return-object v0
.end method
