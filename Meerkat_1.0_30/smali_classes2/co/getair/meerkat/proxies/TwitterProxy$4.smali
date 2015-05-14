.class Lco/getair/meerkat/proxies/TwitterProxy$4;
.super Lcom/twitter/sdk/android/core/Callback;
.source "TwitterProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/TwitterProxy;->favoriteTweet(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/twitter/sdk/android/core/Callback",
        "<",
        "Lcom/google/gson/JsonObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/TwitterProxy;

.field final synthetic val$tweetId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/TwitterProxy;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/TwitterProxy;

    .prologue
    .line 139
    iput-object p1, p0, Lco/getair/meerkat/proxies/TwitterProxy$4;->this$0:Lco/getair/meerkat/proxies/TwitterProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/TwitterProxy$4;->val$tweetId:Ljava/lang/String;

    invoke-direct {p0}, Lcom/twitter/sdk/android/core/Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 0
    .param p1, "e"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 148
    invoke-virtual {p1}, Lcom/twitter/sdk/android/core/TwitterException;->printStackTrace()V

    .line 149
    return-void
.end method

.method public success(Lcom/twitter/sdk/android/core/Result;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<",
            "Lcom/google/gson/JsonObject;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 142
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lcom/google/gson/JsonObject;>;"
    const-string v0, "TwitterProxy"

    const-string v1, "favorite tweet success"

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    const-string v0, "TwitterProxy"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "tweet id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/proxies/TwitterProxy$4;->val$tweetId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    return-void
.end method
