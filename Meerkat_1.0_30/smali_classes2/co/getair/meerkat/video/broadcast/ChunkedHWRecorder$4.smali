.class Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;
.super Ljava/lang/Object;
.source "ChunkedHWRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->drainEncoder(Landroid/media/MediaCodec;Landroid/media/MediaCodec$BufferInfo;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

.field final synthetic val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field final synthetic val$encoder:Landroid/media/MediaCodec;

.field final synthetic val$endOfStream:Z


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;Landroid/media/MediaCodec;ZLandroid/media/MediaCodec$BufferInfo;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    .prologue
    .line 768
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iput-object p2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$encoder:Landroid/media/MediaCodec;

    iput-boolean p3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$endOfStream:Z

    iput-object p4, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 20

    .prologue
    .line 773
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$endOfStream:Z

    if-eqz v3, :cond_0

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$encoder:Landroid/media/MediaCodec;

    if-eqz v3, :cond_0

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$encoder:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    # getter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoEncoder:Landroid/media/MediaCodec;
    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$600(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Landroid/media/MediaCodec;

    move-result-object v4

    if-ne v3, v4, :cond_0

    .line 776
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$encoder:Landroid/media/MediaCodec;

    if-eqz v3, :cond_0

    .line 777
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$encoder:Landroid/media/MediaCodec;

    invoke-virtual {v3}, Landroid/media/MediaCodec;->signalEndOfInputStream()V

    .line 778
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    const/4 v4, 0x1

    iput-boolean v4, v3, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eosSentToVideoEncoder:Z

    .line 782
    :cond_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$encoder:Landroid/media/MediaCodec;

    if-eqz v3, :cond_1

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iget-boolean v3, v3, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->fullStopPerformed:Z

    if-eqz v3, :cond_2

    .line 915
    :cond_1
    :goto_0
    return-void

    .line 787
    :cond_2
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$encoder:Landroid/media/MediaCodec;

    invoke-virtual {v3}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v10

    .line 795
    .local v10, "encoderOutputBuffers":[Ljava/nio/ByteBuffer;
    :goto_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$encoder:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    const-wide/16 v6, 0x32

    invoke-virtual {v3, v4, v6, v7}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v11

    .line 796
    .local v11, "encoderStatus":I
    const/4 v3, -0x1

    if-ne v11, v3, :cond_4

    .line 798
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$endOfStream:Z

    if-eqz v3, :cond_1

    .line 913
    :cond_3
    :goto_2
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    goto :goto_1

    .line 788
    .end local v10    # "encoderOutputBuffers":[Ljava/nio/ByteBuffer;
    .end local v11    # "encoderStatus":I
    :catch_0
    move-exception v12

    .line 790
    .local v12, "ex":Ljava/lang/Exception;
    goto :goto_0

    .line 804
    .end local v12    # "ex":Ljava/lang/Exception;
    .restart local v10    # "encoderOutputBuffers":[Ljava/nio/ByteBuffer;
    .restart local v11    # "encoderStatus":I
    :cond_4
    const/4 v3, -0x3

    if-eq v11, v3, :cond_3

    .line 807
    const/4 v3, -0x2

    if-ne v11, v3, :cond_5

    .line 811
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$encoder:Landroid/media/MediaCodec;

    invoke-virtual {v3}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v13

    .line 812
    .local v13, "newFormat":Landroid/media/MediaFormat;
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$encoder:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    # getter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoEncoder:Landroid/media/MediaCodec;
    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$600(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Landroid/media/MediaCodec;

    move-result-object v4

    if-ne v3, v4, :cond_3

    .line 815
    const-string v3, "csd-1"

    invoke-virtual {v13, v3}, Landroid/media/MediaFormat;->getByteBuffer(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v16

    .line 816
    .local v16, "sps":[B
    const-string v3, "csd-0"

    invoke-virtual {v13, v3}, Landroid/media/MediaFormat;->getByteBuffer(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v14

    .line 818
    .local v14, "pps":[B
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iget-object v3, v3, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->builder:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    move-object/from16 v0, v16

    invoke-virtual {v3, v0, v14}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->setParametersSets([B[B)V

    goto :goto_2

    .line 820
    .end local v13    # "newFormat":Landroid/media/MediaFormat;
    .end local v14    # "pps":[B
    .end local v16    # "sps":[B
    :cond_5
    if-gez v11, :cond_6

    .line 821
    const-string v3, "CameraToMpegTest"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unexpected result from encoder.dequeueOutputBuffer: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 826
    :cond_6
    aget-object v9, v10, v11

    .line 827
    .local v9, "encodedData":Ljava/nio/ByteBuffer;
    if-nez v9, :cond_7

    .line 828
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "encoderOutputBuffer "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " was null"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 832
    :cond_7
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v3, v3, 0x2

    if-eqz v3, :cond_8

    .line 836
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    const/4 v4, 0x0

    iput v4, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 840
    :cond_8
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    if-eqz v3, :cond_c

    .line 842
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v9, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 843
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    add-int/2addr v3, v4

    invoke-virtual {v9, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 845
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$encoder:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    # getter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioEncoder:Landroid/media/MediaCodec;
    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$100(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Landroid/media/MediaCodec;

    move-result-object v4

    if-ne v3, v4, :cond_a

    .line 846
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v4, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    # getter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->lastEncodedAudioTimeStamp:J
    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$700(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-gez v3, :cond_9

    .line 847
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    # getter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->lastEncodedAudioTimeStamp:J
    invoke-static {v5}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$700(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)J

    move-result-wide v6

    const-wide/16 v18, 0x5ab3

    add-long v6, v6, v18

    # setter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->lastEncodedAudioTimeStamp:J
    invoke-static {v4, v6, v7}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$702(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;J)J

    move-result-wide v4

    iput-wide v4, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 848
    :cond_9
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v4, v4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    # setter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->lastEncodedAudioTimeStamp:J
    invoke-static {v3, v4, v5}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$702(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;J)J

    .line 850
    :cond_a
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v4, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-gez v3, :cond_b

    .line 851
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    const-wide/16 v4, 0x0

    iput-wide v4, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 854
    :cond_b
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$encoder:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    # getter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoEncoder:Landroid/media/MediaCodec;
    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$600(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Landroid/media/MediaCodec;

    move-result-object v4

    if-ne v3, v4, :cond_d

    .line 855
    const/4 v15, 0x0

    .line 857
    .local v15, "sample":Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;
    :try_start_1
    sget-object v3, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mediaSamplesPool:Lco/getair/meerkat/utilities/objectPool/ObjectPool;

    invoke-virtual {v3}, Lco/getair/meerkat/utilities/objectPool/ObjectPool;->get()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;

    move-object v15, v0
    :try_end_1
    .catch Lco/getair/meerkat/utilities/objectPool/NoUnlockedObjectException; {:try_start_1 .. :try_end_1} :catch_1

    .line 861
    :goto_3
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v15, v3}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->setBuffer(Ljava/nio/ByteBuffer;)V

    .line 862
    iget-object v3, v15, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v9}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 863
    iget-object v3, v15, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 864
    iget-object v3, v15, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->info:Landroid/media/MediaCodec$BufferInfo;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->offset:I

    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v5, v5, Landroid/media/MediaCodec$BufferInfo;->size:I

    move-object/from16 v0, p0

    iget-object v6, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v6, v6, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    move-object/from16 v0, p0

    iget-object v8, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v8, v8, Landroid/media/MediaCodec$BufferInfo;->flags:I

    invoke-virtual/range {v3 .. v8}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 866
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iget-object v3, v3, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->builder:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->processVideoSample(Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;)V

    .line 886
    .end local v15    # "sample":Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;
    :cond_c
    :goto_4
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$encoder:Landroid/media/MediaCodec;

    const/4 v4, 0x0

    invoke-virtual {v3, v11, v4}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 888
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v3, v3, 0x4

    if-eqz v3, :cond_1

    .line 889
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$endOfStream:Z

    if-nez v3, :cond_e

    .line 890
    const-string v3, "CameraToMpegTest"

    const-string v4, "reached end of stream unexpectedly"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 858
    .restart local v15    # "sample":Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;
    :catch_1
    move-exception v2

    .line 859
    .local v2, "e":Lco/getair/meerkat/utilities/objectPool/NoUnlockedObjectException;
    invoke-virtual {v2}, Lco/getair/meerkat/utilities/objectPool/NoUnlockedObjectException;->printStackTrace()V

    goto :goto_3

    .line 870
    .end local v2    # "e":Lco/getair/meerkat/utilities/objectPool/NoUnlockedObjectException;
    .end local v15    # "sample":Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;
    :cond_d
    const/4 v15, 0x0

    .line 872
    .restart local v15    # "sample":Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;
    :try_start_2
    sget-object v3, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mediaSamplesPool:Lco/getair/meerkat/utilities/objectPool/ObjectPool;

    invoke-virtual {v3}, Lco/getair/meerkat/utilities/objectPool/ObjectPool;->get()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;

    move-object v15, v0
    :try_end_2
    .catch Lco/getair/meerkat/utilities/objectPool/NoUnlockedObjectException; {:try_start_2 .. :try_end_2} :catch_2

    .line 876
    :goto_5
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v15, v3}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->setBuffer(Ljava/nio/ByteBuffer;)V

    .line 877
    iget-object v3, v15, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v9}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 878
    iget-object v3, v15, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 879
    iget-object v3, v15, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->info:Landroid/media/MediaCodec$BufferInfo;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->offset:I

    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v5, v5, Landroid/media/MediaCodec$BufferInfo;->size:I

    move-object/from16 v0, p0

    iget-object v6, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v6, v6, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    move-object/from16 v0, p0

    iget-object v8, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v8, v8, Landroid/media/MediaCodec$BufferInfo;->flags:I

    invoke-virtual/range {v3 .. v8}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 880
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iget-object v3, v3, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->builder:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->processAudioSample(Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;)V

    goto :goto_4

    .line 873
    :catch_2
    move-exception v2

    .line 874
    .restart local v2    # "e":Lco/getair/meerkat/utilities/objectPool/NoUnlockedObjectException;
    invoke-virtual {v2}, Lco/getair/meerkat/utilities/objectPool/NoUnlockedObjectException;->printStackTrace()V

    goto :goto_5

    .line 894
    .end local v2    # "e":Lco/getair/meerkat/utilities/objectPool/NoUnlockedObjectException;
    .end local v15    # "sample":Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;
    :cond_e
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iget-boolean v3, v3, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->fullStopReceived:Z

    if-eqz v3, :cond_1

    .line 897
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$encoder:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    # getter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoEncoder:Landroid/media/MediaCodec;
    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$600(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Landroid/media/MediaCodec;

    move-result-object v4

    if-ne v3, v4, :cond_f

    .line 898
    const-string v3, "CameraToMpegTest"

    const-string v4, "Stopping and releasing video encoder"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 899
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    # invokes: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->stopAndReleaseVideoEncoder()V
    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$800(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)V

    goto/16 :goto_0

    .line 900
    :cond_f
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->val$encoder:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    # getter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioEncoder:Landroid/media/MediaCodec;
    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$100(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Landroid/media/MediaCodec;

    move-result-object v4

    if-ne v3, v4, :cond_1

    .line 901
    const-string v3, "CameraToMpegTest"

    const-string v4, "Stopping and releasing audio encoder"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 902
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    # invokes: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->stopAndReleaseAudioEncoder()V
    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$900(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)V

    goto/16 :goto_0
.end method
