.class Lcom/twitter/sdk/android/tweetui/SyndicationClientEvent$ExternalIds;
.super Ljava/lang/Object;
.source "SyndicationClientEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/twitter/sdk/android/tweetui/SyndicationClientEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ExternalIds"
.end annotation


# instance fields
.field final adId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "6"
    .end annotation
.end field

.field final synthetic this$0:Lcom/twitter/sdk/android/tweetui/SyndicationClientEvent;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/tweetui/SyndicationClientEvent;Ljava/lang/String;)V
    .locals 0
    .param p2, "adId"    # Ljava/lang/String;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/SyndicationClientEvent$ExternalIds;->this$0:Lcom/twitter/sdk/android/tweetui/SyndicationClientEvent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p2, p0, Lcom/twitter/sdk/android/tweetui/SyndicationClientEvent$ExternalIds;->adId:Ljava/lang/String;

    .line 55
    return-void
.end method
