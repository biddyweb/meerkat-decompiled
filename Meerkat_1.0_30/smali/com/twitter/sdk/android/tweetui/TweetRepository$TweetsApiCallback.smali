.class Lcom/twitter/sdk/android/tweetui/TweetRepository$TweetsApiCallback;
.super Lcom/twitter/sdk/android/tweetui/ApiCallback;
.source "TweetRepository.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/twitter/sdk/android/tweetui/TweetRepository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TweetsApiCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/twitter/sdk/android/tweetui/ApiCallback",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/twitter/sdk/android/core/models/Tweet;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/tweetui/TweetRepository;

.field tweetIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/tweetui/TweetRepository;Ljava/util/List;Lcom/twitter/sdk/android/tweetui/LoadCallback;)V
    .locals 0
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
    .line 163
    .local p2, "tweetIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .local p3, "cb":Lcom/twitter/sdk/android/tweetui/LoadCallback;, "Lcom/twitter/sdk/android/tweetui/LoadCallback<Ljava/util/List<Lcom/twitter/sdk/android/core/models/Tweet;>;>;"
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$TweetsApiCallback;->this$0:Lcom/twitter/sdk/android/tweetui/TweetRepository;

    .line 164
    invoke-direct {p0, p3}, Lcom/twitter/sdk/android/tweetui/ApiCallback;-><init>(Lcom/twitter/sdk/android/tweetui/LoadCallback;)V

    .line 165
    iput-object p2, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$TweetsApiCallback;->tweetIds:Ljava/util/List;

    .line 166
    return-void
.end method


# virtual methods
.method public success(Lcom/twitter/sdk/android/core/Result;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 171
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Ljava/util/List<Lcom/twitter/sdk/android/core/models/Tweet;>;>;"
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$TweetsApiCallback;->cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    if-eqz v1, :cond_0

    .line 172
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$TweetsApiCallback;->tweetIds:Ljava/util/List;

    iget-object v1, p1, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    invoke-static {v2, v1}, Lcom/twitter/sdk/android/tweetui/Utils;->orderTweets(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 173
    .local v0, "sorted":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/core/models/Tweet;>;"
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$TweetsApiCallback;->cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    invoke-interface {v1, v0}, Lcom/twitter/sdk/android/tweetui/LoadCallback;->success(Ljava/lang/Object;)V

    .line 175
    .end local v0    # "sorted":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/core/models/Tweet;>;"
    :cond_0
    return-void
.end method
