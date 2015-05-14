.class public Lcom/digits/sdk/android/ConfirmationCodeActionBarActivity;
.super Lcom/digits/sdk/android/DigitsActionBarActivity;
.source "ConfirmationCodeActionBarActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Lcom/digits/sdk/android/DigitsActionBarActivity;-><init>()V

    return-void
.end method


# virtual methods
.method getActivityDelegate()Lcom/digits/sdk/android/DigitsActivityDelegate;
    .locals 1

    .prologue
    .line 10
    new-instance v0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;

    invoke-direct {v0}, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;-><init>()V

    return-object v0
.end method
