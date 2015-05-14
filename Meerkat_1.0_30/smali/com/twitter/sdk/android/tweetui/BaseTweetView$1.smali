.class Lcom/twitter/sdk/android/tweetui/BaseTweetView$1;
.super Ljava/lang/Object;
.source "BaseTweetView.java"

# interfaces
.implements Lcom/twitter/sdk/android/tweetui/LoadCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/tweetui/BaseTweetView;->loadTweet()V
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
        "Lcom/twitter/sdk/android/core/models/Tweet;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/tweetui/BaseTweetView;

.field final synthetic val$tweetId:J


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/tweetui/BaseTweetView;J)V
    .locals 0

    .prologue
    .line 450
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$1;->this$0:Lcom/twitter/sdk/android/tweetui/BaseTweetView;

    iput-wide p2, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$1;->val$tweetId:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 8
    .param p1, "e"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 458
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "TweetUi"

    const-string v2, "loadTweet failure for Tweet Id %d."

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-wide v6, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$1;->val$tweetId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 460
    return-void
.end method

.method public success(Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 1
    .param p1, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 453
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$1;->this$0:Lcom/twitter/sdk/android/tweetui/BaseTweetView;

    invoke-virtual {v0, p1}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setTweet(Lcom/twitter/sdk/android/core/models/Tweet;)V

    .line 454
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 450
    check-cast p1, Lcom/twitter/sdk/android/core/models/Tweet;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$1;->success(Lcom/twitter/sdk/android/core/models/Tweet;)V

    return-void
.end method
