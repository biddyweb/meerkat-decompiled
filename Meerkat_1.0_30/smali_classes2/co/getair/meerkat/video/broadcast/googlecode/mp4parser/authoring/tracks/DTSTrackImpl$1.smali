.class Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl$1;
.super Ljava/lang/Object;
.source "DTSTrackImpl.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->generateSamples(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;IJI)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;

.field final synthetic val$finalSample:Ljava/nio/ByteBuffer;


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;Ljava/nio/ByteBuffer;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;

    .prologue
    .line 662
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;

    iput-object p2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl$1;->val$finalSample:Ljava/nio/ByteBuffer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public asByteBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    .prologue
    .line 672
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl$1;->val$finalSample:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 668
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl$1;->val$finalSample:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
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
    .line 664
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl$1;->val$finalSample:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    invoke-interface {p1, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 665
    return-void
.end method
