.class public Lcom/twitter/sdk/android/core/internal/scribe/SyndicatedSdkImpressionEvent;
.super Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;
.source "SyndicatedSdkImpressionEvent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/core/internal/scribe/SyndicatedSdkImpressionEvent$ExternalIds;
    }
.end annotation


# static fields
.field public static final CLIENT_NAME:Ljava/lang/String; = "android"

.field private static final SCRIBE_CATEGORY:Ljava/lang/String; = "syndicated_sdk_impression"


# instance fields
.field public final deviceIdCreatedAt:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "device_id_created_at"
    .end annotation
.end field

.field public final externalIds:Lcom/twitter/sdk/android/core/internal/scribe/SyndicatedSdkImpressionEvent$ExternalIds;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "external_ids"
    .end annotation
.end field

.field public final language:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "language"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;JLjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "eventNamespace"    # Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
    .param p2, "timestamp"    # J
    .param p4, "language"    # Ljava/lang/String;
    .param p5, "adId"    # Ljava/lang/String;

    .prologue
    .line 44
    const-string v0, "syndicated_sdk_impression"

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;-><init>(Ljava/lang/String;Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;J)V

    .line 45
    iput-object p4, p0, Lcom/twitter/sdk/android/core/internal/scribe/SyndicatedSdkImpressionEvent;->language:Ljava/lang/String;

    .line 46
    new-instance v0, Lcom/twitter/sdk/android/core/internal/scribe/SyndicatedSdkImpressionEvent$ExternalIds;

    invoke-direct {v0, p0, p5}, Lcom/twitter/sdk/android/core/internal/scribe/SyndicatedSdkImpressionEvent$ExternalIds;-><init>(Lcom/twitter/sdk/android/core/internal/scribe/SyndicatedSdkImpressionEvent;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/twitter/sdk/android/core/internal/scribe/SyndicatedSdkImpressionEvent;->externalIds:Lcom/twitter/sdk/android/core/internal/scribe/SyndicatedSdkImpressionEvent$ExternalIds;

    .line 47
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/twitter/sdk/android/core/internal/scribe/SyndicatedSdkImpressionEvent;->deviceIdCreatedAt:J

    .line 48
    return-void
.end method
