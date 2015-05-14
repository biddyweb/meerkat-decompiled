.class Lco/getair/meerkat/proxies/TwitterProxy$2;
.super Lcom/twitter/sdk/android/core/Callback;
.source "TwitterProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/TwitterProxy;->tweet(Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
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

.field final synthetic val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/TwitterProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/TwitterProxy;

    .prologue
    .line 91
    iput-object p1, p0, Lco/getair/meerkat/proxies/TwitterProxy$2;->this$0:Lco/getair/meerkat/proxies/TwitterProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/TwitterProxy$2;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {p0}, Lcom/twitter/sdk/android/core/Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 2
    .param p1, "exception"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 102
    const-string v0, "TwitterProxy"

    invoke-virtual {p1}, Lcom/twitter/sdk/android/core/TwitterException;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    iget-object v0, p0, Lco/getair/meerkat/proxies/TwitterProxy$2;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lco/getair/meerkat/utilities/RunnableWithResultObject;->success:Z

    .line 104
    iget-object v0, p0, Lco/getair/meerkat/proxies/TwitterProxy$2;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-virtual {v0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;->run()V

    .line 105
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
    .line 94
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lcom/google/gson/JsonObject;>;"
    iget-object v1, p1, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    check-cast v1, Lcom/google/gson/JsonObject;

    const-string v2, "id_str"

    invoke-virtual {v1, v2}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v0

    .line 95
    .local v0, "tweetId":Ljava/lang/String;
    iget-object v1, p0, Lco/getair/meerkat/proxies/TwitterProxy$2;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    iput-object v0, v1, Lco/getair/meerkat/utilities/RunnableWithResultObject;->resultObject:Ljava/lang/Object;

    .line 96
    iget-object v1, p0, Lco/getair/meerkat/proxies/TwitterProxy$2;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lco/getair/meerkat/utilities/RunnableWithResultObject;->success:Z

    .line 97
    iget-object v1, p0, Lco/getair/meerkat/proxies/TwitterProxy$2;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-virtual {v1}, Lco/getair/meerkat/utilities/RunnableWithResultObject;->run()V

    .line 98
    return-void
.end method
