.class Lcom/twitter/sdk/android/tweetui/TweetRepository$TweetApiCallback;
.super Lcom/twitter/sdk/android/tweetui/ApiCallback;
.source "TweetRepository.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/twitter/sdk/android/tweetui/TweetRepository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TweetApiCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/twitter/sdk/android/tweetui/ApiCallback",
        "<",
        "Lcom/twitter/sdk/android/core/models/Tweet;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/tweetui/TweetRepository;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/tweetui/TweetRepository;Lcom/twitter/sdk/android/tweetui/LoadCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/tweetui/LoadCallback",
            "<",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 140
    .local p2, "cb":Lcom/twitter/sdk/android/tweetui/LoadCallback;, "Lcom/twitter/sdk/android/tweetui/LoadCallback<Lcom/twitter/sdk/android/core/models/Tweet;>;"
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$TweetApiCallback;->this$0:Lcom/twitter/sdk/android/tweetui/TweetRepository;

    .line 141
    invoke-direct {p0, p2}, Lcom/twitter/sdk/android/tweetui/ApiCallback;-><init>(Lcom/twitter/sdk/android/tweetui/LoadCallback;)V

    .line 142
    return-void
.end method


# virtual methods
.method public success(Lcom/twitter/sdk/android/core/Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 152
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lcom/twitter/sdk/android/core/models/Tweet;>;"
    iget-object v0, p1, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    check-cast v0, Lcom/twitter/sdk/android/core/models/Tweet;

    .line 153
    .local v0, "tweet":Lcom/twitter/sdk/android/core/models/Tweet;
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$TweetApiCallback;->this$0:Lcom/twitter/sdk/android/tweetui/TweetRepository;

    invoke-virtual {v1, v0}, Lcom/twitter/sdk/android/tweetui/TweetRepository;->updateCache(Lcom/twitter/sdk/android/core/models/Tweet;)V

    .line 154
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$TweetApiCallback;->cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    if-eqz v1, :cond_0

    .line 155
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$TweetApiCallback;->cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    invoke-interface {v1, v0}, Lcom/twitter/sdk/android/tweetui/LoadCallback;->success(Ljava/lang/Object;)V

    .line 157
    :cond_0
    return-void
.end method
