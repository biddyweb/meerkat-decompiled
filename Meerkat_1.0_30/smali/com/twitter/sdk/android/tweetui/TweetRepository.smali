.class Lcom/twitter/sdk/android/tweetui/TweetRepository;
.super Lcom/twitter/sdk/android/tweetui/Repository;
.source "TweetRepository.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/tweetui/TweetRepository$TweetsApiCallback;,
        Lcom/twitter/sdk/android/tweetui/TweetRepository$TweetApiCallback;
    }
.end annotation


# static fields
.field private static final AUTH_ERROR:Ljava/lang/String; = "Auth could not be obtained."

.field private static final DEFAULT_CACHE_SIZE:I = 0x14

.field private static final TAG:Ljava/lang/String; = "TweetUi"


# instance fields
.field final formatCache:Landroid/support/v4/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/LruCache",
            "<",
            "Ljava/lang/Long;",
            "Lcom/twitter/sdk/android/tweetui/FormattedTweetText;",
            ">;"
        }
    .end annotation
.end field

.field final tweetCache:Landroid/support/v4/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/LruCache",
            "<",
            "Ljava/lang/Long;",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/tweetui/TweetUi;Ljava/util/concurrent/ExecutorService;Landroid/os/Handler;Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;)V
    .locals 2
    .param p1, "tweetUiKit"    # Lcom/twitter/sdk/android/tweetui/TweetUi;
    .param p2, "executorService"    # Ljava/util/concurrent/ExecutorService;
    .param p3, "mainHandler"    # Landroid/os/Handler;
    .param p4, "queue"    # Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;

    .prologue
    const/16 v1, 0x14

    .line 36
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/twitter/sdk/android/tweetui/Repository;-><init>(Lcom/twitter/sdk/android/tweetui/TweetUi;Ljava/util/concurrent/ExecutorService;Landroid/os/Handler;Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;)V

    .line 38
    new-instance v0, Landroid/support/v4/util/LruCache;

    invoke-direct {v0, v1}, Landroid/support/v4/util/LruCache;-><init>(I)V

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository;->tweetCache:Landroid/support/v4/util/LruCache;

    .line 39
    new-instance v0, Landroid/support/v4/util/LruCache;

    invoke-direct {v0, v1}, Landroid/support/v4/util/LruCache;-><init>(I)V

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository;->formatCache:Landroid/support/v4/util/LruCache;

    .line 40
    return-void
.end method

.method private deliverTweet(Lcom/twitter/sdk/android/core/models/Tweet;Lcom/twitter/sdk/android/tweetui/LoadCallback;)V
    .locals 2
    .param p1, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            "Lcom/twitter/sdk/android/tweetui/LoadCallback",
            "<",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 129
    .local p2, "cb":Lcom/twitter/sdk/android/tweetui/LoadCallback;, "Lcom/twitter/sdk/android/tweetui/LoadCallback<Lcom/twitter/sdk/android/core/models/Tweet;>;"
    if-nez p2, :cond_0

    .line 136
    :goto_0
    return-void

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository;->mainHandler:Landroid/os/Handler;

    new-instance v1, Lcom/twitter/sdk/android/tweetui/TweetRepository$3;

    invoke-direct {v1, p0, p2, p1}, Lcom/twitter/sdk/android/tweetui/TweetRepository$3;-><init>(Lcom/twitter/sdk/android/tweetui/TweetRepository;Lcom/twitter/sdk/android/tweetui/LoadCallback;Lcom/twitter/sdk/android/core/models/Tweet;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method


# virtual methods
.method formatTweetText(Lcom/twitter/sdk/android/core/models/Tweet;)Lcom/twitter/sdk/android/tweetui/FormattedTweetText;
    .locals 6
    .param p1, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 49
    if-nez p1, :cond_1

    const/4 v0, 0x0

    .line 60
    :cond_0
    :goto_0
    return-object v0

    .line 51
    :cond_1
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository;->formatCache:Landroid/support/v4/util/LruCache;

    iget-wide v4, p1, Lcom/twitter/sdk/android/core/models/Tweet;->id:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v4/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/tweetui/FormattedTweetText;

    .line 53
    .local v0, "cached":Lcom/twitter/sdk/android/tweetui/FormattedTweetText;
    if-nez v0, :cond_0

    .line 55
    invoke-static {p1}, Lcom/twitter/sdk/android/tweetui/TweetTextUtils;->formatTweetText(Lcom/twitter/sdk/android/core/models/Tweet;)Lcom/twitter/sdk/android/tweetui/FormattedTweetText;

    move-result-object v1

    .line 56
    .local v1, "formattedTweetText":Lcom/twitter/sdk/android/tweetui/FormattedTweetText;
    if-eqz v1, :cond_2

    iget-object v2, v1, Lcom/twitter/sdk/android/tweetui/FormattedTweetText;->text:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 57
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository;->formatCache:Landroid/support/v4/util/LruCache;

    iget-wide v4, p1, Lcom/twitter/sdk/android/core/models/Tweet;->id:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Landroid/support/v4/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    move-object v0, v1

    .line 60
    goto :goto_0
.end method

.method loadTweet(JLcom/twitter/sdk/android/tweetui/LoadCallback;)V
    .locals 3
    .param p1, "tweetId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/twitter/sdk/android/tweetui/LoadCallback",
            "<",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 71
    .local p3, "cb":Lcom/twitter/sdk/android/tweetui/LoadCallback;, "Lcom/twitter/sdk/android/tweetui/LoadCallback<Lcom/twitter/sdk/android/core/models/Tweet;>;"
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository;->tweetCache:Landroid/support/v4/util/LruCache;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/models/Tweet;

    .line 73
    .local v0, "cachedTweet":Lcom/twitter/sdk/android/core/models/Tweet;
    if-eqz v0, :cond_0

    .line 74
    invoke-direct {p0, v0, p3}, Lcom/twitter/sdk/android/tweetui/TweetRepository;->deliverTweet(Lcom/twitter/sdk/android/core/models/Tweet;Lcom/twitter/sdk/android/tweetui/LoadCallback;)V

    .line 93
    :goto_0
    return-void

    .line 78
    :cond_0
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository;->queue:Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;

    new-instance v2, Lcom/twitter/sdk/android/tweetui/TweetRepository$1;

    invoke-direct {v2, p0, p1, p2, p3}, Lcom/twitter/sdk/android/tweetui/TweetRepository$1;-><init>(Lcom/twitter/sdk/android/tweetui/TweetRepository;JLcom/twitter/sdk/android/tweetui/LoadCallback;)V

    invoke-virtual {v1, v2}, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->addRequest(Lcom/twitter/sdk/android/core/Callback;)Z

    goto :goto_0
.end method

.method loadTweets(Ljava/util/List;Lcom/twitter/sdk/android/tweetui/LoadCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;",
            "Lcom/twitter/sdk/android/tweetui/LoadCallback",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 103
    .local p1, "tweetIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .local p2, "cb":Lcom/twitter/sdk/android/tweetui/LoadCallback;, "Lcom/twitter/sdk/android/tweetui/LoadCallback<Ljava/util/List<Lcom/twitter/sdk/android/core/models/Tweet;>;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository;->queue:Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;

    new-instance v1, Lcom/twitter/sdk/android/tweetui/TweetRepository$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/twitter/sdk/android/tweetui/TweetRepository$2;-><init>(Lcom/twitter/sdk/android/tweetui/TweetRepository;Ljava/util/List;Lcom/twitter/sdk/android/tweetui/LoadCallback;)V

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->addRequest(Lcom/twitter/sdk/android/core/Callback;)Z

    .line 119
    return-void
.end method

.method protected updateCache(Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 4
    .param p1, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 122
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository;->tweetCache:Landroid/support/v4/util/LruCache;

    iget-wide v2, p1, Lcom/twitter/sdk/android/core/models/Tweet;->id:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v4/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    return-void
.end method
