.class public Lco/getair/meerkat/activities/LandingActivity;
.super Lcom/instabug/wrapper/support/activity/InstabugActivity;
.source "LandingActivity.java"


# instance fields
.field facade:Lco/getair/meerkat/facades/LandingActivityFacade;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 27
    invoke-super {p0, p1}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onCreate(Landroid/os/Bundle;)V

    .line 28
    const v0, 0x7f04001d

    invoke-virtual {p0, v0}, Lco/getair/meerkat/activities/LandingActivity;->setContentView(I)V

    .line 30
    invoke-virtual {p0}, Lco/getair/meerkat/activities/LandingActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lco/getair/meerkat/activities/LandingActivity;->startUp(Landroid/content/Intent;)V

    .line 31
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 35
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onDestroy()V

    .line 36
    iget-object v0, p0, Lco/getair/meerkat/activities/LandingActivity;->facade:Lco/getair/meerkat/facades/LandingActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/LandingActivityFacade;->clearFacade()V

    .line 37
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/LandingActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 38
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 50
    invoke-super {p0, p1}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 51
    invoke-virtual {p0, p1}, Lco/getair/meerkat/activities/LandingActivity;->setIntent(Landroid/content/Intent;)V

    .line 52
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 43
    invoke-virtual {p0}, Lco/getair/meerkat/activities/LandingActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/MeerkatApplication;

    .line 44
    .local v0, "meerkatApplication":Lco/getair/meerkat/MeerkatApplication;
    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->flush()V

    .line 45
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onStop()V

    .line 46
    return-void
.end method

.method protected startUp(Landroid/content/Intent;)V
    .locals 1
    .param p1, "callingIntent"    # Landroid/content/Intent;

    .prologue
    .line 20
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/LandingActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 21
    invoke-static {p0}, Lco/getair/meerkat/facades/LandingActivityFacade;->getInst(Landroid/app/Activity;)Lco/getair/meerkat/facades/LandingActivityFacade;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/activities/LandingActivity;->facade:Lco/getair/meerkat/facades/LandingActivityFacade;

    .line 22
    iget-object v0, p0, Lco/getair/meerkat/activities/LandingActivity;->facade:Lco/getair/meerkat/facades/LandingActivityFacade;

    invoke-virtual {v0, p1}, Lco/getair/meerkat/facades/LandingActivityFacade;->startup(Landroid/content/Intent;)V

    .line 23
    return-void
.end method
