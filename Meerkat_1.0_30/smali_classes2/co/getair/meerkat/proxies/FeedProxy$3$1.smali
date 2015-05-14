.class Lco/getair/meerkat/proxies/FeedProxy$3$1;
.super Landroid/os/AsyncTask;
.source "FeedProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/FeedProxy$3;->onResponse(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lco/getair/meerkat/proxies/FeedProxy$3;

.field final synthetic val$response:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/FeedProxy$3;Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/proxies/FeedProxy$3;

    .prologue
    .line 118
    iput-object p1, p0, Lco/getair/meerkat/proxies/FeedProxy$3$1;->this$1:Lco/getair/meerkat/proxies/FeedProxy$3;

    iput-object p2, p0, Lco/getair/meerkat/proxies/FeedProxy$3$1;->val$response:Lorg/json/JSONObject;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 118
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/FeedProxy$3$1;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 9
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 123
    :try_start_0
    new-instance v6, Lco/getair/meerkat/proxies/FeedProxy$3$1$1;

    invoke-direct {v6, p0}, Lco/getair/meerkat/proxies/FeedProxy$3$1$1;-><init>(Lco/getair/meerkat/proxies/FeedProxy$3$1;)V

    invoke-virtual {v6}, Lco/getair/meerkat/proxies/FeedProxy$3$1$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v1

    .line 125
    .local v1, "feedListType":Ljava/lang/reflect/Type;
    # getter for: Lco/getair/meerkat/proxies/FeedProxy;->gson:Lcom/google/gson/Gson;
    invoke-static {}, Lco/getair/meerkat/proxies/FeedProxy;->access$000()Lcom/google/gson/Gson;

    move-result-object v6

    iget-object v7, p0, Lco/getair/meerkat/proxies/FeedProxy$3$1;->val$response:Lorg/json/JSONObject;

    const-string v8, "result"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v1}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 127
    .local v2, "feedObjects":Ljava/util/List;, "Ljava/util/List<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    new-instance v4, Lco/getair/meerkat/dtos/feed/FeedStreams;

    const-class v6, Lco/getair/meerkat/dtos/feed/FeedScheduledStream;

    invoke-direct {v4, v2, v6}, Lco/getair/meerkat/dtos/feed/FeedStreams;-><init>(Ljava/util/List;Ljava/lang/Class;)V

    .line 129
    .local v4, "feedStreams":Lco/getair/meerkat/dtos/feed/FeedStreams;
    iget-object v6, p0, Lco/getair/meerkat/proxies/FeedProxy$3$1;->this$1:Lco/getair/meerkat/proxies/FeedProxy$3;

    iget-boolean v6, v6, Lco/getair/meerkat/proxies/FeedProxy$3;->val$shouldFilter:Z

    invoke-virtual {v4, v6}, Lco/getair/meerkat/dtos/feed/FeedStreams;->filterRelevantStreams(Z)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/dtos/feed/FeedStream;

    .line 130
    .local v3, "feedStream":Lco/getair/meerkat/dtos/feed/FeedStream;
    invoke-static {}, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->getInstance()Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;

    move-result-object v7

    invoke-virtual {v3}, Lco/getair/meerkat/dtos/feed/FeedStream;->getId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->getScheduledStreamById(Ljava/lang/String;)Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    move-result-object v5

    .line 131
    .local v5, "streamFeedItem":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    if-eqz v5, :cond_0

    .line 132
    iget-object v7, p0, Lco/getair/meerkat/proxies/FeedProxy$3$1;->this$1:Lco/getair/meerkat/proxies/FeedProxy$3;

    iget-object v7, v7, Lco/getair/meerkat/proxies/FeedProxy$3;->this$0:Lco/getair/meerkat/proxies/FeedProxy;

    # invokes: Lco/getair/meerkat/proxies/FeedProxy;->notifyStreamArrived(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;)V
    invoke-static {v7, v5}, Lco/getair/meerkat/proxies/FeedProxy;->access$100(Lco/getair/meerkat/proxies/FeedProxy;Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 138
    .end local v1    # "feedListType":Ljava/lang/reflect/Type;
    .end local v2    # "feedObjects":Ljava/util/List;, "Ljava/util/List<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v3    # "feedStream":Lco/getair/meerkat/dtos/feed/FeedStream;
    .end local v4    # "feedStreams":Lco/getair/meerkat/dtos/feed/FeedStreams;
    .end local v5    # "streamFeedItem":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    :catch_0
    move-exception v0

    .line 139
    .local v0, "ex":Ljava/lang/Exception;
    const-string v6, "FAILED parsing scheduled feed"

    invoke-static {v6}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    .line 141
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 134
    .end local v0    # "ex":Ljava/lang/Exception;
    .restart local v1    # "feedListType":Ljava/lang/reflect/Type;
    .restart local v2    # "feedObjects":Ljava/util/List;, "Ljava/util/List<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .restart local v3    # "feedStream":Lco/getair/meerkat/dtos/feed/FeedStream;
    .restart local v4    # "feedStreams":Lco/getair/meerkat/dtos/feed/FeedStreams;
    .restart local v5    # "streamFeedItem":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    :cond_0
    :try_start_1
    iget-object v7, p0, Lco/getair/meerkat/proxies/FeedProxy$3$1;->this$1:Lco/getair/meerkat/proxies/FeedProxy$3;

    iget-object v7, v7, Lco/getair/meerkat/proxies/FeedProxy$3;->this$0:Lco/getair/meerkat/proxies/FeedProxy;

    const-class v8, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    # invokes: Lco/getair/meerkat/proxies/FeedProxy;->requestStreamSummary(Lco/getair/meerkat/dtos/feed/FeedStream;Ljava/lang/Class;)V
    invoke-static {v7, v3, v8}, Lco/getair/meerkat/proxies/FeedProxy;->access$200(Lco/getair/meerkat/proxies/FeedProxy;Lco/getair/meerkat/dtos/feed/FeedStream;Ljava/lang/Class;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 144
    .end local v3    # "feedStream":Lco/getair/meerkat/dtos/feed/FeedStream;
    .end local v5    # "streamFeedItem":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    :cond_1
    const/4 v6, 0x0

    return-object v6
.end method
