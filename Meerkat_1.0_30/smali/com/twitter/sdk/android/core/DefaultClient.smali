.class public Lcom/twitter/sdk/android/core/DefaultClient;
.super Ljava/lang/Object;
.source "DefaultClient.java"

# interfaces
.implements Lretrofit/client/Client;


# instance fields
.field final sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

.field final wrappedClient:Lretrofit/client/Client;


# direct methods
.method public constructor <init>(Ljavax/net/ssl/SSLSocketFactory;)V
    .locals 1
    .param p1, "sslSocketFactory"    # Ljavax/net/ssl/SSLSocketFactory;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/twitter/sdk/android/core/DefaultClient;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 29
    invoke-direct {p0}, Lcom/twitter/sdk/android/core/DefaultClient;->hasOkHttpOnClasspath()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 30
    new-instance v0, Lcom/twitter/sdk/android/core/DefaultClient$1;

    invoke-direct {v0, p0}, Lcom/twitter/sdk/android/core/DefaultClient$1;-><init>(Lcom/twitter/sdk/android/core/DefaultClient;)V

    iput-object v0, p0, Lcom/twitter/sdk/android/core/DefaultClient;->wrappedClient:Lretrofit/client/Client;

    .line 44
    :goto_0
    return-void

    .line 37
    :cond_0
    new-instance v0, Lcom/twitter/sdk/android/core/DefaultClient$2;

    invoke-direct {v0, p0}, Lcom/twitter/sdk/android/core/DefaultClient$2;-><init>(Lcom/twitter/sdk/android/core/DefaultClient;)V

    iput-object v0, p0, Lcom/twitter/sdk/android/core/DefaultClient;->wrappedClient:Lretrofit/client/Client;

    goto :goto_0
.end method

.method private hasOkHttpOnClasspath()Z
    .locals 5

    .prologue
    .line 54
    const/4 v1, 0x0

    .line 56
    .local v1, "okUrlFactory":Z
    :try_start_0
    const-string v2, "com.squareup.okhttp.OkUrlFactory"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 57
    const/4 v1, 0x1

    .line 61
    :goto_0
    const/4 v0, 0x0

    .line 63
    .local v0, "okHttpClient":Z
    :try_start_1
    const-string v2, "com.squareup.okhttp.OkHttpClient"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 64
    const/4 v0, 0x1

    .line 68
    :goto_1
    if-eq v0, v1, :cond_0

    .line 69
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v2

    const-string v3, "Twitter"

    const-string v4, "Retrofit detected an unsupported OkHttp on the classpath.\nTo use OkHttp with this version of Retrofit, you\'ll need:\n1. com.squareup.okhttp:okhttp:1.6.0 (or newer)\n2. com.squareup.okhttp:okhttp-urlconnection:1.6.0 (or newer)\nNote that OkHttp 2.0.0+ is supported!"

    invoke-interface {v2, v3, v4}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    const/4 v0, 0x0

    .line 78
    .end local v0    # "okHttpClient":Z
    :cond_0
    return v0

    .line 65
    .restart local v0    # "okHttpClient":Z
    :catch_0
    move-exception v2

    goto :goto_1

    .line 58
    .end local v0    # "okHttpClient":Z
    :catch_1
    move-exception v2

    goto :goto_0
.end method


# virtual methods
.method public execute(Lretrofit/client/Request;)Lretrofit/client/Response;
    .locals 1
    .param p1, "request"    # Lretrofit/client/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Lcom/twitter/sdk/android/core/DefaultClient;->wrappedClient:Lretrofit/client/Client;

    invoke-interface {v0, p1}, Lretrofit/client/Client;->execute(Lretrofit/client/Request;)Lretrofit/client/Response;

    move-result-object v0

    return-object v0
.end method

.method openSslConnection(Ljava/net/HttpURLConnection;)Ljava/net/HttpURLConnection;
    .locals 2
    .param p1, "connection"    # Ljava/net/HttpURLConnection;

    .prologue
    .line 82
    iget-object v0, p0, Lcom/twitter/sdk/android/core/DefaultClient;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    if-eqz v0, :cond_0

    instance-of v0, p1, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 83
    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    iget-object v1, p0, Lcom/twitter/sdk/android/core/DefaultClient;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, v1}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 85
    :cond_0
    return-object p1
.end method
