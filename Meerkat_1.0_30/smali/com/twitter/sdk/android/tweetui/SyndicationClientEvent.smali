.class Lcom/twitter/sdk/android/tweetui/SyndicationClientEvent;
.super Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;
.source "SyndicationClientEvent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/tweetui/SyndicationClientEvent$ExternalIds;
    }
.end annotation


# static fields
.field static final CLIENT_NAME:Ljava/lang/String; = "tfw"

.field private static final SCRIBE_CATEGORY:Ljava/lang/String; = "tfw_client_event"


# instance fields
.field final externalIds:Lcom/twitter/sdk/android/tweetui/SyndicationClientEvent$ExternalIds;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "external_ids"
    .end annotation
.end field

.field final language:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "language"
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;JLjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "eventNamespace"    # Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
    .param p2, "timestamp"    # J
    .param p4, "language"    # Ljava/lang/String;
    .param p5, "adId"    # Ljava/lang/String;

    .prologue
    .line 34
    const-string v0, "tfw_client_event"

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;-><init>(Ljava/lang/String;Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;J)V

    .line 35
    iput-object p4, p0, Lcom/twitter/sdk/android/tweetui/SyndicationClientEvent;->language:Ljava/lang/String;

    .line 36
    new-instance v0, Lcom/twitter/sdk/android/tweetui/SyndicationClientEvent$ExternalIds;

    invoke-direct {v0, p0, p5}, Lcom/twitter/sdk/android/tweetui/SyndicationClientEvent$ExternalIds;-><init>(Lcom/twitter/sdk/android/tweetui/SyndicationClientEvent;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/SyndicationClientEvent;->externalIds:Lcom/twitter/sdk/android/tweetui/SyndicationClientEvent$ExternalIds;

    .line 37
    return-void
.end method
