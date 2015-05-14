.class public Lcom/twitter/sdk/android/core/internal/oauth/GuestAuthToken;
.super Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;
.source "GuestAuthToken.java"


# static fields
.field private static final EXPIRES_IN_MS:J = 0xa4cb80L

.field public static final HEADER_GUEST_TOKEN:Ljava/lang/String; = "x-guest-token"


# instance fields
.field private final guestToken:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "guest_token"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "tokenType"    # Ljava/lang/String;
    .param p2, "accessToken"    # Ljava/lang/String;
    .param p3, "guestToken"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    iput-object p3, p0, Lcom/twitter/sdk/android/core/internal/oauth/GuestAuthToken;->guestToken:Ljava/lang/String;

    .line 26
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .param p1, "tokenType"    # Ljava/lang/String;
    .param p2, "accessToken"    # Ljava/lang/String;
    .param p3, "guestToken"    # Ljava/lang/String;
    .param p4, "createdAt"    # J

    .prologue
    .line 29
    invoke-direct {p0, p1, p2, p4, p5}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    .line 30
    iput-object p3, p0, Lcom/twitter/sdk/android/core/internal/oauth/GuestAuthToken;->guestToken:Ljava/lang/String;

    .line 31
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 55
    if-ne p0, p1, :cond_1

    .line 64
    :cond_0
    :goto_0
    return v1

    .line 56
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    .line 57
    :cond_3
    invoke-super {p0, p1}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    goto :goto_0

    :cond_4
    move-object v0, p1

    .line 59
    check-cast v0, Lcom/twitter/sdk/android/core/internal/oauth/GuestAuthToken;

    .line 61
    .local v0, "that":Lcom/twitter/sdk/android/core/internal/oauth/GuestAuthToken;
    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/oauth/GuestAuthToken;->guestToken:Ljava/lang/String;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/oauth/GuestAuthToken;->guestToken:Ljava/lang/String;

    iget-object v4, v0, Lcom/twitter/sdk/android/core/internal/oauth/GuestAuthToken;->guestToken:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 62
    goto :goto_0

    .line 61
    :cond_5
    iget-object v3, v0, Lcom/twitter/sdk/android/core/internal/oauth/GuestAuthToken;->guestToken:Ljava/lang/String;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public getAuthHeaders(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/util/Map;
    .locals 3
    .param p1, "authConfig"    # Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    .param p2, "method"    # Ljava/lang/String;
    .param p3, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/TwitterAuthConfig;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 47
    .local p4, "postParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-super {p0, p1, p2, p3, p4}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;->getAuthHeaders(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    .line 49
    .local v0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "x-guest-token"

    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/internal/oauth/GuestAuthToken;->getGuestToken()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    return-object v0
.end method

.method public getGuestToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/oauth/GuestAuthToken;->guestToken:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 69
    invoke-super {p0}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;->hashCode()I

    move-result v0

    .line 70
    .local v0, "result":I
    mul-int/lit8 v2, v0, 0x1f

    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/oauth/GuestAuthToken;->guestToken:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/oauth/GuestAuthToken;->guestToken:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_0
    add-int v0, v2, v1

    .line 71
    return v0

    .line 70
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isExpired()Z
    .locals 6

    .prologue
    .line 41
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/twitter/sdk/android/core/internal/oauth/GuestAuthToken;->createdAt:J

    const-wide/32 v4, 0xa4cb80

    add-long/2addr v2, v4

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
