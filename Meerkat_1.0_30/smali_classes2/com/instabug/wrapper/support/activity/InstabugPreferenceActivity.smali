.class public Lcom/instabug/wrapper/support/activity/InstabugPreferenceActivity;
.super Landroid/preference/PreferenceActivity;
.source "InstabugPreferenceActivity.java"


# instance fields
.field private mDelegate:Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/instabug/wrapper/support/activity/InstabugPreferenceActivity;->mDelegate:Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 35
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 16
    new-instance v0, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;

    invoke-direct {v0, p0}, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/instabug/wrapper/support/activity/InstabugPreferenceActivity;->mDelegate:Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;

    .line 17
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 18
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 40
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 41
    iget-object v0, p0, Lcom/instabug/wrapper/support/activity/InstabugPreferenceActivity;->mDelegate:Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 42
    const/4 v0, 0x1

    return v0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 55
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 56
    iget-object v0, p0, Lcom/instabug/wrapper/support/activity/InstabugPreferenceActivity;->mDelegate:Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;

    invoke-virtual {v0}, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->onDestroy()V

    .line 57
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/instabug/wrapper/support/activity/InstabugPreferenceActivity;->mDelegate:Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    const/4 v0, 0x1

    .line 50
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 28
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onPause()V

    .line 29
    iget-object v0, p0, Lcom/instabug/wrapper/support/activity/InstabugPreferenceActivity;->mDelegate:Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;

    invoke-virtual {v0}, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->onPause()V

    .line 30
    return-void
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 22
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 23
    iget-object v0, p0, Lcom/instabug/wrapper/support/activity/InstabugPreferenceActivity;->mDelegate:Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;

    invoke-virtual {v0}, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->onResume()V

    .line 24
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 61
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
