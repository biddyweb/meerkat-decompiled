.class public Lcom/twitter/sdk/android/core/AppSession;
.super Lcom/twitter/sdk/android/core/Session;
.source "AppSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/core/AppSession$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/twitter/sdk/android/core/Session",
        "<",
        "Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/core/internal/oauth/GuestAuthToken;)V
    .locals 2
    .param p1, "authToken"    # Lcom/twitter/sdk/android/core/internal/oauth/GuestAuthToken;

    .prologue
    .line 20
    const-wide/16 v0, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/twitter/sdk/android/core/Session;-><init>(Lcom/twitter/sdk/android/core/AuthToken;J)V

    .line 21
    return-void
.end method

.method constructor <init>(Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;)V
    .locals 2
    .param p1, "authToken"    # Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;

    .prologue
    .line 16
    const-wide/16 v0, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/twitter/sdk/android/core/Session;-><init>(Lcom/twitter/sdk/android/core/AuthToken;J)V

    .line 17
    return-void
.end method
