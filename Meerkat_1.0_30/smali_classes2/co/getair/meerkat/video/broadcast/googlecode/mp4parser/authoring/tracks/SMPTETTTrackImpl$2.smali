.class Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$2;
.super Ljava/lang/Object;
.source "SMPTETTTrackImpl.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;-><init>([Ljava/io/File;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;

.field final synthetic val$file:Ljava/io/File;


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;Ljava/io/File;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;

    .prologue
    .line 241
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$2;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;

    iput-object p2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$2;->val$file:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public asByteBuffer()Ljava/nio/ByteBuffer;
    .locals 4

    .prologue
    .line 252
    :try_start_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$2;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;

    new-instance v2, Ljava/io/FileInputStream;

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$2;->val$file:Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    # invokes: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->streamToByteArray(Ljava/io/InputStream;)[B
    invoke-static {v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;Ljava/io/InputStream;)[B

    move-result-object v1

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 253
    :catch_0
    move-exception v0

    .line 254
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 247
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$2;->val$file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public writeTo(Ljava/nio/channels/WritableByteChannel;)V
    .locals 4
    .param p1, "channel"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 243
    invoke-static {p1}, Ljava/nio/channels/Channels;->newOutputStream(Ljava/nio/channels/WritableByteChannel;)Ljava/io/OutputStream;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$2;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;

    new-instance v2, Ljava/io/FileInputStream;

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$2;->val$file:Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    # invokes: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->streamToByteArray(Ljava/io/InputStream;)[B
    invoke-static {v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;Ljava/io/InputStream;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 244
    return-void
.end method