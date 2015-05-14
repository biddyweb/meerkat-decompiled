.class Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList$1;
.super Ljava/lang/Object;
.source "DefaultMp4SampleList.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->get(I)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;

.field final synthetic val$finalCorrectPartOfChunk:Ljava/nio/ByteBuffer;

.field final synthetic val$finalOffsetWithInChunk:J

.field final synthetic val$sampleSize:J


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;JLjava/nio/ByteBuffer;J)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;

    .prologue
    .line 209
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;

    iput-wide p2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList$1;->val$sampleSize:J

    iput-object p4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList$1;->val$finalCorrectPartOfChunk:Ljava/nio/ByteBuffer;

    iput-wide p5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList$1;->val$finalOffsetWithInChunk:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public asByteBuffer()Ljava/nio/ByteBuffer;
    .locals 4

    .prologue
    .line 220
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList$1;->val$finalCorrectPartOfChunk:Ljava/nio/ByteBuffer;

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList$1;->val$finalOffsetWithInChunk:J

    invoke-static {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList$1;->val$sampleSize:J

    invoke-static {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 216
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList$1;->val$sampleSize:J

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 225
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DefaultMp4Sample(size:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList$1;->val$sampleSize:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Ljava/nio/channels/WritableByteChannel;)V
    .locals 1
    .param p1, "channel"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 212
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList$1;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 213
    return-void
.end method
