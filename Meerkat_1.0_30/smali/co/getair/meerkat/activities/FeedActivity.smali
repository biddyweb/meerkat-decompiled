.class public Lco/getair/meerkat/activities/FeedActivity;
.super Lcom/instabug/wrapper/support/activity/InstabugActivity;
.source "FeedActivity.java"


# instance fields
.field facade:Lco/getair/meerkat/facades/FeedActivityFacade;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 26
    invoke-super {p0, p1}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onCreate(Landroid/os/Bundle;)V

    .line 27
    const v0, 0x7f04001c

    invoke-virtual {p0, v0}, Lco/getair/meerkat/activities/FeedActivity;->setContentView(I)V

    .line 29
    invoke-virtual {p0}, Lco/getair/meerkat/activities/FeedActivity;->startUp()V

    .line 30
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 34
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onDestroy()V

    .line 35
    iget-object v0, p0, Lco/getair/meerkat/activities/FeedActivity;->facade:Lco/getair/meerkat/facades/FeedActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/FeedActivityFacade;->clearFacade()V

    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/FeedActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 37
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 48
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onResume()V

    .line 49
    iget-object v0, p0, Lco/getair/meerkat/activities/FeedActivity;->facade:Lco/getair/meerkat/facades/FeedActivityFacade;

    const-string v1, "eventFeedResumed"

    invoke-virtual {v0, v1}, Lco/getair/meerkat/facades/FeedActivityFacade;->sendNotification(Ljava/lang/String;)V

    .line 50
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 41
    invoke-virtual {p0}, Lco/getair/meerkat/activities/FeedActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/MeerkatApplication;

    .line 42
    .local v0, "meerkatApplication":Lco/getair/meerkat/MeerkatApplication;
    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->flush()V

    .line 43
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onStop()V

    .line 44
    return-void
.end method

.method public startUp()V
    .locals 1

    .prologue
    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/FeedActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 19
    invoke-static {p0}, Lco/getair/meerkat/facades/FeedActivityFacade;->getInst(Landroid/app/Activity;)Lco/getair/meerkat/facades/FeedActivityFacade;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/activities/FeedActivity;->facade:Lco/getair/meerkat/facades/FeedActivityFacade;

    .line 21
    iget-object v0, p0, Lco/getair/meerkat/activities/FeedActivity;->facade:Lco/getair/meerkat/facades/FeedActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/FeedActivityFacade;->startup()V

    .line 22
    return-void
.end method
