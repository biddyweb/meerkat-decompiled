.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;
.super Ljava/lang/Object;
.source "H264TrackImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SliceHeader"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;
    }
.end annotation


# instance fields
.field public bottom_field_flag:Z

.field public colour_plane_id:I

.field public delta_pic_order_cnt_0:I

.field public delta_pic_order_cnt_1:I

.field public delta_pic_order_cnt_bottom:I

.field public field_pic_flag:Z

.field public first_mb_in_slice:I

.field public frame_num:I

.field public idr_pic_id:I

.field public pic_order_cnt_lsb:I

.field public pic_parameter_set_id:I

.field public slice_type:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljava/util/Map;Ljava/util/Map;Z)V
    .locals 7
    .param p1, "is"    # Ljava/io/InputStream;
    .param p4, "IdrPicFlag"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .local p2, "spss":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;>;"
    .local p3, "ppss":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;>;"
    const/4 v5, 0x0

    .line 523
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 515
    iput-boolean v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->field_pic_flag:Z

    .line 516
    iput-boolean v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->bottom_field_flag:Z

    .line 525
    :try_start_0
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    .line 526
    new-instance v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;

    invoke-direct {v2, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;-><init>(Ljava/io/InputStream;)V

    .line 527
    .local v2, "reader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;
    const-string v5, "SliceHeader: first_mb_in_slice"

    invoke-virtual {v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->first_mb_in_slice:I

    .line 528
    const-string v5, "SliceHeader: slice_type"

    invoke-virtual {v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v3

    .line 529
    .local v3, "sliceTypeInt":I
    packed-switch v3, :pswitch_data_0

    .line 557
    :goto_0
    const-string v5, "SliceHeader: pic_parameter_set_id"

    invoke-virtual {v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->pic_parameter_set_id:I

    .line 558
    iget v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->pic_parameter_set_id:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {p3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;

    .line 559
    .local v1, "pps":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;
    iget v5, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;->seq_parameter_set_id:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {p2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    .line 560
    .local v4, "sps":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;
    iget-boolean v5, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->residual_color_transform_flag:Z

    if-eqz v5, :cond_0

    .line 561
    const/4 v5, 0x2

    const-string v6, "SliceHeader: colour_plane_id"

    invoke-virtual {v2, v5, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->colour_plane_id:I

    .line 563
    :cond_0
    iget v5, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->log2_max_frame_num_minus4:I

    add-int/lit8 v5, v5, 0x4

    const-string v6, "SliceHeader: frame_num"

    invoke-virtual {v2, v5, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->frame_num:I

    .line 565
    iget-boolean v5, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->frame_mbs_only_flag:Z

    if-nez v5, :cond_1

    .line 566
    const-string v5, "SliceHeader: field_pic_flag"

    invoke-virtual {v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->field_pic_flag:Z

    .line 567
    iget-boolean v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->field_pic_flag:Z

    if-eqz v5, :cond_1

    .line 568
    const-string v5, "SliceHeader: bottom_field_flag"

    invoke-virtual {v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->bottom_field_flag:Z

    .line 571
    :cond_1
    if-eqz p4, :cond_2

    .line 573
    const-string v5, "SliceHeader: idr_pic_id"

    invoke-virtual {v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readUE(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->idr_pic_id:I

    .line 575
    :cond_2
    iget v5, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->pic_order_cnt_type:I

    if-nez v5, :cond_3

    .line 576
    iget v5, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->log2_max_pic_order_cnt_lsb_minus4:I

    add-int/lit8 v5, v5, 0x4

    const-string v6, "SliceHeader: pic_order_cnt_lsb"

    invoke-virtual {v2, v5, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->pic_order_cnt_lsb:I

    .line 577
    iget-boolean v5, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;->bottom_field_pic_order_in_frame_present_flag:Z

    if-eqz v5, :cond_3

    iget-boolean v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->field_pic_flag:Z

    if-nez v5, :cond_3

    .line 578
    const-string v5, "SliceHeader: delta_pic_order_cnt_bottom"

    invoke-virtual {v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readSE(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->delta_pic_order_cnt_bottom:I

    .line 582
    :cond_3
    iget v5, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->pic_order_cnt_type:I

    const/4 v6, 0x1

    if-ne v5, v6, :cond_4

    iget-boolean v5, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->delta_pic_order_always_zero_flag:Z

    if-nez v5, :cond_4

    .line 584
    const-string v5, "delta_pic_order_cnt_0"

    invoke-virtual {v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readSE(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->delta_pic_order_cnt_0:I

    .line 585
    iget-boolean v5, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;->bottom_field_pic_order_in_frame_present_flag:Z

    if-eqz v5, :cond_4

    iget-boolean v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->field_pic_flag:Z

    if-nez v5, :cond_4

    .line 586
    const-string v5, "delta_pic_order_cnt_1"

    invoke-virtual {v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readSE(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->delta_pic_order_cnt_1:I

    .line 593
    :cond_4
    return-void

    .line 532
    .end local v1    # "pps":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/PictureParameterSet;
    .end local v4    # "sps":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;
    :pswitch_0
    sget-object v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;->P:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;

    iput-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->slice_type:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 589
    .end local v2    # "reader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;
    .end local v3    # "sliceTypeInt":I
    :catch_0
    move-exception v0

    .line 590
    .local v0, "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 537
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v2    # "reader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;
    .restart local v3    # "sliceTypeInt":I
    :pswitch_1
    :try_start_1
    sget-object v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;->B:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;

    iput-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->slice_type:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;

    goto/16 :goto_0

    .line 542
    :pswitch_2
    sget-object v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;->I:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;

    iput-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->slice_type:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;

    goto/16 :goto_0

    .line 547
    :pswitch_3
    sget-object v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;->SP:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;

    iput-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->slice_type:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;

    goto/16 :goto_0

    .line 552
    :pswitch_4
    sget-object v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;->SI:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;

    iput-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->slice_type:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 529
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 597
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SliceHeader{first_mb_in_slice="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->first_mb_in_slice:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", slice_type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->slice_type:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader$SliceType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", pic_parameter_set_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->pic_parameter_set_id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", colour_plane_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->colour_plane_id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", frame_num="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->frame_num:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", field_pic_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->field_pic_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", bottom_field_flag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->bottom_field_flag:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", idr_pic_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->idr_pic_id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", pic_order_cnt_lsb="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->pic_order_cnt_lsb:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", delta_pic_order_cnt_bottom="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SliceHeader;->delta_pic_order_cnt_bottom:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
