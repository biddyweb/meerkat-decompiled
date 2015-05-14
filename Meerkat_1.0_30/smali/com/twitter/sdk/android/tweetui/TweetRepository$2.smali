.class Lcom/twitter/sdk/android/tweetui/TweetRepository$2;
.super Lcom/twitter/sdk/android/core/Callback;
.source "TweetRepository.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/tweetui/TweetRepository;->loadTweets(Ljava/util/List;Lcom/twitter/sdk/android/tweetui/LoadCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/twitter/sdk/android/core/Callback",
        "<",
        "Lcom/twitter/sdk/android/core/TwitterApiClient;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/tweetui/TweetRepository;

.field final synthetic val$cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

.field final synthetic val$tweetIds:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/tweetui/TweetRepository;Ljava/util/List;Lcom/twitter/sdk/android/tweetui/LoadCallback;)V
    .locals 0

    .prologue
    .line 103
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$2;->this$0:Lcom/twitter/sdk/android/tweetui/TweetRepository;

    iput-object p2, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$2;->val$tweetIds:Ljava/util/List;

    iput-object p3, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$2;->val$cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    invoke-direct {p0}, Lcom/twitter/sdk/android/core/Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 3
    .param p1, "exception"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 113
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "TweetUi"

    const-string v2, "Auth could not be obtained."

    invoke-interface {v0, v1, v2, p1}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 114
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$2;->val$cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    if-eqz v0, :cond_0

    .line 115
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$2;->val$cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    invoke-interface {v0, p1}, Lcom/twitter/sdk/android/tweetui/LoadCallback;->failure(Lcom/twitter/sdk/android/core/TwitterException;)V

    .line 117
    :cond_0
    return-void
.end method

.method public success(Lcom/twitter/sdk/android/core/Result;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<",
            "Lcom/twitter/sdk/android/core/TwitterApiClient;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lcom/twitter/sdk/android/core/TwitterApiClient;>;"
    const/4 v2, 0x0

    .line 106
    const-string v0, ","

    iget-object v3, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$2;->val$tweetIds:Ljava/util/List;

    invoke-static {v0, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    .line 107
    .local v1, "commaSepIds":Ljava/lang/String;
    iget-object v0, p1, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    check-cast v0, Lcom/twitter/sdk/android/core/TwitterApiClient;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/TwitterApiClient;->getStatusesService()Lcom/twitter/sdk/android/core/services/StatusesService;

    move-result-object v0

    new-instance v5, Lcom/twitter/sdk/android/tweetui/TweetRepository$TweetsApiCallback;

    iget-object v3, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$2;->this$0:Lcom/twitter/sdk/android/tweetui/TweetRepository;

    iget-object v4, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$2;->val$tweetIds:Ljava/util/List;

    iget-object v6, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$2;->val$cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    invoke-direct {v5, v3, v4, v6}, Lcom/twitter/sdk/android/tweetui/TweetRepository$TweetsApiCallback;-><init>(Lcom/twitter/sdk/android/tweetui/TweetRepository;Ljava/util/List;Lcom/twitter/sdk/android/tweetui/LoadCallback;)V

    move-object v3, v2

    move-object v4, v2

    invoke-interface/range {v0 .. v5}, Lcom/twitter/sdk/android/core/services/StatusesService;->lookup(Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Lcom/twitter/sdk/android/core/Callback;)V

    .line 109
    return-void
.end method
