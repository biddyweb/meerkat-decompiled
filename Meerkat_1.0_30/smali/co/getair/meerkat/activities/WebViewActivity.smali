.class public Lco/getair/meerkat/activities/WebViewActivity;
.super Lcom/instabug/wrapper/support/activity/InstabugActivity;
.source "WebViewActivity.java"


# static fields
.field public static final EXTRA_TITLE:Ljava/lang/String; = "title"

.field public static final EXTRA_URL:Ljava/lang/String; = "url"


# instance fields
.field private facade:Lco/getair/meerkat/facades/WebViewActivityFacade;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;-><init>()V

    return-void
.end method

.method public static createIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 60
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/getair/meerkat/activities/WebViewActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "url"

    .line 61
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "title"

    .line 62
    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 26
    invoke-super {p0, p1}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onCreate(Landroid/os/Bundle;)V

    .line 28
    const v0, 0x7f040025

    invoke-virtual {p0, v0}, Lco/getair/meerkat/activities/WebViewActivity;->setContentView(I)V

    .line 30
    invoke-virtual {p0}, Lco/getair/meerkat/activities/WebViewActivity;->startUp()V

    .line 31
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 35
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onDestroy()V

    .line 36
    iget-object v0, p0, Lco/getair/meerkat/activities/WebViewActivity;->facade:Lco/getair/meerkat/facades/WebViewActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/WebViewActivityFacade;->clearFacade()V

    .line 37
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/WebViewActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 38
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 43
    invoke-virtual {p0}, Lco/getair/meerkat/activities/WebViewActivity;->getApplication()Landroid/app/Application;

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

.method protected startUp()V
    .locals 1

    .prologue
    .line 53
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/WebViewActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 55
    invoke-static {p0}, Lco/getair/meerkat/facades/WebViewActivityFacade;->getInst(Landroid/app/Activity;)Lco/getair/meerkat/facades/WebViewActivityFacade;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/activities/WebViewActivity;->facade:Lco/getair/meerkat/facades/WebViewActivityFacade;

    .line 56
    iget-object v0, p0, Lco/getair/meerkat/activities/WebViewActivity;->facade:Lco/getair/meerkat/facades/WebViewActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/WebViewActivityFacade;->startup()V

    .line 57
    return-void
.end method
