.class Lcom/twitter/sdk/android/tweetui/ScribeEventFactory;
.super Ljava/lang/Object;
.source "ScribeEventFactory.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static newScribeEvent(Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;JLjava/lang/String;Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;
    .locals 7
    .param p0, "ns"    # Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
    .param p1, "timestamp"    # J
    .param p3, "language"    # Ljava/lang/String;
    .param p4, "advertisingId"    # Ljava/lang/String;

    .prologue
    .line 10
    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->client:Ljava/lang/String;

    const/4 v0, -0x1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    :cond_0
    :goto_0
    packed-switch v0, :pswitch_data_1

    .line 14
    new-instance v0, Lcom/twitter/sdk/android/core/internal/scribe/SyndicatedSdkImpressionEvent;

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/twitter/sdk/android/core/internal/scribe/SyndicatedSdkImpressionEvent;-><init>(Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;JLjava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-object v0

    .line 10
    :pswitch_0
    const-string v2, "tfw"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 12
    :pswitch_1
    new-instance v0, Lcom/twitter/sdk/android/tweetui/SyndicationClientEvent;

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/twitter/sdk/android/tweetui/SyndicationClientEvent;-><init>(Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;JLjava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 10
    nop

    :pswitch_data_0
    .packed-switch 0x1c045
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1
    .end packed-switch
.end method
