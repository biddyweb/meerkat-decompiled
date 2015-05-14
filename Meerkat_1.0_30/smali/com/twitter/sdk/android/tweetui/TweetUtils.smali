.class public final Lcom/twitter/sdk/android/tweetui/TweetUtils;
.super Ljava/lang/Object;
.source "TweetUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/tweetui/TweetUtils$LoggingCallback;
    }
.end annotation


# static fields
.field static final LOAD_TWEET_DEBUG:Ljava/lang/String; = "loadTweet failure for Tweet Id %d."

.field private static final PERMALINK_FORMAT:Ljava/lang/String; = "https://twitter.com/%s/status/%d"

.field private static final TAG:Ljava/lang/String; = "TweetUi"

.field private static final UNKNOWN_SCREEN_NAME:Ljava/lang/String; = "twitter_unknown"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getPermalink(Ljava/lang/String;J)Landroid/net/Uri;
    .locals 7
    .param p0, "screenName"    # Ljava/lang/String;
    .param p1, "tweetId"    # J

    .prologue
    const/4 v4, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 71
    const-wide/16 v2, 0x0

    cmp-long v1, p1, v2

    if-gtz v1, :cond_0

    .line 72
    const/4 v1, 0x0

    .line 81
    :goto_0
    return-object v1

    .line 76
    :cond_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 77
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "https://twitter.com/%s/status/%d"

    new-array v3, v4, [Ljava/lang/Object;

    const-string v4, "twitter_unknown"

    aput-object v4, v3, v5

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 81
    .local v0, "permalink":Ljava/lang/String;
    :goto_1
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    goto :goto_0

    .line 79
    .end local v0    # "permalink":Ljava/lang/String;
    :cond_1
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "https://twitter.com/%s/status/%d"

    new-array v3, v4, [Ljava/lang/Object;

    aput-object p0, v3, v5

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "permalink":Ljava/lang/String;
    goto :goto_1
.end method

.method static isTweetResolvable(Lcom/twitter/sdk/android/core/models/Tweet;)Z
    .locals 4
    .param p0, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 55
    if-eqz p0, :cond_0

    iget-wide v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->id:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->user:Lcom/twitter/sdk/android/core/models/User;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->user:Lcom/twitter/sdk/android/core/models/User;

    iget-object v0, v0, Lcom/twitter/sdk/android/core/models/User;->screenName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static loadTweet(JLcom/twitter/sdk/android/tweetui/LoadCallback;)V
    .locals 4
    .param p0, "tweetId"    # J
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
    .line 33
    .local p2, "cb":Lcom/twitter/sdk/android/tweetui/LoadCallback;, "Lcom/twitter/sdk/android/tweetui/LoadCallback<Lcom/twitter/sdk/android/core/models/Tweet;>;"
    invoke-static {}, Lcom/twitter/sdk/android/tweetui/TweetUi;->getInstance()Lcom/twitter/sdk/android/tweetui/TweetUi;

    move-result-object v0

    invoke-virtual {v0}, Lcom/twitter/sdk/android/tweetui/TweetUi;->getTweetRepository()Lcom/twitter/sdk/android/tweetui/TweetRepository;

    move-result-object v0

    new-instance v1, Lcom/twitter/sdk/android/tweetui/TweetUtils$LoggingCallback;

    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v2

    invoke-direct {v1, p0, p1, p2, v2}, Lcom/twitter/sdk/android/tweetui/TweetUtils$LoggingCallback;-><init>(JLcom/twitter/sdk/android/tweetui/LoadCallback;Lio/fabric/sdk/android/Logger;)V

    invoke-virtual {v0, p0, p1, v1}, Lcom/twitter/sdk/android/tweetui/TweetRepository;->loadTweet(JLcom/twitter/sdk/android/tweetui/LoadCallback;)V

    .line 35
    return-void
.end method

.method public static loadTweets(Ljava/util/List;Lcom/twitter/sdk/android/tweetui/LoadCallback;)V
    .locals 1
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
    .line 45
    .local p0, "tweetIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .local p1, "cb":Lcom/twitter/sdk/android/tweetui/LoadCallback;, "Lcom/twitter/sdk/android/tweetui/LoadCallback<Ljava/util/List<Lcom/twitter/sdk/android/core/models/Tweet;>;>;"
    invoke-static {}, Lcom/twitter/sdk/android/tweetui/TweetUi;->getInstance()Lcom/twitter/sdk/android/tweetui/TweetUi;

    move-result-object v0

    invoke-virtual {v0}, Lcom/twitter/sdk/android/tweetui/TweetUi;->getTweetRepository()Lcom/twitter/sdk/android/tweetui/TweetRepository;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/twitter/sdk/android/tweetui/TweetRepository;->loadTweets(Ljava/util/List;Lcom/twitter/sdk/android/tweetui/LoadCallback;)V

    .line 46
    return-void
.end method
