.class Lco/getair/meerkat/commands/watch/LikeStreamCommand$1;
.super Lco/getair/meerkat/utilities/RunnableWithResultObject;
.source "LikeStreamCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/watch/LikeStreamCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/commands/watch/LikeStreamCommand;

.field final synthetic val$watchProxy:Lco/getair/meerkat/proxies/WatchProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/watch/LikeStreamCommand;Lco/getair/meerkat/proxies/WatchProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/commands/watch/LikeStreamCommand;

    .prologue
    .line 23
    iput-object p1, p0, Lco/getair/meerkat/commands/watch/LikeStreamCommand$1;->this$0:Lco/getair/meerkat/commands/watch/LikeStreamCommand;

    iput-object p2, p0, Lco/getair/meerkat/commands/watch/LikeStreamCommand$1;->val$watchProxy:Lco/getair/meerkat/proxies/WatchProxy;

    invoke-direct {p0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 26
    iget-boolean v0, p0, Lco/getair/meerkat/commands/watch/LikeStreamCommand$1;->success:Z

    if-eqz v0, :cond_0

    .line 27
    iget-object v0, p0, Lco/getair/meerkat/commands/watch/LikeStreamCommand$1;->this$0:Lco/getair/meerkat/commands/watch/LikeStreamCommand;

    const-string v1, "eventStreamLiked"

    iget-object v2, p0, Lco/getair/meerkat/commands/watch/LikeStreamCommand$1;->val$watchProxy:Lco/getair/meerkat/proxies/WatchProxy;

    invoke-virtual {v2}, Lco/getair/meerkat/proxies/WatchProxy;->getTweetId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2, v3}, Lco/getair/meerkat/commands/watch/LikeStreamCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    :goto_0
    return-void

    .line 29
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/commands/watch/LikeStreamCommand$1;->this$0:Lco/getair/meerkat/commands/watch/LikeStreamCommand;

    const-string v1, "eventStreamLikeError"

    iget-object v2, p0, Lco/getair/meerkat/commands/watch/LikeStreamCommand$1;->val$watchProxy:Lco/getair/meerkat/proxies/WatchProxy;

    invoke-virtual {v2}, Lco/getair/meerkat/proxies/WatchProxy;->getTweetId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2, v3}, Lco/getair/meerkat/commands/watch/LikeStreamCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method
