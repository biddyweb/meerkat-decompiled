.class Lcom/twitter/sdk/android/tweetui/TweetRepository$3;
.super Ljava/lang/Object;
.source "TweetRepository.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/tweetui/TweetRepository;->deliverTweet(Lcom/twitter/sdk/android/core/models/Tweet;Lcom/twitter/sdk/android/tweetui/LoadCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/tweetui/TweetRepository;

.field final synthetic val$cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

.field final synthetic val$tweet:Lcom/twitter/sdk/android/core/models/Tweet;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/tweetui/TweetRepository;Lcom/twitter/sdk/android/tweetui/LoadCallback;Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 0

    .prologue
    .line 130
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$3;->this$0:Lcom/twitter/sdk/android/tweetui/TweetRepository;

    iput-object p2, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$3;->val$cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    iput-object p3, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$3;->val$tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 133
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$3;->val$cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetRepository$3;->val$tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    invoke-interface {v0, v1}, Lcom/twitter/sdk/android/tweetui/LoadCallback;->success(Ljava/lang/Object;)V

    .line 134
    return-void
.end method
