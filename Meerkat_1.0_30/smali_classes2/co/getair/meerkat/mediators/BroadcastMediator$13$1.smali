.class Lco/getair/meerkat/mediators/BroadcastMediator$13$1;
.super Lco/getair/meerkat/utilities/RunnableWithResultObject;
.source "BroadcastMediator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/BroadcastMediator$13;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lco/getair/meerkat/mediators/BroadcastMediator$13;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/BroadcastMediator$13;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/mediators/BroadcastMediator$13;

    .prologue
    .line 608
    iput-object p1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$13$1;->this$1:Lco/getair/meerkat/mediators/BroadcastMediator$13;

    invoke-direct {p0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 611
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator$13$1;->this$1:Lco/getair/meerkat/mediators/BroadcastMediator$13;

    iget-object v0, v0, Lco/getair/meerkat/mediators/BroadcastMediator$13;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    const/4 v1, 0x1

    # setter for: Lco/getair/meerkat/mediators/BroadcastMediator;->didSendCoverImage:Z
    invoke-static {v0, v1}, Lco/getair/meerkat/mediators/BroadcastMediator;->access$502(Lco/getair/meerkat/mediators/BroadcastMediator;Z)Z

    .line 612
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator$13$1;->this$1:Lco/getair/meerkat/mediators/BroadcastMediator$13;

    iget-object v0, v0, Lco/getair/meerkat/mediators/BroadcastMediator$13;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    # invokes: Lco/getair/meerkat/mediators/BroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/mediators/BroadcastMediator;->access$600(Lco/getair/meerkat/mediators/BroadcastMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "broadcastReceivedCoverImage"

    iget-object v2, p0, Lco/getair/meerkat/mediators/BroadcastMediator$13$1;->resultObject:Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 614
    return-void
.end method
