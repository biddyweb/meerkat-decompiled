.class public abstract Lcom/digits/sdk/android/DigitsActionBarActivity;
.super Landroid/support/v7/app/ActionBarActivity;
.source "DigitsActionBarActivity.java"


# static fields
.field static final REQUEST_CODE:I = 0x8c

.field static final RESULT_FINISH_DIGITS:I = 0xc8


# instance fields
.field delegate:Lcom/digits/sdk/android/DigitsActivityDelegate;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Landroid/support/v7/app/ActionBarActivity;-><init>()V

    return-void
.end method


# virtual methods
.method abstract getActivityDelegate()Lcom/digits/sdk/android/DigitsActivityDelegate;
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 48
    const/16 v0, 0xc8

    if-ne p2, v0, :cond_0

    const/16 v0, 0x8c

    if-ne p1, v0, :cond_0

    .line 49
    invoke-virtual {p0}, Lcom/digits/sdk/android/DigitsActionBarActivity;->finish()V

    .line 51
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 18
    invoke-static {}, Lcom/digits/sdk/android/Digits;->getInstance()Lcom/digits/sdk/android/Digits;

    move-result-object v1

    invoke-virtual {v1}, Lcom/digits/sdk/android/Digits;->getTheme()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/digits/sdk/android/DigitsActionBarActivity;->setTheme(I)V

    .line 19
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    .line 21
    invoke-virtual {p0}, Lcom/digits/sdk/android/DigitsActionBarActivity;->getActivityDelegate()Lcom/digits/sdk/android/DigitsActivityDelegate;

    move-result-object v1

    iput-object v1, p0, Lcom/digits/sdk/android/DigitsActionBarActivity;->delegate:Lcom/digits/sdk/android/DigitsActivityDelegate;

    .line 22
    invoke-virtual {p0}, Lcom/digits/sdk/android/DigitsActionBarActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 23
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v1, p0, Lcom/digits/sdk/android/DigitsActionBarActivity;->delegate:Lcom/digits/sdk/android/DigitsActivityDelegate;

    invoke-interface {v1, v0}, Lcom/digits/sdk/android/DigitsActivityDelegate;->isValid(Landroid/os/Bundle;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 24
    iget-object v1, p0, Lcom/digits/sdk/android/DigitsActionBarActivity;->delegate:Lcom/digits/sdk/android/DigitsActivityDelegate;

    invoke-interface {v1}, Lcom/digits/sdk/android/DigitsActivityDelegate;->getLayoutId()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/digits/sdk/android/DigitsActionBarActivity;->setContentView(I)V

    .line 25
    iget-object v1, p0, Lcom/digits/sdk/android/DigitsActionBarActivity;->delegate:Lcom/digits/sdk/android/DigitsActivityDelegate;

    invoke-interface {v1, p0, v0}, Lcom/digits/sdk/android/DigitsActivityDelegate;->init(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 30
    return-void

    .line 27
    :cond_0
    invoke-virtual {p0}, Lcom/digits/sdk/android/DigitsActionBarActivity;->finish()V

    .line 28
    new-instance v1, Ljava/lang/IllegalAccessError;

    const-string v2, "This activity can only be started from Digits"

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsActionBarActivity;->delegate:Lcom/digits/sdk/android/DigitsActivityDelegate;

    invoke-interface {v0}, Lcom/digits/sdk/android/DigitsActivityDelegate;->onDestroy()V

    .line 41
    invoke-super {p0}, Landroid/support/v7/app/ActionBarActivity;->onDestroy()V

    .line 42
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 34
    invoke-super {p0}, Landroid/support/v7/app/ActionBarActivity;->onResume()V

    .line 35
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsActionBarActivity;->delegate:Lcom/digits/sdk/android/DigitsActivityDelegate;

    invoke-interface {v0}, Lcom/digits/sdk/android/DigitsActivityDelegate;->onResume()V

    .line 36
    return-void
.end method
