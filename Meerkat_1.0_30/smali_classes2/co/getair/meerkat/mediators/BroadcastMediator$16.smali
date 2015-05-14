.class Lco/getair/meerkat/mediators/BroadcastMediator$16;
.super Ljava/lang/Object;
.source "BroadcastMediator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/BroadcastMediator;->handleConnectionIssues()V
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
    .line 787
    iput-object p1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$16;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 791
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator$16;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    iget-boolean v0, v0, Lco/getair/meerkat/mediators/BroadcastMediator;->recording:Z

    if-eqz v0, :cond_0

    .line 792
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator$16;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$16;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    # getter for: Lco/getair/meerkat/mediators/BroadcastMediator;->mediaServerUrl:Ljava/lang/String;
    invoke-static {v1}, Lco/getair/meerkat/mediators/BroadcastMediator;->access$800(Lco/getair/meerkat/mediators/BroadcastMediator;)Ljava/lang/String;

    move-result-object v1

    # invokes: Lco/getair/meerkat/mediators/BroadcastMediator;->startSubmission(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lco/getair/meerkat/mediators/BroadcastMediator;->access$900(Lco/getair/meerkat/mediators/BroadcastMediator;Ljava/lang/String;)V

    .line 794
    :cond_0
    return-void
.end method
