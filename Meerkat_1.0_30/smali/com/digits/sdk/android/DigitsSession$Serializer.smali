.class public Lcom/digits/sdk/android/DigitsSession$Serializer;
.super Ljava/lang/Object;
.source "DigitsSession.java"

# interfaces
.implements Lio/fabric/sdk/android/services/persistence/SerializationStrategy;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/digits/sdk/android/DigitsSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/fabric/sdk/android/services/persistence/SerializationStrategy",
        "<",
        "Lcom/digits/sdk/android/DigitsSession;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Digits"


# instance fields
.field private final gson:Lcom/google/gson/Gson;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    new-instance v0, Lcom/google/gson/GsonBuilder;

    invoke-direct {v0}, Lcom/google/gson/GsonBuilder;-><init>()V

    const-class v1, Lcom/twitter/sdk/android/core/AuthToken;

    new-instance v2, Lcom/twitter/sdk/android/core/AuthTokenAdapter;

    invoke-direct {v2}, Lcom/twitter/sdk/android/core/AuthTokenAdapter;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcom/google/gson/GsonBuilder;->registerTypeAdapter(Ljava/lang/reflect/Type;Ljava/lang/Object;)Lcom/google/gson/GsonBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    move-result-object v0

    iput-object v0, p0, Lcom/digits/sdk/android/DigitsSession$Serializer;->gson:Lcom/google/gson/Gson;

    .line 96
    return-void
.end method


# virtual methods
.method public deserialize(Ljava/lang/String;)Lcom/digits/sdk/android/DigitsSession;
    .locals 4
    .param p1, "serializedSession"    # Ljava/lang/String;

    .prologue
    .line 112
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 114
    :try_start_0
    iget-object v1, p0, Lcom/digits/sdk/android/DigitsSession$Serializer;->gson:Lcom/google/gson/Gson;

    const-class v2, Lcom/digits/sdk/android/DigitsSession;

    invoke-virtual {v1, p1, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/digits/sdk/android/DigitsSession;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    :goto_0
    return-object v1

    .line 115
    :catch_0
    move-exception v0

    .line 116
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const-string v2, "Digits"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public bridge synthetic deserialize(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 87
    invoke-virtual {p0, p1}, Lcom/digits/sdk/android/DigitsSession$Serializer;->deserialize(Ljava/lang/String;)Lcom/digits/sdk/android/DigitsSession;

    move-result-object v0

    return-object v0
.end method

.method public serialize(Lcom/digits/sdk/android/DigitsSession;)Ljava/lang/String;
    .locals 4
    .param p1, "session"    # Lcom/digits/sdk/android/DigitsSession;

    .prologue
    .line 100
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/digits/sdk/android/DigitsSession;->getAuthToken()Lcom/twitter/sdk/android/core/AuthToken;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 102
    :try_start_0
    iget-object v1, p0, Lcom/digits/sdk/android/DigitsSession$Serializer;->gson:Lcom/google/gson/Gson;

    invoke-virtual {v1, p1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 107
    :goto_0
    return-object v1

    .line 103
    :catch_0
    move-exception v0

    .line 104
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const-string v2, "Digits"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const-string v1, ""

    goto :goto_0
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 87
    check-cast p1, Lcom/digits/sdk/android/DigitsSession;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/digits/sdk/android/DigitsSession$Serializer;->serialize(Lcom/digits/sdk/android/DigitsSession;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
