.class Lco/getair/meerkat/mediators/BroadcastMediator$13;
.super Ljava/lang/Object;
.source "BroadcastMediator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/BroadcastMediator;->startBroadcast()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/BroadcastMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/BroadcastMediator;

    .prologue
    .line 605
    iput-object p1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$13;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 608
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator$13;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    iget-object v0, v0, Lco/getair/meerkat/mediators/BroadcastMediator;->chunkedHWRecorder:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    new-instance v1, Lco/getair/meerkat/mediators/BroadcastMediator$13$1;

    invoke-direct {v1, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$13$1;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator$13;)V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->requestFrameFromCamera(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 616
    return-void
.end method
