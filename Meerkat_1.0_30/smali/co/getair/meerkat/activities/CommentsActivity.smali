.class public Lco/getair/meerkat/activities/CommentsActivity;
.super Lcom/instabug/wrapper/support/activity/InstabugActivity;
.source "CommentsActivity.java"


# static fields
.field public static final COMMENTS_URL_BUNDLE_KEY:Ljava/lang/String; = "commentsUrlBundleKey"


# instance fields
.field private commentsUrl:Ljava/lang/String;

.field facade:Lco/getair/meerkat/facades/CommentsActivityFacade;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public getCommentsUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lco/getair/meerkat/activities/CommentsActivity;->commentsUrl:Ljava/lang/String;

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 31
    invoke-super {p0, p1}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onCreate(Landroid/os/Bundle;)V

    .line 32
    const v0, 0x7f04001b

    invoke-virtual {p0, v0}, Lco/getair/meerkat/activities/CommentsActivity;->setContentView(I)V

    .line 34
    invoke-virtual {p0}, Lco/getair/meerkat/activities/CommentsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "commentsUrlBundleKey"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/activities/CommentsActivity;->commentsUrl:Ljava/lang/String;

    .line 36
    invoke-virtual {p0}, Lco/getair/meerkat/activities/CommentsActivity;->startUp()V

    .line 37
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 41
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onDestroy()V

    .line 42
    iget-object v0, p0, Lco/getair/meerkat/activities/CommentsActivity;->facade:Lco/getair/meerkat/facades/CommentsActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/CommentsActivityFacade;->clearFacade()V

    .line 43
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/CommentsActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 48
    invoke-virtual {p0}, Lco/getair/meerkat/activities/CommentsActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/MeerkatApplication;

    .line 49
    .local v0, "meerkatApplication":Lco/getair/meerkat/MeerkatApplication;
    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->flush()V

    .line 50
    invoke-super {p0}, Lcom/instabug/wrapper/support/activity/InstabugActivity;->onStop()V

    .line 51
    return-void
.end method

.method public startUp()V
    .locals 1

    .prologue
    .line 22
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/CommentsActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 23
    invoke-static {p0}, Lco/getair/meerkat/facades/CommentsActivityFacade;->getInst(Landroid/app/Activity;)Lco/getair/meerkat/facades/CommentsActivityFacade;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/activities/CommentsActivity;->facade:Lco/getair/meerkat/facades/CommentsActivityFacade;

    .line 25
    iget-object v0, p0, Lco/getair/meerkat/activities/CommentsActivity;->facade:Lco/getair/meerkat/facades/CommentsActivityFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/CommentsActivityFacade;->startup()V

    .line 26
    return-void
.end method
