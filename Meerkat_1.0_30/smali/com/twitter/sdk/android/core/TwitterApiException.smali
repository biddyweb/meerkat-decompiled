.class public Lcom/twitter/sdk/android/core/TwitterApiException;
.super Lcom/twitter/sdk/android/core/TwitterException;
.source "TwitterApiException.java"


# static fields
.field public static final DEFAULT_ERROR_CODE:I


# instance fields
.field private final apiError:Lcom/twitter/sdk/android/core/models/ApiError;

.field private final retrofitError:Lretrofit/RetrofitError;

.field private final twitterRateLimit:Lcom/twitter/sdk/android/core/TwitterRateLimit;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/core/models/ApiError;Lcom/twitter/sdk/android/core/TwitterRateLimit;Lretrofit/RetrofitError;)V
    .locals 1
    .param p1, "apiError"    # Lcom/twitter/sdk/android/core/models/ApiError;
    .param p2, "twitterRateLimit"    # Lcom/twitter/sdk/android/core/TwitterRateLimit;
    .param p3, "retrofitError"    # Lretrofit/RetrofitError;

    .prologue
    .line 28
    invoke-virtual {p3}, Lretrofit/RetrofitError;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/twitter/sdk/android/core/TwitterException;-><init>(Ljava/lang/String;)V

    .line 29
    iput-object p3, p0, Lcom/twitter/sdk/android/core/TwitterApiException;->retrofitError:Lretrofit/RetrofitError;

    .line 30
    iput-object p1, p0, Lcom/twitter/sdk/android/core/TwitterApiException;->apiError:Lcom/twitter/sdk/android/core/models/ApiError;

    .line 31
    iput-object p2, p0, Lcom/twitter/sdk/android/core/TwitterApiException;->twitterRateLimit:Lcom/twitter/sdk/android/core/TwitterRateLimit;

    .line 32
    return-void
.end method

.method constructor <init>(Lretrofit/RetrofitError;)V
    .locals 1
    .param p1, "retrofitError"    # Lretrofit/RetrofitError;

    .prologue
    .line 36
    invoke-static {p1}, Lcom/twitter/sdk/android/core/TwitterApiException;->createExceptionMessage(Lretrofit/RetrofitError;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/twitter/sdk/android/core/TwitterException;-><init>(Ljava/lang/String;)V

    .line 37
    invoke-virtual {p1}, Lretrofit/RetrofitError;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/core/TwitterApiException;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 39
    iput-object p1, p0, Lcom/twitter/sdk/android/core/TwitterApiException;->retrofitError:Lretrofit/RetrofitError;

    .line 40
    invoke-static {p1}, Lcom/twitter/sdk/android/core/TwitterApiException;->createRateLimit(Lretrofit/RetrofitError;)Lcom/twitter/sdk/android/core/TwitterRateLimit;

    move-result-object v0

    iput-object v0, p0, Lcom/twitter/sdk/android/core/TwitterApiException;->twitterRateLimit:Lcom/twitter/sdk/android/core/TwitterRateLimit;

    .line 41
    invoke-static {p1}, Lcom/twitter/sdk/android/core/TwitterApiException;->readApiError(Lretrofit/RetrofitError;)Lcom/twitter/sdk/android/core/models/ApiError;

    move-result-object v0

    iput-object v0, p0, Lcom/twitter/sdk/android/core/TwitterApiException;->apiError:Lcom/twitter/sdk/android/core/models/ApiError;

    .line 42
    return-void
.end method

.method public static final convert(Lretrofit/RetrofitError;)Lcom/twitter/sdk/android/core/TwitterApiException;
    .locals 1
    .param p0, "retrofitError"    # Lretrofit/RetrofitError;

    .prologue
    .line 93
    new-instance v0, Lcom/twitter/sdk/android/core/TwitterApiException;

    invoke-direct {v0, p0}, Lcom/twitter/sdk/android/core/TwitterApiException;-><init>(Lretrofit/RetrofitError;)V

    return-object v0
.end method

.method private static createExceptionMessage(Lretrofit/RetrofitError;)Ljava/lang/String;
    .locals 2
    .param p0, "retrofitError"    # Lretrofit/RetrofitError;

    .prologue
    .line 45
    invoke-virtual {p0}, Lretrofit/RetrofitError;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 46
    invoke-virtual {p0}, Lretrofit/RetrofitError;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 51
    :goto_0
    return-object v0

    .line 48
    :cond_0
    invoke-virtual {p0}, Lretrofit/RetrofitError;->getResponse()Lretrofit/client/Response;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Status: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lretrofit/RetrofitError;->getResponse()Lretrofit/client/Response;

    move-result-object v1

    invoke-virtual {v1}, Lretrofit/client/Response;->getStatus()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 51
    :cond_1
    const-string v0, "unknown error"

    goto :goto_0
.end method

.method private static createRateLimit(Lretrofit/RetrofitError;)Lcom/twitter/sdk/android/core/TwitterRateLimit;
    .locals 2
    .param p0, "retrofitError"    # Lretrofit/RetrofitError;

    .prologue
    .line 55
    invoke-virtual {p0}, Lretrofit/RetrofitError;->getResponse()Lretrofit/client/Response;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 56
    new-instance v0, Lcom/twitter/sdk/android/core/TwitterRateLimit;

    invoke-virtual {p0}, Lretrofit/RetrofitError;->getResponse()Lretrofit/client/Response;

    move-result-object v1

    invoke-virtual {v1}, Lretrofit/client/Response;->getHeaders()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/twitter/sdk/android/core/TwitterRateLimit;-><init>(Ljava/util/List;)V

    .line 58
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static parseApiError(Ljava/lang/String;)Lcom/twitter/sdk/android/core/models/ApiError;
    .locals 9
    .param p0, "response"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 116
    new-instance v2, Lcom/google/gson/Gson;

    invoke-direct {v2}, Lcom/google/gson/Gson;-><init>()V

    .line 119
    .local v2, "gson":Lcom/google/gson/Gson;
    :try_start_0
    new-instance v5, Lcom/google/gson/JsonParser;

    invoke-direct {v5}, Lcom/google/gson/JsonParser;-><init>()V

    invoke-virtual {v5, p0}, Lcom/google/gson/JsonParser;->parse(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v3

    .line 120
    .local v3, "responseObj":Lcom/google/gson/JsonObject;
    const-string v5, "errors"

    invoke-virtual {v3, v5}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v5

    const-class v6, [Lcom/twitter/sdk/android/core/models/ApiError;

    invoke-virtual {v2, v5, v6}, Lcom/google/gson/Gson;->fromJson(Lcom/google/gson/JsonElement;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/twitter/sdk/android/core/models/ApiError;

    .line 122
    .local v0, "apiErrors":[Lcom/twitter/sdk/android/core/models/ApiError;
    array-length v5, v0

    if-nez v5, :cond_0

    .line 133
    .end local v0    # "apiErrors":[Lcom/twitter/sdk/android/core/models/ApiError;
    .end local v3    # "responseObj":Lcom/google/gson/JsonObject;
    :goto_0
    return-object v4

    .line 126
    .restart local v0    # "apiErrors":[Lcom/twitter/sdk/android/core/models/ApiError;
    .restart local v3    # "responseObj":Lcom/google/gson/JsonObject;
    :cond_0
    const/4 v5, 0x0

    aget-object v4, v0, v5
    :try_end_0
    .catch Lcom/google/gson/JsonSyntaxException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 128
    .end local v0    # "apiErrors":[Lcom/twitter/sdk/android/core/models/ApiError;
    .end local v3    # "responseObj":Lcom/google/gson/JsonObject;
    :catch_0
    move-exception v1

    .line 129
    .local v1, "e":Lcom/google/gson/JsonSyntaxException;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v5

    const-string v6, "Twitter"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Invalid json: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7, v1}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 130
    .end local v1    # "e":Lcom/google/gson/JsonSyntaxException;
    :catch_1
    move-exception v1

    .line 131
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v5

    const-string v6, "Twitter"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unexpected response: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7, v1}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static readApiError(Lretrofit/RetrofitError;)Lcom/twitter/sdk/android/core/models/ApiError;
    .locals 7
    .param p0, "retrofitError"    # Lretrofit/RetrofitError;

    .prologue
    const/4 v4, 0x0

    .line 97
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lretrofit/RetrofitError;->getResponse()Lretrofit/client/Response;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {p0}, Lretrofit/RetrofitError;->getResponse()Lretrofit/client/Response;

    move-result-object v3

    invoke-virtual {v3}, Lretrofit/client/Response;->getBody()Lretrofit/mime/TypedInput;

    move-result-object v3

    if-nez v3, :cond_1

    :cond_0
    move-object v3, v4

    .line 112
    :goto_0
    return-object v3

    .line 101
    :cond_1
    invoke-virtual {p0}, Lretrofit/RetrofitError;->getResponse()Lretrofit/client/Response;

    move-result-object v3

    invoke-virtual {v3}, Lretrofit/client/Response;->getBody()Lretrofit/mime/TypedInput;

    move-result-object v3

    check-cast v3, Lretrofit/mime/TypedByteArray;

    invoke-virtual {v3}, Lretrofit/mime/TypedByteArray;->getBytes()[B

    move-result-object v2

    .line 104
    .local v2, "responseBytes":[B
    if-nez v2, :cond_2

    move-object v3, v4

    goto :goto_0

    .line 107
    :cond_2
    :try_start_0
    new-instance v1, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 108
    .local v1, "response":Ljava/lang/String;
    invoke-static {v1}, Lcom/twitter/sdk/android/core/TwitterApiException;->parseApiError(Ljava/lang/String;)Lcom/twitter/sdk/android/core/models/ApiError;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 109
    .end local v1    # "response":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 110
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v3

    const-string v5, "Twitter"

    const-string v6, "Failed to convert to string"

    invoke-interface {v3, v5, v6, v0}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v3, v4

    .line 112
    goto :goto_0
.end method


# virtual methods
.method public canRetry()Z
    .locals 2

    .prologue
    .line 80
    iget-object v1, p0, Lcom/twitter/sdk/android/core/TwitterApiException;->retrofitError:Lretrofit/RetrofitError;

    invoke-virtual {v1}, Lretrofit/RetrofitError;->getResponse()Lretrofit/client/Response;

    move-result-object v1

    invoke-virtual {v1}, Lretrofit/client/Response;->getStatus()I

    move-result v0

    .line 81
    .local v0, "status":I
    const/16 v1, 0x190

    if-lt v0, v1, :cond_0

    const/16 v1, 0x1f3

    if-le v0, v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getErrorCode()I
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterApiException;->apiError:Lcom/twitter/sdk/android/core/models/ApiError;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterApiException;->apiError:Lcom/twitter/sdk/android/core/models/ApiError;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/models/ApiError;->getCode()I

    move-result v0

    goto :goto_0
.end method

.method public getErrorMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterApiException;->apiError:Lcom/twitter/sdk/android/core/models/ApiError;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterApiException;->apiError:Lcom/twitter/sdk/android/core/models/ApiError;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/models/ApiError;->getMessage()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getRetrofitError()Lretrofit/RetrofitError;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterApiException;->retrofitError:Lretrofit/RetrofitError;

    return-object v0
.end method

.method public getTwitterRateLimit()Lcom/twitter/sdk/android/core/TwitterRateLimit;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterApiException;->twitterRateLimit:Lcom/twitter/sdk/android/core/TwitterRateLimit;

    return-object v0
.end method
