.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;
.super Ljava/lang/Object;
.source "H264TrackImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SEIMessage"
.end annotation


# instance fields
.field clock_timestamp_flag:Z

.field cnt_dropped_flag:I

.field counting_type:I

.field cpb_removal_delay:I

.field ct_type:I

.field discontinuity_flag:I

.field dpb_removal_delay:I

.field full_timestamp_flag:I

.field hours_value:I

.field minutes_value:I

.field n_frames:I

.field nuit_field_based_flag:I

.field payloadSize:I

.field payloadType:I

.field pic_struct:I

.field removal_delay_flag:Z

.field seconds_value:I

.field sps:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;

.field time_offset:I

.field time_offset_length:I


# direct methods
.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;Ljava/io/InputStream;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;)V
    .locals 10
    .param p1, "this$0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;
    .param p2, "is"    # Ljava/io/InputStream;
    .param p3, "sps"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 666
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 642
    const/4 v8, 0x0

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadType:I

    .line 643
    const/4 v8, 0x0

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadSize:I

    .line 667
    iput-object p3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->sps:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    .line 668
    invoke-virtual {p2}, Ljava/io/InputStream;->read()I

    .line 669
    invoke-virtual {p2}, Ljava/io/InputStream;->available()I

    move-result v1

    .line 670
    .local v1, "datasize":I
    const/4 v6, 0x0

    .line 671
    .local v6, "read":I
    :goto_0
    if-ge v6, v1, :cond_e

    .line 672
    const/4 v8, 0x0

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadType:I

    .line 673
    const/4 v8, 0x0

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadSize:I

    .line 674
    invoke-virtual {p2}, Ljava/io/InputStream;->read()I

    move-result v4

    .line 675
    .local v4, "last_payload_type_bytes":I
    add-int/lit8 v6, v6, 0x1

    .line 676
    :goto_1
    const/16 v8, 0xff

    if-ne v4, v8, :cond_0

    .line 677
    iget v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadType:I

    add-int/2addr v8, v4

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadType:I

    .line 678
    invoke-virtual {p2}, Ljava/io/InputStream;->read()I

    move-result v4

    .line 679
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 681
    :cond_0
    iget v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadType:I

    add-int/2addr v8, v4

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadType:I

    .line 682
    invoke-virtual {p2}, Ljava/io/InputStream;->read()I

    move-result v3

    .line 683
    .local v3, "last_payload_size_bytes":I
    add-int/lit8 v6, v6, 0x1

    .line 685
    :goto_2
    const/16 v8, 0xff

    if-ne v3, v8, :cond_1

    .line 686
    iget v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadSize:I

    add-int/2addr v8, v3

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadSize:I

    .line 687
    invoke-virtual {p2}, Ljava/io/InputStream;->read()I

    move-result v3

    .line 688
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 690
    :cond_1
    iget v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadSize:I

    add-int/2addr v8, v3

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadSize:I

    .line 691
    sub-int v8, v1, v6

    iget v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadSize:I

    if-lt v8, v9, :cond_c

    .line 692
    iget v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadType:I

    const/4 v9, 0x1

    if-ne v8, v9, :cond_b

    .line 693
    iget-object v8, p3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    if-eqz v8, :cond_a

    iget-object v8, p3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    iget-object v8, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->nalHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    if-nez v8, :cond_2

    iget-object v8, p3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    iget-object v8, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->vclHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    if-nez v8, :cond_2

    iget-object v8, p3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    iget-boolean v8, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->pic_struct_present_flag:Z

    if-eqz v8, :cond_a

    .line 694
    :cond_2
    iget v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadSize:I

    new-array v0, v8, [B

    .line 695
    .local v0, "data":[B
    invoke-virtual {p2, v0}, Ljava/io/InputStream;->read([B)I

    .line 696
    iget v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadSize:I

    add-int/2addr v6, v8

    .line 697
    new-instance v7, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;

    new-instance v8, Ljava/io/ByteArrayInputStream;

    invoke-direct {v8, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v7, v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;-><init>(Ljava/io/InputStream;)V

    .line 698
    .local v7, "reader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;
    iget-object v8, p3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    iget-object v8, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->nalHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    if-nez v8, :cond_3

    iget-object v8, p3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    iget-object v8, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->vclHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    if-eqz v8, :cond_6

    .line 699
    :cond_3
    const/4 v8, 0x1

    iput-boolean v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->removal_delay_flag:Z

    .line 700
    iget-object v8, p3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    iget-object v8, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->nalHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    iget v8, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->cpb_removal_delay_length_minus1:I

    add-int/lit8 v8, v8, 0x1

    const-string v9, "SEI: cpb_removal_delay"

    invoke-virtual {v7, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->cpb_removal_delay:I

    .line 701
    iget-object v8, p3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    iget-object v8, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->nalHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    iget v8, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->dpb_output_delay_length_minus1:I

    add-int/lit8 v8, v8, 0x1

    const-string v9, "SEI: dpb_removal_delay"

    invoke-virtual {v7, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->dpb_removal_delay:I

    .line 705
    :goto_3
    iget-object v8, p3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    iget-boolean v8, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->pic_struct_present_flag:Z

    if-eqz v8, :cond_d

    .line 706
    const/4 v8, 0x4

    const-string v9, "SEI: pic_struct"

    invoke-virtual {v7, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->pic_struct:I

    .line 708
    iget v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->pic_struct:I

    packed-switch v8, :pswitch_data_0

    .line 713
    const/4 v5, 0x1

    .line 728
    .local v5, "numClockTS":I
    :goto_4
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    if-ge v2, v5, :cond_d

    .line 729
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "pic_timing SEI: clock_timestamp_flag["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v8

    iput-boolean v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->clock_timestamp_flag:Z

    .line 730
    iget-boolean v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->clock_timestamp_flag:Z

    if-eqz v8, :cond_5

    .line 731
    const/4 v8, 0x2

    const-string v9, "pic_timing SEI: ct_type"

    invoke-virtual {v7, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->ct_type:I

    .line 732
    const/4 v8, 0x1

    const-string v9, "pic_timing SEI: nuit_field_based_flag"

    invoke-virtual {v7, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->nuit_field_based_flag:I

    .line 733
    const/4 v8, 0x5

    const-string v9, "pic_timing SEI: counting_type"

    invoke-virtual {v7, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->counting_type:I

    .line 734
    const/4 v8, 0x1

    const-string v9, "pic_timing SEI: full_timestamp_flag"

    invoke-virtual {v7, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->full_timestamp_flag:I

    .line 735
    const/4 v8, 0x1

    const-string v9, "pic_timing SEI: discontinuity_flag"

    invoke-virtual {v7, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->discontinuity_flag:I

    .line 736
    const/4 v8, 0x1

    const-string v9, "pic_timing SEI: cnt_dropped_flag"

    invoke-virtual {v7, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->cnt_dropped_flag:I

    .line 737
    const/16 v8, 0x8

    const-string v9, "pic_timing SEI: n_frames"

    invoke-virtual {v7, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->n_frames:I

    .line 738
    iget v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->full_timestamp_flag:I

    const/4 v9, 0x1

    if-ne v8, v9, :cond_7

    .line 739
    const/4 v8, 0x6

    const-string v9, "pic_timing SEI: seconds_value"

    invoke-virtual {v7, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->seconds_value:I

    .line 740
    const/4 v8, 0x6

    const-string v9, "pic_timing SEI: minutes_value"

    invoke-virtual {v7, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->minutes_value:I

    .line 741
    const/4 v8, 0x5

    const-string v9, "pic_timing SEI: hours_value"

    invoke-virtual {v7, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->hours_value:I

    .line 754
    :cond_4
    :goto_6
    iget-object v8, p3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    iget-object v8, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->nalHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    if-eqz v8, :cond_8

    .line 755
    iget-object v8, p3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    iget-object v8, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->nalHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    iget v8, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->time_offset_length:I

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->time_offset_length:I

    .line 761
    :goto_7
    const/16 v8, 0x18

    const-string v9, "pic_timing SEI: time_offset"

    invoke-virtual {v7, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->time_offset:I

    .line 728
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_5

    .line 703
    .end local v2    # "i":I
    .end local v5    # "numClockTS":I
    :cond_6
    const/4 v8, 0x0

    iput-boolean v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->removal_delay_flag:Z

    goto/16 :goto_3

    .line 719
    :pswitch_0
    const/4 v5, 0x2

    .line 720
    .restart local v5    # "numClockTS":I
    goto/16 :goto_4

    .line 725
    .end local v5    # "numClockTS":I
    :pswitch_1
    const/4 v5, 0x3

    .restart local v5    # "numClockTS":I
    goto/16 :goto_4

    .line 743
    .restart local v2    # "i":I
    :cond_7
    const-string v8, "pic_timing SEI: seconds_flag"

    invoke-virtual {v7, v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 744
    const/4 v8, 0x6

    const-string v9, "pic_timing SEI: seconds_value"

    invoke-virtual {v7, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->seconds_value:I

    .line 745
    const-string v8, "pic_timing SEI: minutes_flag"

    invoke-virtual {v7, v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 746
    const/4 v8, 0x6

    const-string v9, "pic_timing SEI: minutes_value"

    invoke-virtual {v7, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->minutes_value:I

    .line 747
    const-string v8, "pic_timing SEI: hours_flag"

    invoke-virtual {v7, v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readBool(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 748
    const/4 v8, 0x5

    const-string v9, "pic_timing SEI: hours_value"

    invoke-virtual {v7, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;->readU(ILjava/lang/String;)I

    move-result v8

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->hours_value:I

    goto :goto_6

    .line 756
    :cond_8
    iget-object v8, p3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    iget-object v8, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->vclHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    if-eqz v8, :cond_9

    .line 757
    iget-object v8, p3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    iget-object v8, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->vclHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    iget v8, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;->time_offset_length:I

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->time_offset_length:I

    goto :goto_7

    .line 759
    :cond_9
    const/16 v8, 0x18

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->time_offset_length:I

    goto :goto_7

    .line 768
    .end local v0    # "data":[B
    .end local v2    # "i":I
    .end local v5    # "numClockTS":I
    .end local v7    # "reader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/read/CAVLCReader;
    :cond_a
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_8
    iget v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadSize:I

    if-ge v2, v8, :cond_d

    .line 769
    invoke-virtual {p2}, Ljava/io/InputStream;->read()I

    .line 770
    add-int/lit8 v6, v6, 0x1

    .line 768
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 774
    .end local v2    # "i":I
    :cond_b
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_9
    iget v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadSize:I

    if-ge v2, v8, :cond_d

    .line 775
    invoke-virtual {p2}, Ljava/io/InputStream;->read()I

    .line 776
    add-int/lit8 v6, v6, 0x1

    .line 774
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 780
    .end local v2    # "i":I
    :cond_c
    move v6, v1

    .line 782
    :cond_d
    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->LOG:Ljava/util/logging/Logger;
    invoke-static {}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->access$000()Ljava/util/logging/Logger;

    move-result-object v8

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 784
    .end local v3    # "last_payload_size_bytes":I
    .end local v4    # "last_payload_type_bytes":I
    :cond_e
    return-void

    .line 708
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 788
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SEIMessage{payloadType="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", payloadSize="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 791
    .local v0, "out":Ljava/lang/String;
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->payloadType:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 792
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->sps:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-object v1, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    iget-object v1, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->nalHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    if-nez v1, :cond_0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->sps:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-object v1, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    iget-object v1, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->vclHRDParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/HRDParameters;

    if-eqz v1, :cond_1

    .line 794
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", cpb_removal_delay="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->cpb_removal_delay:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", dpb_removal_delay="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->dpb_removal_delay:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 797
    :cond_1
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->sps:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;

    iget-object v1, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/SeqParameterSet;->vuiParams:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;

    iget-boolean v1, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/h264/model/VUIParameters;->pic_struct_present_flag:Z

    if-eqz v1, :cond_2

    .line 798
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", pic_struct="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->pic_struct:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 799
    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->clock_timestamp_flag:Z

    if-eqz v1, :cond_2

    .line 800
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", ct_type="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->ct_type:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", nuit_field_based_flag="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->nuit_field_based_flag:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", counting_type="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->counting_type:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", full_timestamp_flag="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->full_timestamp_flag:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", discontinuity_flag="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->discontinuity_flag:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", cnt_dropped_flag="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->cnt_dropped_flag:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", n_frames="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->n_frames:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", seconds_value="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->seconds_value:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", minutes_value="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->minutes_value:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", hours_value="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->hours_value:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", time_offset_length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->time_offset_length:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", time_offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl$SEIMessage;->time_offset:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 815
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x7d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 816
    return-object v0
.end method
