.class public Lco/getair/meerkat/commands/watch/ReportStreamCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "ReportStreamCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/commands/watch/ReportStreamCommand;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/commands/watch/ReportStreamCommand;

    .prologue
    .line 23
    invoke-direct {p0}, Lco/getair/meerkat/commands/watch/ReportStreamCommand;->report()V

    return-void
.end method

.method private report()V
    .locals 3

    .prologue
    .line 50
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/ReportStreamCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/WatchActivityFacade;

    .line 51
    .local v0, "watchActivityFacade":Lco/getair/meerkat/facades/WatchActivityFacade;
    const-string v2, "watchProxy"

    invoke-virtual {v0, v2}, Lco/getair/meerkat/facades/WatchActivityFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/WatchProxy;

    .line 53
    .local v1, "watchProxy":Lco/getair/meerkat/proxies/WatchProxy;
    new-instance v2, Lco/getair/meerkat/commands/watch/ReportStreamCommand$3;

    invoke-direct {v2, p0, v1}, Lco/getair/meerkat/commands/watch/ReportStreamCommand$3;-><init>(Lco/getair/meerkat/commands/watch/ReportStreamCommand;Lco/getair/meerkat/proxies/WatchProxy;)V

    invoke-virtual {v1, v2}, Lco/getair/meerkat/proxies/WatchProxy;->reportStream(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 76
    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 4
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 26
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 28
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/ReportStreamCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    .line 29
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Report Stream?"

    .line 30
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Are you sure you want to report this stream?"

    .line 31
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Yeah"

    new-instance v3, Lco/getair/meerkat/commands/watch/ReportStreamCommand$2;

    invoke-direct {v3, p0}, Lco/getair/meerkat/commands/watch/ReportStreamCommand$2;-><init>(Lco/getair/meerkat/commands/watch/ReportStreamCommand;)V

    .line 32
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Nah"

    new-instance v3, Lco/getair/meerkat/commands/watch/ReportStreamCommand$1;

    invoke-direct {v3, p0}, Lco/getair/meerkat/commands/watch/ReportStreamCommand$1;-><init>(Lco/getair/meerkat/commands/watch/ReportStreamCommand;)V

    .line 37
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 43
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 46
    return-void
.end method
