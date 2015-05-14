.class abstract Lcom/twitter/sdk/android/tweetui/ApiCallback;
.super Lcom/twitter/sdk/android/core/Callback;
.source "ApiCallback.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/twitter/sdk/android/core/Callback",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final API_CALL_ERROR:Ljava/lang/String; = "API call failure."

.field private static final TAG:Ljava/lang/String; = "TweetUi"


# instance fields
.field protected final cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/twitter/sdk/android/tweetui/LoadCallback",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/tweetui/LoadCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/tweetui/LoadCallback",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 23
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/ApiCallback;, "Lcom/twitter/sdk/android/tweetui/ApiCallback<TT;>;"
    .local p1, "cb":Lcom/twitter/sdk/android/tweetui/LoadCallback;, "Lcom/twitter/sdk/android/tweetui/LoadCallback<TT;>;"
    invoke-direct {p0}, Lcom/twitter/sdk/android/core/Callback;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/ApiCallback;->cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    .line 25
    return-void
.end method


# virtual methods
.method public failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 6
    .param p1, "exception"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 33
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/ApiCallback;, "Lcom/twitter/sdk/android/tweetui/ApiCallback<TT;>;"
    move-object v0, p1

    check-cast v0, Lcom/twitter/sdk/android/core/TwitterApiException;

    .line 34
    .local v0, "apiException":Lcom/twitter/sdk/android/core/TwitterApiException;
    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/TwitterApiException;->getErrorCode()I

    move-result v1

    .line 35
    .local v1, "errorCode":I
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v2

    const-string v3, "TweetUi"

    const-string v4, "API call failure."

    invoke-interface {v2, v3, v4, v0}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 37
    const/16 v2, 0x59

    if-eq v1, v2, :cond_0

    const/16 v2, 0xef

    if-ne v1, v2, :cond_1

    .line 39
    :cond_0
    invoke-static {}, Lcom/twitter/sdk/android/tweetui/TweetUi;->getInstance()Lcom/twitter/sdk/android/tweetui/TweetUi;

    move-result-object v2

    const-wide/16 v4, 0x0

    invoke-virtual {v2, v4, v5}, Lcom/twitter/sdk/android/tweetui/TweetUi;->clearAppSession(J)V

    .line 42
    :cond_1
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/ApiCallback;->cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    if-eqz v2, :cond_2

    .line 43
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/ApiCallback;->cb:Lcom/twitter/sdk/android/tweetui/LoadCallback;

    invoke-interface {v2, p1}, Lcom/twitter/sdk/android/tweetui/LoadCallback;->failure(Lcom/twitter/sdk/android/core/TwitterException;)V

    .line 45
    :cond_2
    return-void
.end method

.method public abstract success(Lcom/twitter/sdk/android/core/Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<TT;>;)V"
        }
    .end annotation
.end method
