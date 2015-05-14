.class Lco/getair/meerkat/mediators/BroadcastMediator$ChunkedHWRecorderWrapper;
.super Ljava/lang/Object;
.source "BroadcastMediator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/mediators/BroadcastMediator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ChunkedHWRecorderWrapper"
.end annotation


# instance fields
.field private chunkedHwRecorder:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

.field private mThrowable:Ljava/lang/Throwable;


# direct methods
.method private constructor <init>(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)V
    .locals 0
    .param p1, "recorder"    # Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    .prologue
    .line 876
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 877
    iput-object p1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$ChunkedHWRecorderWrapper;->chunkedHwRecorder:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    .line 878
    return-void
.end method

.method public static runTest(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)V
    .locals 3
    .param p0, "obj"    # Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 884
    new-instance v1, Lco/getair/meerkat/mediators/BroadcastMediator$ChunkedHWRecorderWrapper;

    invoke-direct {v1, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$ChunkedHWRecorderWrapper;-><init>(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)V

    .line 885
    .local v1, "wrapper":Lco/getair/meerkat/mediators/BroadcastMediator$ChunkedHWRecorderWrapper;
    new-instance v0, Ljava/lang/Thread;

    const-string v2, "broadcast codec"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 886
    .local v0, "th":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 889
    iget-object v2, v1, Lco/getair/meerkat/mediators/BroadcastMediator$ChunkedHWRecorderWrapper;->mThrowable:Ljava/lang/Throwable;

    if-eqz v2, :cond_0

    .line 890
    iget-object v2, v1, Lco/getair/meerkat/mediators/BroadcastMediator$ChunkedHWRecorderWrapper;->mThrowable:Ljava/lang/Throwable;

    throw v2

    .line 892
    :cond_0
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 897
    :try_start_0
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$ChunkedHWRecorderWrapper;->chunkedHwRecorder:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->startRecording()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 901
    :goto_0
    return-void

    .line 898
    :catch_0
    move-exception v0

    .line 899
    .local v0, "th":Ljava/lang/Throwable;
    iput-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator$ChunkedHWRecorderWrapper;->mThrowable:Ljava/lang/Throwable;

    goto :goto_0
.end method
