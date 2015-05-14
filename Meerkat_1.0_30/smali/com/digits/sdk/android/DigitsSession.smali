.class public Lcom/digits/sdk/android/DigitsSession;
.super Lcom/twitter/sdk/android/core/Session;
.source "DigitsSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/digits/sdk/android/DigitsSession$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/twitter/sdk/android/core/Session",
        "<",
        "Lcom/twitter/sdk/android/core/AuthToken;",
        ">;"
    }
.end annotation


# static fields
.field public static final LOGGED_OUT_USER_ID:J = 0x0L

.field static final SECRET_HEADER:Ljava/lang/String; = "x-twitter-new-account-oauth-secret"

.field static final TOKEN_HEADER:Ljava/lang/String; = "x-twitter-new-account-oauth-access-token"

.field public static final UNKNOWN_USER_ID:J = -0x1L


# direct methods
.method public constructor <init>(Lcom/twitter/sdk/android/core/AuthToken;J)V
    .locals 0
    .param p1, "authToken"    # Lcom/twitter/sdk/android/core/AuthToken;
    .param p2, "id"    # J

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3}, Lcom/twitter/sdk/android/core/Session;-><init>(Lcom/twitter/sdk/android/core/AuthToken;J)V

    .line 37
    return-void
.end method

.method public constructor <init>(Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;)V
    .locals 2
    .param p1, "token"    # Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;

    .prologue
    .line 40
    const-wide/16 v0, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/digits/sdk/android/DigitsSession;-><init>(Lcom/twitter/sdk/android/core/AuthToken;J)V

    .line 41
    return-void
.end method

.method static create(Lcom/digits/sdk/android/DigitsSessionResponse;)Lcom/digits/sdk/android/DigitsSession;
    .locals 4
    .param p0, "result"    # Lcom/digits/sdk/android/DigitsSessionResponse;

    .prologue
    .line 76
    if-nez p0, :cond_0

    .line 77
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "result must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 80
    :cond_0
    new-instance v0, Lcom/digits/sdk/android/DigitsSession;

    new-instance v1, Lcom/twitter/sdk/android/core/TwitterAuthToken;

    iget-object v2, p0, Lcom/digits/sdk/android/DigitsSessionResponse;->token:Ljava/lang/String;

    iget-object v3, p0, Lcom/digits/sdk/android/DigitsSessionResponse;->secret:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lcom/twitter/sdk/android/core/TwitterAuthToken;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v2, p0, Lcom/digits/sdk/android/DigitsSessionResponse;->userId:J

    invoke-direct {v0, v1, v2, v3}, Lcom/digits/sdk/android/DigitsSession;-><init>(Lcom/twitter/sdk/android/core/AuthToken;J)V

    return-object v0
.end method

.method static create(Lcom/twitter/sdk/android/core/Result;)Lcom/digits/sdk/android/DigitsSession;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<",
            "Lcom/digits/sdk/android/DigitsUser;",
            ">;)",
            "Lcom/digits/sdk/android/DigitsSession;"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lcom/digits/sdk/android/DigitsUser;>;"
    if-nez p0, :cond_0

    .line 49
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "result must not be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 51
    :cond_0
    iget-object v5, p0, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    if-nez v5, :cond_1

    .line 52
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "result.data must not be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 54
    :cond_1
    iget-object v5, p0, Lcom/twitter/sdk/android/core/Result;->response:Lretrofit/client/Response;

    if-nez v5, :cond_2

    .line 55
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "result.response must not be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 58
    :cond_2
    iget-object v5, p0, Lcom/twitter/sdk/android/core/Result;->response:Lretrofit/client/Response;

    invoke-virtual {v5}, Lretrofit/client/Response;->getHeaders()Ljava/util/List;

    move-result-object v1

    .line 59
    .local v1, "headers":Ljava/util/List;, "Ljava/util/List<Lretrofit/client/Header;>;"
    const-string v4, ""

    .line 60
    .local v4, "token":Ljava/lang/String;
    const-string v3, ""

    .line 61
    .local v3, "secret":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lretrofit/client/Header;

    .line 62
    .local v0, "header":Lretrofit/client/Header;
    const-string v5, "x-twitter-new-account-oauth-access-token"

    invoke-virtual {v0}, Lretrofit/client/Header;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 63
    invoke-virtual {v0}, Lretrofit/client/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 67
    :cond_4
    :goto_0
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 72
    .end local v0    # "header":Lretrofit/client/Header;
    :cond_5
    new-instance v6, Lcom/digits/sdk/android/DigitsSession;

    new-instance v7, Lcom/twitter/sdk/android/core/TwitterAuthToken;

    invoke-direct {v7, v4, v3}, Lcom/twitter/sdk/android/core/TwitterAuthToken;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v5, p0, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    check-cast v5, Lcom/digits/sdk/android/DigitsUser;

    iget-wide v8, v5, Lcom/digits/sdk/android/DigitsUser;->id:J

    invoke-direct {v6, v7, v8, v9}, Lcom/digits/sdk/android/DigitsSession;-><init>(Lcom/twitter/sdk/android/core/AuthToken;J)V

    return-object v6

    .line 64
    .restart local v0    # "header":Lretrofit/client/Header;
    :cond_6
    const-string v5, "x-twitter-new-account-oauth-secret"

    invoke-virtual {v0}, Lretrofit/client/Header;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 65
    invoke-virtual {v0}, Lretrofit/client/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public static create(Lcom/twitter/sdk/android/core/TwitterSession;)Lcom/digits/sdk/android/DigitsSession;
    .locals 4
    .param p0, "session"    # Lcom/twitter/sdk/android/core/TwitterSession;

    .prologue
    .line 84
    new-instance v0, Lcom/digits/sdk/android/DigitsSession;

    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/TwitterSession;->getAuthToken()Lcom/twitter/sdk/android/core/AuthToken;

    move-result-object v1

    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/TwitterSession;->getUserId()J

    move-result-wide v2

    invoke-direct {v0, v1, v2, v3}, Lcom/digits/sdk/android/DigitsSession;-><init>(Lcom/twitter/sdk/android/core/AuthToken;J)V

    return-object v0
.end method


# virtual methods
.method public isLoggedOutUser()Z
    .locals 4

    .prologue
    .line 44
    invoke-virtual {p0}, Lcom/digits/sdk/android/DigitsSession;->getId()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
