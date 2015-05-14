.class public Lcom/digits/sdk/android/UnrecoverableException;
.super Lcom/digits/sdk/android/DigitsException;
.source "UnrecoverableException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 8
    invoke-direct {p0, p1}, Lcom/digits/sdk/android/DigitsException;-><init>(Ljava/lang/String;)V

    .line 9
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "errorCode"    # I

    .prologue
    .line 12
    invoke-direct {p0, p1, p2}, Lcom/digits/sdk/android/DigitsException;-><init>(Ljava/lang/String;I)V

    .line 13
    return-void
.end method
