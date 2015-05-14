.class public abstract Lcom/digits/sdk/android/DigitsActivity;
.super Landroid/app/Activity;
.source "DigitsActivity.java"


# static fields
.field static final REQUEST_CODE:I = 0x8c

.field static final RESULT_FINISH_DIGITS:I = 0xc8


# instance fields
.field delegate:Lcom/digits/sdk/android/DigitsActivityDelegate;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

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
    .line 46
    const/16 v0, 0xc8

    if-ne p2, v0, :cond_0

    const/16 v0, 0x8c

    if-ne p1, v0, :cond_0

    .line 47
    invoke-virtual {p0}, Lcom/digits/sdk/android/DigitsActivity;->finish()V

    .line 49
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 16
    invoke-static {}, Lcom/digits/sdk/android/Digits;->getInstance()Lcom/digits/sdk/android/Digits;

    move-result-object v1

    invoke-virtual {v1}, Lcom/digits/sdk/android/Digits;->getTheme()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/digits/sdk/android/DigitsActivity;->setTheme(I)V

    .line 17
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 19
    invoke-virtual {p0}, Lcom/digits/sdk/android/DigitsActivity;->getActivityDelegate()Lcom/digits/sdk/android/DigitsActivityDelegate;

    move-result-object v1

    iput-object v1, p0, Lcom/digits/sdk/android/DigitsActivity;->delegate:Lcom/digits/sdk/android/DigitsActivityDelegate;

    .line 20
    invoke-virtual {p0}, Lcom/digits/sdk/android/DigitsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 21
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v1, p0, Lcom/digits/sdk/android/DigitsActivity;->delegate:Lcom/digits/sdk/android/DigitsActivityDelegate;

    invoke-interface {v1, v0}, Lcom/digits/sdk/android/DigitsActivityDelegate;->isValid(Landroid/os/Bundle;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 22
    iget-object v1, p0, Lcom/digits/sdk/android/DigitsActivity;->delegate:Lcom/digits/sdk/android/DigitsActivityDelegate;

    invoke-interface {v1}, Lcom/digits/sdk/android/DigitsActivityDelegate;->getLayoutId()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/digits/sdk/android/DigitsActivity;->setContentView(I)V

    .line 23
    iget-object v1, p0, Lcom/digits/sdk/android/DigitsActivity;->delegate:Lcom/digits/sdk/android/DigitsActivityDelegate;

    invoke-interface {v1, p0, v0}, Lcom/digits/sdk/android/DigitsActivityDelegate;->init(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 28
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/digits/sdk/android/DigitsActivity;->finish()V

    .line 26
    new-instance v1, Ljava/lang/IllegalAccessError;

    const-string v2, "This activity can only be started from Digits"

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsActivity;->delegate:Lcom/digits/sdk/android/DigitsActivityDelegate;

    invoke-interface {v0}, Lcom/digits/sdk/android/DigitsActivityDelegate;->onDestroy()V

    .line 39
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 40
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 32
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 33
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsActivity;->delegate:Lcom/digits/sdk/android/DigitsActivityDelegate;

    invoke-interface {v0}, Lcom/digits/sdk/android/DigitsActivityDelegate;->onResume()V

    .line 34
    return-void
.end method
