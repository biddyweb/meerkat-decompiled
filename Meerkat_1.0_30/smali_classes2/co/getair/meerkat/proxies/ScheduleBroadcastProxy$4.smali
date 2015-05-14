.class Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;
.super Lco/getair/meerkat/utilities/RunnableWithResultObject;
.source "ScheduleBroadcastProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->tweetBroadcast(Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

.field final synthetic val$followUpActions:Ljava/util/HashMap;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;Ljava/util/HashMap;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    .prologue
    .line 165
    iput-object p1, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;->this$0:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;->val$followUpActions:Ljava/util/HashMap;

    invoke-direct {p0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v5, 0x0

    .line 169
    iget-object v1, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;->resultObject:Ljava/lang/Object;

    if-eqz v1, :cond_0

    .line 171
    iget-object v9, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;->resultObject:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    .line 172
    .local v9, "tweetId":Ljava/lang/String;
    iget-object v1, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;->val$followUpActions:Ljava/util/HashMap;

    const-string v4, "schedule"

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 174
    .local v2, "scheduleUpdateUrl":Ljava/lang/String;
    iget-object v1, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;->this$0:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    # invokes: Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v1}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->access$300(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v6

    check-cast v6, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;

    .line 176
    .local v6, "activity":Lco/getair/meerkat/activities/ScheduleBroadcastActivity;
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 177
    .local v8, "params":Ljava/util/HashMap;
    const-string v1, "tweetId"

    invoke-virtual {v8, v1, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    const-string v1, "auth"

    invoke-static {v6}, Lco/getair/meerkat/dtos/Session;->loadSession(Landroid/content/Context;)Lco/getair/meerkat/dtos/Session;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/dtos/Session;->getAuthToken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    new-instance v7, Lcom/google/gson/Gson;

    invoke-direct {v7}, Lcom/google/gson/Gson;-><init>()V

    .line 181
    .local v7, "gson":Lcom/google/gson/Gson;
    invoke-virtual {v7, v8}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 183
    .local v3, "paramsString":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x2

    new-instance v4, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4$1;

    invoke-direct {v4, p0}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4$1;-><init>(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;)V

    new-instance v5, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4$2;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4$2;-><init>(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 200
    .local v0, "updateScheduledBroadcastWithTweetId":Lcom/android/volley/toolbox/JsonObjectRequest;
    invoke-static {v6}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 208
    .end local v0    # "updateScheduledBroadcastWithTweetId":Lcom/android/volley/toolbox/JsonObjectRequest;
    .end local v2    # "scheduleUpdateUrl":Ljava/lang/String;
    .end local v3    # "paramsString":Ljava/lang/String;
    .end local v6    # "activity":Lco/getair/meerkat/activities/ScheduleBroadcastActivity;
    .end local v7    # "gson":Lcom/google/gson/Gson;
    .end local v8    # "params":Ljava/util/HashMap;
    .end local v9    # "tweetId":Ljava/lang/String;
    :goto_0
    return-void

    .line 205
    :cond_0
    iget-object v1, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;->this$0:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    # invokes: Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v1}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->access$600(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    const-string v4, "scheduleBroadcastScheduled"

    invoke-virtual {v1, v4, v5, v5}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method
