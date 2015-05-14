.class Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;
.super Ljava/lang/Object;
.source "Avc1ToAvc3TrackImpl.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;->get(I)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;

.field final synthetic val$buf:Ljava/nio/ByteBuffer;

.field final synthetic val$len:I

.field final synthetic val$orignalSample:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;Ljava/nio/ByteBuffer;ILco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;

    .prologue
    .line 71
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->this$1:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;

    iput-object p2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$buf:Ljava/nio/ByteBuffer;

    iput p3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$len:I

    iput-object p4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$orignalSample:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public asByteBuffer()Ljava/nio/ByteBuffer;
    .locals 7

    .prologue
    .line 110
    const/4 v2, 0x0

    .line 111
    .local v2, "spsPpsSize":I
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->this$1:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;

    iget-object v3, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;

    iget-object v3, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->avcC:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->getSequenceParameterSets()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 112
    .local v0, "bytes":[B
    iget v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$len:I

    array-length v5, v0

    add-int/2addr v4, v5

    add-int/2addr v2, v4

    .line 113
    goto :goto_0

    .line 114
    .end local v0    # "bytes":[B
    :cond_0
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->this$1:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;

    iget-object v3, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;

    iget-object v3, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->avcC:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->getSequenceParameterSetExts()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 115
    .restart local v0    # "bytes":[B
    iget v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$len:I

    array-length v5, v0

    add-int/2addr v4, v5

    add-int/2addr v2, v4

    .line 116
    goto :goto_1

    .line 117
    .end local v0    # "bytes":[B
    :cond_1
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->this$1:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;

    iget-object v3, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;

    iget-object v3, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->avcC:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->getPictureParameterSets()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 118
    .restart local v0    # "bytes":[B
    iget v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$len:I

    array-length v5, v0

    add-int/2addr v4, v5

    add-int/2addr v2, v4

    .line 119
    goto :goto_2

    .line 123
    .end local v0    # "bytes":[B
    :cond_2
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$orignalSample:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    invoke-interface {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->getSize()J

    move-result-wide v4

    invoke-static {v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v3

    add-int/2addr v3, v2

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 124
    .local v1, "data":Ljava/nio/ByteBuffer;
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->this$1:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;

    iget-object v3, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;

    iget-object v3, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->avcC:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->getSequenceParameterSets()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 125
    .restart local v0    # "bytes":[B
    array-length v4, v0

    int-to-long v4, v4

    iget v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$len:I

    invoke-static {v4, v5, v1, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriterVariable;->write(JLjava/nio/ByteBuffer;I)V

    .line 126
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    goto :goto_3

    .line 128
    .end local v0    # "bytes":[B
    :cond_3
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->this$1:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;

    iget-object v3, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;

    iget-object v3, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->avcC:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->getSequenceParameterSetExts()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 129
    .restart local v0    # "bytes":[B
    array-length v4, v0

    int-to-long v4, v4

    iget v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$len:I

    invoke-static {v4, v5, v1, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriterVariable;->write(JLjava/nio/ByteBuffer;I)V

    .line 130
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    goto :goto_4

    .line 132
    .end local v0    # "bytes":[B
    :cond_4
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->this$1:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;

    iget-object v3, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;

    iget-object v3, v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->avcC:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->getPictureParameterSets()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 133
    .restart local v0    # "bytes":[B
    array-length v4, v0

    int-to-long v4, v4

    iget v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$len:I

    invoke-static {v4, v5, v1, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriterVariable;->write(JLjava/nio/ByteBuffer;I)V

    .line 134
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    goto :goto_5

    .line 136
    .end local v0    # "bytes":[B
    :cond_5
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$orignalSample:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    invoke-interface {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 137
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v3

    check-cast v3, Ljava/nio/ByteBuffer;

    return-object v3
.end method

.method public getSize()J
    .locals 6

    .prologue
    .line 95
    const/4 v1, 0x0

    .line 96
    .local v1, "spsPpsSize":I
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->this$1:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;

    iget-object v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;

    iget-object v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->avcC:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->getSequenceParameterSets()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 97
    .local v0, "bytes":[B
    iget v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$len:I

    array-length v4, v0

    add-int/2addr v3, v4

    add-int/2addr v1, v3

    .line 98
    goto :goto_0

    .line 99
    .end local v0    # "bytes":[B
    :cond_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->this$1:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;

    iget-object v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;

    iget-object v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->avcC:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->getSequenceParameterSetExts()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 100
    .restart local v0    # "bytes":[B
    iget v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$len:I

    array-length v4, v0

    add-int/2addr v3, v4

    add-int/2addr v1, v3

    .line 101
    goto :goto_1

    .line 102
    .end local v0    # "bytes":[B
    :cond_1
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->this$1:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;

    iget-object v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;

    iget-object v2, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->avcC:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->getPictureParameterSets()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 103
    .restart local v0    # "bytes":[B
    iget v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$len:I

    array-length v4, v0

    add-int/2addr v3, v4

    add-int/2addr v1, v3

    .line 104
    goto :goto_2

    .line 105
    .end local v0    # "bytes":[B
    :cond_2
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$orignalSample:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    invoke-interface {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->getSize()J

    move-result-wide v2

    int-to-long v4, v1

    add-long/2addr v2, v4

    return-wide v2
.end method

.method public writeTo(Ljava/nio/channels/WritableByteChannel;)V
    .locals 6
    .param p1, "channel"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->this$1:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;

    iget-object v1, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;

    iget-object v1, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->avcC:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->getSequenceParameterSets()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 76
    .local v0, "bytes":[B
    array-length v1, v0

    int-to-long v4, v1

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    iget v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$len:I

    invoke-static {v4, v5, v1, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriterVariable;->write(JLjava/nio/ByteBuffer;I)V

    .line 77
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 78
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    goto :goto_0

    .line 80
    .end local v0    # "bytes":[B
    :cond_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->this$1:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;

    iget-object v1, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;

    iget-object v1, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->avcC:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->getSequenceParameterSetExts()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 81
    .restart local v0    # "bytes":[B
    array-length v1, v0

    int-to-long v4, v1

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    iget v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$len:I

    invoke-static {v4, v5, v1, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriterVariable;->write(JLjava/nio/ByteBuffer;I)V

    .line 82
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 83
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    goto :goto_1

    .line 85
    .end local v0    # "bytes":[B
    :cond_1
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->this$1:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;

    iget-object v1, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;

    iget-object v1, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->avcC:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->getPictureParameterSets()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 86
    .restart local v0    # "bytes":[B
    array-length v1, v0

    int-to-long v4, v1

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    iget v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$len:I

    invoke-static {v4, v5, v1, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriterVariable;->write(JLjava/nio/ByteBuffer;I)V

    .line 87
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 88
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    goto :goto_2

    .line 90
    .end local v0    # "bytes":[B
    :cond_2
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList$1;->val$orignalSample:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    invoke-interface {v1, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->writeTo(Ljava/nio/channels/WritableByteChannel;)V

    .line 91
    return-void
.end method
