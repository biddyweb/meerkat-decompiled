.class public Lco/getair/meerkat/dtos/feed/FeedStream;
.super Ljava/lang/Object;
.source "FeedStream.java"


# instance fields
.field private final LOG_TAG:Ljava/lang/String;

.field private broadcastSummaryUrl:Ljava/lang/String;

.field private didILike:Z

.field private didIRestream:Z

.field private id:Ljava/lang/String;

.field private influencers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/dtos/Influencer;",
            ">;"
        }
    .end annotation
.end field

.field private isMine:Z

.field private score:I

.field private topInfluencer:Lco/getair/meerkat/dtos/Influencer;


# direct methods
.method public constructor <init>(Ljava/util/Map;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "liveStreamMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v4, 0x0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const-string v3, "FeedBroacast"

    iput-object v3, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->LOG_TAG:Ljava/lang/String;

    .line 24
    const-string v3, ""

    iput-object v3, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->id:Ljava/lang/String;

    .line 25
    const-string v3, ""

    iput-object v3, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->broadcastSummaryUrl:Ljava/lang/String;

    .line 26
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v3

    iput-object v3, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->influencers:Ljava/util/List;

    .line 27
    const/4 v3, 0x0

    iput-object v3, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->topInfluencer:Lco/getair/meerkat/dtos/Influencer;

    .line 28
    iput-boolean v4, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->didIRestream:Z

    .line 29
    iput-boolean v4, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->didILike:Z

    .line 30
    iput-boolean v4, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->isMine:Z

    .line 31
    iput v4, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->score:I

    .line 41
    :try_start_0
    const-string v3, "id"

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->id:Ljava/lang/String;

    .line 42
    invoke-virtual {p0}, Lco/getair/meerkat/dtos/feed/FeedStream;->getLinkUrlKey()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->broadcastSummaryUrl:Ljava/lang/String;

    .line 43
    const-string v3, "influencers"

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 45
    .local v2, "influencersStringsArray":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 46
    .local v1, "influencerString":Ljava/lang/String;
    iget-object v4, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->influencers:Ljava/util/List;

    new-instance v5, Lco/getair/meerkat/dtos/Influencer;

    invoke-direct {v5, v1}, Lco/getair/meerkat/dtos/Influencer;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 50
    .end local v1    # "influencerString":Ljava/lang/String;
    .end local v2    # "influencersStringsArray":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v0

    .line 51
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "FeedBroacast"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    return-void

    .line 49
    .restart local v2    # "influencersStringsArray":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lco/getair/meerkat/dtos/feed/FeedStream;->parseInfluencers()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private parseInfluencers()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 72
    const/4 v0, 0x0

    .line 73
    .local v0, "currentInfluencer":Lco/getair/meerkat/dtos/Influencer;
    sget-object v1, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeNone:Lco/getair/meerkat/dtos/Influencer$Type;

    .line 75
    .local v1, "currentRelation":Lco/getair/meerkat/dtos/Influencer$Type;
    iget-object v3, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->influencers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/dtos/Influencer;

    .line 77
    .local v2, "influencer":Lco/getair/meerkat/dtos/Influencer;
    invoke-virtual {v2}, Lco/getair/meerkat/dtos/Influencer;->getType()Lco/getair/meerkat/dtos/Influencer$Type;

    move-result-object v4

    sget-object v5, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeLiker:Lco/getair/meerkat/dtos/Influencer$Type;

    if-ne v4, v5, :cond_1

    invoke-virtual {v2}, Lco/getair/meerkat/dtos/Influencer;->isMe()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 78
    iput-boolean v6, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->didILike:Z

    .line 81
    :cond_1
    invoke-virtual {v2}, Lco/getair/meerkat/dtos/Influencer;->getType()Lco/getair/meerkat/dtos/Influencer$Type;

    move-result-object v4

    sget-object v5, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeRestreamer:Lco/getair/meerkat/dtos/Influencer$Type;

    if-ne v4, v5, :cond_2

    invoke-virtual {v2}, Lco/getair/meerkat/dtos/Influencer;->isMe()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 82
    iput-boolean v6, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->didIRestream:Z

    .line 85
    :cond_2
    invoke-virtual {v2}, Lco/getair/meerkat/dtos/Influencer;->getType()Lco/getair/meerkat/dtos/Influencer$Type;

    move-result-object v4

    sget-object v5, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeBroadcaster:Lco/getair/meerkat/dtos/Influencer$Type;

    if-ne v4, v5, :cond_3

    invoke-virtual {v2}, Lco/getair/meerkat/dtos/Influencer;->isMe()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 86
    iput-boolean v6, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->isMine:Z

    .line 89
    :cond_3
    invoke-virtual {v2}, Lco/getair/meerkat/dtos/Influencer;->isMe()Z

    move-result v4

    if-nez v4, :cond_0

    .line 90
    invoke-virtual {v2}, Lco/getair/meerkat/dtos/Influencer;->isRelevantForMe()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 91
    invoke-virtual {v2}, Lco/getair/meerkat/dtos/Influencer;->getType()Lco/getair/meerkat/dtos/Influencer$Type;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/dtos/Influencer$Type;->ordinal()I

    move-result v4

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/Influencer$Type;->ordinal()I

    move-result v5

    if-le v4, v5, :cond_0

    .line 92
    invoke-virtual {v2}, Lco/getair/meerkat/dtos/Influencer;->getType()Lco/getair/meerkat/dtos/Influencer$Type;

    move-result-object v1

    .line 93
    move-object v0, v2

    goto :goto_0

    .line 98
    .end local v2    # "influencer":Lco/getair/meerkat/dtos/Influencer;
    :cond_4
    iput-object v0, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->topInfluencer:Lco/getair/meerkat/dtos/Influencer;

    .line 99
    return-void
.end method


# virtual methods
.method public didIRestream()Z
    .locals 1

    .prologue
    .line 102
    iget-boolean v0, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->didIRestream:Z

    return v0
.end method

.method public getBroadcastSummaryUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->broadcastSummaryUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->id:Ljava/lang/String;

    return-object v0
.end method

.method protected getLinkUrlKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    const-string v0, ""

    return-object v0
.end method

.method public getScore()I
    .locals 1

    .prologue
    .line 68
    iget v0, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->score:I

    return v0
.end method

.method public getTopInfluencer()Lco/getair/meerkat/dtos/Influencer;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/FeedStream;->topInfluencer:Lco/getair/meerkat/dtos/Influencer;

    return-object v0
.end method
