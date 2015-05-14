.class Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter$1;
.super Ljava/lang/Object;
.source "TweetViewFetchAdapter.java"

# interfaces
.implements Lcom/twitter/sdk/android/tweetui/LoadCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter;->setTweetIds(Ljava/util/List;Lcom/twitter/sdk/android/tweetui/LoadCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/twitter/sdk/android/tweetui/LoadCallback",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/twitter/sdk/android/core/models/Tweet;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter;

.field final synthetic val$cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter;Lcom/twitter/sdk/android/tweetui/LoadCallback;)V
    .locals 0

    .prologue
    .line 60
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter$1;, "Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter.1;"
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter$1;->this$0:Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter;

    iput-object p2, p0, Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter$1;->val$cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 1
    .param p1, "error"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 72
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter$1;, "Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter.1;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter$1;->val$cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    if-eqz v0, :cond_0

    .line 73
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter$1;->val$cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    invoke-interface {v0, p1}, Lcom/twitter/sdk/android/tweetui/LoadCallback;->failure(Lcom/twitter/sdk/android/core/TwitterException;)V

    .line 75
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 60
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter$1;, "Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter.1;"
    check-cast p1, Ljava/util/List;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter$1;->success(Ljava/util/List;)V

    return-void
.end method

.method public success(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter$1;, "Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter.1;"
    .local p1, "tweets":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/core/models/Tweet;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter$1;->this$0:Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter;

    invoke-virtual {v0, p1}, Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter;->setTweets(Ljava/util/List;)V

    .line 64
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter$1;->val$cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    if-eqz v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetViewFetchAdapter$1;->val$cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    invoke-interface {v0, p1}, Lcom/twitter/sdk/android/tweetui/LoadCallback;->success(Ljava/lang/Object;)V

    .line 67
    :cond_0
    return-void
.end method
