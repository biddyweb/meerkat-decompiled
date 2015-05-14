.class public Lcom/digits/sdk/android/DigitsException;
.super Ljava/lang/RuntimeException;
.source "DigitsException.java"


# instance fields
.field private final errorCode:I


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 16
    const/4 v0, -0x1

    invoke-direct {p0, p1, v0}, Lcom/digits/sdk/android/DigitsException;-><init>(Ljava/lang/String;I)V

    .line 17
    return-void
.end method

.method constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "errorCode"    # I

    .prologue
    .line 20
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 21
    iput p2, p0, Lcom/digits/sdk/android/DigitsException;->errorCode:I

    .line 22
    return-void
.end method

.method static create(Lcom/digits/sdk/android/ErrorCodes;Lcom/twitter/sdk/android/core/TwitterException;)Lcom/digits/sdk/android/DigitsException;
    .locals 3
    .param p0, "errors"    # Lcom/digits/sdk/android/ErrorCodes;
    .param p1, "exception"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 26
    instance-of v2, p1, Lcom/twitter/sdk/android/core/TwitterApiException;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 27
    check-cast v0, Lcom/twitter/sdk/android/core/TwitterApiException;

    .line 28
    .local v0, "apiException":Lcom/twitter/sdk/android/core/TwitterApiException;
    invoke-static {p0, v0}, Lcom/digits/sdk/android/DigitsException;->getMessageForApiError(Lcom/digits/sdk/android/ErrorCodes;Lcom/twitter/sdk/android/core/TwitterApiException;)Ljava/lang/String;

    move-result-object v1

    .line 29
    .local v1, "message":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/TwitterApiException;->getErrorCode()I

    move-result v2

    invoke-static {v2, v1}, Lcom/digits/sdk/android/DigitsException;->createException(ILjava/lang/String;)Lcom/digits/sdk/android/DigitsException;

    move-result-object v2

    .line 32
    .end local v0    # "apiException":Lcom/twitter/sdk/android/core/TwitterApiException;
    :goto_0
    return-object v2

    .line 31
    .end local v1    # "message":Ljava/lang/String;
    :cond_0
    invoke-interface {p0}, Lcom/digits/sdk/android/ErrorCodes;->getDefaultMessage()Ljava/lang/String;

    move-result-object v1

    .line 32
    .restart local v1    # "message":Ljava/lang/String;
    new-instance v2, Lcom/digits/sdk/android/DigitsException;

    invoke-direct {v2, v1}, Lcom/digits/sdk/android/DigitsException;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static createException(ILjava/lang/String;)Lcom/digits/sdk/android/DigitsException;
    .locals 1
    .param p0, "error"    # I
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 37
    const/16 v0, 0x11d

    if-ne p0, v0, :cond_0

    .line 38
    new-instance v0, Lcom/digits/sdk/android/AlreadyRegisteredException;

    invoke-direct {v0, p1, p0}, Lcom/digits/sdk/android/AlreadyRegisteredException;-><init>(Ljava/lang/String;I)V

    .line 42
    :goto_0
    return-object v0

    .line 39
    :cond_0
    invoke-static {p0}, Lcom/digits/sdk/android/DigitsException;->isUnrecoverable(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 40
    new-instance v0, Lcom/digits/sdk/android/UnrecoverableException;

    invoke-direct {v0, p1, p0}, Lcom/digits/sdk/android/UnrecoverableException;-><init>(Ljava/lang/String;I)V

    goto :goto_0

    .line 42
    :cond_1
    new-instance v0, Lcom/digits/sdk/android/DigitsException;

    invoke-direct {v0, p1, p0}, Lcom/digits/sdk/android/DigitsException;-><init>(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method private static getMessageForApiError(Lcom/digits/sdk/android/ErrorCodes;Lcom/twitter/sdk/android/core/TwitterApiException;)Ljava/lang/String;
    .locals 3
    .param p0, "errors"    # Lcom/digits/sdk/android/ErrorCodes;
    .param p1, "apiException"    # Lcom/twitter/sdk/android/core/TwitterApiException;

    .prologue
    .line 58
    invoke-virtual {p1}, Lcom/twitter/sdk/android/core/TwitterApiException;->getRetrofitError()Lretrofit/RetrofitError;

    move-result-object v0

    .line 59
    .local v0, "error":Lretrofit/RetrofitError;
    invoke-virtual {v0}, Lretrofit/RetrofitError;->isNetworkError()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 60
    invoke-interface {p0}, Lcom/digits/sdk/android/ErrorCodes;->getNetworkError()Ljava/lang/String;

    move-result-object v1

    .line 64
    .local v1, "errorCodeMessage":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 62
    .end local v1    # "errorCodeMessage":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1}, Lcom/twitter/sdk/android/core/TwitterApiException;->getErrorCode()I

    move-result v2

    invoke-interface {p0, v2}, Lcom/digits/sdk/android/ErrorCodes;->getMessage(I)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "errorCodeMessage":Ljava/lang/String;
    goto :goto_0
.end method

.method private static isUnrecoverable(I)Z
    .locals 1
    .param p0, "error"    # I

    .prologue
    .line 47
    const/16 v0, 0x11e

    if-eq p0, v0, :cond_0

    const/16 v0, 0x10d

    if-eq p0, v0, :cond_0

    const/16 v0, 0xeb

    if-eq p0, v0, :cond_0

    const/16 v0, 0xed

    if-eq p0, v0, :cond_0

    const/16 v0, 0x12b

    if-eq p0, v0, :cond_0

    const/16 v0, 0x11c

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getErrorCode()I
    .locals 1

    .prologue
    .line 68
    iget v0, p0, Lcom/digits/sdk/android/DigitsException;->errorCode:I

    return v0
.end method
