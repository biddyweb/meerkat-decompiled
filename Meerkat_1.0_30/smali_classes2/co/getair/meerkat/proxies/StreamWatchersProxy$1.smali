.class Lco/getair/meerkat/proxies/StreamWatchersProxy$1;
.super Ljava/lang/Object;
.source "StreamWatchersProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/StreamWatchersProxy;->getWatchers()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener",
        "<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/StreamWatchersProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/StreamWatchersProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/StreamWatchersProxy;

    .prologue
    .line 61
    iput-object p1, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy$1;->this$0:Lco/getair/meerkat/proxies/StreamWatchersProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 61
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/StreamWatchersProxy$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 9
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 66
    :try_start_0
    const-string v6, "result"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 68
    .local v3, "result":Lorg/json/JSONObject;
    const-string v6, "expiry"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 69
    .local v0, "delayInSeconds":I
    const-string v6, "watchers"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 71
    .local v5, "watchers":Lorg/json/JSONArray;
    iget-object v6, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy$1;->this$0:Lco/getair/meerkat/proxies/StreamWatchersProxy;

    # getter for: Lco/getair/meerkat/proxies/StreamWatchersProxy;->streamHasEnded:Z
    invoke-static {v6}, Lco/getair/meerkat/proxies/StreamWatchersProxy;->access$000(Lco/getair/meerkat/proxies/StreamWatchersProxy;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 73
    iget-object v6, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy$1;->this$0:Lco/getair/meerkat/proxies/StreamWatchersProxy;

    # invokes: Lco/getair/meerkat/proxies/StreamWatchersProxy;->reactivateGetWatchers(I)V
    invoke-static {v6, v0}, Lco/getair/meerkat/proxies/StreamWatchersProxy;->access$100(Lco/getair/meerkat/proxies/StreamWatchersProxy;I)V

    .line 75
    new-instance v6, Lco/getair/meerkat/proxies/StreamWatchersProxy$1$1;

    invoke-direct {v6, p0}, Lco/getair/meerkat/proxies/StreamWatchersProxy$1$1;-><init>(Lco/getair/meerkat/proxies/StreamWatchersProxy$1;)V

    invoke-virtual {v6}, Lco/getair/meerkat/proxies/StreamWatchersProxy$1$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v2

    .line 76
    .local v2, "listType":Ljava/lang/reflect/Type;
    new-instance v6, Lcom/google/gson/Gson;

    invoke-direct {v6}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v5}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    .line 78
    .local v4, "watcherList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/dtos/watch_broadcast/Watcher;>;"
    iget-object v6, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy$1;->this$0:Lco/getair/meerkat/proxies/StreamWatchersProxy;

    # invokes: Lco/getair/meerkat/proxies/StreamWatchersProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v6}, Lco/getair/meerkat/proxies/StreamWatchersProxy;->access$200(Lco/getair/meerkat/proxies/StreamWatchersProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v6

    const-string v7, "eventStreamWatchersReceived"

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v4, v8}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    .end local v0    # "delayInSeconds":I
    .end local v2    # "listType":Ljava/lang/reflect/Type;
    .end local v3    # "result":Lorg/json/JSONObject;
    .end local v4    # "watcherList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/dtos/watch_broadcast/Watcher;>;"
    .end local v5    # "watchers":Lorg/json/JSONArray;
    :cond_0
    :goto_0
    return-void

    .line 81
    :catch_0
    move-exception v1

    .line 82
    .local v1, "exception":Ljava/lang/Exception;
    iget-object v6, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy$1;->this$0:Lco/getair/meerkat/proxies/StreamWatchersProxy;

    const/16 v7, 0xa

    # invokes: Lco/getair/meerkat/proxies/StreamWatchersProxy;->reactivateGetWatchers(I)V
    invoke-static {v6, v7}, Lco/getair/meerkat/proxies/StreamWatchersProxy;->access$100(Lco/getair/meerkat/proxies/StreamWatchersProxy;I)V

    .line 83
    const-string v6, "StreamWatchersProxy"

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
