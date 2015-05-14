.class Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$1;
.super Ljava/lang/Object;
.source "AACTrackImpl.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->readSamples(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;

.field final synthetic val$currentPosition:J

.field final synthetic val$frameSize:J


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;JJ)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;

    .prologue
    .line 346
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;

    iput-wide p2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$1;->val$currentPosition:J

    iput-wide p4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$1;->val$frameSize:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public asByteBuffer()Ljava/nio/ByteBuffer;
    .locals 6

    .prologue
    .line 357
    :try_start_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;

    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->access$000(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    move-result-object v1

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$1;->val$currentPosition:J

    iget-wide v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$1;->val$frameSize:J

    invoke-interface {v1, v2, v3, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->map(JJ)Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 358
    :catch_0
    move-exception v0

    .line 359
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 352
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$1;->val$frameSize:J

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
    .line 348
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;

    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->access$000(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    move-result-object v1

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$1;->val$currentPosition:J

    iget-wide v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$1;->val$frameSize:J

    move-object v6, p1

    invoke-interface/range {v1 .. v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J

    .line 349
    return-void
.end method
