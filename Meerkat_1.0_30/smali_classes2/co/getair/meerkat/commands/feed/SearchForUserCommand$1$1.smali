.class Lco/getair/meerkat/commands/feed/SearchForUserCommand$1$1;
.super Lco/getair/meerkat/utilities/RunnableWithResultObject;
.source "SearchForUserCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/feed/SearchForUserCommand$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lco/getair/meerkat/commands/feed/SearchForUserCommand$1;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/feed/SearchForUserCommand$1;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/commands/feed/SearchForUserCommand$1;

    .prologue
    .line 38
    iput-object p1, p0, Lco/getair/meerkat/commands/feed/SearchForUserCommand$1$1;->this$1:Lco/getair/meerkat/commands/feed/SearchForUserCommand$1;

    invoke-direct {p0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 41
    iget-object v1, p0, Lco/getair/meerkat/commands/feed/SearchForUserCommand$1$1;->resultObject:Ljava/lang/Object;

    if-eqz v1, :cond_0

    .line 42
    iget-object v0, p0, Lco/getair/meerkat/commands/feed/SearchForUserCommand$1$1;->resultObject:Ljava/lang/Object;

    check-cast v0, Lco/getair/meerkat/dtos/User;

    .line 43
    .local v0, "userToFollow":Lco/getair/meerkat/dtos/User;
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v1

    const-string v2, "followUserCommand"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, v3}, Lco/getair/meerkat/facades/ApplicationFacade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    .end local v0    # "userToFollow":Lco/getair/meerkat/dtos/User;
    :cond_0
    return-void
.end method
