.class public Lco/getair/meerkat/commands/mixpanel/DecrementPeolpePropertyCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "DecrementPeolpePropertyCommand.java"


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
    .locals 4
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 16
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 18
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 20
    .local v1, "propertyName":Ljava/lang/String;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/mixpanel/DecrementPeolpePropertyCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "mixpanelProxy"

    invoke-virtual {v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/MixpanelProxy;

    .line 21
    .local v0, "mixpanelProxy":Lco/getair/meerkat/proxies/MixpanelProxy;
    invoke-virtual {v0, v1}, Lco/getair/meerkat/proxies/MixpanelProxy;->decrementPeopleProperty(Ljava/lang/String;)V

    .line 22
    return-void
.end method
