.class public Lco/getair/meerkat/activities/PhoneActivationCodeActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "PhoneActivationCodeActivity.java"


# static fields
.field public static final PHONE_NUMBER_BUNDLE_KEY:Ljava/lang/String; = "phoneNumberBundleKey"


# instance fields
.field facade:Lco/getair/meerkat/facades/PhoneActivationCodeActivityFacade;

.field private phoneNumber:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public getPhoneNumber()Ljava/lang/String;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lco/getair/meerkat/activities/PhoneActivationCodeActivity;->phoneNumber:Ljava/lang/String;

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 35
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 36
    const v0, 0x7f04001f

    invoke-virtual {p0, v0}, Lco/getair/meerkat/activities/PhoneActivationCodeActivity;->setContentView(I)V

    .line 38
    invoke-virtual {p0}, Lco/getair/meerkat/activities/PhoneActivationCodeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "phoneNumberBundleKey"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/activities/PhoneActivationCodeActivity;->phoneNumber:Ljava/lang/String;

    .line 40
    invoke-virtual {p0}, Lco/getair/meerkat/activities/PhoneActivationCodeActivity;->startUp()V

    .line 41
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 45
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onDestroy()V

    .line 46
    iget-object v0, p0, Lco/getair/meerkat/activities/PhoneActivationCodeActivity;->facade:Lco/getair/meerkat/facades/PhoneActivationCodeActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/PhoneActivationCodeActivityFacade;->clearFacade()V

    .line 47
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/PhoneActivationCodeActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 52
    invoke-virtual {p0}, Lco/getair/meerkat/activities/PhoneActivationCodeActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/MeerkatApplication;

    .line 53
    .local v0, "meerkatApplication":Lco/getair/meerkat/MeerkatApplication;
    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->flush()V

    .line 54
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onStop()V

    .line 55
    return-void
.end method

.method public startUp()V
    .locals 1

    .prologue
    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/PhoneActivationCodeActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 28
    invoke-static {p0}, Lco/getair/meerkat/facades/PhoneActivationCodeActivityFacade;->getInst(Landroid/app/Activity;)Lco/getair/meerkat/facades/PhoneActivationCodeActivityFacade;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/activities/PhoneActivationCodeActivity;->facade:Lco/getair/meerkat/facades/PhoneActivationCodeActivityFacade;

    .line 30
    iget-object v0, p0, Lco/getair/meerkat/activities/PhoneActivationCodeActivity;->facade:Lco/getair/meerkat/facades/PhoneActivationCodeActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/PhoneActivationCodeActivityFacade;->startup()V

    .line 31
    return-void
.end method
