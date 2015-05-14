.class Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$1;
.super Ljava/lang/Object;
.source "EC3TrackImpl.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->readSamples()Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;

.field final synthetic val$start:I


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;I)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;

    .prologue
    .line 391
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;

    iput p2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$1;->val$start:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public asByteBuffer()Ljava/nio/ByteBuffer;
    .locals 6

    .prologue
    .line 402
    :try_start_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;

    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$1;->val$start:I

    int-to-long v2, v2

    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;

    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->frameSize:I
    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->access$000(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;)I

    move-result v4

    int-to-long v4, v4

    invoke-interface {v1, v2, v3, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->map(JJ)Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 403
    :catch_0
    move-exception v0

    .line 404
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 397
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;

    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->frameSize:I
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->access$000(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;)I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public writeTo(Ljava/nio/channels/WritableByteChannel;)V
    .locals 7
    .param p1, "channel"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 393
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;

    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    move-result-object v1

    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$1;->val$start:I

    int-to-long v2, v0

    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;

    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->frameSize:I
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->access$000(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;)I

    move-result v0

    int-to-long v4, v0

    move-object v6, p1

    invoke-interface/range {v1 .. v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J

    .line 394
    return-void
.end method
