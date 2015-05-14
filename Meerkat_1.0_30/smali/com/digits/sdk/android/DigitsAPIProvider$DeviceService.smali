.class public interface abstract Lcom/digits/sdk/android/DigitsAPIProvider$DeviceService;
.super Ljava/lang/Object;
.source "DigitsAPIProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/digits/sdk/android/DigitsAPIProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x60c
    name = "DeviceService"
.end annotation


# virtual methods
.method public abstract register(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lcom/twitter/sdk/android/core/Callback;)V
    .param p1    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Field;
            value = "raw_phone_number"
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Field;
            value = "text_key"
        .end annotation
    .end param
    .param p3    # Ljava/lang/Boolean;
        .annotation runtime Lretrofit/http/Field;
            value = "send_numeric_pin"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lretrofit/client/Response;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/FormUrlEncoded;
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/1.1/device/register.json"
    .end annotation
.end method
