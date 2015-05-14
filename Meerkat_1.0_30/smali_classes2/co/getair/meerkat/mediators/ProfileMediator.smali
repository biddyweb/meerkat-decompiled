.class public Lco/getair/meerkat/mediators/ProfileMediator;
.super Lorg/puremvc/java/multicore/patterns/mediator/Mediator;
.source "ProfileMediator.java"


# instance fields
.field private followersCountTextView:Landroid/widget/TextView;

.field private followingCountTextView:Landroid/widget/TextView;

.field private navigationBar:Lco/getair/meerkat/views/NavigationBar;

.field private rootView:Landroid/view/View;

.field private versionTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 5
    .param p1, "mediatorName"    # Ljava/lang/String;
    .param p2, "viewComponent"    # Ljava/lang/Object;

    .prologue
    .line 66
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 68
    check-cast p2, Landroid/view/View;

    .end local p2    # "viewComponent":Ljava/lang/Object;
    iput-object p2, p0, Lco/getair/meerkat/mediators/ProfileMediator;->rootView:Landroid/view/View;

    .line 70
    iget-object v3, p0, Lco/getair/meerkat/mediators/ProfileMediator;->rootView:Landroid/view/View;

    const v4, 0x7f0e00ab

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/views/NavigationBar;

    iput-object v3, p0, Lco/getair/meerkat/mediators/ProfileMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    .line 72
    iget-object v3, p0, Lco/getair/meerkat/mediators/ProfileMediator;->rootView:Landroid/view/View;

    const v4, 0x7f0e00af

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lco/getair/meerkat/mediators/ProfileMediator;->followersCountTextView:Landroid/widget/TextView;

    .line 73
    iget-object v3, p0, Lco/getair/meerkat/mediators/ProfileMediator;->rootView:Landroid/view/View;

    const v4, 0x7f0e00ad

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lco/getair/meerkat/mediators/ProfileMediator;->followingCountTextView:Landroid/widget/TextView;

    .line 74
    iget-object v3, p0, Lco/getair/meerkat/mediators/ProfileMediator;->rootView:Landroid/view/View;

    const v4, 0x7f0e00b4

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lco/getair/meerkat/mediators/ProfileMediator;->versionTextView:Landroid/widget/TextView;

    .line 76
    iget-object v3, p0, Lco/getair/meerkat/mediators/ProfileMediator;->rootView:Landroid/view/View;

    const v4, 0x7f0e00ac

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 77
    .local v1, "followingView":Landroid/view/View;
    new-instance v3, Lco/getair/meerkat/mediators/ProfileMediator$1;

    invoke-direct {v3, p0}, Lco/getair/meerkat/mediators/ProfileMediator$1;-><init>(Lco/getair/meerkat/mediators/ProfileMediator;)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 92
    iget-object v3, p0, Lco/getair/meerkat/mediators/ProfileMediator;->rootView:Landroid/view/View;

    const v4, 0x7f0e00ae

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 93
    .local v0, "followerView":Landroid/view/View;
    new-instance v3, Lco/getair/meerkat/mediators/ProfileMediator$2;

    invoke-direct {v3, p0}, Lco/getair/meerkat/mediators/ProfileMediator$2;-><init>(Lco/getair/meerkat/mediators/ProfileMediator;)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 107
    iget-object v3, p0, Lco/getair/meerkat/mediators/ProfileMediator;->rootView:Landroid/view/View;

    const v4, 0x7f0e00b0

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 108
    .local v2, "logoutButton":Landroid/widget/Button;
    new-instance v3, Lco/getair/meerkat/mediators/ProfileMediator$3;

    invoke-direct {v3, p0}, Lco/getair/meerkat/mediators/ProfileMediator$3;-><init>(Lco/getair/meerkat/mediators/ProfileMediator;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 115
    iget-object v3, p0, Lco/getair/meerkat/mediators/ProfileMediator;->rootView:Landroid/view/View;

    const v4, 0x7f0e00b1

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    new-instance v4, Lco/getair/meerkat/mediators/ProfileMediator$4;

    invoke-direct {v4, p0}, Lco/getair/meerkat/mediators/ProfileMediator$4;-><init>(Lco/getair/meerkat/mediators/ProfileMediator;)V

    .line 116
    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 123
    iget-object v3, p0, Lco/getair/meerkat/mediators/ProfileMediator;->rootView:Landroid/view/View;

    const v4, 0x7f0e00b2

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    new-instance v4, Lco/getair/meerkat/mediators/ProfileMediator$5;

    invoke-direct {v4, p0}, Lco/getair/meerkat/mediators/ProfileMediator$5;-><init>(Lco/getair/meerkat/mediators/ProfileMediator;)V

    .line 124
    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 131
    iget-object v3, p0, Lco/getair/meerkat/mediators/ProfileMediator;->rootView:Landroid/view/View;

    const v4, 0x7f0e00b3

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    new-instance v4, Lco/getair/meerkat/mediators/ProfileMediator$6;

    invoke-direct {v4, p0}, Lco/getair/meerkat/mediators/ProfileMediator$6;-><init>(Lco/getair/meerkat/mediators/ProfileMediator;)V

    .line 132
    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/mediators/ProfileMediator;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/ProfileMediator;

    .prologue
    .line 31
    invoke-direct {p0}, Lco/getair/meerkat/mediators/ProfileMediator;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/mediators/ProfileMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/ProfileMediator;

    .prologue
    .line 31
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/ProfileMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lco/getair/meerkat/mediators/ProfileMediator;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/ProfileMediator;
    .param p1, "x1"    # Landroid/app/Activity;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3}, Lco/getair/meerkat/mediators/ProfileMediator;->openWebView(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lco/getair/meerkat/mediators/ProfileMediator;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/ProfileMediator;

    .prologue
    .line 31
    iget-object v0, p0, Lco/getair/meerkat/mediators/ProfileMediator;->followersCountTextView:Landroid/widget/TextView;

    return-object v0
.end method

.method private getOwnerActivity()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 167
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/ProfileMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method private openWebView(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "ownerActivity"    # Landroid/app/Activity;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "title"    # Ljava/lang/String;

    .prologue
    .line 171
    invoke-static {p1, p2, p3}, Lco/getair/meerkat/activities/WebViewActivity;->createIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 172
    return-void
.end method


# virtual methods
.method public handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 3
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 151
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "profileFollowerLoaded"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 153
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 155
    .local v0, "followerList":Ljava/util/ArrayList;
    invoke-direct {p0}, Lco/getair/meerkat/mediators/ProfileMediator;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lco/getair/meerkat/mediators/ProfileMediator$7;

    invoke-direct {v2, p0, v0}, Lco/getair/meerkat/mediators/ProfileMediator$7;-><init>(Lco/getair/meerkat/mediators/ProfileMediator;Ljava/util/ArrayList;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 164
    .end local v0    # "followerList":Ljava/util/ArrayList;
    :cond_0
    return-void
.end method

.method public listNotificationInterests()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 142
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "profileFollowerLoaded"

    aput-object v2, v0, v1

    return-object v0
.end method

.method public onRegister()V
    .locals 11

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 40
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;->onRegister()V

    .line 42
    new-instance v2, Lco/getair/meerkat/proxies/GraphProxy;

    const-string v7, "graphProxy"

    invoke-direct {p0}, Lco/getair/meerkat/mediators/ProfileMediator;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-direct {v2, v7, v8}, Lco/getair/meerkat/proxies/GraphProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 43
    .local v2, "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    invoke-virtual {v2}, Lco/getair/meerkat/proxies/GraphProxy;->getMyUser()Lco/getair/meerkat/dtos/User;

    move-result-object v6

    .line 44
    .local v6, "user":Lco/getair/meerkat/dtos/User;
    invoke-virtual {v2}, Lco/getair/meerkat/proxies/GraphProxy;->getMyFollowingCount()Ljava/lang/Integer;

    move-result-object v1

    .line 46
    .local v1, "followingCount":Ljava/lang/Integer;
    iget-object v7, p0, Lco/getair/meerkat/mediators/ProfileMediator;->followingCountTextView:Landroid/widget/TextView;

    const-string v8, "%d"

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v1, v9, v10

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    iget-object v7, p0, Lco/getair/meerkat/mediators/ProfileMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-virtual {v6}, Lco/getair/meerkat/dtos/User;->getDisplayName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lco/getair/meerkat/views/NavigationBar;->setTitle(Ljava/lang/String;)V

    .line 49
    iget-object v7, p0, Lco/getair/meerkat/mediators/ProfileMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v7, v8}, Lco/getair/meerkat/views/NavigationBar;->setProfileInfoVisible(Ljava/lang/Boolean;)V

    .line 50
    iget-object v7, p0, Lco/getair/meerkat/mediators/ProfileMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v7, v8}, Lco/getair/meerkat/views/NavigationBar;->setLeaderboardVisible(Ljava/lang/Boolean;)V

    .line 51
    iget-object v7, p0, Lco/getair/meerkat/mediators/ProfileMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v7, v8}, Lco/getair/meerkat/views/NavigationBar;->setLogoVisible(Ljava/lang/Boolean;)V

    .line 52
    iget-object v7, p0, Lco/getair/meerkat/mediators/ProfileMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v7, v8}, Lco/getair/meerkat/views/NavigationBar;->setSearchVisible(Ljava/lang/Boolean;)V

    .line 53
    iget-object v7, p0, Lco/getair/meerkat/mediators/ProfileMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-virtual {p0}, Lco/getair/meerkat/mediators/ProfileMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v8

    invoke-virtual {v7, v8}, Lco/getair/meerkat/views/NavigationBar;->setFacade(Lorg/puremvc/java/multicore/patterns/facade/Facade;)V

    .line 56
    :try_start_0
    invoke-direct {p0}, Lco/getair/meerkat/mediators/ProfileMediator;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    invoke-direct {p0}, Lco/getair/meerkat/mediators/ProfileMediator;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    .line 57
    .local v3, "pInfo":Landroid/content/pm/PackageInfo;
    invoke-direct {p0}, Lco/getair/meerkat/mediators/ProfileMediator;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 58
    .local v4, "res":Landroid/content/res/Resources;
    const v7, 0x7f0900ec

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    iget-object v10, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    aput-object v10, v8, v9

    const/4 v9, 0x1

    iget v10, v3, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 59
    .local v5, "text":Ljava/lang/String;
    iget-object v7, p0, Lco/getair/meerkat/mediators/ProfileMediator;->versionTextView:Landroid/widget/TextView;

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .end local v3    # "pInfo":Landroid/content/pm/PackageInfo;
    .end local v4    # "res":Landroid/content/res/Resources;
    .end local v5    # "text":Ljava/lang/String;
    :goto_0
    return-void

    .line 60
    :catch_0
    move-exception v0

    .line 61
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method
