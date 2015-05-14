.class public Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "ProfileUpdateFollowingFollowers.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;

    .prologue
    .line 22
    invoke-virtual {p0}, Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;

    .prologue
    .line 22
    invoke-virtual {p0}, Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;

    .prologue
    .line 22
    invoke-virtual {p0}, Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method private getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;
    .locals 1

    .prologue
    .line 65
    invoke-virtual {p0}, Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    return-object v0
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 5
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 26
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 28
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v3

    const-string v4, "graphProxy"

    invoke-virtual {v3, v4}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/GraphProxy;

    .line 29
    .local v1, "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    invoke-virtual {v1}, Lco/getair/meerkat/proxies/GraphProxy;->getMyUser()Lco/getair/meerkat/dtos/User;

    move-result-object v2

    .line 31
    .local v2, "myUser":Lco/getair/meerkat/dtos/User;
    new-instance v3, Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers$1;

    invoke-direct {v3, p0}, Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers$1;-><init>(Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;)V

    invoke-virtual {v1, v2, v3}, Lco/getair/meerkat/proxies/GraphProxy;->getFollowersForUser(Lco/getair/meerkat/dtos/User;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 56
    invoke-virtual {v1}, Lco/getair/meerkat/proxies/GraphProxy;->getMyFollowingCount()Ljava/lang/Integer;

    move-result-object v0

    .line 58
    .local v0, "followingCount":Ljava/lang/Integer;
    return-void
.end method
