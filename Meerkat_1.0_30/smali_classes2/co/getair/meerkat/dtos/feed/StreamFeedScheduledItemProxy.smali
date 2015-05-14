.class public Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;
.super Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
.source "StreamFeedScheduledItemProxy.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy",
        "<",
        "Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;",
        ">;"
    }
.end annotation


# instance fields
.field private final broadcastSummary:Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;IZLco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;Lco/getair/meerkat/dtos/Influencer;Ljava/util/HashMap;)V
    .locals 8
    .param p1, "proxyName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "version"    # I
    .param p4, "didRestream"    # Z
    .param p5, "broadcastSummary"    # Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;
    .param p6, "influencer"    # Lco/getair/meerkat/dtos/Influencer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/content/Context;",
            "IZ",
            "Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;",
            "Lco/getair/meerkat/dtos/Influencer;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 35
    .line 39
    .local p7, "followupActions":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p5}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getId()Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v6, p6

    move-object v7, p7

    .line 35
    invoke-direct/range {v0 .. v7}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;-><init>(Ljava/lang/String;Landroid/content/Context;IZLjava/lang/String;Lco/getair/meerkat/dtos/Influencer;Ljava/util/HashMap;)V

    .line 43
    iput-object p5, p0, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->broadcastSummary:Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    .line 44
    return-void
.end method


# virtual methods
.method public compareTo(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;)I
    .locals 8
    .param p1, "another"    # Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    .prologue
    .line 58
    const/4 v1, -0x1

    .line 59
    .local v1, "BEFORE":I
    const/4 v2, 0x0

    .line 60
    .local v2, "EQUAL":I
    const/4 v0, 0x1

    .line 62
    .local v0, "AFTER":I
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    if-eq v4, v5, :cond_0

    .line 63
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Cannot compare different SteamFeedItemProxy types."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    :cond_0
    move-object v3, p1

    .line 66
    check-cast v3, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    .line 68
    .local v3, "item":Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;
    iget-object v4, p0, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->broadcastSummary:Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    invoke-virtual {v4}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getEndTime()J

    move-result-wide v4

    invoke-virtual {v3}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-result-object v6

    invoke-virtual {v6}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getEndTime()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-gez v4, :cond_1

    .line 69
    const/4 v4, -0x1

    .line 76
    :goto_0
    return v4

    .line 72
    :cond_1
    iget-object v4, p0, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->broadcastSummary:Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    invoke-virtual {v4}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getEndTime()J

    move-result-wide v4

    invoke-virtual {v3}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-result-object v6

    invoke-virtual {v6}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getEndTime()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-lez v4, :cond_2

    .line 73
    const/4 v4, 0x1

    goto :goto_0

    .line 76
    :cond_2
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 24
    check-cast p1, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->compareTo(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic getBroadcastSummary()Lco/getair/meerkat/dtos/feed/BroadcastSummary;
    .locals 1

    .prologue
    .line 24
    invoke-virtual {p0}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-result-object v0

    return-object v0
.end method

.method public getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->broadcastSummary:Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    return-object v0
.end method

.method public getType()Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->Scheduled:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    return-object v0
.end method
