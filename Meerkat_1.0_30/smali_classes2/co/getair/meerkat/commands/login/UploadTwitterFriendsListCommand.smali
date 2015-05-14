.class public Lco/getair/meerkat/commands/login/UploadTwitterFriendsListCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "UploadTwitterFriendsListCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 4
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 20
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 22
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 23
    .local v0, "friendsIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/UploadTwitterFriendsListCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "sessionProxy"

    invoke-virtual {v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/SessionProxy;

    .line 25
    .local v1, "sessionProxy":Lco/getair/meerkat/proxies/SessionProxy;
    invoke-virtual {v1, v0}, Lco/getair/meerkat/proxies/SessionProxy;->uploadTwitterFrindsList(Ljava/util/List;)V

    .line 26
    return-void
.end method
