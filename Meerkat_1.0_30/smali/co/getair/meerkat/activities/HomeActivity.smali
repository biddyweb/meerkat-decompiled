.class public Lco/getair/meerkat/activities/HomeActivity;
.super Lcom/instabug/wrapper/support/activity/InstabugActivity;
.source "HomeActivity.java"


# instance fields
.field private facade:Lco/getair/meerkat/facades/HomeActivityFacade;

.field private twitterLoginButton:Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 41
    invoke-super {p0, p1, p2, p3}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 43
    new-instance v0, Lco/getair/meerkat/dtos/OnActivityResultParams;

    invoke-direct {v0, p1, p2, p3}, Lco/getair/meerkat/dtos/OnActivityResultParams;-><init>(IILandroid/content/Intent;)V

    .line 45
    .local v0, "onActivityResultParams":Lco/getair/meerkat/dtos/OnActivityResultParams;
    iget-object v1, p0, Lco/getair/meerkat/activities/HomeActivity;->facade:Lco/getair/meerkat/facades/HomeActivityFacade;

    const-string v2, "eventTwitterLoginDone"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, v3}, Lco/getair/meerkat/facades/HomeActivityFacade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 33
    invoke-super {p0, p1}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onCreate(Landroid/os/Bundle;)V

    .line 34
    const v0, 0x7f04001d

    invoke-virtual {p0, v0}, Lco/getair/meerkat/activities/HomeActivity;->setContentView(I)V

    .line 36
    invoke-virtual {p0}, Lco/getair/meerkat/activities/HomeActivity;->startUp()V

    .line 37
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 50
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onDestroy()V

    .line 51
    iget-object v0, p0, Lco/getair/meerkat/activities/HomeActivity;->facade:Lco/getair/meerkat/facades/HomeActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/HomeActivityFacade;->clearFacade()V

    .line 52
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/HomeActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 58
    invoke-virtual {p0}, Lco/getair/meerkat/activities/HomeActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/MeerkatApplication;

    .line 59
    .local v0, "meerkatApplication":Lco/getair/meerkat/MeerkatApplication;
    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->flush()V

    .line 60
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onStop()V

    .line 61
    return-void
.end method

.method protected startUp()V
    .locals 1

    .prologue
    .line 26
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/HomeActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 27
    invoke-static {p0}, Lco/getair/meerkat/facades/HomeActivityFacade;->getInst(Landroid/app/Activity;)Lco/getair/meerkat/facades/HomeActivityFacade;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/activities/HomeActivity;->facade:Lco/getair/meerkat/facades/HomeActivityFacade;

    .line 28
    iget-object v0, p0, Lco/getair/meerkat/activities/HomeActivity;->facade:Lco/getair/meerkat/facades/HomeActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/HomeActivityFacade;->startup()V

    .line 29
    return-void
.end method
