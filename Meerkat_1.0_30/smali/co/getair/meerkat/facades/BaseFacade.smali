.class public Lco/getair/meerkat/facades/BaseFacade;
.super Lorg/puremvc/java/multicore/patterns/facade/Facade;
.source "BaseFacade.java"


# instance fields
.field private dismissBroadcast:Landroid/content/BroadcastReceiver;

.field private dismissWatch:Landroid/content/BroadcastReceiver;

.field private ownerActivity:Landroid/app/Activity;


# direct methods
.method protected constructor <init>(Landroid/app/Activity;)V
    .locals 1
    .param p1, "ownerActivity"    # Landroid/app/Activity;

    .prologue
    .line 59
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;-><init>(Ljava/lang/String;)V

    .line 43
    new-instance v0, Lco/getair/meerkat/facades/BaseFacade$1;

    invoke-direct {v0, p0}, Lco/getair/meerkat/facades/BaseFacade$1;-><init>(Lco/getair/meerkat/facades/BaseFacade;)V

    iput-object v0, p0, Lco/getair/meerkat/facades/BaseFacade;->dismissBroadcast:Landroid/content/BroadcastReceiver;

    .line 50
    new-instance v0, Lco/getair/meerkat/facades/BaseFacade$2;

    invoke-direct {v0, p0}, Lco/getair/meerkat/facades/BaseFacade$2;-><init>(Lco/getair/meerkat/facades/BaseFacade;)V

    iput-object v0, p0, Lco/getair/meerkat/facades/BaseFacade;->dismissWatch:Landroid/content/BroadcastReceiver;

    .line 60
    invoke-virtual {p0, p1}, Lco/getair/meerkat/facades/BaseFacade;->setOwnerActivity(Landroid/app/Activity;)V

    .line 61
    return-void
.end method

.method public static getInst(Landroid/app/Activity;)Lco/getair/meerkat/facades/BaseFacade;
    .locals 3
    .param p0, "ownerActivity"    # Landroid/app/Activity;

    .prologue
    .line 76
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 77
    .local v0, "multitonKey":Ljava/lang/String;
    sget-object v1, Lco/getair/meerkat/facades/BaseFacade;->instanceMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 78
    sget-object v1, Lco/getair/meerkat/facades/BaseFacade;->instanceMap:Ljava/util/Map;

    new-instance v2, Lco/getair/meerkat/facades/BaseFacade;

    invoke-direct {v2, p0}, Lco/getair/meerkat/facades/BaseFacade;-><init>(Landroid/app/Activity;)V

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    :cond_0
    sget-object v1, Lco/getair/meerkat/facades/BaseFacade;->instanceMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    return-object v1
.end method

.method private registerCommands()V
    .locals 9

    .prologue
    .line 102
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->initializeController()V

    .line 105
    const-string v7, "commandReplyToTweet"

    new-instance v8, Lco/getair/meerkat/commands/twitter/ReplyToTweetCommand;

    invoke-direct {v8}, Lco/getair/meerkat/commands/twitter/ReplyToTweetCommand;-><init>()V

    invoke-virtual {p0, v7, v8}, Lco/getair/meerkat/facades/BaseFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 106
    const-string v7, "commandFavoriteTweet"

    new-instance v8, Lco/getair/meerkat/commands/twitter/FavoriteTweetCommand;

    invoke-direct {v8}, Lco/getair/meerkat/commands/twitter/FavoriteTweetCommand;-><init>()V

    invoke-virtual {p0, v7, v8}, Lco/getair/meerkat/facades/BaseFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 107
    const-string v7, "commandRetweetTweet"

    new-instance v8, Lco/getair/meerkat/commands/twitter/RetweetTweetCommand;

    invoke-direct {v8}, Lco/getair/meerkat/commands/twitter/RetweetTweetCommand;-><init>()V

    invoke-virtual {p0, v7, v8}, Lco/getair/meerkat/facades/BaseFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 108
    const-string v7, "commandOptInTweets"

    new-instance v8, Lco/getair/meerkat/commands/twitter/OptInTweetsCommand;

    invoke-direct {v8}, Lco/getair/meerkat/commands/twitter/OptInTweetsCommand;-><init>()V

    invoke-virtual {p0, v7, v8}, Lco/getair/meerkat/facades/BaseFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 109
    const-string v7, "commandOptOutTweets"

    new-instance v8, Lco/getair/meerkat/commands/twitter/OptOutTweetsCommand;

    invoke-direct {v8}, Lco/getair/meerkat/commands/twitter/OptOutTweetsCommand;-><init>()V

    invoke-virtual {p0, v7, v8}, Lco/getair/meerkat/facades/BaseFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 110
    const-string v7, "commandTweet"

    new-instance v8, Lco/getair/meerkat/commands/twitter/TweetCommad;

    invoke-direct {v8}, Lco/getair/meerkat/commands/twitter/TweetCommad;-><init>()V

    invoke-virtual {p0, v7, v8}, Lco/getair/meerkat/facades/BaseFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 114
    new-instance v1, Lco/getair/meerkat/commands/mixpanel/IdentifyOnMixpanelCommand;

    invoke-direct {v1}, Lco/getair/meerkat/commands/mixpanel/IdentifyOnMixpanelCommand;-><init>()V

    .line 115
    .local v1, "identifyOnMixpanelCommand":Lco/getair/meerkat/commands/mixpanel/IdentifyOnMixpanelCommand;
    const-string v7, "identifyUserOnMixpanel"

    invoke-virtual {p0, v7, v1}, Lco/getair/meerkat/facades/BaseFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 117
    new-instance v6, Lco/getair/meerkat/commands/mixpanel/TrackEventCommand;

    invoke-direct {v6}, Lco/getair/meerkat/commands/mixpanel/TrackEventCommand;-><init>()V

    .line 118
    .local v6, "trackEventCommand":Lco/getair/meerkat/commands/mixpanel/TrackEventCommand;
    const-string v7, "trackMixpanelEvent"

    invoke-virtual {p0, v7, v6}, Lco/getair/meerkat/facades/BaseFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 120
    new-instance v3, Lco/getair/meerkat/commands/mixpanel/SetMixpanelPeoplePropertiesCommand;

    invoke-direct {v3}, Lco/getair/meerkat/commands/mixpanel/SetMixpanelPeoplePropertiesCommand;-><init>()V

    .line 121
    .local v3, "setMixpanelPeoplePropertiesCommand":Lco/getair/meerkat/commands/mixpanel/SetMixpanelPeoplePropertiesCommand;
    const-string v7, "setMixpanelPeopleProperties"

    invoke-virtual {p0, v7, v3}, Lco/getair/meerkat/facades/BaseFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 123
    new-instance v4, Lco/getair/meerkat/commands/mixpanel/SetMixpanelSuperPropertiesCommand;

    invoke-direct {v4}, Lco/getair/meerkat/commands/mixpanel/SetMixpanelSuperPropertiesCommand;-><init>()V

    .line 124
    .local v4, "setMixpanelSuperPropertiesCommand":Lco/getair/meerkat/commands/mixpanel/SetMixpanelSuperPropertiesCommand;
    const-string v7, "seMixpanelSuperProperties"

    invoke-virtual {p0, v7, v4}, Lco/getair/meerkat/facades/BaseFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 126
    new-instance v5, Lco/getair/meerkat/commands/mixpanel/TimeEventCommand;

    invoke-direct {v5}, Lco/getair/meerkat/commands/mixpanel/TimeEventCommand;-><init>()V

    .line 127
    .local v5, "timeEventCommand":Lco/getair/meerkat/commands/mixpanel/TimeEventCommand;
    const-string v7, "timeEventForMixpanel"

    invoke-virtual {p0, v7, v5}, Lco/getair/meerkat/facades/BaseFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 129
    new-instance v2, Lco/getair/meerkat/commands/mixpanel/IncrementMixpanelPeoplePropertyCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/mixpanel/IncrementMixpanelPeoplePropertyCommand;-><init>()V

    .line 130
    .local v2, "incrementMixpanelPeoplePropertyCommand":Lco/getair/meerkat/commands/mixpanel/IncrementMixpanelPeoplePropertyCommand;
    const-string v7, "incrementPeopleProperty"

    invoke-virtual {p0, v7, v2}, Lco/getair/meerkat/facades/BaseFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 132
    new-instance v0, Lco/getair/meerkat/commands/mixpanel/DecrementPeolpePropertyCommand;

    invoke-direct {v0}, Lco/getair/meerkat/commands/mixpanel/DecrementPeolpePropertyCommand;-><init>()V

    .line 133
    .local v0, "decrementPeolpePropertyCommand":Lco/getair/meerkat/commands/mixpanel/DecrementPeolpePropertyCommand;
    const-string v7, "decrementPeopleProperty"

    invoke-virtual {p0, v7, v0}, Lco/getair/meerkat/facades/BaseFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 137
    const-string v7, "authorizationStart"

    new-instance v8, Lco/getair/meerkat/commands/login/AuthorizeCommand;

    invoke-direct {v8}, Lco/getair/meerkat/commands/login/AuthorizeCommand;-><init>()V

    invoke-virtual {p0, v7, v8}, Lco/getair/meerkat/facades/BaseFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 139
    return-void
.end method

.method private registerMediators()V
    .locals 1

    .prologue
    .line 97
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->initializeView()V

    .line 98
    new-instance v0, Lco/getair/meerkat/mediators/TwitterMediator;

    invoke-direct {v0}, Lco/getair/meerkat/mediators/TwitterMediator;-><init>()V

    invoke-virtual {p0, v0}, Lco/getair/meerkat/facades/BaseFacade;->registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V

    .line 99
    return-void
.end method

.method private registerProxies()V
    .locals 6

    .prologue
    .line 142
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->initializeModel()V

    .line 144
    invoke-virtual {p0}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    .line 145
    .local v2, "ownerActivity":Landroid/app/Activity;
    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/MeerkatApplication;

    .line 147
    .local v0, "meerkatApplication":Lco/getair/meerkat/MeerkatApplication;
    new-instance v3, Lco/getair/meerkat/proxies/TwitterProxy;

    const-string v4, "twitterProxy"

    invoke-direct {v3, v4, v2}, Lco/getair/meerkat/proxies/TwitterProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 148
    .local v3, "twitterProxy":Lco/getair/meerkat/proxies/TwitterProxy;
    invoke-virtual {p0, v3}, Lco/getair/meerkat/facades/BaseFacade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 150
    new-instance v1, Lco/getair/meerkat/proxies/MixpanelProxy;

    const-string v4, "mixpanelProxy"

    invoke-direct {v1, v4, v0}, Lco/getair/meerkat/proxies/MixpanelProxy;-><init>(Ljava/lang/String;Lco/getair/meerkat/MeerkatApplication;)V

    .line 151
    .local v1, "mixpanelProxy":Lco/getair/meerkat/proxies/MixpanelProxy;
    invoke-virtual {p0, v1}, Lco/getair/meerkat/facades/BaseFacade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 153
    new-instance v4, Lco/getair/meerkat/utilities/GPSHandlerProxy;

    const-string v5, "gpsProxy"

    invoke-direct {v4, v5, v2}, Lco/getair/meerkat/utilities/GPSHandlerProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {p0, v4}, Lco/getair/meerkat/facades/BaseFacade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 154
    return-void
.end method


# virtual methods
.method public getOwnerActivity()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lco/getair/meerkat/facades/BaseFacade;->ownerActivity:Landroid/app/Activity;

    return-object v0
.end method

.method public setOwnerActivity(Landroid/app/Activity;)V
    .locals 0
    .param p1, "ownerActivity"    # Landroid/app/Activity;

    .prologue
    .line 70
    iput-object p1, p0, Lco/getair/meerkat/facades/BaseFacade;->ownerActivity:Landroid/app/Activity;

    .line 71
    return-void
.end method

.method public startup()V
    .locals 4

    .prologue
    .line 85
    iget-object v0, p0, Lco/getair/meerkat/facades/BaseFacade;->ownerActivity:Landroid/app/Activity;

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/facades/BaseFacade;->dismissBroadcast:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "notificationDismissBroadcastScreen"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 87
    iget-object v0, p0, Lco/getair/meerkat/facades/BaseFacade;->ownerActivity:Landroid/app/Activity;

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/facades/BaseFacade;->dismissWatch:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "notificationDismissWatchScreen"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 90
    invoke-direct {p0}, Lco/getair/meerkat/facades/BaseFacade;->registerProxies()V

    .line 91
    invoke-direct {p0}, Lco/getair/meerkat/facades/BaseFacade;->registerCommands()V

    .line 92
    invoke-direct {p0}, Lco/getair/meerkat/facades/BaseFacade;->registerMediators()V

    .line 93
    const-string v0, "startup"

    iget-object v1, p0, Lco/getair/meerkat/facades/BaseFacade;->ownerActivity:Landroid/app/Activity;

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lco/getair/meerkat/facades/BaseFacade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 94
    return-void
.end method
