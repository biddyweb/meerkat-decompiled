.class public Lco/getair/meerkat/activities/WatchActivity;
.super Lcom/instabug/wrapper/support/activity/InstabugActivity;
.source "WatchActivity.java"


# static fields
.field public static final EXTRA_BROADCAST_ID:Ljava/lang/String; = "broadcastId"

.field public static final EXTRA_STREAM_ID:Ljava/lang/String; = "streamId"


# instance fields
.field private facade:Lco/getair/meerkat/facades/WatchActivityFacade;

.field private started:Z

.field public streamId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;-><init>()V

    .line 20
    const/4 v0, 0x0

    iput-object v0, p0, Lco/getair/meerkat/activities/WatchActivity;->streamId:Ljava/lang/String;

    .line 22
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/getair/meerkat/activities/WatchActivity;->started:Z

    return-void
.end method

.method public static createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "broadcastId"    # Ljava/lang/String;

    .prologue
    .line 101
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/getair/meerkat/activities/WatchActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "broadcastId"

    .line 102
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method private getStreamIdFromIntent(Landroid/content/Intent;)Ljava/lang/String;
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 106
    const/4 v0, 0x0

    .line 107
    .local v0, "streamId":Ljava/lang/String;
    const-string v1, "broadcastId"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 109
    if-nez v0, :cond_0

    .line 110
    const-string v1, "streamId"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 113
    :cond_0
    return-object v0
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 51
    invoke-super {p0, p1, p2, p3}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 52
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 53
    invoke-direct {p0, p3}, Lco/getair/meerkat/activities/WatchActivity;->getStreamIdFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/activities/WatchActivity;->streamId:Ljava/lang/String;

    .line 54
    const-string v0, "WatchActivity"

    iget-object v1, p0, Lco/getair/meerkat/activities/WatchActivity;->streamId:Ljava/lang/String;

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    invoke-virtual {p0}, Lco/getair/meerkat/activities/WatchActivity;->startApp()V

    .line 59
    :goto_0
    return-void

    .line 57
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/activities/WatchActivity;->finish()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 63
    invoke-super {p0, p1}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onCreate(Landroid/os/Bundle;)V

    .line 65
    const v1, 0x7f040024

    invoke-virtual {p0, v1}, Lco/getair/meerkat/activities/WatchActivity;->setContentView(I)V

    .line 68
    :try_start_0
    invoke-virtual {p0}, Lco/getair/meerkat/activities/WatchActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-direct {p0, v1}, Lco/getair/meerkat/activities/WatchActivity;->getStreamIdFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/activities/WatchActivity;->streamId:Ljava/lang/String;

    .line 69
    const-string v1, "WatchActivity"

    iget-object v2, p0, Lco/getair/meerkat/activities/WatchActivity;->streamId:Ljava/lang/String;

    invoke-static {v1, v2}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    invoke-virtual {p0}, Lco/getair/meerkat/activities/WatchActivity;->startApp()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    :goto_0
    return-void

    .line 71
    :catch_0
    move-exception v0

    .line 72
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 73
    invoke-virtual {p0}, Lco/getair/meerkat/activities/WatchActivity;->finish()V

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 79
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onDestroy()V

    .line 80
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/getair/meerkat/activities/WatchActivity;->started:Z

    .line 81
    iget-object v0, p0, Lco/getair/meerkat/activities/WatchActivity;->facade:Lco/getair/meerkat/facades/WatchActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/WatchActivityFacade;->clearFacade()V

    .line 82
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/WatchActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 83
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 37
    invoke-super {p0, p1}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 40
    :try_start_0
    invoke-direct {p0, p1}, Lco/getair/meerkat/activities/WatchActivity;->getStreamIdFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/activities/WatchActivity;->streamId:Ljava/lang/String;

    .line 41
    const-string v1, "WatchActivity"

    iget-object v2, p0, Lco/getair/meerkat/activities/WatchActivity;->streamId:Ljava/lang/String;

    invoke-static {v1, v2}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    invoke-virtual {p0}, Lco/getair/meerkat/activities/WatchActivity;->startApp()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    :goto_0
    return-void

    .line 43
    :catch_0
    move-exception v0

    .line 44
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 45
    invoke-virtual {p0}, Lco/getair/meerkat/activities/WatchActivity;->finish()V

    goto :goto_0
.end method

.method protected onRestart()V
    .locals 0

    .prologue
    .line 96
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onRestart()V

    .line 97
    invoke-virtual {p0}, Lco/getair/meerkat/activities/WatchActivity;->startApp()V

    .line 98
    return-void
.end method

.method protected onStop()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 87
    invoke-virtual {p0}, Lco/getair/meerkat/activities/WatchActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/MeerkatApplication;

    .line 88
    .local v0, "meerkatApplication":Lco/getair/meerkat/MeerkatApplication;
    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->flush()V

    .line 89
    iget-object v1, p0, Lco/getair/meerkat/activities/WatchActivity;->facade:Lco/getair/meerkat/facades/WatchActivityFacade;

    const-string v2, "end"

    invoke-virtual {v1, v2, v3, v3}, Lco/getair/meerkat/facades/WatchActivityFacade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 90
    const/4 v1, 0x0

    iput-boolean v1, p0, Lco/getair/meerkat/activities/WatchActivity;->started:Z

    .line 91
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onStop()V

    .line 92
    return-void
.end method

.method protected startApp()V
    .locals 1

    .prologue
    .line 26
    iget-boolean v0, p0, Lco/getair/meerkat/activities/WatchActivity;->started:Z

    if-nez v0, :cond_0

    .line 27
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/getair/meerkat/activities/WatchActivity;->started:Z

    .line 28
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/WatchActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 29
    invoke-static {p0}, Lco/getair/meerkat/facades/WatchActivityFacade;->getInst(Landroid/app/Activity;)Lco/getair/meerkat/facades/WatchActivityFacade;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/activities/WatchActivity;->facade:Lco/getair/meerkat/facades/WatchActivityFacade;

    .line 31
    iget-object v0, p0, Lco/getair/meerkat/activities/WatchActivity;->facade:Lco/getair/meerkat/facades/WatchActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/WatchActivityFacade;->startup()V

    .line 33
    :cond_0
    return-void
.end method
