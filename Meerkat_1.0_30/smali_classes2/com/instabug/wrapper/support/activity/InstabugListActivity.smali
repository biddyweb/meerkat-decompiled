.class public Lcom/instabug/wrapper/support/activity/InstabugListActivity;
.super Landroid/app/ListActivity;
.source "InstabugListActivity.java"


# instance fields
.field private mDelegate:Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/instabug/wrapper/support/activity/InstabugListActivity;->mDelegate:Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 33
    invoke-super {p0, p1}, Landroid/app/ListActivity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 14
    new-instance v0, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;

    invoke-direct {v0, p0}, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/instabug/wrapper/support/activity/InstabugListActivity;->mDelegate:Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;

    .line 15
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 16
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 38
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 39
    iget-object v0, p0, Lcom/instabug/wrapper/support/activity/InstabugListActivity;->mDelegate:Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 40
    const/4 v0, 0x1

    return v0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 53
    invoke-super {p0}, Landroid/app/ListActivity;->onDestroy()V

    .line 54
    iget-object v0, p0, Lcom/instabug/wrapper/support/activity/InstabugListActivity;->mDelegate:Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;

    invoke-virtual {v0}, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->onDestroy()V

    .line 55
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/instabug/wrapper/support/activity/InstabugListActivity;->mDelegate:Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 46
    const/4 v0, 0x1

    .line 48
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 26
    invoke-super {p0}, Landroid/app/ListActivity;->onPause()V

    .line 27
    iget-object v0, p0, Lcom/instabug/wrapper/support/activity/InstabugListActivity;->mDelegate:Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;

    invoke-virtual {v0}, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->onPause()V

    .line 28
    return-void
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 20
    invoke-super {p0}, Landroid/app/ListActivity;->onResume()V

    .line 21
    iget-object v0, p0, Lcom/instabug/wrapper/support/activity/InstabugListActivity;->mDelegate:Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;

    invoke-virtual {v0}, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->onResume()V

    .line 22
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 59
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
