.class public Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline;
.super Ljava/lang/Object;
.source "SearchTimeline.java"

# interfaces
.implements Lcom/twitter/sdk/android/tweetui/internal/Timeline;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/twitter/sdk/android/tweetui/internal/Timeline",
        "<",
        "Lcom/twitter/sdk/android/core/models/Tweet;",
        ">;"
    }
.end annotation


# instance fields
.field private final query:Ljava/lang/String;

.field private final searchService:Lcom/twitter/sdk/android/core/services/SearchService;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/twitter/sdk/android/core/services/SearchService;)V
    .locals 0
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "service"    # Lcom/twitter/sdk/android/core/services/SearchService;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline;->query:Ljava/lang/String;

    .line 21
    iput-object p2, p0, Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline;->searchService:Lcom/twitter/sdk/android/core/services/SearchService;

    .line 22
    return-void
.end method

.method private getSearchCallback(Lcom/twitter/sdk/android/core/Callback;)Lcom/twitter/sdk/android/core/Callback;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            ">;>;)",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/models/Search;",
            ">;"
        }
    .end annotation

    .prologue
    .line 43
    .local p1, "cb":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Ljava/util/List<Lcom/twitter/sdk/android/core/models/Tweet;>;>;"
    new-instance v0, Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline$1;

    invoke-direct {v0, p0, p1}, Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline$1;-><init>(Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline;Lcom/twitter/sdk/android/core/Callback;)V

    return-object v0
.end method


# virtual methods
.method public newer(Ljava/lang/Integer;Ljava/lang/Long;Lcom/twitter/sdk/android/core/Callback;)V
    .locals 12
    .param p1, "count"    # Ljava/lang/Integer;
    .param p2, "sinceId"    # Ljava/lang/Long;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .local p3, "cb":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Ljava/util/List<Lcom/twitter/sdk/android/core/models/Tweet;>;>;"
    const/4 v2, 0x0

    .line 26
    invoke-direct {p0, p3}, Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline;->getSearchCallback(Lcom/twitter/sdk/android/core/Callback;)Lcom/twitter/sdk/android/core/Callback;

    move-result-object v11

    .line 27
    .local v11, "searchCallback":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/twitter/sdk/android/core/models/Search;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline;->searchService:Lcom/twitter/sdk/android/core/services/SearchService;

    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline;->query:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    move-object v6, p1

    move-object v7, v2

    move-object v8, p2

    move-object v9, v2

    invoke-interface/range {v0 .. v11}, Lcom/twitter/sdk/android/core/services/SearchService;->tweets(Ljava/lang/String;Lcom/twitter/sdk/android/core/services/params/Geocode;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;Lcom/twitter/sdk/android/core/Callback;)V

    .line 29
    return-void
.end method

.method public older(Ljava/lang/Integer;Ljava/lang/Long;Lcom/twitter/sdk/android/core/Callback;)V
    .locals 12
    .param p1, "count"    # Ljava/lang/Integer;
    .param p2, "maxId"    # Ljava/lang/Long;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .local p3, "cb":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Ljava/util/List<Lcom/twitter/sdk/android/core/models/Tweet;>;>;"
    const/4 v2, 0x0

    .line 33
    invoke-direct {p0, p3}, Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline;->getSearchCallback(Lcom/twitter/sdk/android/core/Callback;)Lcom/twitter/sdk/android/core/Callback;

    move-result-object v11

    .line 34
    .local v11, "searchCallback":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/twitter/sdk/android/core/models/Search;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline;->searchService:Lcom/twitter/sdk/android/core/services/SearchService;

    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline;->query:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    move-object v6, p1

    move-object v7, v2

    move-object v8, v2

    move-object v9, p2

    invoke-interface/range {v0 .. v11}, Lcom/twitter/sdk/android/core/services/SearchService;->tweets(Ljava/lang/String;Lcom/twitter/sdk/android/core/services/params/Geocode;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;Lcom/twitter/sdk/android/core/Callback;)V

    .line 36
    return-void
.end method
