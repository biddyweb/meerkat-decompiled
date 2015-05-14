.class public Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;
.super Ljava/lang/Object;
.source "TwitterRequestHeaders.java"


# static fields
.field public static final HEADER_USER_AGENT:Ljava/lang/String; = "User-Agent"


# instance fields
.field private final authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

.field private final method:Ljava/lang/String;

.field private final postParams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final session:Lcom/twitter/sdk/android/core/Session;

.field private final url:Ljava/lang/String;

.field private final userAgent:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/Session;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "authConfig"    # Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    .param p4, "session"    # Lcom/twitter/sdk/android/core/Session;
    .param p5, "userAgent"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/twitter/sdk/android/core/TwitterAuthConfig;",
            "Lcom/twitter/sdk/android/core/Session;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p6, "postParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->method:Ljava/lang/String;

    .line 26
    iput-object p2, p0, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->url:Ljava/lang/String;

    .line 27
    iput-object p3, p0, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    .line 28
    iput-object p4, p0, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->session:Lcom/twitter/sdk/android/core/Session;

    .line 29
    iput-object p5, p0, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->userAgent:Ljava/lang/String;

    .line 30
    iput-object p6, p0, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->postParams:Ljava/util/Map;

    .line 31
    return-void
.end method


# virtual methods
.method public getAuthHeaders()Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 56
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->session:Lcom/twitter/sdk/android/core/Session;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->session:Lcom/twitter/sdk/android/core/Session;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/Session;->getAuthToken()Lcom/twitter/sdk/android/core/AuthToken;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 57
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->session:Lcom/twitter/sdk/android/core/Session;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/Session;->getAuthToken()Lcom/twitter/sdk/android/core/AuthToken;

    move-result-object v0

    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->getMethod()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->url:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->getPostParams()Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/twitter/sdk/android/core/AuthToken;->getAuthHeaders(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    .line 60
    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    goto :goto_0
.end method

.method protected getExtraHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public final getHeaders()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 35
    .local v0, "headers":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->getExtraHeaders()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 36
    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->userAgent:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 37
    const-string v1, "User-Agent"

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->userAgent:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    :cond_0
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->getAuthHeaders()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 40
    return-object v0
.end method

.method protected getMethod()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->method:Ljava/lang/String;

    return-object v0
.end method

.method protected getPostParams()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 68
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->postParams:Ljava/util/Map;

    return-object v0
.end method
