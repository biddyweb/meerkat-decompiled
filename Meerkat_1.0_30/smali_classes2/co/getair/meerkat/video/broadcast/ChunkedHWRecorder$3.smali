.class Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$3;
.super Ljava/lang/Object;
.source "ChunkedHWRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->requestFrameFromCamera(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

.field final synthetic val$resultRunnable:Lco/getair/meerkat/utilities/RunnableWithResultObject;


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    .prologue
    .line 597
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$3;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iput-object p2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$3;->val$resultRunnable:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 600
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$3;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$3;->val$resultRunnable:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->requestFrameFromCamera(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 601
    return-void
.end method
