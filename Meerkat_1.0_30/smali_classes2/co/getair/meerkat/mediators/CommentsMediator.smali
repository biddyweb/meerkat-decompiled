.class public Lco/getair/meerkat/mediators/CommentsMediator;
.super Lorg/puremvc/java/multicore/patterns/mediator/Mediator;
.source "CommentsMediator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;
    }
.end annotation


# instance fields
.field private commentsListView:Landroid/widget/ListView;

.field private navigationBar:Lco/getair/meerkat/views/NavigationBar;

.field private rootView:Landroid/view/View;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "mediatorName"    # Ljava/lang/String;
    .param p2, "viewComponent"    # Ljava/lang/Object;

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 53
    check-cast p2, Landroid/view/View;

    .end local p2    # "viewComponent":Ljava/lang/Object;
    iput-object p2, p0, Lco/getair/meerkat/mediators/CommentsMediator;->rootView:Landroid/view/View;

    .line 55
    iget-object v0, p0, Lco/getair/meerkat/mediators/CommentsMediator;->rootView:Landroid/view/View;

    const v1, 0x7f0e008c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/views/NavigationBar;

    iput-object v0, p0, Lco/getair/meerkat/mediators/CommentsMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    .line 57
    iget-object v0, p0, Lco/getair/meerkat/mediators/CommentsMediator;->rootView:Landroid/view/View;

    const v1, 0x7f0e008e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/CommentsMediator;->commentsListView:Landroid/widget/ListView;

    .line 58
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/mediators/CommentsMediator;)Landroid/widget/ListView;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/CommentsMediator;

    .prologue
    .line 33
    iget-object v0, p0, Lco/getair/meerkat/mediators/CommentsMediator;->commentsListView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/mediators/CommentsMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/CommentsMediator;

    .prologue
    .line 33
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/CommentsMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 2
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 71
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "commentsLoaded"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 73
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/CommentsMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lco/getair/meerkat/mediators/CommentsMediator$1;

    invoke-direct {v1, p0, p1}, Lco/getair/meerkat/mediators/CommentsMediator$1;-><init>(Lco/getair/meerkat/mediators/CommentsMediator;Lorg/puremvc/java/multicore/interfaces/INotification;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 92
    :cond_0
    return-void
.end method

.method public listNotificationInterests()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 62
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "commentsLoaded"

    aput-object v2, v0, v1

    return-object v0
.end method

.method public onRegister()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 41
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;->onRegister()V

    .line 43
    iget-object v0, p0, Lco/getair/meerkat/mediators/CommentsMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/views/NavigationBar;->setProfileInfoVisible(Ljava/lang/Boolean;)V

    .line 44
    iget-object v0, p0, Lco/getair/meerkat/mediators/CommentsMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/views/NavigationBar;->setLeaderboardVisible(Ljava/lang/Boolean;)V

    .line 45
    iget-object v0, p0, Lco/getair/meerkat/mediators/CommentsMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/views/NavigationBar;->setLogoVisible(Ljava/lang/Boolean;)V

    .line 46
    iget-object v0, p0, Lco/getair/meerkat/mediators/CommentsMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/views/NavigationBar;->setSearchVisible(Ljava/lang/Boolean;)V

    .line 47
    iget-object v0, p0, Lco/getair/meerkat/mediators/CommentsMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-virtual {p0}, Lco/getair/meerkat/mediators/CommentsMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/views/NavigationBar;->setFacade(Lorg/puremvc/java/multicore/patterns/facade/Facade;)V

    .line 48
    return-void
.end method
