.class Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline$1;
.super Lcom/twitter/sdk/android/core/Callback;
.source "SearchTimeline.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline;->getSearchCallback(Lcom/twitter/sdk/android/core/Callback;)Lcom/twitter/sdk/android/core/Callback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/twitter/sdk/android/core/Callback",
        "<",
        "Lcom/twitter/sdk/android/core/models/Search;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline;

.field final synthetic val$cb:Lcom/twitter/sdk/android/core/Callback;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline;Lcom/twitter/sdk/android/core/Callback;)V
    .locals 0

    .prologue
    .line 43
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline$1;->this$0:Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline;

    iput-object p2, p0, Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline$1;->val$cb:Lcom/twitter/sdk/android/core/Callback;

    invoke-direct {p0}, Lcom/twitter/sdk/android/core/Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 1
    .param p1, "exception"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline$1;->val$cb:Lcom/twitter/sdk/android/core/Callback;

    if-eqz v0, :cond_0

    .line 55
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline$1;->val$cb:Lcom/twitter/sdk/android/core/Callback;

    invoke-virtual {v0, p1}, Lcom/twitter/sdk/android/core/Callback;->failure(Lcom/twitter/sdk/android/core/TwitterException;)V

    .line 57
    :cond_0
    return-void
.end method

.method public success(Lcom/twitter/sdk/android/core/Result;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<",
            "Lcom/twitter/sdk/android/core/models/Search;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lcom/twitter/sdk/android/core/models/Search;>;"
    iget-object v1, p1, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    check-cast v1, Lcom/twitter/sdk/android/core/models/Search;

    iget-object v0, v1, Lcom/twitter/sdk/android/core/models/Search;->tweets:Ljava/util/List;

    .line 47
    .local v0, "tweets":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/core/models/Tweet;>;"
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline$1;->val$cb:Lcom/twitter/sdk/android/core/Callback;

    if-eqz v1, :cond_0

    .line 48
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/internal/SearchTimeline$1;->val$cb:Lcom/twitter/sdk/android/core/Callback;

    new-instance v2, Lcom/twitter/sdk/android/core/Result;

    iget-object v3, p1, Lcom/twitter/sdk/android/core/Result;->response:Lretrofit/client/Response;

    invoke-direct {v2, v0, v3}, Lcom/twitter/sdk/android/core/Result;-><init>(Ljava/lang/Object;Lretrofit/client/Response;)V

    invoke-virtual {v1, v2}, Lcom/twitter/sdk/android/core/Callback;->success(Lcom/twitter/sdk/android/core/Result;)V

    .line 50
    :cond_0
    return-void
.end method
