.class public interface abstract Lcom/digits/sdk/android/DigitsAPIProvider$SdkService;
.super Ljava/lang/Object;
.source "DigitsAPIProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/digits/sdk/android/DigitsAPIProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x60c
    name = "SdkService"
.end annotation


# virtual methods
.method public abstract account(Ljava/lang/String;Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V
    .param p1    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Field;
            value = "phone_number"
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Field;
            value = "numeric_pin"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/digits/sdk/android/DigitsUser;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/FormUrlEncoded;
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/1.1/sdk/account.json"
    .end annotation
.end method

.method public abstract auth(Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V
    .param p1    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Field;
            value = "x_auth_phone_number"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/digits/sdk/android/AuthResponse;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/FormUrlEncoded;
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/auth/1/xauth_phone_number.json"
    .end annotation
.end method

.method public abstract login(Ljava/lang/String;JLjava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V
    .param p1    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Field;
            value = "login_verification_request_id"
        .end annotation
    .end param
    .param p2    # J
        .annotation runtime Lretrofit/http/Field;
            value = "login_verification_user_id"
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Field;
            value = "login_verification_challenge_response"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/digits/sdk/android/DigitsSessionResponse;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/FormUrlEncoded;
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/auth/1/xauth_challenge.json"
    .end annotation
.end method

.method public abstract verifyPin(Ljava/lang/String;JLjava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V
    .param p1    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Field;
            value = "login_verification_request_id"
        .end annotation
    .end param
    .param p2    # J
        .annotation runtime Lretrofit/http/Field;
            value = "login_verification_user_id"
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Field;
            value = "pin"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/digits/sdk/android/DigitsSessionResponse;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/FormUrlEncoded;
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/auth/1/xauth_pin.json"
    .end annotation
.end method
