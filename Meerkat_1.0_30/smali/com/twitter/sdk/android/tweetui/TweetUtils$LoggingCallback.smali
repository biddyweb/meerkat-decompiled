.class Lcom/twitter/sdk/android/tweetui/TweetUtils$LoggingCallback;
.super Ljava/lang/Object;
.source "TweetUtils.java"

# interfaces
.implements Lcom/twitter/sdk/android/tweetui/LoadCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/twitter/sdk/android/tweetui/TweetUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LoggingCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/twitter/sdk/android/tweetui/LoadCallback",
        "<",
        "Lcom/twitter/sdk/android/core/models/Tweet;",
        ">;"
    }
.end annotation


# instance fields
.field private final cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/twitter/sdk/android/tweetui/LoadCallback",
            "<",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            ">;"
        }
    .end annotation
.end field

.field private final logger:Lio/fabric/sdk/android/Logger;

.field private final tweetId:J


# direct methods
.method constructor <init>(JLcom/twitter/sdk/android/tweetui/LoadCallback;Lio/fabric/sdk/android/Logger;)V
    .locals 1
    .param p1, "tweetId"    # J
    .param p4, "logger"    # Lio/fabric/sdk/android/Logger;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/twitter/sdk/android/tweetui/LoadCallback",
            "<",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            ">;",
            "Lio/fabric/sdk/android/Logger;",
            ")V"
        }
    .end annotation

    .prologue
    .line 93
    .local p3, "cb":Lcom/twitter/sdk/android/tweetui/LoadCallback;, "Lcom/twitter/sdk/android/tweetui/LoadCallback<Lcom/twitter/sdk/android/core/models/Tweet;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput-wide p1, p0, Lcom/twitter/sdk/android/tweetui/TweetUtils$LoggingCallback;->tweetId:J

    .line 95
    iput-object p3, p0, Lcom/twitter/sdk/android/tweetui/TweetUtils$LoggingCallback;->cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    .line 96
    iput-object p4, p0, Lcom/twitter/sdk/android/tweetui/TweetUtils$LoggingCallback;->logger:Lio/fabric/sdk/android/Logger;

    .line 97
    return-void
.end method


# virtual methods
.method public failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 8
    .param p1, "exception"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 108
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetUtils$LoggingCallback;->logger:Lio/fabric/sdk/android/Logger;

    const-string v1, "TweetUi"

    const-string v2, "loadTweet failure for Tweet Id %d."

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-wide v6, p0, Lcom/twitter/sdk/android/tweetui/TweetUtils$LoggingCallback;->tweetId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetUtils$LoggingCallback;->cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    if-eqz v0, :cond_0

    .line 110
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetUtils$LoggingCallback;->cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    invoke-interface {v0, p1}, Lcom/twitter/sdk/android/tweetui/LoadCallback;->failure(Lcom/twitter/sdk/android/core/TwitterException;)V

    .line 112
    :cond_0
    return-void
.end method

.method public success(Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 1
    .param p1, "loadedItem"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 101
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetUtils$LoggingCallback;->cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    if-eqz v0, :cond_0

    .line 102
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetUtils$LoggingCallback;->cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    invoke-interface {v0, p1}, Lcom/twitter/sdk/android/tweetui/LoadCallback;->success(Ljava/lang/Object;)V

    .line 104
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 88
    check-cast p1, Lcom/twitter/sdk/android/core/models/Tweet;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/twitter/sdk/android/tweetui/TweetUtils$LoggingCallback;->success(Lcom/twitter/sdk/android/core/models/Tweet;)V

    return-void
.end method
