.class Lco/getair/meerkat/commands/watch/AddCommentCommand$1;
.super Lco/getair/meerkat/utilities/RunnableWithResultObject;
.source "AddCommentCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/watch/AddCommentCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/commands/watch/AddCommentCommand;

.field final synthetic val$addCommentParams:Lco/getair/meerkat/dtos/AddCommentParams;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/watch/AddCommentCommand;Lco/getair/meerkat/dtos/AddCommentParams;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/commands/watch/AddCommentCommand;

    .prologue
    .line 26
    iput-object p1, p0, Lco/getair/meerkat/commands/watch/AddCommentCommand$1;->this$0:Lco/getair/meerkat/commands/watch/AddCommentCommand;

    iput-object p2, p0, Lco/getair/meerkat/commands/watch/AddCommentCommand$1;->val$addCommentParams:Lco/getair/meerkat/dtos/AddCommentParams;

    invoke-direct {p0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 29
    iget-boolean v1, p0, Lco/getair/meerkat/commands/watch/AddCommentCommand$1;->success:Z

    if-eqz v1, :cond_1

    .line 32
    iget-object v1, p0, Lco/getair/meerkat/commands/watch/AddCommentCommand$1;->this$0:Lco/getair/meerkat/commands/watch/AddCommentCommand;

    # invokes: Lco/getair/meerkat/commands/watch/AddCommentCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v1}, Lco/getair/meerkat/commands/watch/AddCommentCommand;->access$000(Lco/getair/meerkat/commands/watch/AddCommentCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    const-string v2, "watchProxy"

    invoke-virtual {v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/WatchProxy;

    .line 33
    .local v0, "watchProxy":Lco/getair/meerkat/proxies/WatchProxy;
    if-eqz v0, :cond_0

    .line 34
    invoke-virtual {v0}, Lco/getair/meerkat/proxies/WatchProxy;->setStreamCommented()V

    .line 38
    :cond_0
    iget-object v1, p0, Lco/getair/meerkat/commands/watch/AddCommentCommand$1;->this$0:Lco/getair/meerkat/commands/watch/AddCommentCommand;

    const-string v2, "eventCommentAdded"

    iget-object v3, p0, Lco/getair/meerkat/commands/watch/AddCommentCommand$1;->val$addCommentParams:Lco/getair/meerkat/dtos/AddCommentParams;

    invoke-virtual {v1, v2, v3, v4}, Lco/getair/meerkat/commands/watch/AddCommentCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    .end local v0    # "watchProxy":Lco/getair/meerkat/proxies/WatchProxy;
    :goto_0
    return-void

    .line 40
    :cond_1
    iget-object v1, p0, Lco/getair/meerkat/commands/watch/AddCommentCommand$1;->this$0:Lco/getair/meerkat/commands/watch/AddCommentCommand;

    const-string v2, "eventCommentAddedError"

    iget-object v3, p0, Lco/getair/meerkat/commands/watch/AddCommentCommand$1;->val$addCommentParams:Lco/getair/meerkat/dtos/AddCommentParams;

    invoke-virtual {v1, v2, v3, v4}, Lco/getair/meerkat/commands/watch/AddCommentCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method
