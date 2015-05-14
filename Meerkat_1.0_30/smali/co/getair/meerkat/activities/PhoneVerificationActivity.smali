.class public Lco/getair/meerkat/activities/PhoneVerificationActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "PhoneVerificationActivity.java"


# instance fields
.field facade:Lco/getair/meerkat/facades/PhoneVerificationActivityFacade;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 29
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 30
    const v0, 0x7f040020

    invoke-virtual {p0, v0}, Lco/getair/meerkat/activities/PhoneVerificationActivity;->setContentView(I)V

    .line 32
    invoke-virtual {p0}, Lco/getair/meerkat/activities/PhoneVerificationActivity;->startUp()V

    .line 33
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 37
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onDestroy()V

    .line 38
    iget-object v0, p0, Lco/getair/meerkat/activities/PhoneVerificationActivity;->facade:Lco/getair/meerkat/facades/PhoneVerificationActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/PhoneVerificationActivityFacade;->clearFacade()V

    .line 39
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/PhoneVerificationActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 40
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 44
    invoke-virtual {p0}, Lco/getair/meerkat/activities/PhoneVerificationActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/MeerkatApplication;

    .line 45
    .local v0, "meerkatApplication":Lco/getair/meerkat/MeerkatApplication;
    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->flush()V

    .line 46
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onStop()V

    .line 47
    return-void
.end method

.method public startUp()V
    .locals 1

    .prologue
    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/PhoneVerificationActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 22
    invoke-static {p0}, Lco/getair/meerkat/facades/PhoneVerificationActivityFacade;->getInst(Landroid/app/Activity;)Lco/getair/meerkat/facades/PhoneVerificationActivityFacade;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/activities/PhoneVerificationActivity;->facade:Lco/getair/meerkat/facades/PhoneVerificationActivityFacade;

    .line 24
    iget-object v0, p0, Lco/getair/meerkat/activities/PhoneVerificationActivity;->facade:Lco/getair/meerkat/facades/PhoneVerificationActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/PhoneVerificationActivityFacade;->startup()V

    .line 25
    return-void
.end method
