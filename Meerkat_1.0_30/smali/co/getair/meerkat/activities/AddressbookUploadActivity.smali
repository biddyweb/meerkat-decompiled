.class public Lco/getair/meerkat/activities/AddressbookUploadActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "AddressbookUploadActivity.java"


# instance fields
.field facade:Lco/getair/meerkat/facades/AddressbookUploadFacade;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 28
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 29
    const v0, 0x7f040019

    invoke-virtual {p0, v0}, Lco/getair/meerkat/activities/AddressbookUploadActivity;->setContentView(I)V

    .line 31
    invoke-virtual {p0}, Lco/getair/meerkat/activities/AddressbookUploadActivity;->startUp()V

    .line 32
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 36
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onDestroy()V

    .line 37
    iget-object v0, p0, Lco/getair/meerkat/activities/AddressbookUploadActivity;->facade:Lco/getair/meerkat/facades/AddressbookUploadFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/AddressbookUploadFacade;->clearFacade()V

    .line 38
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/AddressbookUploadFacade;->removeCore(Ljava/lang/String;)V

    .line 39
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 43
    invoke-virtual {p0}, Lco/getair/meerkat/activities/AddressbookUploadActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/MeerkatApplication;

    .line 44
    .local v0, "meerkatApplication":Lco/getair/meerkat/MeerkatApplication;
    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->flush()V

    .line 45
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onStop()V

    .line 46
    return-void
.end method

.method public startUp()V
    .locals 1

    .prologue
    .line 20
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/AddressbookUploadFacade;->removeCore(Ljava/lang/String;)V

    .line 21
    invoke-static {p0}, Lco/getair/meerkat/facades/AddressbookUploadFacade;->getInst(Landroid/app/Activity;)Lco/getair/meerkat/facades/AddressbookUploadFacade;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/activities/AddressbookUploadActivity;->facade:Lco/getair/meerkat/facades/AddressbookUploadFacade;

    .line 23
    iget-object v0, p0, Lco/getair/meerkat/activities/AddressbookUploadActivity;->facade:Lco/getair/meerkat/facades/AddressbookUploadFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/AddressbookUploadFacade;->startup()V

    .line 24
    return-void
.end method
