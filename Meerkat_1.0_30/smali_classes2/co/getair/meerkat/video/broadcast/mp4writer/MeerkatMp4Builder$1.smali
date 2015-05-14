.class Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder$1;
.super Ljava/lang/Object;
.source "MeerkatMp4Builder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->streamChunk([BZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

.field final synthetic val$chunk:[B

.field final synthetic val$endStream:Z


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;[BZ)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    .prologue
    .line 151
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder$1;->this$0:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    iput-object p2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder$1;->val$chunk:[B

    iput-boolean p3, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder$1;->val$endStream:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 155
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder$1;->this$0:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    # getter for: Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->isStopped:Z
    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->access$000(Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 157
    :try_start_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder$1;->this$0:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    # getter for: Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->outStream:Ljava/io/OutputStream;
    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->access$100(Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;)Ljava/io/OutputStream;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder$1;->val$chunk:[B

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 158
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder$1;->this$0:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    # getter for: Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->outStream:Ljava/io/OutputStream;
    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->access$100(Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;)Ljava/io/OutputStream;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    .line 159
    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder$1;->val$endStream:Z

    if-eqz v1, :cond_0

    .line 160
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder$1;->this$0:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    # getter for: Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->outStream:Ljava/io/OutputStream;
    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->access$100(Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;)Ljava/io/OutputStream;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    :cond_0
    :goto_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder$1;->this$0:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder$1;->val$endStream:Z

    # setter for: Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->isStopped:Z
    invoke-static {v1, v2}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->access$002(Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;Z)Z

    .line 168
    :cond_1
    return-void

    .line 162
    :catch_0
    move-exception v0

    .line 163
    .local v0, "t":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method
