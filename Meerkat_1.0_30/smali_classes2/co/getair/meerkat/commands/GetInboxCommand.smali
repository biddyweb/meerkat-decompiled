.class public Lco/getair/meerkat/commands/GetInboxCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "GetInboxCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 3
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 16
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 18
    invoke-virtual {p0}, Lco/getair/meerkat/commands/GetInboxCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    const-string v2, "inboxProxy"

    invoke-virtual {v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/InboxProxy;

    .line 19
    .local v0, "inboxProxy":Lco/getair/meerkat/proxies/InboxProxy;
    invoke-virtual {v0}, Lco/getair/meerkat/proxies/InboxProxy;->fetchInbox()V

    .line 20
    return-void
.end method
