.class Lco/getair/meerkat/commands/feed/SearchForUserCommand$1;
.super Lco/getair/meerkat/utilities/RunnableWithResultObject;
.source "SearchForUserCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/feed/SearchForUserCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/commands/feed/SearchForUserCommand;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/feed/SearchForUserCommand;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/commands/feed/SearchForUserCommand;

    .prologue
    .line 29
    iput-object p1, p0, Lco/getair/meerkat/commands/feed/SearchForUserCommand$1;->this$0:Lco/getair/meerkat/commands/feed/SearchForUserCommand;

    invoke-direct {p0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 32
    iget-object v3, p0, Lco/getair/meerkat/commands/feed/SearchForUserCommand$1;->resultObject:Ljava/lang/Object;

    if-eqz v3, :cond_0

    .line 34
    :try_start_0
    iget-object v2, p0, Lco/getair/meerkat/commands/feed/SearchForUserCommand$1;->resultObject:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    .line 35
    .local v2, "userIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 36
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 38
    .local v1, "userIdToFollow":Ljava/lang/String;
    iget-object v3, p0, Lco/getair/meerkat/commands/feed/SearchForUserCommand$1;->this$0:Lco/getair/meerkat/commands/feed/SearchForUserCommand;

    # invokes: Lco/getair/meerkat/commands/feed/SearchForUserCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v3}, Lco/getair/meerkat/commands/feed/SearchForUserCommand;->access$000(Lco/getair/meerkat/commands/feed/SearchForUserCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v3

    new-instance v4, Lco/getair/meerkat/commands/feed/SearchForUserCommand$1$1;

    invoke-direct {v4, p0}, Lco/getair/meerkat/commands/feed/SearchForUserCommand$1$1;-><init>(Lco/getair/meerkat/commands/feed/SearchForUserCommand$1;)V

    invoke-static {v3, v1, v4}, Lco/getair/meerkat/dtos/User;->fetchUser(Landroid/content/Context;Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .end local v1    # "userIdToFollow":Ljava/lang/String;
    .end local v2    # "userIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    return-void

    .line 48
    :catch_0
    move-exception v0

    .line 49
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "search results corrupted"

    invoke-static {v3}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;)V

    goto :goto_0
.end method
