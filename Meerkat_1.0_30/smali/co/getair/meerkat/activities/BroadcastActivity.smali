.class public Lco/getair/meerkat/activities/BroadcastActivity;
.super Lcom/instabug/wrapper/support/activity/InstabugActivity;
.source "BroadcastActivity.java"


# static fields
.field public static final GoLiveExtraParamsKey:Ljava/lang/String; = "goLiveParams"


# instance fields
.field facade:Lco/getair/meerkat/facades/BroadcastActivityFacade;

.field private onCreate:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;-><init>()V

    .line 18
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/getair/meerkat/activities/BroadcastActivity;->onCreate:Z

    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 75
    iget-object v0, p0, Lco/getair/meerkat/activities/BroadcastActivity;->facade:Lco/getair/meerkat/facades/BroadcastActivityFacade;

    const-string v1, "broadcastActivityPaused"

    invoke-virtual {v0, v1, v2, v2}, Lco/getair/meerkat/facades/BroadcastActivityFacade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 32
    invoke-super {p0, p1}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onCreate(Landroid/os/Bundle;)V

    .line 33
    const v0, 0x7f04001a

    invoke-virtual {p0, v0}, Lco/getair/meerkat/activities/BroadcastActivity;->setContentView(I)V

    .line 34
    invoke-virtual {p0}, Lco/getair/meerkat/activities/BroadcastActivity;->startUp()V

    .line 35
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 56
    invoke-virtual {p0}, Lco/getair/meerkat/activities/BroadcastActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/MeerkatApplication;

    .line 57
    .local v0, "meerkatApplication":Lco/getair/meerkat/MeerkatApplication;
    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->flush()V

    .line 58
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onDestroy()V

    .line 59
    iget-object v1, p0, Lco/getair/meerkat/activities/BroadcastActivity;->facade:Lco/getair/meerkat/facades/BroadcastActivityFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BroadcastActivityFacade;->clearFacade()V

    .line 60
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/facades/BroadcastActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 49
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onPause()V

    .line 50
    invoke-virtual {p0}, Lco/getair/meerkat/activities/BroadcastActivity;->finish()V

    .line 52
    return-void
.end method

.method protected onResume()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 39
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onResume()V

    .line 40
    iget-boolean v0, p0, Lco/getair/meerkat/activities/BroadcastActivity;->onCreate:Z

    if-nez v0, :cond_0

    .line 41
    iget-object v0, p0, Lco/getair/meerkat/activities/BroadcastActivity;->facade:Lco/getair/meerkat/facades/BroadcastActivityFacade;

    const-string v1, "broadcastActivityResumed"

    invoke-virtual {v0, v1, v2, v2}, Lco/getair/meerkat/facades/BroadcastActivityFacade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    :goto_0
    return-void

    .line 43
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/getair/meerkat/activities/BroadcastActivity;->onCreate:Z

    goto :goto_0
.end method

.method protected onStop()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 65
    invoke-virtual {p0}, Lco/getair/meerkat/activities/BroadcastActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/MeerkatApplication;

    .line 66
    .local v0, "meerkatApplication":Lco/getair/meerkat/MeerkatApplication;
    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->flush()V

    .line 67
    iget-object v1, p0, Lco/getair/meerkat/activities/BroadcastActivity;->facade:Lco/getair/meerkat/facades/BroadcastActivityFacade;

    const-string v2, "end"

    invoke-virtual {v1, v2, v3, v3}, Lco/getair/meerkat/facades/BroadcastActivityFacade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 68
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onStop()V

    .line 69
    return-void
.end method

.method public startUp()V
    .locals 1

    .prologue
    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/BroadcastActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 25
    invoke-static {p0}, Lco/getair/meerkat/facades/BroadcastActivityFacade;->getInst(Landroid/app/Activity;)Lco/getair/meerkat/facades/BroadcastActivityFacade;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/activities/BroadcastActivity;->facade:Lco/getair/meerkat/facades/BroadcastActivityFacade;

    .line 27
    iget-object v0, p0, Lco/getair/meerkat/activities/BroadcastActivity;->facade:Lco/getair/meerkat/facades/BroadcastActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/BroadcastActivityFacade;->startup()V

    .line 28
    return-void
.end method
