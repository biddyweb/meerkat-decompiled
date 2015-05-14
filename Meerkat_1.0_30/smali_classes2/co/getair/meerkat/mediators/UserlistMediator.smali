.class public Lco/getair/meerkat/mediators/UserlistMediator;
.super Lorg/puremvc/java/multicore/patterns/mediator/Mediator;
.source "UserlistMediator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;
    }
.end annotation


# instance fields
.field private navigationBar:Lco/getair/meerkat/views/NavigationBar;

.field private rootView:Landroid/view/View;

.field private showScore:Z

.field private title:Ljava/lang/String;

.field private userActionMode:Lcom/google/common/base/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Optional",
            "<",
            "Landroid/view/ActionMode;",
            ">;"
        }
    .end annotation
.end field

.field private userListView:Landroid/widget/ListView;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "mediatorName"    # Ljava/lang/String;
    .param p2, "viewComponent"    # Ljava/lang/Object;

    .prologue
    .line 67
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 50
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/getair/meerkat/mediators/UserlistMediator;->showScore:Z

    .line 52
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/mediators/UserlistMediator;->userActionMode:Lcom/google/common/base/Optional;

    .line 69
    check-cast p2, Landroid/view/View;

    .end local p2    # "viewComponent":Ljava/lang/Object;
    iput-object p2, p0, Lco/getair/meerkat/mediators/UserlistMediator;->rootView:Landroid/view/View;

    .line 71
    iget-object v0, p0, Lco/getair/meerkat/mediators/UserlistMediator;->rootView:Landroid/view/View;

    const v1, 0x7f0e00bf

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/views/NavigationBar;

    iput-object v0, p0, Lco/getair/meerkat/mediators/UserlistMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    .line 73
    iget-object v0, p0, Lco/getair/meerkat/mediators/UserlistMediator;->rootView:Landroid/view/View;

    const v1, 0x7f0e00be

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/UserlistMediator;->userListView:Landroid/widget/ListView;

    .line 74
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/mediators/UserlistMediator;)Landroid/widget/ListView;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/UserlistMediator;

    .prologue
    .line 44
    iget-object v0, p0, Lco/getair/meerkat/mediators/UserlistMediator;->userListView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/mediators/UserlistMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/UserlistMediator;

    .prologue
    .line 44
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/UserlistMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lco/getair/meerkat/mediators/UserlistMediator;)Z
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/UserlistMediator;

    .prologue
    .line 44
    iget-boolean v0, p0, Lco/getair/meerkat/mediators/UserlistMediator;->showScore:Z

    return v0
.end method


# virtual methods
.method public handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 2
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 97
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "userlistLoaded"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 99
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/UserlistMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lco/getair/meerkat/mediators/UserlistMediator$1;

    invoke-direct {v1, p0, p1}, Lco/getair/meerkat/mediators/UserlistMediator$1;-><init>(Lco/getair/meerkat/mediators/UserlistMediator;Lorg/puremvc/java/multicore/interfaces/INotification;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 118
    :cond_0
    return-void
.end method

.method public listNotificationInterests()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 87
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "userlistLoaded"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "eventUserFollowStateChanged"

    aput-object v2, v0, v1

    return-object v0
.end method

.method public onRegister()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 56
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;->onRegister()V

    .line 58
    iget-object v0, p0, Lco/getair/meerkat/mediators/UserlistMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/views/NavigationBar;->setProfileInfoVisible(Ljava/lang/Boolean;)V

    .line 59
    iget-object v0, p0, Lco/getair/meerkat/mediators/UserlistMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/views/NavigationBar;->setLeaderboardVisible(Ljava/lang/Boolean;)V

    .line 60
    iget-object v0, p0, Lco/getair/meerkat/mediators/UserlistMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/views/NavigationBar;->setLogoVisible(Ljava/lang/Boolean;)V

    .line 61
    iget-object v0, p0, Lco/getair/meerkat/mediators/UserlistMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/views/NavigationBar;->setSearchVisible(Ljava/lang/Boolean;)V

    .line 62
    iget-object v0, p0, Lco/getair/meerkat/mediators/UserlistMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-virtual {p0}, Lco/getair/meerkat/mediators/UserlistMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/views/NavigationBar;->setFacade(Lorg/puremvc/java/multicore/patterns/facade/Facade;)V

    .line 63
    iget-object v0, p0, Lco/getair/meerkat/mediators/UserlistMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    iget-object v1, p0, Lco/getair/meerkat/mediators/UserlistMediator;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lco/getair/meerkat/views/NavigationBar;->setTitle(Ljava/lang/String;)V

    .line 64
    return-void
.end method

.method public setShowScore(Z)V
    .locals 0
    .param p1, "showScore"    # Z

    .prologue
    .line 82
    iput-boolean p1, p0, Lco/getair/meerkat/mediators/UserlistMediator;->showScore:Z

    .line 83
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 78
    iput-object p1, p0, Lco/getair/meerkat/mediators/UserlistMediator;->title:Ljava/lang/String;

    .line 79
    return-void
.end method
