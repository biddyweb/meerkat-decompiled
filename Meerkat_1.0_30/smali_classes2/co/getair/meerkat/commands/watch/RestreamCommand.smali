.class public Lco/getair/meerkat/commands/watch/RestreamCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "RestreamCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/commands/watch/RestreamCommand;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/commands/watch/RestreamCommand;

    .prologue
    .line 25
    invoke-direct {p0}, Lco/getair/meerkat/commands/watch/RestreamCommand;->restream()V

    return-void
.end method

.method private restream()V
    .locals 4

    .prologue
    .line 64
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/RestreamCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/WatchActivityFacade;

    .line 65
    .local v0, "watchActivityFacade":Lco/getair/meerkat/facades/WatchActivityFacade;
    const-string v2, "watchProxy"

    invoke-virtual {v0, v2}, Lco/getair/meerkat/facades/WatchActivityFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/WatchProxy;

    .line 69
    .local v1, "watchProxy":Lco/getair/meerkat/proxies/WatchProxy;
    invoke-virtual {v0}, Lco/getair/meerkat/facades/WatchActivityFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/activities/WatchActivity;

    iget-object v2, v2, Lco/getair/meerkat/activities/WatchActivity;->streamId:Ljava/lang/String;

    new-instance v3, Lco/getair/meerkat/commands/watch/RestreamCommand$3;

    invoke-direct {v3, p0, v1}, Lco/getair/meerkat/commands/watch/RestreamCommand$3;-><init>(Lco/getair/meerkat/commands/watch/RestreamCommand;Lco/getair/meerkat/proxies/WatchProxy;)V

    invoke-virtual {v1, v2, v3}, Lco/getair/meerkat/proxies/WatchProxy;->restreamVideo(Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 91
    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 7
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 28
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 30
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/RestreamCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/facades/WatchActivityFacade;

    .line 31
    .local v3, "watchActivityFacade":Lco/getair/meerkat/facades/WatchActivityFacade;
    new-instance v0, Lco/getair/meerkat/utilities/ApplicationPreferences;

    invoke-virtual {v3}, Lco/getair/meerkat/facades/WatchActivityFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v0, v4}, Lco/getair/meerkat/utilities/ApplicationPreferences;-><init>(Landroid/content/Context;)V

    .line 32
    .local v0, "applicationPreferences":Lco/getair/meerkat/utilities/ApplicationPreferences;
    invoke-virtual {v0}, Lco/getair/meerkat/utilities/ApplicationPreferences;->isFirstTimeRetweetStream()Z

    move-result v2

    .line 34
    .local v2, "isFirstTimeRetweetStream":Z
    if-eqz v2, :cond_0

    .line 37
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/RestreamCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v4}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    .line 38
    .local v1, "context":Landroid/content/Context;
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {v4, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v5, "Restream?"

    .line 39
    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const-string v5, "This will also retweet it"

    .line 40
    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const-string v5, "Ok"

    new-instance v6, Lco/getair/meerkat/commands/watch/RestreamCommand$2;

    invoke-direct {v6, p0}, Lco/getair/meerkat/commands/watch/RestreamCommand$2;-><init>(Lco/getair/meerkat/commands/watch/RestreamCommand;)V

    .line 41
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const-string v5, "Not Now"

    new-instance v6, Lco/getair/meerkat/commands/watch/RestreamCommand$1;

    invoke-direct {v6, p0}, Lco/getair/meerkat/commands/watch/RestreamCommand$1;-><init>(Lco/getair/meerkat/commands/watch/RestreamCommand;)V

    .line 46
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 52
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 58
    .end local v1    # "context":Landroid/content/Context;
    :goto_0
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lco/getair/meerkat/utilities/ApplicationPreferences;->saveIsFirstTimeRetweetStream(Z)V

    .line 59
    return-void

    .line 55
    :cond_0
    invoke-direct {p0}, Lco/getair/meerkat/commands/watch/RestreamCommand;->restream()V

    goto :goto_0
.end method
