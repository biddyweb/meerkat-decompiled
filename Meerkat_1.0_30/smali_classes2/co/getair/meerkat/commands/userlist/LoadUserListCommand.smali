.class public Lco/getair/meerkat/commands/userlist/LoadUserListCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "LoadUserListCommand.java"


# instance fields
.field resultHandler:Lco/getair/meerkat/utilities/RunnableWithResultObject;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    .line 98
    new-instance v0, Lco/getair/meerkat/commands/userlist/LoadUserListCommand$3;

    invoke-direct {v0, p0}, Lco/getair/meerkat/commands/userlist/LoadUserListCommand$3;-><init>(Lco/getair/meerkat/commands/userlist/LoadUserListCommand;)V

    iput-object v0, p0, Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->resultHandler:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/commands/userlist/LoadUserListCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/userlist/LoadUserListCommand;

    .prologue
    .line 35
    invoke-virtual {p0}, Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/commands/userlist/LoadUserListCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/userlist/LoadUserListCommand;

    .prologue
    .line 35
    invoke-virtual {p0}, Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lco/getair/meerkat/commands/userlist/LoadUserListCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/userlist/LoadUserListCommand;

    .prologue
    .line 35
    invoke-virtual {p0}, Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method private loadFollowerListSource()V
    .locals 4

    .prologue
    .line 66
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v2

    const-string v3, "graphProxy"

    invoke-virtual {v2, v3}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/GraphProxy;

    .line 67
    .local v0, "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    invoke-virtual {v0}, Lco/getair/meerkat/proxies/GraphProxy;->getMyUser()Lco/getair/meerkat/dtos/User;

    move-result-object v1

    .line 69
    .local v1, "user":Lco/getair/meerkat/dtos/User;
    iget-object v2, p0, Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->resultHandler:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/proxies/GraphProxy;->getFollowersForUser(Lco/getair/meerkat/dtos/User;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 71
    return-void
.end method

.method private loadFollowingListSource()V
    .locals 4

    .prologue
    .line 58
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v2

    const-string v3, "graphProxy"

    invoke-virtual {v2, v3}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/GraphProxy;

    .line 59
    .local v0, "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    invoke-virtual {v0}, Lco/getair/meerkat/proxies/GraphProxy;->getMyUser()Lco/getair/meerkat/dtos/User;

    move-result-object v1

    .line 61
    .local v1, "user":Lco/getair/meerkat/dtos/User;
    iget-object v2, p0, Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->resultHandler:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/proxies/GraphProxy;->getMyFollowingList(Lco/getair/meerkat/dtos/User;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 62
    return-void
.end method

.method private loadLeaderboardListSource()V
    .locals 9

    .prologue
    const/4 v1, 0x0

    .line 76
    invoke-virtual {p0}, Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v7

    .line 77
    .local v7, "ownerActivity":Landroid/app/Activity;
    invoke-static {v7}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v6

    .line 78
    .local v6, "apiProxy":Lco/getair/meerkat/ApiProxy;
    const-string v3, "%s?auth=%s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "leaderboard"

    invoke-virtual {v6, v5}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    const/4 v5, 0x1

    invoke-static {v7}, Lco/getair/meerkat/dtos/Session;->loadSession(Landroid/content/Context;)Lco/getair/meerkat/dtos/Session;

    move-result-object v8

    invoke-virtual {v8}, Lco/getair/meerkat/dtos/Session;->getAuthToken()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 80
    .local v2, "leaderboardUrl":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/commands/userlist/LoadUserListCommand$1;

    invoke-direct {v4, p0}, Lco/getair/meerkat/commands/userlist/LoadUserListCommand$1;-><init>(Lco/getair/meerkat/commands/userlist/LoadUserListCommand;)V

    new-instance v5, Lco/getair/meerkat/commands/userlist/LoadUserListCommand$2;

    invoke-direct {v5, p0}, Lco/getair/meerkat/commands/userlist/LoadUserListCommand$2;-><init>(Lco/getair/meerkat/commands/userlist/LoadUserListCommand;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 93
    .local v0, "followUserRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    invoke-static {v7}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 95
    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 2
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 38
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 40
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 42
    .local v0, "listSource":Ljava/lang/String;
    const-string v1, "following"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 44
    invoke-direct {p0}, Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->loadFollowingListSource()V

    .line 53
    :cond_0
    :goto_0
    return-void

    .line 45
    :cond_1
    const-string v1, "followers"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 47
    invoke-direct {p0}, Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->loadFollowerListSource()V

    goto :goto_0

    .line 48
    :cond_2
    const-string v1, "leaderboard"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 50
    invoke-direct {p0}, Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->loadLeaderboardListSource()V

    goto :goto_0
.end method
