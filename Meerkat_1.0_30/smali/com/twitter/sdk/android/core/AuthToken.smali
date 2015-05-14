.class public abstract Lcom/twitter/sdk/android/core/AuthToken;
.super Ljava/lang/Object;
.source "AuthToken.java"

# interfaces
.implements Lcom/twitter/sdk/android/core/internal/oauth/AuthHeaders;


# instance fields
.field protected final createdAt:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/twitter/sdk/android/core/AuthToken;->createdAt:J

    .line 18
    return-void
.end method

.method protected constructor <init>(J)V
    .locals 1
    .param p1, "createdAt"    # J

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-wide p1, p0, Lcom/twitter/sdk/android/core/AuthToken;->createdAt:J

    .line 22
    return-void
.end method


# virtual methods
.method public abstract isExpired()Z
.end method
