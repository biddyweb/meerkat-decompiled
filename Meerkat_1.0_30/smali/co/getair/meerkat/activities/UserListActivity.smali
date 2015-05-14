.class public Lco/getair/meerkat/activities/UserListActivity;
.super Lcom/instabug/wrapper/support/activity/InstabugActivity;
.source "UserListActivity.java"


# static fields
.field public static final LIST_SHOW_SCORE_BUNDLE_KEY:Ljava/lang/String; = "listShowScoreBundleKey"

.field public static final LIST_SOURCE_BUNDLE_KEY:Ljava/lang/String; = "listSourceBundleKey"

.field public static final LIST_TITLE_BUNDLE_KEY:Ljava/lang/String; = "listTitleBundleKey"


# instance fields
.field facade:Lco/getair/meerkat/facades/UserlistActivityFacade;

.field private listShowScore:Z

.field private listSource:Ljava/lang/String;

.field private listTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public getListSource()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lco/getair/meerkat/activities/UserListActivity;->listSource:Ljava/lang/String;

    return-object v0
.end method

.method public getListTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lco/getair/meerkat/activities/UserListActivity;->listTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getShowScore()Z
    .locals 1

    .prologue
    .line 70
    iget-boolean v0, p0, Lco/getair/meerkat/activities/UserListActivity;->listShowScore:Z

    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 34
    invoke-super {p0, p1}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onCreate(Landroid/os/Bundle;)V

    .line 36
    const v1, 0x7f040023

    invoke-virtual {p0, v1}, Lco/getair/meerkat/activities/UserListActivity;->setContentView(I)V

    .line 38
    invoke-virtual {p0}, Lco/getair/meerkat/activities/UserListActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 39
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "listSourceBundleKey"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/activities/UserListActivity;->listSource:Ljava/lang/String;

    .line 40
    const-string v1, "listTitleBundleKey"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/activities/UserListActivity;->listTitle:Ljava/lang/String;

    .line 41
    const-string v1, "listShowScoreBundleKey"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lco/getair/meerkat/activities/UserListActivity;->listShowScore:Z

    .line 43
    invoke-virtual {p0}, Lco/getair/meerkat/activities/UserListActivity;->startUp()V

    .line 44
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 48
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onDestroy()V

    .line 49
    iget-object v0, p0, Lco/getair/meerkat/activities/UserListActivity;->facade:Lco/getair/meerkat/facades/UserlistActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/UserlistActivityFacade;->clearFacade()V

    .line 50
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/UserlistActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 51
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 55
    invoke-virtual {p0}, Lco/getair/meerkat/activities/UserListActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/MeerkatApplication;

    .line 56
    .local v0, "meerkatApplication":Lco/getair/meerkat/MeerkatApplication;
    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->flush()V

    .line 57
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onStop()V

    .line 58
    return-void
.end method

.method public startUp()V
    .locals 1

    .prologue
    .line 26
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/UserlistActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 27
    invoke-static {p0}, Lco/getair/meerkat/facades/UserlistActivityFacade;->getInst(Landroid/app/Activity;)Lco/getair/meerkat/facades/UserlistActivityFacade;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/activities/UserListActivity;->facade:Lco/getair/meerkat/facades/UserlistActivityFacade;

    .line 29
    iget-object v0, p0, Lco/getair/meerkat/activities/UserListActivity;->facade:Lco/getair/meerkat/facades/UserlistActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/UserlistActivityFacade;->startup()V

    .line 30
    return-void
.end method
