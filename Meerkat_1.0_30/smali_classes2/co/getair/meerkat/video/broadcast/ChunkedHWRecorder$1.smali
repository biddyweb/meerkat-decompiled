.class Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;
.super Ljava/lang/Object;
.source "ChunkedHWRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->startAudioRecord()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    .prologue
    .line 349
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 353
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    # getter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->audioRecord:Landroid/media/AudioRecord;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$000(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Landroid/media/AudioRecord;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/AudioRecord;->startRecording()V

    .line 354
    const/4 v0, 0x0

    .line 357
    .local v0, "audioEosRequestedCopy":Z
    :cond_0
    :goto_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iget-boolean v2, v2, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->firstFrameReady:Z

    if-eqz v2, :cond_0

    .line 359
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iget-boolean v0, v2, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->audioEosRequested:Z

    .line 360
    if-nez v0, :cond_1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iget-boolean v2, v2, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->fullStopReceived:Z

    if-eqz v2, :cond_2

    .line 361
    :cond_1
    const-string v2, "CameraToMpegTest"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Audio loop caught audioEosRequested / fullStopReceived "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iget-boolean v6, v6, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->fullStopReceived:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    invoke-virtual {v2, v4}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->sendAudioToEncoder(Z)V

    .line 366
    :cond_2
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iget-boolean v2, v2, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->fullStopReceived:Z

    if-eqz v2, :cond_3

    .line 367
    const-string v2, "CameraToMpegTest"

    const-string v5, "Stopping AudioRecord"

    invoke-static {v2, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 368
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    # getter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->audioRecord:Landroid/media/AudioRecord;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$000(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Landroid/media/AudioRecord;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/AudioRecord;->stop()V

    .line 372
    :cond_3
    :try_start_0
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    # getter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioEncoder:Landroid/media/MediaCodec;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$100(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Landroid/media/MediaCodec;

    move-result-object v6

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    # getter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioBufferInfo:Landroid/media/MediaCodec$BufferInfo;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$200(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Landroid/media/MediaCodec$BufferInfo;

    move-result-object v7

    if-nez v0, :cond_4

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iget-boolean v2, v2, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->fullStopReceived:Z

    if-eqz v2, :cond_6

    :cond_4
    move v2, v4

    :goto_1
    # invokes: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->drainEncoder(Landroid/media/MediaCodec;Landroid/media/MediaCodec$BufferInfo;Z)V
    invoke-static {v5, v6, v7, v2}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$300(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;Landroid/media/MediaCodec;Landroid/media/MediaCodec$BufferInfo;Z)V
    :try_end_0
    .catch Lco/getair/meerkat/utilities/objectPool/NoUnlockedObjectException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 380
    :goto_2
    if-eqz v0, :cond_5

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iput-boolean v3, v2, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->audioEosRequested:Z

    .line 382
    :cond_5
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iget-boolean v2, v2, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->fullStopReceived:Z

    if-nez v2, :cond_7

    .line 384
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    invoke-virtual {v2, v3}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->sendAudioToEncoder(Z)V

    goto :goto_0

    :cond_6
    move v2, v3

    .line 372
    goto :goto_1

    .line 376
    :catch_0
    move-exception v1

    .line 377
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 390
    .end local v1    # "e":Ljava/io/IOException;
    :cond_7
    return-void

    .line 374
    :catch_1
    move-exception v2

    goto :goto_2
.end method
