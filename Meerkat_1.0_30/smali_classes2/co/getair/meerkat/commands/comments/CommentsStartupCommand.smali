.class public Lco/getair/meerkat/commands/comments/CommentsStartupCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "CommentsStartupCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method private getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;
    .locals 1

    .prologue
    .line 56
    invoke-virtual {p0}, Lco/getair/meerkat/commands/comments/CommentsStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    return-object v0
.end method

.method private registerCommands()V
    .locals 3

    .prologue
    .line 37
    new-instance v0, Lco/getair/meerkat/commands/comments/LoadCommentsListCommand;

    invoke-direct {v0}, Lco/getair/meerkat/commands/comments/LoadCommentsListCommand;-><init>()V

    .line 38
    .local v0, "loadCommentsListCommand":Lco/getair/meerkat/commands/comments/LoadCommentsListCommand;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/comments/CommentsStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    const-string v2, "commentsLoad"

    invoke-virtual {v1, v2, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 40
    return-void
.end method

.method private registerMediators()V
    .locals 4

    .prologue
    .line 49
    new-instance v0, Lco/getair/meerkat/mediators/CommentsMediator;

    const-string v1, "commentsMediator"

    invoke-direct {p0}, Lco/getair/meerkat/commands/comments/CommentsStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f0e008a

    invoke-virtual {v2, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/mediators/CommentsMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 50
    .local v0, "commentsMediator":Lco/getair/meerkat/mediators/CommentsMediator;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/comments/CommentsStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V

    .line 51
    return-void
.end method

.method private registerProxies()V
    .locals 0

    .prologue
    .line 45
    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 3
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 25
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 27
    invoke-direct {p0}, Lco/getair/meerkat/commands/comments/CommentsStartupCommand;->registerCommands()V

    .line 28
    invoke-direct {p0}, Lco/getair/meerkat/commands/comments/CommentsStartupCommand;->registerProxies()V

    .line 29
    invoke-direct {p0}, Lco/getair/meerkat/commands/comments/CommentsStartupCommand;->registerMediators()V

    .line 31
    const-string v1, "commentsLoad"

    invoke-direct {p0}, Lco/getair/meerkat/commands/comments/CommentsStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v0

    invoke-virtual {v0}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/activities/CommentsActivity;

    invoke-virtual {v0}, Lco/getair/meerkat/activities/CommentsActivity;->getCommentsUrl()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, v2}, Lco/getair/meerkat/commands/comments/CommentsStartupCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    return-void
.end method
