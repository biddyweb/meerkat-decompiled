.class Lco/getair/meerkat/proxies/BroadcastProxy$3;
.super Ljava/lang/Object;
.source "BroadcastProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/BroadcastProxy;->goLive()V
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
.field final synthetic this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

.field final synthetic val$createBroadcastUrl:Ljava/lang/String;

.field final synthetic val$gpsHandlerProxy:Lco/getair/meerkat/utilities/GPSHandlerProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/BroadcastProxy;Ljava/lang/String;Lco/getair/meerkat/utilities/GPSHandlerProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/BroadcastProxy;

    .prologue
    .line 174
    iput-object p1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3;->val$createBroadcastUrl:Ljava/lang/String;

    iput-object p3, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3;->val$gpsHandlerProxy:Lco/getair/meerkat/utilities/GPSHandlerProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 174
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/BroadcastProxy$3;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 14
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 179
    :try_start_0
    const-string v0, "BroadcastProxy"

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    new-instance v7, Lcom/google/gson/Gson;

    invoke-direct {v7}, Lcom/google/gson/Gson;-><init>()V

    .line 181
    .local v7, "gsonParser":Lcom/google/gson/Gson;
    iget-object v1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    const-string v0, "followupActions"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    const-class v5, Ljava/util/HashMap;

    invoke-virtual {v7, v0, v5}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    # setter for: Lco/getair/meerkat/proxies/BroadcastProxy;->followupActions:Ljava/util/HashMap;
    invoke-static {v1, v0}, Lco/getair/meerkat/proxies/BroadcastProxy;->access$202(Lco/getair/meerkat/proxies/BroadcastProxy;Ljava/util/HashMap;)Ljava/util/HashMap;

    .line 183
    const-string v0, "result"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    .line 184
    .local v11, "result":Lorg/json/JSONObject;
    iget-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    const-string v1, "id"

    invoke-virtual {v11, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    # setter for: Lco/getair/meerkat/proxies/BroadcastProxy;->id:Ljava/lang/String;
    invoke-static {v0, v1}, Lco/getair/meerkat/proxies/BroadcastProxy;->access$302(Lco/getair/meerkat/proxies/BroadcastProxy;Ljava/lang/String;)Ljava/lang/String;

    .line 185
    const-string v0, "publishInformation"

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    .line 186
    .local v9, "publishInformation":Lorg/json/JSONObject;
    const-string v0, "template"

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 187
    .local v10, "publishTemplate":Ljava/lang/String;
    const-string v0, "page"

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 189
    .local v8, "meerkatHashtag":Ljava/lang/String;
    move-object v4, v10

    .line 190
    .local v4, "publishText":Ljava/lang/String;
    const-string v0, "{caption}"

    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 191
    const-string v0, "{caption}"

    iget-object v1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    # getter for: Lco/getair/meerkat/proxies/BroadcastProxy;->caption:Ljava/lang/String;
    invoke-static {v1}, Lco/getair/meerkat/proxies/BroadcastProxy;->access$400(Lco/getair/meerkat/proxies/BroadcastProxy;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    .line 194
    :cond_0
    const-string v0, "{page}"

    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 195
    const-string v0, "{page}"

    invoke-virtual {v4, v0, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    .line 198
    :cond_1
    const-string v0, "http"

    invoke-virtual {v4, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v4, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 200
    .local v2, "link":Ljava/lang/String;
    iget-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    iget-object v1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    # getter for: Lco/getair/meerkat/proxies/BroadcastProxy;->context:Landroid/content/Context;
    invoke-static {v1}, Lco/getair/meerkat/proxies/BroadcastProxy;->access$500(Lco/getair/meerkat/proxies/BroadcastProxy;)Landroid/content/Context;

    move-result-object v1

    iget-object v5, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3;->val$createBroadcastUrl:Ljava/lang/String;

    # invokes: Lco/getair/meerkat/proxies/BroadcastProxy;->addProxies(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {v0, v1, v5}, Lco/getair/meerkat/proxies/BroadcastProxy;->access$600(Lco/getair/meerkat/proxies/BroadcastProxy;Landroid/content/Context;Ljava/lang/String;)V

    .line 201
    iget-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    # invokes: Lco/getair/meerkat/proxies/BroadcastProxy;->addCommands()V
    invoke-static {v0}, Lco/getair/meerkat/proxies/BroadcastProxy;->access$700(Lco/getair/meerkat/proxies/BroadcastProxy;)V

    .line 203
    iget-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3;->val$gpsHandlerProxy:Lco/getair/meerkat/utilities/GPSHandlerProxy;

    invoke-virtual {v0}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->getLocationText()Ljava/lang/String;

    move-result-object v3

    .line 205
    .local v3, "locationText":Ljava/lang/String;
    iget-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    # invokes: Lco/getair/meerkat/proxies/BroadcastProxy;->startBroadcastMixpanelTrack()V
    invoke-static {v0}, Lco/getair/meerkat/proxies/BroadcastProxy;->access$800(Lco/getair/meerkat/proxies/BroadcastProxy;)V

    .line 206
    iget-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    const-string v1, "commandStartGettingStreamActivities"

    const/4 v5, 0x0

    const/4 v12, 0x0

    invoke-virtual {v0, v1, v5, v12}, Lco/getair/meerkat/proxies/BroadcastProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 207
    iget-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    const-string v1, "commandStartGettingWatchers"

    const/4 v5, 0x0

    const/4 v12, 0x0

    invoke-virtual {v0, v1, v5, v12}, Lco/getair/meerkat/proxies/BroadcastProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 208
    iget-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    const-string v1, "eventMediaServerUrlArrived"

    iget-object v5, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    # getter for: Lco/getair/meerkat/proxies/BroadcastProxy;->followupActions:Ljava/util/HashMap;
    invoke-static {v5}, Lco/getair/meerkat/proxies/BroadcastProxy;->access$200(Lco/getair/meerkat/proxies/BroadcastProxy;)Ljava/util/HashMap;

    move-result-object v5

    const-string v12, "media"

    invoke-virtual {v5, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const/4 v12, 0x0

    invoke-virtual {v0, v1, v5, v12}, Lco/getair/meerkat/proxies/BroadcastProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 209
    iget-object v12, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    const-string v13, "eventBroadcastBegan"

    new-instance v0, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;

    iget-object v1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    # getter for: Lco/getair/meerkat/proxies/BroadcastProxy;->caption:Ljava/lang/String;
    invoke-static {v1}, Lco/getair/meerkat/proxies/BroadcastProxy;->access$400(Lco/getair/meerkat/proxies/BroadcastProxy;)Ljava/lang/String;

    move-result-object v1

    new-instance v5, Lco/getair/meerkat/proxies/BroadcastProxy$3$1;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/BroadcastProxy$3$1;-><init>(Lco/getair/meerkat/proxies/BroadcastProxy$3;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    const/4 v1, 0x0

    invoke-virtual {v12, v13, v0, v1}, Lco/getair/meerkat/proxies/BroadcastProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 250
    .end local v2    # "link":Ljava/lang/String;
    .end local v3    # "locationText":Ljava/lang/String;
    .end local v4    # "publishText":Ljava/lang/String;
    .end local v7    # "gsonParser":Lcom/google/gson/Gson;
    .end local v8    # "meerkatHashtag":Ljava/lang/String;
    .end local v9    # "publishInformation":Lorg/json/JSONObject;
    .end local v10    # "publishTemplate":Ljava/lang/String;
    .end local v11    # "result":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 247
    :catch_0
    move-exception v6

    .line 248
    .local v6, "exception":Lorg/json/JSONException;
    const-string v0, "BroadcastProxy"

    invoke-virtual {v6}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
