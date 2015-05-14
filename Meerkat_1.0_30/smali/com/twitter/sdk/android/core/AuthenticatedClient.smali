.class public Lcom/twitter/sdk/android/core/AuthenticatedClient;
.super Lcom/twitter/sdk/android/core/DefaultClient;
.source "AuthenticatedClient.java"


# static fields
.field private static final FAKE_URL:Ljava/lang/String; = "https://twitter.com"


# instance fields
.field private final authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

.field private final session:Lcom/twitter/sdk/android/core/Session;


# direct methods
.method public constructor <init>(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/Session;Ljavax/net/ssl/SSLSocketFactory;)V
    .locals 0
    .param p1, "config"    # Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    .param p2, "session"    # Lcom/twitter/sdk/android/core/Session;
    .param p3, "sslSocketFactory"    # Ljavax/net/ssl/SSLSocketFactory;

    .prologue
    .line 36
    invoke-direct {p0, p3}, Lcom/twitter/sdk/android/core/DefaultClient;-><init>(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 37
    iput-object p1, p0, Lcom/twitter/sdk/android/core/AuthenticatedClient;->authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    .line 38
    iput-object p2, p0, Lcom/twitter/sdk/android/core/AuthenticatedClient;->session:Lcom/twitter/sdk/android/core/Session;

    .line 39
    return-void
.end method


# virtual methods
.method public execute(Lretrofit/client/Request;)Lretrofit/client/Response;
    .locals 6
    .param p1, "request"    # Lretrofit/client/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    new-instance v0, Lretrofit/client/Request;

    invoke-virtual {p1}, Lretrofit/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lretrofit/client/Request;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, p1}, Lcom/twitter/sdk/android/core/AuthenticatedClient;->getAuthHeaders(Lretrofit/client/Request;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {p1}, Lretrofit/client/Request;->getBody()Lretrofit/mime/TypedOutput;

    move-result-object v5

    invoke-direct {v0, v2, v3, v4, v5}, Lretrofit/client/Request;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lretrofit/mime/TypedOutput;)V

    .line 47
    .end local p1    # "request":Lretrofit/client/Request;
    .local v0, "request":Lretrofit/client/Request;
    iget-object v2, p0, Lcom/twitter/sdk/android/core/AuthenticatedClient;->wrappedClient:Lretrofit/client/Client;

    invoke-interface {v2, v0}, Lretrofit/client/Client;->execute(Lretrofit/client/Request;)Lretrofit/client/Response;

    move-result-object v1

    .line 49
    .local v1, "response":Lretrofit/client/Response;
    return-object v1
.end method

.method protected getAuthHeaders(Lretrofit/client/Request;)Ljava/util/List;
    .locals 10
    .param p1, "request"    # Lretrofit/client/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lretrofit/client/Request;",
            ")",
            "Ljava/util/List",
            "<",
            "Lretrofit/client/Header;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    new-instance v0, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;

    invoke-virtual {p1}, Lretrofit/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lretrofit/client/Request;->getUrl()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/twitter/sdk/android/core/AuthenticatedClient;->authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    iget-object v4, p0, Lcom/twitter/sdk/android/core/AuthenticatedClient;->session:Lcom/twitter/sdk/android/core/Session;

    const/4 v5, 0x0

    invoke-virtual {p0, p1}, Lcom/twitter/sdk/android/core/AuthenticatedClient;->getPostParams(Lretrofit/client/Request;)Ljava/util/Map;

    move-result-object v6

    invoke-direct/range {v0 .. v6}, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/Session;Ljava/lang/String;Ljava/util/Map;)V

    .line 57
    .local v0, "authHeaders":Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;
    new-instance v8, Ljava/util/ArrayList;

    invoke-virtual {p1}, Lretrofit/client/Request;->getHeaders()Ljava/util/List;

    move-result-object v1

    invoke-direct {v8, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 58
    .local v8, "headers":Ljava/util/List;, "Ljava/util/List<Lretrofit/client/Header;>;"
    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/internal/TwitterRequestHeaders;->getHeaders()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 59
    .local v7, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v3, Lretrofit/client/Header;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {v3, v1, v2}, Lretrofit/client/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v8, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 61
    .end local v7    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    return-object v8
.end method

.method protected getPostParams(Lretrofit/client/Request;)Ljava/util/Map;
    .locals 10
    .param p1, "request"    # Lretrofit/client/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lretrofit/client/Request;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    new-instance v5, Ljava/util/TreeMap;

    invoke-direct {v5}, Ljava/util/TreeMap;-><init>()V

    .line 70
    .local v5, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v7, "POST"

    invoke-virtual {p1}, Lretrofit/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v8

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v8, v9}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 71
    invoke-virtual {p1}, Lretrofit/client/Request;->getBody()Lretrofit/mime/TypedOutput;

    move-result-object v3

    .line 72
    .local v3, "output":Lretrofit/mime/TypedOutput;
    instance-of v7, v3, Lretrofit/mime/FormUrlEncodedTypedOutput;

    if-eqz v7, :cond_0

    .line 73
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 74
    .local v2, "os":Ljava/io/ByteArrayOutputStream;
    invoke-interface {v3, v2}, Lretrofit/mime/TypedOutput;->writeTo(Ljava/io/OutputStream;)V

    .line 75
    const-string v7, "UTF-8"

    invoke-virtual {v2, v7}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 76
    .local v6, "val":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_0

    .line 77
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "https://twitter.com/?"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    .line 78
    .local v0, "bodyUri":Ljava/net/URI;
    const-string v7, "UTF-8"

    invoke-static {v0, v7}, Lorg/apache/http/client/utils/URLEncodedUtils;->parse(Ljava/net/URI;Ljava/lang/String;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/http/NameValuePair;

    .line 79
    .local v4, "pair":Lorg/apache/http/NameValuePair;
    invoke-interface {v4}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v5, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 84
    .end local v0    # "bodyUri":Ljava/net/URI;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "os":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "output":Lretrofit/mime/TypedOutput;
    .end local v4    # "pair":Lorg/apache/http/NameValuePair;
    .end local v6    # "val":Ljava/lang/String;
    :cond_0
    return-object v5
.end method
