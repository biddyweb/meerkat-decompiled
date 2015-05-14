.class public Lco/getair/meerkat/activities/ProfileActivity;
.super Lcom/instabug/wrapper/support/activity/InstabugActivity;
.source "ProfileActivity.java"


# instance fields
.field facade:Lco/getair/meerkat/facades/ProfileActivityFacade;


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
    .line 25
    invoke-super {p0, p1}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    const v0, 0x7f040021

    invoke-virtual {p0, v0}, Lco/getair/meerkat/activities/ProfileActivity;->setContentView(I)V

    .line 28
    invoke-virtual {p0}, Lco/getair/meerkat/activities/ProfileActivity;->startUp()V

    .line 29
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 33
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onDestroy()V

    .line 34
    iget-object v0, p0, Lco/getair/meerkat/activities/ProfileActivity;->facade:Lco/getair/meerkat/facades/ProfileActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/ProfileActivityFacade;->clearFacade()V

    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/ProfileActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 36
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 40
    invoke-virtual {p0}, Lco/getair/meerkat/activities/ProfileActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/MeerkatApplication;

    .line 41
    .local v0, "meerkatApplication":Lco/getair/meerkat/MeerkatApplication;
    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->flush()V

    .line 42
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onStop()V

    .line 43
    return-void
.end method

.method public startUp()V
    .locals 1

    .prologue
    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/ProfileActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 18
    invoke-static {p0}, Lco/getair/meerkat/facades/ProfileActivityFacade;->getInst(Landroid/app/Activity;)Lco/getair/meerkat/facades/ProfileActivityFacade;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/activities/ProfileActivity;->facade:Lco/getair/meerkat/facades/ProfileActivityFacade;

    .line 20
    iget-object v0, p0, Lco/getair/meerkat/activities/ProfileActivity;->facade:Lco/getair/meerkat/facades/ProfileActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/ProfileActivityFacade;->startup()V

    .line 21
    return-void
.end method
