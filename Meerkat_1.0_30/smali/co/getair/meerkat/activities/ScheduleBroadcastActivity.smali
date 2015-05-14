.class public Lco/getair/meerkat/activities/ScheduleBroadcastActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "ScheduleBroadcastActivity.java"


# static fields
.field public static final BROADCAST_NAME_KEY:Ljava/lang/String; = "broadcastName"


# instance fields
.field public CAPTURE_IMAGE_ACTIVITY_REQUEST_CODE:I

.field private broadcastName:Ljava/lang/String;

.field facade:Lco/getair/meerkat/facades/ScheduleBroadcastActivityFacade;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    .line 19
    const/4 v0, 0x1

    iput v0, p0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->CAPTURE_IMAGE_ACTIVITY_REQUEST_CODE:I

    .line 25
    const-string v0, ""

    iput-object v0, p0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->broadcastName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getBroadcastName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->broadcastName:Ljava/lang/String;

    return-object v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x0

    .line 78
    iget v1, p0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->CAPTURE_IMAGE_ACTIVITY_REQUEST_CODE:I

    if-ne p1, v1, :cond_0

    .line 80
    const/4 v1, -0x1

    if-ne p2, v1, :cond_1

    .line 83
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "data"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 85
    .local v0, "photo":Landroid/graphics/Bitmap;
    iget-object v1, p0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->facade:Lco/getair/meerkat/facades/ScheduleBroadcastActivityFacade;

    const-string v2, "scheduleBroadcastImageReceived"

    invoke-virtual {v1, v2, v0, v3}, Lco/getair/meerkat/facades/ScheduleBroadcastActivityFacade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 98
    .end local v0    # "photo":Landroid/graphics/Bitmap;
    :cond_0
    :goto_0
    return-void

    .line 87
    :cond_1
    if-nez p2, :cond_2

    .line 90
    iget-object v1, p0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->facade:Lco/getair/meerkat/facades/ScheduleBroadcastActivityFacade;

    const-string v2, "scheduleBroadcastImageCancelled"

    invoke-virtual {v1, v2, v3, v3}, Lco/getair/meerkat/facades/ScheduleBroadcastActivityFacade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 94
    :cond_2
    iget-object v1, p0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->facade:Lco/getair/meerkat/facades/ScheduleBroadcastActivityFacade;

    const-string v2, "scheduleBroadcastImageFailed"

    invoke-virtual {v1, v2, v3, v3}, Lco/getair/meerkat/facades/ScheduleBroadcastActivityFacade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 41
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 43
    invoke-virtual {p0}, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "broadcastName"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->broadcastName:Ljava/lang/String;

    .line 45
    const v0, 0x7f040022

    invoke-virtual {p0, v0}, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->setContentView(I)V

    .line 47
    invoke-virtual {p0}, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->startUp()V

    .line 48
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 52
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onDestroy()V

    .line 53
    iget-object v0, p0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->facade:Lco/getair/meerkat/facades/ScheduleBroadcastActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/ScheduleBroadcastActivityFacade;->clearFacade()V

    .line 54
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/UserlistActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 55
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 59
    invoke-virtual {p0}, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/MeerkatApplication;

    .line 60
    .local v0, "meerkatApplication":Lco/getair/meerkat/MeerkatApplication;
    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->flush()V

    .line 61
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onStop()V

    .line 62
    return-void
.end method

.method public requestPhotoFromUser()V
    .locals 2

    .prologue
    .line 67
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 70
    .local v0, "intent":Landroid/content/Intent;
    iget v1, p0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->CAPTURE_IMAGE_ACTIVITY_REQUEST_CODE:I

    invoke-virtual {p0, v0, v1}, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 72
    return-void
.end method

.method public startUp()V
    .locals 1

    .prologue
    .line 33
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/ScheduleBroadcastActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 34
    invoke-static {p0}, Lco/getair/meerkat/facades/ScheduleBroadcastActivityFacade;->getInst(Landroid/app/Activity;)Lco/getair/meerkat/facades/ScheduleBroadcastActivityFacade;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->facade:Lco/getair/meerkat/facades/ScheduleBroadcastActivityFacade;

    .line 36
    iget-object v0, p0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->facade:Lco/getair/meerkat/facades/ScheduleBroadcastActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/ScheduleBroadcastActivityFacade;->startup()V

    .line 37
    return-void
.end method
