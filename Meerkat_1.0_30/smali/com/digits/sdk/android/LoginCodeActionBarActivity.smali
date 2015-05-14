.class public Lcom/digits/sdk/android/LoginCodeActionBarActivity;
.super Lcom/digits/sdk/android/DigitsActionBarActivity;
.source "LoginCodeActionBarActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/digits/sdk/android/DigitsActionBarActivity;-><init>()V

    return-void
.end method


# virtual methods
.method getActivityDelegate()Lcom/digits/sdk/android/DigitsActivityDelegate;
    .locals 1

    .prologue
    .line 12
    new-instance v0, Lcom/digits/sdk/android/LoginCodeActivityDelegate;

    invoke-direct {v0}, Lcom/digits/sdk/android/LoginCodeActivityDelegate;-><init>()V

    return-object v0
.end method
