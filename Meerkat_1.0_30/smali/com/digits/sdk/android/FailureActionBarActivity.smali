.class public Lcom/digits/sdk/android/FailureActionBarActivity;
.super Landroid/support/v7/app/ActionBarActivity;
.source "FailureActionBarActivity.java"


# instance fields
.field delegate:Lcom/digits/sdk/android/FailureActivityDelegateImpl;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/support/v7/app/ActionBarActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 14
    invoke-static {}, Lcom/digits/sdk/android/Digits;->getInstance()Lcom/digits/sdk/android/Digits;

    move-result-object v0

    invoke-virtual {v0}, Lcom/digits/sdk/android/Digits;->getTheme()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/FailureActionBarActivity;->setTheme(I)V

    .line 15
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    .line 17
    new-instance v0, Lcom/digits/sdk/android/FailureActivityDelegateImpl;

    invoke-direct {v0, p0}, Lcom/digits/sdk/android/FailureActivityDelegateImpl;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/digits/sdk/android/FailureActionBarActivity;->delegate:Lcom/digits/sdk/android/FailureActivityDelegateImpl;

    .line 18
    iget-object v0, p0, Lcom/digits/sdk/android/FailureActionBarActivity;->delegate:Lcom/digits/sdk/android/FailureActivityDelegateImpl;

    invoke-virtual {v0}, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->init()V

    .line 19
    return-void
.end method
