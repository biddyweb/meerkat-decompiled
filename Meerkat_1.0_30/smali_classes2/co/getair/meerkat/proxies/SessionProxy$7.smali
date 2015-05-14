.class Lco/getair/meerkat/proxies/SessionProxy$7;
.super Ljava/lang/Object;
.source "SessionProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/SessionProxy;->signUpWithTwitter(Lcom/twitter/sdk/android/core/models/User;)V
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
.field final synthetic this$0:Lco/getair/meerkat/proxies/SessionProxy;

.field final synthetic val$twitterSession:Lcom/twitter/sdk/android/core/TwitterSession;

.field final synthetic val$twitterUser:Lcom/twitter/sdk/android/core/models/User;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/SessionProxy;Lcom/twitter/sdk/android/core/TwitterSession;Lcom/twitter/sdk/android/core/models/User;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/SessionProxy;

    .prologue
    .line 244
    iput-object p1, p0, Lco/getair/meerkat/proxies/SessionProxy$7;->this$0:Lco/getair/meerkat/proxies/SessionProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/SessionProxy$7;->val$twitterSession:Lcom/twitter/sdk/android/core/TwitterSession;

    iput-object p3, p0, Lco/getair/meerkat/proxies/SessionProxy$7;->val$twitterUser:Lcom/twitter/sdk/android/core/models/User;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 244
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/SessionProxy$7;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 8
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 247
    const-string v3, "SessionProxy"

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lco/getair/meerkat/utilities/MLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 253
    .local v1, "mixpanelPeopleProperties":Lorg/json/JSONObject;
    const-string v3, "twitter id"

    iget-object v4, p0, Lco/getair/meerkat/proxies/SessionProxy$7;->val$twitterSession:Lcom/twitter/sdk/android/core/TwitterSession;

    invoke-virtual {v4}, Lcom/twitter/sdk/android/core/TwitterSession;->getUserId()J

    move-result-wide v4

    invoke-virtual {v1, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 254
    const-string v3, "$username"

    iget-object v4, p0, Lco/getair/meerkat/proxies/SessionProxy$7;->val$twitterSession:Lcom/twitter/sdk/android/core/TwitterSession;

    invoke-virtual {v4}, Lcom/twitter/sdk/android/core/TwitterSession;->getUserName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 255
    const-string v3, "handle"

    iget-object v4, p0, Lco/getair/meerkat/proxies/SessionProxy$7;->val$twitterSession:Lcom/twitter/sdk/android/core/TwitterSession;

    invoke-virtual {v4}, Lcom/twitter/sdk/android/core/TwitterSession;->getUserName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 256
    const-string v4, "full name"

    iget-object v3, p0, Lco/getair/meerkat/proxies/SessionProxy$7;->val$twitterUser:Lcom/twitter/sdk/android/core/models/User;

    iget-object v3, v3, Lcom/twitter/sdk/android/core/models/User;->name:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lco/getair/meerkat/proxies/SessionProxy$7;->val$twitterUser:Lcom/twitter/sdk/android/core/models/User;

    iget-object v3, v3, Lcom/twitter/sdk/android/core/models/User;->name:Ljava/lang/String;

    :goto_0
    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 257
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    long-to-int v2, v4

    .line 258
    .local v2, "now":I
    const-string v3, "join date"

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 259
    const-string v3, "stream count"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 260
    const-string v3, "schedule count"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 261
    const-string v3, "schedule like count"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 262
    const-string v3, "watch count"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 263
    const-string v3, "comments count"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 264
    const-string v3, "restream count"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 266
    iget-object v3, p0, Lco/getair/meerkat/proxies/SessionProxy$7;->this$0:Lco/getair/meerkat/proxies/SessionProxy;

    # invokes: Lco/getair/meerkat/proxies/SessionProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v3}, Lco/getair/meerkat/proxies/SessionProxy;->access$500(Lco/getair/meerkat/proxies/SessionProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    const-string v4, "setMixpanelPeopleProperties"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v1, v5}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 268
    iget-object v3, p0, Lco/getair/meerkat/proxies/SessionProxy$7;->this$0:Lco/getair/meerkat/proxies/SessionProxy;

    # getter for: Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;
    invoke-static {v3}, Lco/getair/meerkat/proxies/SessionProxy;->access$000(Lco/getair/meerkat/proxies/SessionProxy;)Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v3

    invoke-virtual {v3, p1}, Lco/getair/meerkat/ApiProxy;->setFollowupActionsFromJson(Lorg/json/JSONObject;)V

    .line 270
    iget-object v3, p0, Lco/getair/meerkat/proxies/SessionProxy$7;->this$0:Lco/getair/meerkat/proxies/SessionProxy;

    # invokes: Lco/getair/meerkat/proxies/SessionProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v3}, Lco/getair/meerkat/proxies/SessionProxy;->access$600(Lco/getair/meerkat/proxies/SessionProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    const-string v4, "authorizationStart"

    sget-object v5, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;->SIGNUP:Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    const/4 v6, 0x0

    invoke-virtual {v3, v4, v5, v6}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 275
    .end local v1    # "mixpanelPeopleProperties":Lorg/json/JSONObject;
    .end local v2    # "now":I
    :goto_1
    return-void

    .line 256
    .restart local v1    # "mixpanelPeopleProperties":Lorg/json/JSONObject;
    :cond_0
    const-string v3, ""
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 272
    .end local v1    # "mixpanelPeopleProperties":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 273
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method
