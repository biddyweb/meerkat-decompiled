.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/BitstreamElement;
.source "SeqParameterSet.java"


# instance fields
.field public bit_depth_chroma_minus8:I

.field public bit_depth_luma_minus8:I

.field public chroma_format_idc:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;

.field public constraint_set_0_flag:Z

.field public constraint_set_1_flag:Z

.field public constraint_set_2_flag:Z

.field public constraint_set_3_flag:Z

.field public constraint_set_4_flag:Z

.field public constraint_set_5_flag:Z

.field public delta_pic_order_always_zero_flag:Z

.field public direct_8x8_inference_flag:Z

.field public entropy_coding_mode_flag:Z

.field public field_pic_flag:Z

.field public frame_crop_bottom_offset:I

.field public frame_crop_left_offset:I

.field public frame_crop_right_offset:I

.field public frame_crop_top_offset:I

.field public frame_cropping_flag:Z

.field public frame_mbs_only_flag:Z

.field public gaps_in_frame_num_value_allowed_flag:Z

.field public level_idc:I

.field public log2_max_frame_num_minus4:I

.field public log2_max_pic_order_cnt_lsb_minus4:I

.field public mb_adaptive_frame_field_flag:Z

.field public num_ref_frames:I

.field public num_ref_frames_in_pic_order_cnt_cycle:I

.field public offsetForRefFrame:[I

.field public offset_for_non_ref_pic:I

.field public offset_for_top_to_bottom_field:I

.field public pic_height_in_map_units_minus1:I

.field public pic_order_cnt_type:I

.field public pic_width_in_mbs_minus1:I

.field public profile_idc:I

.field public qpprime_y_zero_transform_bypass_flag:Z

.field public reserved_zero_2bits:J

.field public residual_color_transform_flag:Z

.field public scalingMatrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;

.field public seq_parameter_set_id:I

.field public vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

.field public weighted_bipred_idc:I

.field public weighted_pred_flag:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/BitstreamElement;-><init>()V

    return-void
.end method

.method private static ReadVUIParameters(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;
    .locals 9
    .param p0, "reader"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x20

    const/16 v7, 0x10

    const/16 v6, 0x8

    .line 202
    new-instance v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    invoke-direct {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;-><init>()V

    .line 203
    .local v3, "vuip":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;
    const-string v4, "VUI: aspect_ratio_info_present_flag"

    .line 204
    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->aspect_ratio_info_present_flag:Z

    .line 205
    iget-boolean v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->aspect_ratio_info_present_flag:Z

    if-eqz v4, :cond_0

    .line 206
    const-string v4, "VUI: aspect_ratio"

    invoke-virtual {p0, v6, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v4

    long-to-int v4, v4

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/AspectRatio;->fromValue(I)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/AspectRatio;

    move-result-object v4

    iput-object v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->aspect_ratio:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/AspectRatio;

    .line 208
    iget-object v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->aspect_ratio:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/AspectRatio;

    sget-object v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/AspectRatio;->Extended_SAR:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/AspectRatio;

    if-ne v4, v5, :cond_0

    .line 209
    const-string v4, "VUI: sar_width"

    invoke-virtual {p0, v7, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->sar_width:I

    .line 210
    const-string v4, "VUI: sar_height"

    invoke-virtual {p0, v7, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->sar_height:I

    .line 213
    :cond_0
    const-string v4, "VUI: overscan_info_present_flag"

    .line 214
    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->overscan_info_present_flag:Z

    .line 215
    iget-boolean v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->overscan_info_present_flag:Z

    if-eqz v4, :cond_1

    .line 216
    const-string v4, "VUI: overscan_appropriate_flag"

    .line 217
    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->overscan_appropriate_flag:Z

    .line 219
    :cond_1
    const-string v4, "VUI: video_signal_type_present_flag"

    .line 220
    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->video_signal_type_present_flag:Z

    .line 221
    iget-boolean v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->video_signal_type_present_flag:Z

    if-eqz v4, :cond_2

    .line 222
    const/4 v4, 0x3

    const-string v5, "VUI: video_format"

    invoke-virtual {p0, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->video_format:I

    .line 223
    const-string v4, "VUI: video_full_range_flag"

    .line 224
    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->video_full_range_flag:Z

    .line 225
    const-string v4, "VUI: colour_description_present_flag"

    .line 226
    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->colour_description_present_flag:Z

    .line 227
    iget-boolean v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->colour_description_present_flag:Z

    if-eqz v4, :cond_2

    .line 228
    const-string v4, "VUI: colour_primaries"

    invoke-virtual {p0, v6, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->colour_primaries:I

    .line 230
    const-string v4, "VUI: transfer_characteristics"

    invoke-virtual {p0, v6, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->transfer_characteristics:I

    .line 232
    const-string v4, "VUI: matrix_coefficients"

    invoke-virtual {p0, v6, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->matrix_coefficients:I

    .line 236
    :cond_2
    const-string v4, "VUI: chroma_loc_info_present_flag"

    .line 237
    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->chroma_loc_info_present_flag:Z

    .line 238
    iget-boolean v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->chroma_loc_info_present_flag:Z

    if-eqz v4, :cond_3

    .line 239
    const-string v4, "VUI chroma_sample_loc_type_top_field"

    .line 240
    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v4

    iput v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->chroma_sample_loc_type_top_field:I

    .line 241
    const-string v4, "VUI chroma_sample_loc_type_bottom_field"

    .line 242
    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v4

    iput v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->chroma_sample_loc_type_bottom_field:I

    .line 244
    :cond_3
    const-string v4, "VUI: timing_info_present_flag"

    .line 245
    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->timing_info_present_flag:Z

    .line 246
    iget-boolean v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->timing_info_present_flag:Z

    if-eqz v4, :cond_4

    .line 247
    const-string v4, "VUI: num_units_in_tick"

    invoke-virtual {p0, v8, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->num_units_in_tick:I

    .line 249
    const-string v4, "VUI: time_scale"

    invoke-virtual {p0, v8, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->time_scale:I

    .line 250
    const-string v4, "VUI: fixed_frame_rate_flag"

    .line 251
    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->fixed_frame_rate_flag:Z

    .line 253
    :cond_4
    const-string v4, "VUI: nal_hrd_parameters_present_flag"

    .line 254
    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v1

    .line 255
    .local v1, "nal_hrd_parameters_present_flag":Z
    if-eqz v1, :cond_5

    .line 256
    invoke-static {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->readHRDParameters(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    move-result-object v4

    iput-object v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->nalHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    .line 257
    :cond_5
    const-string v4, "VUI: vcl_hrd_parameters_present_flag"

    .line 258
    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v2

    .line 259
    .local v2, "vcl_hrd_parameters_present_flag":Z
    if-eqz v2, :cond_6

    .line 260
    invoke-static {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->readHRDParameters(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    move-result-object v4

    iput-object v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->vclHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    .line 261
    :cond_6
    if-nez v1, :cond_7

    if-eqz v2, :cond_8

    .line 262
    :cond_7
    const-string v4, "VUI: low_delay_hrd_flag"

    .line 263
    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->low_delay_hrd_flag:Z

    .line 265
    :cond_8
    const-string v4, "VUI: pic_struct_present_flag"

    .line 266
    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->pic_struct_present_flag:Z

    .line 267
    const-string v4, "VUI: bitstream_restriction_flag"

    .line 268
    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v0

    .line 269
    .local v0, "bitstream_restriction_flag":Z
    if-eqz v0, :cond_9

    .line 270
    new-instance v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;

    invoke-direct {v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;-><init>()V

    iput-object v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->bitstreamRestriction:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;

    .line 271
    iget-object v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->bitstreamRestriction:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;

    const-string v5, "VUI: motion_vectors_over_pic_boundaries_flag"

    .line 272
    invoke-virtual {p0, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;->motion_vectors_over_pic_boundaries_flag:Z

    .line 273
    iget-object v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->bitstreamRestriction:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;

    const-string v5, "VUI max_bytes_per_pic_denom"

    .line 274
    invoke-virtual {p0, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;->max_bytes_per_pic_denom:I

    .line 275
    iget-object v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->bitstreamRestriction:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;

    const-string v5, "VUI max_bits_per_mb_denom"

    .line 276
    invoke-virtual {p0, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;->max_bits_per_mb_denom:I

    .line 277
    iget-object v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->bitstreamRestriction:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;

    const-string v5, "VUI log2_max_mv_length_horizontal"

    .line 278
    invoke-virtual {p0, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;->log2_max_mv_length_horizontal:I

    .line 279
    iget-object v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->bitstreamRestriction:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;

    const-string v5, "VUI log2_max_mv_length_vertical"

    .line 280
    invoke-virtual {p0, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;->log2_max_mv_length_vertical:I

    .line 281
    iget-object v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->bitstreamRestriction:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;

    const-string v5, "VUI num_reorder_frames"

    .line 282
    invoke-virtual {p0, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;->num_reorder_frames:I

    .line 283
    iget-object v4, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->bitstreamRestriction:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;

    const-string v5, "VUI max_dec_frame_buffering"

    .line 284
    invoke-virtual {p0, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;->max_dec_frame_buffering:I

    .line 287
    :cond_9
    return-object v3
.end method

.method public static read(Ljava/io/InputStream;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;
    .locals 9
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x8

    .line 81
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;

    invoke-direct {v1, p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;-><init>(Ljava/io/InputStream;)V

    .line 82
    .local v1, "reader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;
    new-instance v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    invoke-direct {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;-><init>()V

    .line 84
    .local v3, "sps":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;
    const-string v5, "SPS: profile_idc"

    invoke-virtual {v1, v8, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v6

    long-to-int v5, v6

    iput v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->profile_idc:I

    .line 85
    const-string v5, "SPS: constraint_set_0_flag"

    .line 86
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_0_flag:Z

    .line 87
    const-string v5, "SPS: constraint_set_1_flag"

    .line 88
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_1_flag:Z

    .line 89
    const-string v5, "SPS: constraint_set_2_flag"

    .line 90
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_2_flag:Z

    .line 91
    const-string v5, "SPS: constraint_set_3_flag"

    .line 92
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_3_flag:Z

    .line 93
    const-string v5, "SPS: constraint_set_4_flag"

    .line 94
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_4_flag:Z

    .line 95
    const-string v5, "SPS: constraint_set_5_flag"

    .line 96
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_5_flag:Z

    .line 98
    const/4 v5, 0x2

    const-string v6, "SPS: reserved_zero_2bits"

    invoke-virtual {v1, v5, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v6

    iput-wide v6, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->reserved_zero_2bits:J

    .line 99
    const-string v5, "SPS: level_idc"

    invoke-virtual {v1, v8, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v6

    long-to-int v5, v6

    iput v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->level_idc:I

    .line 100
    const-string v5, "SPS: seq_parameter_set_id"

    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->seq_parameter_set_id:I

    .line 102
    iget v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->profile_idc:I

    const/16 v6, 0x64

    if-eq v5, v6, :cond_0

    iget v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->profile_idc:I

    const/16 v6, 0x6e

    if-eq v5, v6, :cond_0

    iget v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->profile_idc:I

    const/16 v6, 0x7a

    if-eq v5, v6, :cond_0

    iget v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->profile_idc:I

    const/16 v6, 0x90

    if-ne v5, v6, :cond_7

    .line 104
    :cond_0
    const-string v5, "SPS: chroma_format_idc"

    .line 105
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    .line 104
    invoke-static {v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;->fromId(I)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;

    move-result-object v5

    iput-object v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->chroma_format_idc:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;

    .line 106
    iget-object v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->chroma_format_idc:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;

    sget-object v6, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;->YUV_444:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;

    if-ne v5, v6, :cond_1

    .line 107
    const-string v5, "SPS: residual_color_transform_flag"

    .line 108
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->residual_color_transform_flag:Z

    .line 110
    :cond_1
    const-string v5, "SPS: bit_depth_luma_minus8"

    .line 111
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->bit_depth_luma_minus8:I

    .line 112
    const-string v5, "SPS: bit_depth_chroma_minus8"

    .line 113
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->bit_depth_chroma_minus8:I

    .line 114
    const-string v5, "SPS: qpprime_y_zero_transform_bypass_flag"

    .line 115
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->qpprime_y_zero_transform_bypass_flag:Z

    .line 116
    const-string v5, "SPS: seq_scaling_matrix_present_lag"

    .line 117
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v2

    .line 118
    .local v2, "seqScalingMatrixPresent":Z
    if-eqz v2, :cond_2

    .line 119
    invoke-static {v1, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->readScalingListMatrix(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;)V

    .line 124
    .end local v2    # "seqScalingMatrixPresent":Z
    :cond_2
    :goto_0
    const-string v5, "SPS: log2_max_frame_num_minus4"

    .line 125
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->log2_max_frame_num_minus4:I

    .line 126
    const-string v5, "SPS: pic_order_cnt_type"

    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->pic_order_cnt_type:I

    .line 127
    iget v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->pic_order_cnt_type:I

    if-nez v5, :cond_8

    .line 128
    const-string v5, "SPS: log2_max_pic_order_cnt_lsb_minus4"

    .line 129
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->log2_max_pic_order_cnt_lsb_minus4:I

    .line 145
    :cond_3
    const-string v5, "SPS: num_ref_frames"

    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->num_ref_frames:I

    .line 146
    const-string v5, "SPS: gaps_in_frame_num_value_allowed_flag"

    .line 147
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->gaps_in_frame_num_value_allowed_flag:Z

    .line 148
    const-string v5, "SPS: pic_width_in_mbs_minus1"

    .line 149
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->pic_width_in_mbs_minus1:I

    .line 150
    const-string v5, "SPS: pic_height_in_map_units_minus1"

    .line 151
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->pic_height_in_map_units_minus1:I

    .line 152
    const-string v5, "SPS: frame_mbs_only_flag"

    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_mbs_only_flag:Z

    .line 153
    iget-boolean v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_mbs_only_flag:Z

    if-nez v5, :cond_4

    .line 154
    const-string v5, "SPS: mb_adaptive_frame_field_flag"

    .line 155
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->mb_adaptive_frame_field_flag:Z

    .line 157
    :cond_4
    const-string v5, "SPS: direct_8x8_inference_flag"

    .line 158
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->direct_8x8_inference_flag:Z

    .line 159
    const-string v5, "SPS: frame_cropping_flag"

    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_cropping_flag:Z

    .line 160
    iget-boolean v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_cropping_flag:Z

    if-eqz v5, :cond_5

    .line 161
    const-string v5, "SPS: frame_crop_left_offset"

    .line 162
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_crop_left_offset:I

    .line 163
    const-string v5, "SPS: frame_crop_right_offset"

    .line 164
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_crop_right_offset:I

    .line 165
    const-string v5, "SPS: frame_crop_top_offset"

    .line 166
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_crop_top_offset:I

    .line 167
    const-string v5, "SPS: frame_crop_bottom_offset"

    .line 168
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_crop_bottom_offset:I

    .line 170
    :cond_5
    const-string v5, "SPS: vui_parameters_present_flag"

    .line 171
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v4

    .line 172
    .local v4, "vui_parameters_present_flag":Z
    if-eqz v4, :cond_6

    .line 173
    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->ReadVUIParameters(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    move-result-object v5

    iput-object v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    .line 175
    :cond_6
    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readTrailingBits()V

    .line 177
    return-object v3

    .line 122
    .end local v4    # "vui_parameters_present_flag":Z
    :cond_7
    sget-object v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;->YUV_420:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;

    iput-object v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->chroma_format_idc:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;

    goto/16 :goto_0

    .line 130
    :cond_8
    iget v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->pic_order_cnt_type:I

    const/4 v6, 0x1

    if-ne v5, v6, :cond_3

    .line 131
    const-string v5, "SPS: delta_pic_order_always_zero_flag"

    .line 132
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->delta_pic_order_always_zero_flag:Z

    .line 133
    const-string v5, "SPS: offset_for_non_ref_pic"

    .line 134
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readSE(Ljava/lang/String;)I

    move-result v5

    iput v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->offset_for_non_ref_pic:I

    .line 135
    const-string v5, "SPS: offset_for_top_to_bottom_field"

    .line 136
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readSE(Ljava/lang/String;)I

    move-result v5

    iput v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->offset_for_top_to_bottom_field:I

    .line 137
    const-string v5, "SPS: num_ref_frames_in_pic_order_cnt_cycle"

    .line 138
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->num_ref_frames_in_pic_order_cnt_cycle:I

    .line 139
    iget v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->num_ref_frames_in_pic_order_cnt_cycle:I

    new-array v5, v5, [I

    iput-object v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->offsetForRefFrame:[I

    .line 140
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->num_ref_frames_in_pic_order_cnt_cycle:I

    if-ge v0, v5, :cond_3

    .line 141
    iget-object v5, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->offsetForRefFrame:[I

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SPS: offsetForRefFrame ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 142
    invoke-virtual {v1, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readSE(Ljava/lang/String;)I

    move-result v6

    aput v6, v5, v0

    .line 140
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private static readHRDParameters(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;
    .locals 6
    .param p0, "reader"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x4

    const/4 v4, 0x5

    .line 292
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;-><init>()V

    .line 293
    .local v1, "hrd":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;
    const-string v2, "SPS: cpb_cnt_minus1"

    invoke-virtual {p0, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->cpb_cnt_minus1:I

    .line 294
    const-string v2, "HRD: bit_rate_scale"

    invoke-virtual {p0, v5, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v2

    long-to-int v2, v2

    iput v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->bit_rate_scale:I

    .line 295
    const-string v2, "HRD: cpb_size_scale"

    invoke-virtual {p0, v5, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v2

    long-to-int v2, v2

    iput v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->cpb_size_scale:I

    .line 296
    iget v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->cpb_cnt_minus1:I

    add-int/lit8 v2, v2, 0x1

    new-array v2, v2, [I

    iput-object v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->bit_rate_value_minus1:[I

    .line 297
    iget v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->cpb_cnt_minus1:I

    add-int/lit8 v2, v2, 0x1

    new-array v2, v2, [I

    iput-object v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->cpb_size_value_minus1:[I

    .line 298
    iget v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->cpb_cnt_minus1:I

    add-int/lit8 v2, v2, 0x1

    new-array v2, v2, [Z

    iput-object v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->cbr_flag:[Z

    .line 300
    const/4 v0, 0x0

    .local v0, "SchedSelIdx":I
    :goto_0
    iget v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->cpb_cnt_minus1:I

    if-gt v0, v2, :cond_0

    .line 301
    iget-object v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->bit_rate_value_minus1:[I

    const-string v3, "HRD: bit_rate_value_minus1"

    .line 302
    invoke-virtual {p0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v3

    aput v3, v2, v0

    .line 303
    iget-object v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->cpb_size_value_minus1:[I

    const-string v3, "HRD: cpb_size_value_minus1"

    .line 304
    invoke-virtual {p0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v3

    aput v3, v2, v0

    .line 305
    iget-object v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->cbr_flag:[Z

    const-string v3, "HRD: cbr_flag"

    invoke-virtual {p0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v3

    aput-boolean v3, v2, v0

    .line 300
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 307
    :cond_0
    const-string v2, "HRD: initial_cpb_removal_delay_length_minus1"

    invoke-virtual {p0, v4, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v2

    long-to-int v2, v2

    iput v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->initial_cpb_removal_delay_length_minus1:I

    .line 309
    const-string v2, "HRD: cpb_removal_delay_length_minus1"

    invoke-virtual {p0, v4, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v2

    long-to-int v2, v2

    iput v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->cpb_removal_delay_length_minus1:I

    .line 311
    const-string v2, "HRD: dpb_output_delay_length_minus1"

    invoke-virtual {p0, v4, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v2

    long-to-int v2, v2

    iput v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->dpb_output_delay_length_minus1:I

    .line 313
    const-string v2, "HRD: time_offset_length"

    invoke-virtual {p0, v4, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readNBit(ILjava/lang/String;)J

    move-result-wide v2

    long-to-int v2, v2

    iput v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->time_offset_length:I

    .line 315
    return-object v1
.end method

.method private static readScalingListMatrix(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;)V
    .locals 6
    .param p0, "reader"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;
    .param p1, "sps"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x8

    .line 182
    new-instance v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;

    invoke-direct {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;-><init>()V

    iput-object v2, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->scalingMatrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;

    .line 183
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v5, :cond_2

    .line 184
    const-string v2, "SPS: seqScalingListPresentFlag"

    .line 185
    invoke-virtual {p0, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v1

    .line 186
    .local v1, "seqScalingListPresentFlag":Z
    if-eqz v1, :cond_0

    .line 187
    iget-object v2, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->scalingMatrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;

    new-array v3, v5, [Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingList;

    iput-object v3, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;->ScalingList4x4:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingList;

    .line 188
    iget-object v2, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->scalingMatrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;

    new-array v3, v5, [Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingList;

    iput-object v3, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;->ScalingList8x8:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingList;

    .line 189
    const/4 v2, 0x6

    if-ge v0, v2, :cond_1

    .line 190
    iget-object v2, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->scalingMatrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;

    iget-object v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;->ScalingList4x4:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingList;

    const/16 v3, 0x10

    invoke-static {p0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingList;->read(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;I)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingList;

    move-result-object v3

    aput-object v3, v2, v0

    .line 183
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 193
    :cond_1
    iget-object v2, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->scalingMatrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;

    iget-object v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;->ScalingList8x8:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingList;

    add-int/lit8 v3, v0, -0x6

    const/16 v4, 0x40

    invoke-static {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingList;->read(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;I)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingList;

    move-result-object v4

    aput-object v4, v2, v3

    goto :goto_1

    .line 198
    .end local v1    # "seqScalingListPresentFlag":Z
    :cond_2
    return-void
.end method

.method private writeHRDParameters(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;)V
    .locals 6
    .param p1, "hrd"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;
    .param p2, "writer"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x4

    const/4 v4, 0x5

    .line 503
    iget v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->cpb_cnt_minus1:I

    const-string v2, "HRD: cpb_cnt_minus1"

    invoke-virtual {p2, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 504
    iget v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->bit_rate_scale:I

    int-to-long v2, v1

    const-string v1, "HRD: bit_rate_scale"

    invoke-virtual {p2, v2, v3, v5, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeNBit(JILjava/lang/String;)V

    .line 505
    iget v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->cpb_size_scale:I

    int-to-long v2, v1

    const-string v1, "HRD: cpb_size_scale"

    invoke-virtual {p2, v2, v3, v5, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeNBit(JILjava/lang/String;)V

    .line 507
    const/4 v0, 0x0

    .local v0, "SchedSelIdx":I
    :goto_0
    iget v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->cpb_cnt_minus1:I

    if-gt v0, v1, :cond_0

    .line 508
    iget-object v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->bit_rate_value_minus1:[I

    aget v1, v1, v0

    const-string v2, "HRD: "

    invoke-virtual {p2, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 509
    iget-object v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->cpb_size_value_minus1:[I

    aget v1, v1, v0

    const-string v2, "HRD: "

    invoke-virtual {p2, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 510
    iget-object v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->cbr_flag:[Z

    aget-boolean v1, v1, v0

    const-string v2, "HRD: "

    invoke-virtual {p2, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 507
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 512
    :cond_0
    iget v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->initial_cpb_removal_delay_length_minus1:I

    int-to-long v2, v1

    const-string v1, "HRD: initial_cpb_removal_delay_length_minus1"

    invoke-virtual {p2, v2, v3, v4, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeNBit(JILjava/lang/String;)V

    .line 514
    iget v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->cpb_removal_delay_length_minus1:I

    int-to-long v2, v1

    const-string v1, "HRD: cpb_removal_delay_length_minus1"

    invoke-virtual {p2, v2, v3, v4, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeNBit(JILjava/lang/String;)V

    .line 516
    iget v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->dpb_output_delay_length_minus1:I

    int-to-long v2, v1

    const-string v1, "HRD: dpb_output_delay_length_minus1"

    invoke-virtual {p2, v2, v3, v4, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeNBit(JILjava/lang/String;)V

    .line 518
    iget v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->time_offset_length:I

    int-to-long v2, v1

    const-string v1, "HRD: time_offset_length"

    invoke-virtual {p2, v2, v3, v4, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeNBit(JILjava/lang/String;)V

    .line 519
    return-void
.end method

.method private writeVUIParameters(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;)V
    .locals 9
    .param p1, "vuip"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;
    .param p2, "writer"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x20

    const/16 v7, 0x10

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/16 v6, 0x8

    .line 411
    iget-boolean v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->aspect_ratio_info_present_flag:Z

    const-string v3, "VUI: aspect_ratio_info_present_flag"

    invoke-virtual {p2, v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 413
    iget-boolean v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->aspect_ratio_info_present_flag:Z

    if-eqz v0, :cond_0

    .line 414
    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->aspect_ratio:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/AspectRatio;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/AspectRatio;->getValue()I

    move-result v0

    int-to-long v4, v0

    const-string v0, "VUI: aspect_ratio"

    invoke-virtual {p2, v4, v5, v6, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeNBit(JILjava/lang/String;)V

    .line 416
    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->aspect_ratio:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/AspectRatio;

    sget-object v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/AspectRatio;->Extended_SAR:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/AspectRatio;

    if-ne v0, v3, :cond_0

    .line 417
    iget v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->sar_width:I

    int-to-long v4, v0

    const-string v0, "VUI: sar_width"

    invoke-virtual {p2, v4, v5, v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeNBit(JILjava/lang/String;)V

    .line 418
    iget v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->sar_height:I

    int-to-long v4, v0

    const-string v0, "VUI: sar_height"

    invoke-virtual {p2, v4, v5, v7, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeNBit(JILjava/lang/String;)V

    .line 421
    :cond_0
    iget-boolean v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->overscan_info_present_flag:Z

    const-string v3, "VUI: overscan_info_present_flag"

    invoke-virtual {p2, v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 423
    iget-boolean v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->overscan_info_present_flag:Z

    if-eqz v0, :cond_1

    .line 424
    iget-boolean v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->overscan_appropriate_flag:Z

    const-string v3, "VUI: overscan_appropriate_flag"

    invoke-virtual {p2, v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 427
    :cond_1
    iget-boolean v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->video_signal_type_present_flag:Z

    const-string v3, "VUI: video_signal_type_present_flag"

    invoke-virtual {p2, v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 429
    iget-boolean v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->video_signal_type_present_flag:Z

    if-eqz v0, :cond_2

    .line 430
    iget v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->video_format:I

    int-to-long v4, v0

    const/4 v0, 0x3

    const-string v3, "VUI: video_format"

    invoke-virtual {p2, v4, v5, v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeNBit(JILjava/lang/String;)V

    .line 431
    iget-boolean v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->video_full_range_flag:Z

    const-string v3, "VUI: video_full_range_flag"

    invoke-virtual {p2, v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 433
    iget-boolean v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->colour_description_present_flag:Z

    const-string v3, "VUI: colour_description_present_flag"

    invoke-virtual {p2, v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 435
    iget-boolean v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->colour_description_present_flag:Z

    if-eqz v0, :cond_2

    .line 436
    iget v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->colour_primaries:I

    int-to-long v4, v0

    const-string v0, "VUI: colour_primaries"

    invoke-virtual {p2, v4, v5, v6, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeNBit(JILjava/lang/String;)V

    .line 438
    iget v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->transfer_characteristics:I

    int-to-long v4, v0

    const-string v0, "VUI: transfer_characteristics"

    invoke-virtual {p2, v4, v5, v6, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeNBit(JILjava/lang/String;)V

    .line 440
    iget v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->matrix_coefficients:I

    int-to-long v4, v0

    const-string v0, "VUI: matrix_coefficients"

    invoke-virtual {p2, v4, v5, v6, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeNBit(JILjava/lang/String;)V

    .line 444
    :cond_2
    iget-boolean v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->chroma_loc_info_present_flag:Z

    const-string v3, "VUI: chroma_loc_info_present_flag"

    invoke-virtual {p2, v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 446
    iget-boolean v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->chroma_loc_info_present_flag:Z

    if-eqz v0, :cond_3

    .line 447
    iget v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->chroma_sample_loc_type_top_field:I

    const-string v3, "VUI: chroma_sample_loc_type_top_field"

    invoke-virtual {p2, v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 449
    iget v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->chroma_sample_loc_type_bottom_field:I

    const-string v3, "VUI: chroma_sample_loc_type_bottom_field"

    invoke-virtual {p2, v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 452
    :cond_3
    iget-boolean v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->timing_info_present_flag:Z

    const-string v3, "VUI: timing_info_present_flag"

    invoke-virtual {p2, v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 454
    iget-boolean v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->timing_info_present_flag:Z

    if-eqz v0, :cond_4

    .line 455
    iget v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->num_units_in_tick:I

    int-to-long v4, v0

    const-string v0, "VUI: num_units_in_tick"

    invoke-virtual {p2, v4, v5, v8, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeNBit(JILjava/lang/String;)V

    .line 457
    iget v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->time_scale:I

    int-to-long v4, v0

    const-string v0, "VUI: time_scale"

    invoke-virtual {p2, v4, v5, v8, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeNBit(JILjava/lang/String;)V

    .line 458
    iget-boolean v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->fixed_frame_rate_flag:Z

    const-string v3, "VUI: fixed_frame_rate_flag"

    invoke-virtual {p2, v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 461
    :cond_4
    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->nalHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    if-eqz v0, :cond_a

    move v0, v1

    :goto_0
    const-string v3, "VUI: "

    invoke-virtual {p2, v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 462
    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->nalHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    if-eqz v0, :cond_5

    .line 463
    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->nalHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    invoke-direct {p0, v0, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->writeHRDParameters(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;)V

    .line 465
    :cond_5
    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->vclHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    if-eqz v0, :cond_b

    move v0, v1

    :goto_1
    const-string v3, "VUI: "

    invoke-virtual {p2, v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 466
    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->vclHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    if-eqz v0, :cond_6

    .line 467
    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->vclHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    invoke-direct {p0, v0, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->writeHRDParameters(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;)V

    .line 470
    :cond_6
    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->nalHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    if-nez v0, :cond_7

    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->vclHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    if-eqz v0, :cond_8

    .line 471
    :cond_7
    iget-boolean v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->low_delay_hrd_flag:Z

    const-string v3, "VUI: low_delay_hrd_flag"

    .line 472
    invoke-virtual {p2, v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 475
    :cond_8
    iget-boolean v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->pic_struct_present_flag:Z

    const-string v3, "VUI: pic_struct_present_flag"

    invoke-virtual {p2, v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 477
    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->bitstreamRestriction:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;

    if-eqz v0, :cond_c

    :goto_2
    const-string v0, "VUI: "

    invoke-virtual {p2, v1, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 478
    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->bitstreamRestriction:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;

    if-eqz v0, :cond_9

    .line 479
    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->bitstreamRestriction:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;

    iget-boolean v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;->motion_vectors_over_pic_boundaries_flag:Z

    const-string v1, "VUI: motion_vectors_over_pic_boundaries_flag"

    .line 480
    invoke-virtual {p2, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 483
    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->bitstreamRestriction:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;->max_bytes_per_pic_denom:I

    const-string v1, "VUI: max_bytes_per_pic_denom"

    invoke-virtual {p2, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 485
    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->bitstreamRestriction:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;->max_bits_per_mb_denom:I

    const-string v1, "VUI: max_bits_per_mb_denom"

    invoke-virtual {p2, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 487
    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->bitstreamRestriction:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;->log2_max_mv_length_horizontal:I

    const-string v1, "VUI: log2_max_mv_length_horizontal"

    invoke-virtual {p2, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 490
    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->bitstreamRestriction:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;->log2_max_mv_length_vertical:I

    const-string v1, "VUI: log2_max_mv_length_vertical"

    invoke-virtual {p2, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 493
    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->bitstreamRestriction:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;->num_reorder_frames:I

    const-string v1, "VUI: num_reorder_frames"

    invoke-virtual {p2, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 495
    iget-object v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->bitstreamRestriction:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters$BitstreamRestriction;->max_dec_frame_buffering:I

    const-string v1, "VUI: max_dec_frame_buffering"

    invoke-virtual {p2, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 499
    :cond_9
    return-void

    :cond_a
    move v0, v2

    .line 461
    goto/16 :goto_0

    :cond_b
    move v0, v2

    .line 465
    goto :goto_1

    :cond_c
    move v1, v2

    .line 477
    goto :goto_2
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 523
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SeqParameterSet{ \n        pic_order_cnt_type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->pic_order_cnt_type:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        field_pic_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->field_pic_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        delta_pic_order_always_zero_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->delta_pic_order_always_zero_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        weighted_pred_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->weighted_pred_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        weighted_bipred_idc="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->weighted_bipred_idc:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        entropy_coding_mode_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->entropy_coding_mode_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        mb_adaptive_frame_field_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->mb_adaptive_frame_field_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        direct_8x8_inference_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->direct_8x8_inference_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        chroma_format_idc="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->chroma_format_idc:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        log2_max_frame_num_minus4="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->log2_max_frame_num_minus4:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        log2_max_pic_order_cnt_lsb_minus4="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->log2_max_pic_order_cnt_lsb_minus4:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        pic_height_in_map_units_minus1="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->pic_height_in_map_units_minus1:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        pic_width_in_mbs_minus1="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->pic_width_in_mbs_minus1:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        bit_depth_luma_minus8="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->bit_depth_luma_minus8:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        bit_depth_chroma_minus8="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->bit_depth_chroma_minus8:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        qpprime_y_zero_transform_bypass_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->qpprime_y_zero_transform_bypass_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        profile_idc="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->profile_idc:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        constraint_set_0_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_0_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        constraint_set_1_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_1_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        constraint_set_2_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_2_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        constraint_set_3_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_3_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        constraint_set_4_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_4_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        constraint_set_5_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_5_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        level_idc="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->level_idc:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        seq_parameter_set_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->seq_parameter_set_id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        residual_color_transform_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->residual_color_transform_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        offset_for_non_ref_pic="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->offset_for_non_ref_pic:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        offset_for_top_to_bottom_field="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->offset_for_top_to_bottom_field:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        num_ref_frames="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->num_ref_frames:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        gaps_in_frame_num_value_allowed_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->gaps_in_frame_num_value_allowed_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        frame_mbs_only_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_mbs_only_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        frame_cropping_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_cropping_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        frame_crop_left_offset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_crop_left_offset:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        frame_crop_right_offset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_crop_right_offset:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        frame_crop_top_offset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_crop_top_offset:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        frame_crop_bottom_offset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_crop_bottom_offset:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        offsetForRefFrame="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->offsetForRefFrame:[I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        vuiParams="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        scalingMatrix="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->scalingMatrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \n        num_ref_frames_in_pic_order_cnt_cycle="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->num_ref_frames_in_pic_order_cnt_cycle:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(Ljava/io/OutputStream;)V
    .locals 9
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x8

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 319
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;

    invoke-direct {v1, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;-><init>(Ljava/io/OutputStream;)V

    .line 321
    .local v1, "writer":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->profile_idc:I

    int-to-long v6, v2

    const-string v2, "SPS: profile_idc"

    invoke-virtual {v1, v6, v7, v8, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeNBit(JILjava/lang/String;)V

    .line 322
    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_0_flag:Z

    const-string v5, "SPS: constraint_set_0_flag"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 323
    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_1_flag:Z

    const-string v5, "SPS: constraint_set_1_flag"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 324
    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_2_flag:Z

    const-string v5, "SPS: constraint_set_2_flag"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 325
    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->constraint_set_3_flag:Z

    const-string v5, "SPS: constraint_set_3_flag"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 326
    const-wide/16 v6, 0x0

    const/4 v2, 0x4

    const-string v5, "SPS: reserved"

    invoke-virtual {v1, v6, v7, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeNBit(JILjava/lang/String;)V

    .line 327
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->level_idc:I

    int-to-long v6, v2

    const-string v2, "SPS: level_idc"

    invoke-virtual {v1, v6, v7, v8, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeNBit(JILjava/lang/String;)V

    .line 328
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->seq_parameter_set_id:I

    const-string v5, "SPS: seq_parameter_set_id"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 330
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->profile_idc:I

    const/16 v5, 0x64

    if-eq v2, v5, :cond_0

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->profile_idc:I

    const/16 v5, 0x6e

    if-eq v2, v5, :cond_0

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->profile_idc:I

    const/16 v5, 0x7a

    if-eq v2, v5, :cond_0

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->profile_idc:I

    const/16 v5, 0x90

    if-ne v2, v5, :cond_7

    .line 332
    :cond_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->chroma_format_idc:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;->getId()I

    move-result v2

    const-string v5, "SPS: chroma_format_idc"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 333
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->chroma_format_idc:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;

    sget-object v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;->YUV_444:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ChromaFormat;

    if-ne v2, v5, :cond_1

    .line 334
    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->residual_color_transform_flag:Z

    const-string v5, "SPS: residual_color_transform_flag"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 337
    :cond_1
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->bit_depth_luma_minus8:I

    const-string v5, "SPS: "

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 338
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->bit_depth_chroma_minus8:I

    const-string v5, "SPS: "

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 339
    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->qpprime_y_zero_transform_bypass_flag:Z

    const-string v5, "SPS: qpprime_y_zero_transform_bypass_flag"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 341
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->scalingMatrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;

    if-eqz v2, :cond_3

    move v2, v3

    :goto_0
    const-string v5, "SPS: "

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 342
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->scalingMatrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;

    if-eqz v2, :cond_7

    .line 343
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v8, :cond_7

    .line 344
    const/4 v2, 0x6

    if-ge v0, v2, :cond_5

    .line 345
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->scalingMatrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;

    iget-object v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;->ScalingList4x4:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingList;

    aget-object v2, v2, v0

    if-eqz v2, :cond_4

    move v2, v3

    :goto_2
    const-string v5, "SPS: "

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 348
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->scalingMatrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;

    iget-object v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;->ScalingList4x4:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingList;

    aget-object v2, v2, v0

    if-eqz v2, :cond_2

    .line 349
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->scalingMatrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;

    iget-object v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;->ScalingList4x4:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingList;

    aget-object v2, v2, v0

    invoke-virtual {v2, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingList;->write(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;)V

    .line 343
    :cond_2
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v0    # "i":I
    :cond_3
    move v2, v4

    .line 341
    goto :goto_0

    .restart local v0    # "i":I
    :cond_4
    move v2, v4

    .line 345
    goto :goto_2

    .line 352
    :cond_5
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->scalingMatrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;

    iget-object v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;->ScalingList8x8:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingList;

    add-int/lit8 v5, v0, -0x6

    aget-object v2, v2, v5

    if-eqz v2, :cond_6

    move v2, v3

    :goto_4
    const-string v5, "SPS: "

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 355
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->scalingMatrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;

    iget-object v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;->ScalingList8x8:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingList;

    add-int/lit8 v5, v0, -0x6

    aget-object v2, v2, v5

    if-eqz v2, :cond_2

    .line 356
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->scalingMatrix:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;

    iget-object v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingMatrix;->ScalingList8x8:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingList;

    add-int/lit8 v5, v0, -0x6

    aget-object v2, v2, v5

    invoke-virtual {v2, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/ScalingList;->write(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;)V

    goto :goto_3

    :cond_6
    move v2, v4

    .line 352
    goto :goto_4

    .line 362
    .end local v0    # "i":I
    :cond_7
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->log2_max_frame_num_minus4:I

    const-string v5, "SPS: log2_max_frame_num_minus4"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 364
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->pic_order_cnt_type:I

    const-string v5, "SPS: pic_order_cnt_type"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 365
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->pic_order_cnt_type:I

    if-nez v2, :cond_c

    .line 366
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->log2_max_pic_order_cnt_lsb_minus4:I

    const-string v5, "SPS: log2_max_pic_order_cnt_lsb_minus4"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 379
    :cond_8
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->num_ref_frames:I

    const-string v5, "SPS: num_ref_frames"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 380
    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->gaps_in_frame_num_value_allowed_flag:Z

    const-string v5, "SPS: gaps_in_frame_num_value_allowed_flag"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 382
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->pic_width_in_mbs_minus1:I

    const-string v5, "SPS: pic_width_in_mbs_minus1"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 383
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->pic_height_in_map_units_minus1:I

    const-string v5, "SPS: pic_height_in_map_units_minus1"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 385
    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_mbs_only_flag:Z

    const-string v5, "SPS: frame_mbs_only_flag"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 386
    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_mbs_only_flag:Z

    if-nez v2, :cond_9

    .line 387
    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->mb_adaptive_frame_field_flag:Z

    const-string v5, "SPS: mb_adaptive_frame_field_flag"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 390
    :cond_9
    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->direct_8x8_inference_flag:Z

    const-string v5, "SPS: direct_8x8_inference_flag"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 392
    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_cropping_flag:Z

    const-string v5, "SPS: frame_cropping_flag"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 393
    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_cropping_flag:Z

    if-eqz v2, :cond_a

    .line 394
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_crop_left_offset:I

    const-string v5, "SPS: frame_crop_left_offset"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 396
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_crop_right_offset:I

    const-string v5, "SPS: frame_crop_right_offset"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 398
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_crop_top_offset:I

    const-string v5, "SPS: frame_crop_top_offset"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 399
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_crop_bottom_offset:I

    const-string v5, "SPS: frame_crop_bottom_offset"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 402
    :cond_a
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    if-eqz v2, :cond_d

    :goto_5
    const-string v2, "SPS: "

    invoke-virtual {v1, v3, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 403
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    if-eqz v2, :cond_b

    .line 404
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    invoke-direct {p0, v2, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->writeVUIParameters(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;)V

    .line 406
    :cond_b
    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeTrailingBits()V

    .line 407
    return-void

    .line 368
    :cond_c
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->pic_order_cnt_type:I

    if-ne v2, v3, :cond_8

    .line 369
    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->delta_pic_order_always_zero_flag:Z

    const-string v5, "SPS: delta_pic_order_always_zero_flag"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeBool(ZLjava/lang/String;)V

    .line 371
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->offset_for_non_ref_pic:I

    const-string v5, "SPS: offset_for_non_ref_pic"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeSE(ILjava/lang/String;)V

    .line 373
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->offset_for_top_to_bottom_field:I

    const-string v5, "SPS: offset_for_top_to_bottom_field"

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeSE(ILjava/lang/String;)V

    .line 375
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->offsetForRefFrame:[I

    array-length v2, v2

    const-string v5, "SPS: "

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeUE(ILjava/lang/String;)V

    .line 376
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_6
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->offsetForRefFrame:[I

    array-length v2, v2

    if-ge v0, v2, :cond_8

    .line 377
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->offsetForRefFrame:[I

    aget v2, v2, v0

    const-string v5, "SPS: "

    invoke-virtual {v1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/write/CAVLCWriter;->writeSE(ILjava/lang/String;)V

    .line 376
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .end local v0    # "i":I
    :cond_d
    move v3, v4

    .line 402
    goto :goto_5
.end method
