.class Lco/getair/meerkat/mediators/BroadcastMediator$11;
.super Ljava/lang/Object;
.source "BroadcastMediator.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/BroadcastMediator;->stopBroadcast()V
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
    .line 319
    iput-object p1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$11;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 321
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator$11;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    const/4 v1, 0x1

    # setter for: Lco/getair/meerkat/mediators/BroadcastMediator;->didEndBroadcasting:Z
    invoke-static {v0, v1}, Lco/getair/meerkat/mediators/BroadcastMediator;->access$402(Lco/getair/meerkat/mediators/BroadcastMediator;Z)Z

    .line 322
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator$11;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    iget-object v0, v0, Lco/getair/meerkat/mediators/BroadcastMediator;->chunkedHWRecorder:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->endStream()V

    .line 323
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator$11;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    invoke-virtual {v0}, Lco/getair/meerkat/mediators/BroadcastMediator;->finishBroadcasting()V

    .line 324
    return-void
.end method
