.class Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1;
.super Lco/getair/meerkat/utilities/RunnableWithResultObject;
.source "RegisterForNotificationsCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;->doInBackground([Ljava/lang/Void;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;


# direct methods
.method constructor <init>(Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;

    .prologue
    .line 71
    iput-object p1, p0, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1;->this$1:Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;

    invoke-direct {p0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 74
    iget-boolean v0, p0, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1;->success:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1;->this$1:Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;

    iget-object v0, v0, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;->this$0:Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;

    # invokes: Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;->access$100(Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    instance-of v0, v0, Lco/getair/meerkat/facades/BaseFacade;

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1;->this$1:Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;

    iget-object v0, v0, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;->this$0:Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;

    # invokes: Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;->access$300(Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1$1;

    invoke-direct {v1, p0}, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1$1;-><init>(Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 82
    :cond_0
    return-void
.end method
