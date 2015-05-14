.class Lcom/twitter/sdk/android/tweetui/AuthRequestQueue$1;
.super Lcom/twitter/sdk/android/core/Callback;
.source "AuthRequestQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->getAppAuthTokenCallback()Lcom/twitter/sdk/android/core/Callback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/twitter/sdk/android/core/Callback",
        "<",
        "Lcom/twitter/sdk/android/core/AppSession;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;)V
    .locals 0

    .prologue
    .line 139
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue$1;->this$0:Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;

    invoke-direct {p0}, Lcom/twitter/sdk/android/core/Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 1
    .param p1, "exception"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 147
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue$1;->this$0:Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;

    invoke-virtual {v0, p1}, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->flushQueueOnError(Lcom/twitter/sdk/android/core/TwitterException;)V

    .line 148
    return-void
.end method

.method public success(Lcom/twitter/sdk/android/core/Result;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<",
            "Lcom/twitter/sdk/android/core/AppSession;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 142
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lcom/twitter/sdk/android/core/AppSession;>;"
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue$1;->this$0:Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;

    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue$1;->this$0:Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;

    # getter for: Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;
    invoke-static {v0}, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->access$000(Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;)Lcom/twitter/sdk/android/core/TwitterCore;

    move-result-object v2

    iget-object v0, p1, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    check-cast v0, Lcom/twitter/sdk/android/core/Session;

    invoke-virtual {v2, v0}, Lcom/twitter/sdk/android/core/TwitterCore;->getApiClient(Lcom/twitter/sdk/android/core/Session;)Lcom/twitter/sdk/android/core/TwitterApiClient;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->flushQueueOnSuccess(Lcom/twitter/sdk/android/core/TwitterApiClient;)V

    .line 143
    return-void
.end method
