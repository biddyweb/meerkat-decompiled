.class Lco/getair/meerkat/mediators/BroadcastMediator$17;
.super Ljava/lang/Object;
.source "BroadcastMediator.java"

# interfaces
.implements Lcom/nanotasks/BackgroundWork;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/BroadcastMediator;->startAdaptiveBitrateMonitor()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/nanotasks/BackgroundWork",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/BroadcastMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/BroadcastMediator;

    .prologue
    .line 807
    iput-object p1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$17;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic doInBackground()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 807
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator$17;->doInBackground()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public doInBackground()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 811
    :cond_0
    :goto_0
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$17;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    iget-boolean v1, v1, Lco/getair/meerkat/mediators/BroadcastMediator;->recording:Z

    if-eqz v1, :cond_1

    .line 813
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$17;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    iget-object v1, v1, Lco/getair/meerkat/mediators/BroadcastMediator;->inPipe:Ljava/io/PipedInputStream;

    invoke-virtual {v1}, Ljava/io/PipedInputStream;->available()I

    move-result v0

    .line 815
    .local v0, "usedBuffer":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "buffer available "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/utilities/MLog;->i(Ljava/lang/String;)V

    .line 816
    const-wide/16 v2, 0x3e8

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 818
    const v1, 0xf4240

    if-le v0, v1, :cond_0

    .line 820
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$17;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    iget-object v1, v1, Lco/getair/meerkat/mediators/BroadcastMediator;->chunkedHWRecorder:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    invoke-virtual {v1, v2, v3}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->setBitRateRatio(D)V

    .line 821
    const-string v1, "bitrate reduced by 0.5"

    invoke-static {v1}, Lco/getair/meerkat/utilities/MLog;->i(Ljava/lang/String;)V

    goto :goto_0

    .line 824
    .end local v0    # "usedBuffer":I
    :cond_1
    const-string v1, ""

    return-object v1
.end method
