.class public Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent$Transform;
.super Ljava/lang/Object;
.source "ScribeEvent.java"

# interfaces
.implements Lio/fabric/sdk/android/services/events/EventTransform;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Transform"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/fabric/sdk/android/services/events/EventTransform",
        "<",
        "Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;",
        ">;"
    }
.end annotation


# instance fields
.field private final gson:Lcom/google/gson/Gson;


# direct methods
.method public constructor <init>(Lcom/google/gson/Gson;)V
    .locals 0
    .param p1, "gson"    # Lcom/google/gson/Gson;

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    iput-object p1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent$Transform;->gson:Lcom/google/gson/Gson;

    .line 97
    return-void
.end method


# virtual methods
.method public toBytes(Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;)[B
    .locals 2
    .param p1, "event"    # Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent$Transform;->gson:Lcom/google/gson/Gson;

    invoke-virtual {v0, p1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBytes(Ljava/lang/Object;)[B
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    check-cast p1, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent$Transform;->toBytes(Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;)[B

    move-result-object v0

    return-object v0
.end method
