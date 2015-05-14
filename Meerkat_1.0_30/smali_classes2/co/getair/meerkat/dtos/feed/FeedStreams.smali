.class public Lco/getair/meerkat/dtos/feed/FeedStreams;
.super Ljava/lang/Object;
.source "FeedStreams.java"


# instance fields
.field private final LOG_TAG:Ljava/lang/String;

.field private feedStreams:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/dtos/feed/FeedStream;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/lang/Class;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/lang/Class",
            "<+",
            "Lco/getair/meerkat/dtos/feed/FeedStream;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p1, "feedObjects":Ljava/util/List;, "Ljava/util/List<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "typeClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lco/getair/meerkat/dtos/feed/FeedStream;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const-string v5, "FeedLiveStreams"

    iput-object v5, p0, Lco/getair/meerkat/dtos/feed/FeedStreams;->LOG_TAG:Ljava/lang/String;

    .line 23
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v5

    iput-object v5, p0, Lco/getair/meerkat/dtos/feed/FeedStreams;->feedStreams:Ljava/util/List;

    .line 27
    :try_start_0
    const-class v4, Ljava/util/HashMap;

    .line 28
    .local v4, "hashMapClass":Ljava/lang/Class;
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    aput-object v4, v5, v6

    invoke-virtual {p2, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 30
    .local v0, "constructor":Ljava/lang/reflect/Constructor;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 31
    .local v3, "feedObject":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v3, v6, v7

    invoke-virtual {v0, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/dtos/feed/FeedStream;

    .line 33
    .local v2, "feedLiveStream":Lco/getair/meerkat/dtos/feed/FeedStream;
    iget-object v6, p0, Lco/getair/meerkat/dtos/feed/FeedStreams;->feedStreams:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 35
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;
    .end local v2    # "feedLiveStream":Lco/getair/meerkat/dtos/feed/FeedStream;
    .end local v3    # "feedObject":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v4    # "hashMapClass":Ljava/lang/Class;
    :catch_0
    move-exception v1

    .line 36
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    .line 38
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    return-void
.end method


# virtual methods
.method public filterRelevantStreams(Z)Ljava/util/List;
    .locals 5
    .param p1, "doFilter"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/dtos/feed/FeedStream;",
            ">;"
        }
    .end annotation

    .prologue
    .line 42
    if-eqz p1, :cond_1

    .line 43
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v1

    .line 45
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/dtos/feed/FeedStream;>;"
    iget-object v3, p0, Lco/getair/meerkat/dtos/feed/FeedStreams;->feedStreams:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/dtos/feed/FeedStream;

    .line 46
    .local v2, "stream":Lco/getair/meerkat/dtos/feed/FeedStream;
    invoke-virtual {v2}, Lco/getair/meerkat/dtos/feed/FeedStream;->getTopInfluencer()Lco/getair/meerkat/dtos/Influencer;

    move-result-object v0

    .line 48
    .local v0, "influencer":Lco/getair/meerkat/dtos/Influencer;
    if-eqz v0, :cond_0

    .line 49
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 55
    .end local v0    # "influencer":Lco/getair/meerkat/dtos/Influencer;
    .end local v1    # "result":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/dtos/feed/FeedStream;>;"
    .end local v2    # "stream":Lco/getair/meerkat/dtos/feed/FeedStream;
    :cond_1
    iget-object v1, p0, Lco/getair/meerkat/dtos/feed/FeedStreams;->feedStreams:Ljava/util/List;

    :cond_2
    return-object v1
.end method
