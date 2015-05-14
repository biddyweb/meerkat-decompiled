.class public Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;
.super Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
.source "StreamFeedLiveItemProxy.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy",
        "<",
        "Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;",
        ">;"
    }
.end annotation


# instance fields
.field broadcastSummary:Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;IZLco/getair/meerkat/dtos/feed/LiveBroadcastSummary;Lco/getair/meerkat/dtos/Influencer;Ljava/util/HashMap;)V
    .locals 8
    .param p1, "proxyName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "version"    # I
    .param p4, "didRestream"    # Z
    .param p5, "broadcastSummary"    # Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;
    .param p6, "influencer"    # Lco/getair/meerkat/dtos/Influencer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/content/Context;",
            "IZ",
            "Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;",
            "Lco/getair/meerkat/dtos/Influencer;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 37
    .line 41
    .local p7, "followupActions":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p5}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getId()Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v6, p6

    move-object v7, p7

    .line 37
    invoke-direct/range {v0 .. v7}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;-><init>(Ljava/lang/String;Landroid/content/Context;IZLjava/lang/String;Lco/getair/meerkat/dtos/Influencer;Ljava/util/HashMap;)V

    .line 28
    const/4 v0, 0x0

    iput-object v0, p0, Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;->broadcastSummary:Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    .line 45
    invoke-static {p5}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    iput-object p5, p0, Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;->broadcastSummary:Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    .line 48
    return-void
.end method


# virtual methods
.method public compareTo(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;)I
    .locals 6
    .param p1, "another"    # Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    .prologue
    .line 66
    const/4 v1, -0x1

    .line 67
    .local v1, "BEFORE":I
    const/4 v2, 0x0

    .line 68
    .local v2, "EQUAL":I
    const/4 v0, 0x1

    .line 70
    .local v0, "AFTER":I
    invoke-virtual {p0}, Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;->getScore()I

    move-result v4

    .line 71
    .local v4, "score":I
    invoke-virtual {p1}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->getScore()I

    move-result v3

    .line 73
    .local v3, "otherScore":I
    if-le v4, v3, :cond_0

    .line 74
    const/4 v5, -0x1

    .line 81
    :goto_0
    return v5

    .line 77
    :cond_0
    if-ge v4, v3, :cond_1

    .line 78
    const/4 v5, 0x1

    goto :goto_0

    .line 81
    :cond_1
    const/4 v5, 0x0

    goto :goto_0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 26
    check-cast p1, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;->compareTo(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic getBroadcastSummary()Lco/getair/meerkat/dtos/feed/BroadcastSummary;
    .locals 1

    .prologue
    .line 26
    invoke-virtual {p0}, Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    move-result-object v0

    return-object v0
.end method

.method public getBroadcastSummary()Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;->broadcastSummary:Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    return-object v0
.end method

.method public getScore()I
    .locals 2

    .prologue
    .line 57
    invoke-super {p0}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->getScore()I

    move-result v0

    iget-object v1, p0, Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;->broadcastSummary:Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getLikesCount()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getType()Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->Live:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    return-object v0
.end method
