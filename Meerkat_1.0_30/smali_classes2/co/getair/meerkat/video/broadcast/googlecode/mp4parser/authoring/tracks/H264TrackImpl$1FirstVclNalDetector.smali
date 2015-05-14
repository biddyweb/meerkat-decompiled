.class Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;
.super Ljava/lang/Object;
.source "H264TrackImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->readSamples(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "FirstVclNalDetector"
.end annotation


# instance fields
.field bottom_field_flag:Z

.field delta_pic_order_cnt_0:I

.field delta_pic_order_cnt_1:I

.field delta_pic_order_cnt_bottom:I

.field field_pic_flag:Z

.field frame_num:I

.field idrPicFlag:Z

.field idr_pic_id:I

.field nal_ref_idc:I

.field pic_order_cnt_lsb:I

.field pic_order_cnt_type:I

.field pic_parameter_set_id:I

.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;


# direct methods
.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;Ljava/nio/ByteBuffer;II)V
    .locals 5
    .param p1, "this$0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;
    .param p2, "nal"    # Ljava/nio/ByteBuffer;
    .param p3, "nal_ref_idc"    # I
    .param p4, "nal_unit_type"    # I

    .prologue
    .line 225
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 226
    new-instance v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$ByteBufferBackedInputStream;

    invoke-direct {v2, p1, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$ByteBufferBackedInputStream;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;Ljava/nio/ByteBuffer;)V

    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;->cleanBuffer(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v0

    .line 227
    .local v0, "bs":Ljava/io/InputStream;
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;

    iget-object v3, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->spsIdToSps:Ljava/util/Map;

    iget-object v4, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->ppsIdToPps:Ljava/util/Map;

    const/4 v2, 0x5

    if-ne p4, v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-direct {v1, v0, v3, v4, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;-><init>(Ljava/io/InputStream;Ljava/util/Map;Ljava/util/Map;Z)V

    .line 228
    .local v1, "sh":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;
    iget v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->frame_num:I

    iput v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->frame_num:I

    .line 229
    iget v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->pic_parameter_set_id:I

    iput v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->pic_parameter_set_id:I

    .line 230
    iget-boolean v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->field_pic_flag:Z

    iput-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->field_pic_flag:Z

    .line 231
    iget-boolean v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->bottom_field_flag:Z

    iput-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->bottom_field_flag:Z

    .line 232
    iput p3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->nal_ref_idc:I

    .line 233
    iget-object v3, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->spsIdToSps:Ljava/util/Map;

    iget-object v2, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->ppsIdToPps:Ljava/util/Map;

    iget v4, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->pic_parameter_set_id:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;

    iget v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;->seq_parameter_set_id:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->pic_order_cnt_type:I

    iput v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->pic_order_cnt_type:I

    .line 234
    iget v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->delta_pic_order_cnt_bottom:I

    iput v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->delta_pic_order_cnt_bottom:I

    .line 235
    iget v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->pic_order_cnt_lsb:I

    iput v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->pic_order_cnt_lsb:I

    .line 236
    iget v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->delta_pic_order_cnt_0:I

    iput v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->delta_pic_order_cnt_0:I

    .line 237
    iget v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->delta_pic_order_cnt_1:I

    iput v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->delta_pic_order_cnt_1:I

    .line 238
    iget v2, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->idr_pic_id:I

    iput v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->idr_pic_id:I

    .line 239
    return-void

    .line 227
    .end local v1    # "sh":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method


# virtual methods
.method isFirstInNew(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;)Z
    .locals 3
    .param p1, "nu"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;

    .prologue
    const/4 v0, 0x1

    .line 255
    iget v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->frame_num:I

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->frame_num:I

    if-eq v1, v2, :cond_1

    .line 296
    :cond_0
    :goto_0
    return v0

    .line 258
    :cond_1
    iget v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->pic_parameter_set_id:I

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->pic_parameter_set_id:I

    if-ne v1, v2, :cond_0

    .line 261
    iget-boolean v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->field_pic_flag:Z

    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->field_pic_flag:Z

    if-ne v1, v2, :cond_0

    .line 264
    iget-boolean v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->field_pic_flag:Z

    if-eqz v1, :cond_2

    .line 265
    iget-boolean v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->bottom_field_flag:Z

    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->bottom_field_flag:Z

    if-ne v1, v2, :cond_0

    .line 269
    :cond_2
    iget v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->nal_ref_idc:I

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->nal_ref_idc:I

    if-ne v1, v2, :cond_0

    .line 272
    iget v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->pic_order_cnt_type:I

    if-nez v1, :cond_3

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->pic_order_cnt_type:I

    if-nez v1, :cond_3

    .line 273
    iget v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->pic_order_cnt_lsb:I

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->pic_order_cnt_lsb:I

    if-ne v1, v2, :cond_0

    .line 276
    iget v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->delta_pic_order_cnt_bottom:I

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->delta_pic_order_cnt_bottom:I

    if-ne v1, v2, :cond_0

    .line 280
    :cond_3
    iget v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->pic_order_cnt_type:I

    if-ne v1, v0, :cond_4

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->pic_order_cnt_type:I

    if-ne v1, v0, :cond_4

    .line 281
    iget v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->delta_pic_order_cnt_0:I

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->delta_pic_order_cnt_0:I

    if-ne v1, v2, :cond_0

    .line 284
    iget v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->delta_pic_order_cnt_1:I

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->delta_pic_order_cnt_1:I

    if-ne v1, v2, :cond_0

    .line 288
    :cond_4
    iget-boolean v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->idrPicFlag:Z

    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->idrPicFlag:Z

    if-ne v1, v2, :cond_0

    .line 291
    iget-boolean v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->idrPicFlag:Z

    if-eqz v1, :cond_5

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->idrPicFlag:Z

    if-eqz v1, :cond_5

    .line 292
    iget v1, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->idr_pic_id:I

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$1FirstVclNalDetector;->idr_pic_id:I

    if-ne v1, v2, :cond_0

    .line 296
    :cond_5
    const/4 v0, 0x0

    goto :goto_0
.end method
