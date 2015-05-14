.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/SequenceParameterSetRbsp;
.super Ljava/lang/Object;
.source "SequenceParameterSetRbsp.java"


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 40
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 12
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;

    move-object/from16 v0, p1

    invoke-direct {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;-><init>(Ljava/io/InputStream;)V

    .line 15
    .local v5, "bsr":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;
    const/16 v37, 0x4

    const-string v38, "sps_video_parameter_set_id"

    move/from16 v0, v37

    move-object/from16 v1, v38

    invoke-virtual {v5, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v38

    move-wide/from16 v0, v38

    long-to-int v0, v0

    move/from16 v36, v0

    .line 16
    .local v36, "sps_video_parameter_set_id":I
    const/16 v37, 0x3

    const-string v38, "sps_max_sub_layers_minus1"

    move/from16 v0, v37

    move-object/from16 v1, v38

    invoke-virtual {v5, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v38

    move-wide/from16 v0, v38

    long-to-int v0, v0

    move/from16 v31, v0

    .line 17
    .local v31, "sps_max_sub_layers_minus1":I
    const-string v37, "sps_temporal_id_nesting_flag"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v35

    .line 18
    .local v35, "sps_temporal_id_nesting_flag":Z
    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/SequenceParameterSetRbsp;->profile_tier_level(ILco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)V

    .line 19
    const-string v37, "sps_seq_parameter_set_id"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v33

    .line 20
    .local v33, "sps_seq_parameter_set_id":I
    const-string v37, "chroma_format_idc"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v6

    .line 21
    .local v6, "chroma_format_idc":I
    const/16 v37, 0x3

    move/from16 v0, v37

    if-ne v6, v0, :cond_0

    .line 22
    invoke-virtual {v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->read1Bit()I

    move-result v27

    .line 23
    .local v27, "separate_colour_plane_flag":I
    const-string v37, "pic_width_in_luma_samples"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v24

    .line 24
    .local v24, "pic_width_in_luma_samples":I
    const-string v37, "pic_width_in_luma_samples"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v23

    .line 25
    .local v23, "pic_height_in_luma_samples":I
    const-string v37, "conformance_window_flag"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v10

    .line 26
    .local v10, "conformance_window_flag":Z
    if-eqz v10, :cond_0

    .line 27
    const-string v37, "conf_win_left_offset"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v7

    .line 28
    .local v7, "conf_win_left_offset":I
    const-string v37, "conf_win_right_offset"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v8

    .line 29
    .local v8, "conf_win_right_offset":I
    const-string v37, "conf_win_top_offset"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v9

    .line 30
    .local v9, "conf_win_top_offset":I
    const-string v37, "conf_win_bottom_offset"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    .line 33
    .end local v7    # "conf_win_left_offset":I
    .end local v8    # "conf_win_right_offset":I
    .end local v9    # "conf_win_top_offset":I
    .end local v10    # "conformance_window_flag":Z
    .end local v23    # "pic_height_in_luma_samples":I
    .end local v24    # "pic_width_in_luma_samples":I
    .end local v27    # "separate_colour_plane_flag":I
    :cond_0
    const-string v37, "bit_depth_luma_minus8"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v4

    .line 34
    .local v4, "bit_depth_luma_minus8":I
    const-string v37, "bit_depth_chroma_minus8"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v3

    .line 35
    .local v3, "bit_depth_chroma_minus8":I
    const-string v37, "log2_max_pic_order_cnt_lsb_minus4"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v15

    .line 36
    .local v15, "log2_max_pic_order_cnt_lsb_minus4":I
    const-string v37, "sps_sub_layer_ordering_info_present_flag"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v34

    .line 38
    .local v34, "sps_sub_layer_ordering_info_present_flag":Z
    if-eqz v34, :cond_1

    const/16 v37, 0x0

    :goto_0
    sub-int v37, v31, v37

    add-int/lit8 v12, v37, 0x1

    .line 39
    .local v12, "j":I
    new-array v0, v12, [I

    move-object/from16 v28, v0

    .line 40
    .local v28, "sps_max_dec_pic_buffering_minus1":[I
    new-array v0, v12, [I

    move-object/from16 v30, v0

    .line 41
    .local v30, "sps_max_num_reorder_pics":[I
    new-array v0, v12, [I

    move-object/from16 v29, v0

    .line 43
    .local v29, "sps_max_latency_increase_plus1":[I
    if-eqz v34, :cond_2

    const/4 v11, 0x0

    .local v11, "i":I
    :goto_1
    move/from16 v0, v31

    if-gt v11, v0, :cond_3

    .line 44
    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "sps_max_dec_pic_buffering_minus1["

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, "]"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v37

    aput v37, v28, v11

    .line 45
    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "sps_max_num_reorder_pics["

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, "]"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v37

    aput v37, v30, v11

    .line 46
    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "sps_max_latency_increase_plus1["

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, "]"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v37

    aput v37, v29, v11

    .line 43
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .end local v11    # "i":I
    .end local v12    # "j":I
    .end local v28    # "sps_max_dec_pic_buffering_minus1":[I
    .end local v29    # "sps_max_latency_increase_plus1":[I
    .end local v30    # "sps_max_num_reorder_pics":[I
    :cond_1
    move/from16 v37, v31

    .line 38
    goto/16 :goto_0

    .restart local v12    # "j":I
    .restart local v28    # "sps_max_dec_pic_buffering_minus1":[I
    .restart local v29    # "sps_max_latency_increase_plus1":[I
    .restart local v30    # "sps_max_num_reorder_pics":[I
    :cond_2
    move/from16 v11, v31

    .line 43
    goto :goto_1

    .line 49
    .restart local v11    # "i":I
    :cond_3
    const-string v37, "log2_min_luma_coding_block_size_minus3"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v16

    .line 50
    .local v16, "log2_min_luma_coding_block_size_minus3":I
    const-string v37, "log2_diff_max_min_luma_coding_block_size"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v13

    .line 51
    .local v13, "log2_diff_max_min_luma_coding_block_size":I
    const-string v37, "log2_min_transform_block_size_minus2"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v17

    .line 52
    .local v17, "log2_min_transform_block_size_minus2":I
    const-string v37, "log2_diff_max_min_transform_block_size"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v14

    .line 53
    .local v14, "log2_diff_max_min_transform_block_size":I
    const-string v37, "max_transform_hierarchy_depth_inter"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v18

    .line 54
    .local v18, "max_transform_hierarchy_depth_inter":I
    const-string v37, "max_transform_hierarchy_depth_intra"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v19

    .line 56
    .local v19, "max_transform_hierarchy_depth_intra":I
    const-string v37, "scaling_list_enabled_flag"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v26

    .line 57
    .local v26, "scaling_list_enabled_flag":Z
    if-eqz v26, :cond_4

    .line 58
    const-string v37, "sps_scaling_list_data_present_flag"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v32

    .line 59
    .local v32, "sps_scaling_list_data_present_flag":Z
    if-eqz v32, :cond_4

    .line 60
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/SequenceParameterSetRbsp;->scaling_list_data(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)V

    .line 63
    .end local v32    # "sps_scaling_list_data_present_flag":Z
    :cond_4
    const-string v37, "amp_enabled_flag"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v2

    .line 64
    .local v2, "amp_enabled_flag":Z
    const-string v37, "sample_adaptive_offset_enabled_flag"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v25

    .line 65
    .local v25, "sample_adaptive_offset_enabled_flag":Z
    const-string v37, "pcm_enabled_flag"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v20

    .line 67
    .local v20, "pcm_enabled_flag":Z
    if-eqz v20, :cond_5

    .line 68
    const/16 v37, 0x4

    const-string v38, "pcm_sample_bit_depth_luma_minus1"

    move/from16 v0, v37

    move-object/from16 v1, v38

    invoke-virtual {v5, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v38

    move-wide/from16 v0, v38

    long-to-int v0, v0

    move/from16 v22, v0

    .line 69
    .local v22, "pcm_sample_bit_depth_luma_minus1":I
    const/16 v37, 0x4

    const-string v38, "pcm_sample_bit_depth_chroma_minus1"

    move/from16 v0, v37

    move-object/from16 v1, v38

    invoke-virtual {v5, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v38

    move-wide/from16 v0, v38

    long-to-int v0, v0

    move/from16 v21, v0

    .line 70
    .local v21, "pcm_sample_bit_depth_chroma_minus1":I
    const-string v37, "log2_min_pcm_luma_coding_block_size_minus3"

    move-object/from16 v0, v37

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    .line 72
    .end local v21    # "pcm_sample_bit_depth_chroma_minus1":I
    .end local v22    # "pcm_sample_bit_depth_luma_minus1":I
    :cond_5
    return-void
.end method

.method private profile_tier_level(ILco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)V
    .locals 33
    .param p1, "maxNumSubLayersMinus1"    # I
    .param p2, "bsr"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    const/16 v30, 0x2

    const-string v31, "general_profile_space"

    move-object/from16 v0, p2

    move/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v10

    .line 109
    .local v10, "general_profile_space":I
    const-string v30, "general_tier_flag"

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v14

    .line 110
    .local v14, "general_tier_flag":Z
    const/16 v30, 0x5

    const-string v31, "general_profile_idc"

    move-object/from16 v0, p2

    move/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v9

    .line 111
    .local v9, "general_profile_idc":I
    const/16 v30, 0x20

    move/from16 v0, v30

    new-array v8, v0, [Z

    .line 112
    .local v8, "general_profile_compatibility_flag":[Z
    const/16 v16, 0x0

    .local v16, "j":I
    :goto_0
    const/16 v30, 0x20

    move/from16 v0, v16

    move/from16 v1, v30

    if-ge v0, v1, :cond_0

    .line 113
    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool()Z

    move-result v30

    aput-boolean v30, v8, v16

    .line 112
    add-int/lit8 v16, v16, 0x1

    goto :goto_0

    .line 115
    :cond_0
    const-string v30, "general_progressive_source_flag"

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v11

    .line 116
    .local v11, "general_progressive_source_flag":Z
    const-string v30, "general_interlaced_source_flag"

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    .line 117
    .local v5, "general_interlaced_source_flag":Z
    const-string v30, "general_non_packed_constraint_flag"

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v7

    .line 118
    .local v7, "general_non_packed_constraint_flag":Z
    const-string v30, "general_frame_only_constraint_flag"

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v4

    .line 119
    .local v4, "general_frame_only_constraint_flag":Z
    const/16 v30, 0x2c

    const-string v31, "general_reserved_zero_44bits"

    move-object/from16 v0, p2

    move/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v12

    .line 120
    .local v12, "general_reserved_zero_44bits":J
    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readByte()I

    move-result v6

    .line 121
    .local v6, "general_level_idc":I
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v25, v0

    .line 122
    .local v25, "sub_layer_profile_present_flag":[Z
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v21, v0

    .line 123
    .local v21, "sub_layer_level_present_flag":[Z
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_1
    move/from16 v0, p1

    if-ge v15, v0, :cond_1

    .line 124
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "sub_layer_profile_present_flag["

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "]"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v30

    aput-boolean v30, v25, v15

    .line 125
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "sub_layer_level_present_flag["

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "]"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v30

    aput-boolean v30, v21, v15

    .line 123
    add-int/lit8 v15, v15, 0x1

    goto :goto_1

    .line 128
    :cond_1
    if-lez p1, :cond_2

    .line 129
    const/16 v30, 0x8

    move/from16 v0, v30

    new-array v0, v0, [I

    move-object/from16 v17, v0

    .line 131
    .local v17, "reserved_zero_2bits":[I
    move/from16 v15, p1

    :goto_2
    const/16 v30, 0x8

    move/from16 v0, v30

    if-ge v15, v0, :cond_2

    .line 132
    const/16 v30, 0x2

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "reserved_zero_2bits["

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, "]"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v30

    aput v30, v17, v15

    .line 131
    add-int/lit8 v15, v15, 0x1

    goto :goto_2

    .line 135
    .end local v17    # "reserved_zero_2bits":[I
    :cond_2
    move/from16 v0, p1

    new-array v0, v0, [I

    move-object/from16 v26, v0

    .line 136
    .local v26, "sub_layer_profile_space":[I
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v29, v0

    .line 137
    .local v29, "sub_layer_tier_flag":[Z
    move/from16 v0, p1

    new-array v0, v0, [I

    move-object/from16 v24, v0

    .line 138
    .local v24, "sub_layer_profile_idc":[I
    const/16 v30, 0x20

    move/from16 v0, p1

    move/from16 v1, v30

    filled-new-array {v0, v1}, [I

    move-result-object v30

    sget-object v31, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v31

    move-object/from16 v1, v30

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, [[Z

    .line 139
    .local v23, "sub_layer_profile_compatibility_flag":[[Z
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v27, v0

    .line 140
    .local v27, "sub_layer_progressive_source_flag":[Z
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v19, v0

    .line 141
    .local v19, "sub_layer_interlaced_source_flag":[Z
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v22, v0

    .line 142
    .local v22, "sub_layer_non_packed_constraint_flag":[Z
    move/from16 v0, p1

    new-array v0, v0, [Z

    move-object/from16 v18, v0

    .line 143
    .local v18, "sub_layer_frame_only_constraint_flag":[Z
    move/from16 v0, p1

    new-array v0, v0, [J

    move-object/from16 v28, v0

    .line 144
    .local v28, "sub_layer_reserved_zero_44bits":[J
    move/from16 v0, p1

    new-array v0, v0, [I

    move-object/from16 v20, v0

    .line 147
    .local v20, "sub_layer_level_idc":[I
    const/4 v15, 0x0

    :goto_3
    move/from16 v0, p1

    if-ge v15, v0, :cond_6

    .line 148
    aget-boolean v30, v25, v15

    if-eqz v30, :cond_4

    .line 149
    const/16 v30, 0x2

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "sub_layer_profile_space["

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, "]"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v30

    aput v30, v26, v15

    .line 150
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "sub_layer_tier_flag["

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "]"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v30

    aput-boolean v30, v29, v15

    .line 151
    const/16 v30, 0x5

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "sub_layer_profile_idc["

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, "]"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v30

    aput v30, v24, v15

    .line 152
    const/16 v16, 0x0

    :goto_4
    const/16 v30, 0x20

    move/from16 v0, v16

    move/from16 v1, v30

    if-ge v0, v1, :cond_3

    .line 153
    aget-object v30, v23, v15

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "sub_layer_profile_compatibility_flag["

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, "]["

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, "]"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v31

    aput-boolean v31, v30, v16

    .line 152
    add-int/lit8 v16, v16, 0x1

    goto :goto_4

    .line 155
    :cond_3
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "sub_layer_progressive_source_flag["

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "]"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v30

    aput-boolean v30, v27, v15

    .line 156
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "sub_layer_interlaced_source_flag["

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "]"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v30

    aput-boolean v30, v19, v15

    .line 157
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "sub_layer_non_packed_constraint_flag["

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "]"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v30

    aput-boolean v30, v22, v15

    .line 158
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "sub_layer_frame_only_constraint_flag["

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "]"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v30

    aput-boolean v30, v18, v15

    .line 159
    const/16 v30, 0x2c

    move-object/from16 v0, p2

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(I)J

    move-result-wide v30

    aput-wide v30, v28, v15

    .line 161
    :cond_4
    aget-boolean v30, v21, v15

    if-eqz v30, :cond_5

    .line 162
    const/16 v30, 0x8

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "sub_layer_level_idc["

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, "]"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v30

    aput v30, v20, v15

    .line 147
    :cond_5
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_3

    .line 165
    :cond_6
    return-void
.end method

.method private scaling_list_data(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)V
    .locals 13
    .param p1, "bsr"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    const/4 v10, 0x4

    new-array v8, v10, [[Z

    .line 76
    .local v8, "scaling_list_pred_mode_flag":[[Z
    const/4 v10, 0x4

    new-array v7, v10, [[I

    .line 77
    .local v7, "scaling_list_pred_matrix_id_delta":[[I
    const/4 v10, 0x2

    new-array v5, v10, [[I

    .line 78
    .local v5, "scaling_list_dc_coef_minus8":[[I
    const/4 v10, 0x4

    new-array v0, v10, [[[I

    .line 80
    .local v0, "ScalingList":[[[I
    const/4 v9, 0x0

    .local v9, "sizeId":I
    :goto_0
    const/4 v10, 0x4

    if-ge v9, v10, :cond_8

    .line 81
    const/4 v3, 0x0

    .local v3, "matrixId":I
    :goto_1
    const/4 v10, 0x3

    if-ne v9, v10, :cond_1

    const/4 v10, 0x2

    :goto_2
    if-ge v3, v10, :cond_7

    .line 82
    const/4 v10, 0x3

    if-ne v9, v10, :cond_2

    const/4 v10, 0x2

    :goto_3
    new-array v10, v10, [Z

    aput-object v10, v8, v9

    .line 83
    const/4 v10, 0x3

    if-ne v9, v10, :cond_3

    const/4 v10, 0x2

    :goto_4
    new-array v10, v10, [I

    aput-object v10, v7, v9

    .line 84
    const/4 v10, 0x3

    if-ne v9, v10, :cond_4

    const/4 v10, 0x2

    :goto_5
    new-array v10, v10, [[I

    aput-object v10, v0, v9

    .line 85
    aget-object v10, v8, v9

    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool()Z

    move-result v11

    aput-boolean v11, v10, v3

    .line 86
    aget-object v10, v8, v9

    aget-boolean v10, v10, v3

    if-nez v10, :cond_5

    .line 87
    aget-object v10, v7, v9

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "scaling_list_pred_matrix_id_delta["

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "]["

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "]"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p1, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v11

    aput v11, v10, v3

    .line 81
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    const/4 v10, 0x6

    goto :goto_2

    .line 82
    :cond_2
    const/4 v10, 0x6

    goto :goto_3

    .line 83
    :cond_3
    const/4 v10, 0x6

    goto :goto_4

    .line 84
    :cond_4
    const/4 v10, 0x6

    goto :goto_5

    .line 89
    :cond_5
    const/16 v4, 0x8

    .line 90
    .local v4, "nextCoef":I
    const/16 v10, 0x40

    const/4 v11, 0x1

    shl-int/lit8 v12, v9, 0x1

    add-int/lit8 v12, v12, 0x4

    shl-int/2addr v11, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 91
    .local v1, "coefNum":I
    const/4 v10, 0x1

    if-le v9, v10, :cond_6

    .line 92
    add-int/lit8 v10, v9, -0x2

    aget-object v10, v5, v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "scaling_list_dc_coef_minus8["

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "- 2]["

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "]"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p1, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readSE(Ljava/lang/String;)I

    move-result v11

    aput v11, v10, v3

    .line 93
    add-int/lit8 v10, v9, -0x2

    aget-object v10, v5, v10

    aget v10, v10, v3

    add-int/lit8 v4, v10, 0x8

    .line 95
    :cond_6
    aget-object v10, v0, v9

    new-array v11, v1, [I

    aput-object v11, v10, v3

    .line 96
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_6
    if-ge v2, v1, :cond_0

    .line 97
    const-string v10, "scaling_list_delta_coef "

    invoke-virtual {p1, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readSE(Ljava/lang/String;)I

    move-result v6

    .line 98
    .local v6, "scaling_list_delta_coef":I
    add-int v10, v4, v6

    add-int/lit16 v10, v10, 0x100

    rem-int/lit16 v4, v10, 0x100

    .line 99
    aget-object v10, v0, v9

    aget-object v10, v10, v3

    aput v4, v10, v2

    .line 96
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 80
    .end local v1    # "coefNum":I
    .end local v2    # "i":I
    .end local v4    # "nextCoef":I
    .end local v6    # "scaling_list_delta_coef":I
    :cond_7
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_0

    .line 104
    .end local v3    # "matrixId":I
    :cond_8
    return-void
.end method
