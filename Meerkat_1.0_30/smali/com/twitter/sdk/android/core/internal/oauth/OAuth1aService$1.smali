.class Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService$1;
.super Lcom/twitter/sdk/android/core/Callback;
.source "OAuth1aService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->getCallbackWrapper(Lcom/twitter/sdk/android/core/Callback;)Lcom/twitter/sdk/android/core/Callback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/twitter/sdk/android/core/Callback",
        "<",
        "Lretrofit/client/Response;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;

.field final synthetic val$callback:Lcom/twitter/sdk/android/core/Callback;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;Lcom/twitter/sdk/android/core/Callback;)V
    .locals 0

    .prologue
    .line 179
    iput-object p1, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService$1;->this$0:Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;

    iput-object p2, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService$1;->val$callback:Lcom/twitter/sdk/android/core/Callback;

    invoke-direct {p0}, Lcom/twitter/sdk/android/core/Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 1
    .param p1, "exception"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 215
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService$1;->val$callback:Lcom/twitter/sdk/android/core/Callback;

    invoke-virtual {v0, p1}, Lcom/twitter/sdk/android/core/Callback;->failure(Lcom/twitter/sdk/android/core/TwitterException;)V

    .line 216
    return-void
.end method

.method public success(Lcom/twitter/sdk/android/core/Result;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<",
            "Lretrofit/client/Response;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 184
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lretrofit/client/Response;>;"
    const/4 v3, 0x0

    .line 185
    .local v3, "reader":Ljava/io/BufferedReader;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 188
    .local v6, "sb":Ljava/lang/StringBuilder;
    :try_start_0
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    iget-object v7, p1, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    check-cast v7, Lretrofit/client/Response;

    invoke-virtual {v7}, Lretrofit/client/Response;->getBody()Lretrofit/mime/TypedInput;

    move-result-object v7

    invoke-interface {v7}, Lretrofit/mime/TypedInput;->in()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v4, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 192
    .end local v3    # "reader":Ljava/io/BufferedReader;
    .local v4, "reader":Ljava/io/BufferedReader;
    :goto_0
    :try_start_1
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .local v2, "line":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 193
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 196
    .end local v2    # "line":Ljava/lang/String;
    :catchall_0
    move-exception v7

    move-object v3, v4

    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    :goto_1
    if-eqz v3, :cond_0

    .line 197
    :try_start_2
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    :cond_0
    throw v7
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 208
    :catch_0
    move-exception v1

    .line 209
    .local v1, "e":Ljava/io/IOException;
    :goto_2
    iget-object v7, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService$1;->val$callback:Lcom/twitter/sdk/android/core/Callback;

    new-instance v8, Lcom/twitter/sdk/android/core/TwitterAuthException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v1}, Lcom/twitter/sdk/android/core/TwitterAuthException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {v7, v8}, Lcom/twitter/sdk/android/core/Callback;->failure(Lcom/twitter/sdk/android/core/TwitterException;)V

    .line 211
    .end local v1    # "e":Ljava/io/IOException;
    :goto_3
    return-void

    .line 196
    .end local v3    # "reader":Ljava/io/BufferedReader;
    .restart local v2    # "line":Ljava/lang/String;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    :cond_1
    if-eqz v4, :cond_2

    .line 197
    :try_start_3
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 200
    :cond_2
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 201
    .local v5, "responseAsStr":Ljava/lang/String;
    invoke-static {v5}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->parseAuthResponse(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;

    move-result-object v0

    .line 202
    .local v0, "authResponse":Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;
    if-nez v0, :cond_3

    .line 203
    iget-object v7, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService$1;->val$callback:Lcom/twitter/sdk/android/core/Callback;

    new-instance v8, Lcom/twitter/sdk/android/core/TwitterAuthException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Failed to parse auth response: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/twitter/sdk/android/core/TwitterAuthException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v8}, Lcom/twitter/sdk/android/core/Callback;->failure(Lcom/twitter/sdk/android/core/TwitterException;)V

    :goto_4
    move-object v3, v4

    .line 210
    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    goto :goto_3

    .line 206
    .end local v3    # "reader":Ljava/io/BufferedReader;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    :cond_3
    iget-object v7, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService$1;->val$callback:Lcom/twitter/sdk/android/core/Callback;

    new-instance v8, Lcom/twitter/sdk/android/core/Result;

    const/4 v9, 0x0

    invoke-direct {v8, v0, v9}, Lcom/twitter/sdk/android/core/Result;-><init>(Ljava/lang/Object;Lretrofit/client/Response;)V

    invoke-virtual {v7, v8}, Lcom/twitter/sdk/android/core/Callback;->success(Lcom/twitter/sdk/android/core/Result;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_4

    .line 208
    .end local v0    # "authResponse":Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;
    .end local v5    # "responseAsStr":Ljava/lang/String;
    :catch_1
    move-exception v1

    move-object v3, v4

    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    goto :goto_2

    .line 196
    .end local v2    # "line":Ljava/lang/String;
    :catchall_1
    move-exception v7

    goto :goto_1
.end method
