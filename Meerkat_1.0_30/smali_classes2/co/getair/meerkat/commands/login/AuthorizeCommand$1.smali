.class Lco/getair/meerkat/commands/login/AuthorizeCommand$1;
.super Lco/getair/meerkat/utilities/RunnableWithResultObject;
.source "AuthorizeCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/login/AuthorizeCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/commands/login/AuthorizeCommand;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/login/AuthorizeCommand;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/commands/login/AuthorizeCommand;

    .prologue
    .line 27
    iput-object p1, p0, Lco/getair/meerkat/commands/login/AuthorizeCommand$1;->this$0:Lco/getair/meerkat/commands/login/AuthorizeCommand;

    invoke-direct {p0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 30
    iget-boolean v0, p0, Lco/getair/meerkat/commands/login/AuthorizeCommand$1;->success:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/getair/meerkat/commands/login/AuthorizeCommand$1;->this$0:Lco/getair/meerkat/commands/login/AuthorizeCommand;

    # invokes: Lco/getair/meerkat/commands/login/AuthorizeCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/commands/login/AuthorizeCommand;->access$000(Lco/getair/meerkat/commands/login/AuthorizeCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    instance-of v0, v0, Lco/getair/meerkat/facades/BaseFacade;

    if-eqz v0, :cond_0

    .line 31
    iget-object v0, p0, Lco/getair/meerkat/commands/login/AuthorizeCommand$1;->this$0:Lco/getair/meerkat/commands/login/AuthorizeCommand;

    # invokes: Lco/getair/meerkat/commands/login/AuthorizeCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/commands/login/AuthorizeCommand;->access$200(Lco/getair/meerkat/commands/login/AuthorizeCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lco/getair/meerkat/commands/login/AuthorizeCommand$1$1;

    invoke-direct {v1, p0}, Lco/getair/meerkat/commands/login/AuthorizeCommand$1$1;-><init>(Lco/getair/meerkat/commands/login/AuthorizeCommand$1;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 45
    :goto_0
    return-void

    .line 38
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/commands/login/AuthorizeCommand$1;->this$0:Lco/getair/meerkat/commands/login/AuthorizeCommand;

    # invokes: Lco/getair/meerkat/commands/login/AuthorizeCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/commands/login/AuthorizeCommand;->access$400(Lco/getair/meerkat/commands/login/AuthorizeCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lco/getair/meerkat/commands/login/AuthorizeCommand$1$2;

    invoke-direct {v1, p0}, Lco/getair/meerkat/commands/login/AuthorizeCommand$1$2;-><init>(Lco/getair/meerkat/commands/login/AuthorizeCommand$1;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
