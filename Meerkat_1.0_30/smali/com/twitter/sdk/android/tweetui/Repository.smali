.class abstract Lcom/twitter/sdk/android/tweetui/Repository;
.super Ljava/lang/Object;
.source "Repository.java"


# instance fields
.field protected final executorService:Ljava/util/concurrent/ExecutorService;

.field protected final mainHandler:Landroid/os/Handler;

.field protected final queue:Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;

.field protected final tweetUiKit:Lcom/twitter/sdk/android/tweetui/TweetUi;


# direct methods
.method public constructor <init>(Lcom/twitter/sdk/android/tweetui/TweetUi;Ljava/util/concurrent/ExecutorService;Landroid/os/Handler;Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;)V
    .locals 0
    .param p1, "tweetUiKit"    # Lcom/twitter/sdk/android/tweetui/TweetUi;
    .param p2, "executorService"    # Ljava/util/concurrent/ExecutorService;
    .param p3, "mainHandler"    # Landroid/os/Handler;
    .param p4, "queue"    # Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/Repository;->tweetUiKit:Lcom/twitter/sdk/android/tweetui/TweetUi;

    .line 17
    iput-object p2, p0, Lcom/twitter/sdk/android/tweetui/Repository;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 18
    iput-object p3, p0, Lcom/twitter/sdk/android/tweetui/Repository;->mainHandler:Landroid/os/Handler;

    .line 19
    iput-object p4, p0, Lcom/twitter/sdk/android/tweetui/Repository;->queue:Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;

    .line 20
    return-void
.end method
