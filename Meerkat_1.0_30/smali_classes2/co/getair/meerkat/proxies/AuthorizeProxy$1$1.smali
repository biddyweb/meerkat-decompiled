.class Lco/getair/meerkat/proxies/AuthorizeProxy$1$1;
.super Lco/getair/meerkat/utilities/RunnableWithResultObject;
.source "AuthorizeProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/AuthorizeProxy$1;->onResponse(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lco/getair/meerkat/proxies/AuthorizeProxy$1;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/AuthorizeProxy$1;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/proxies/AuthorizeProxy$1;

    .prologue
    .line 137
    iput-object p1, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$1$1;->this$1:Lco/getair/meerkat/proxies/AuthorizeProxy$1;

    invoke-direct {p0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 141
    iget-object v7, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$1$1;->resultObject:Ljava/lang/Object;

    if-nez v7, :cond_0

    .line 215
    :goto_0
    return-void

    .line 146
    :cond_0
    iget-object v6, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$1$1;->resultObject:Ljava/lang/Object;

    check-cast v6, Lco/getair/meerkat/dtos/User;

    .line 148
    .local v6, "user":Lco/getair/meerkat/dtos/User;
    invoke-virtual {v6}, Lco/getair/meerkat/dtos/User;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/crashlytics/android/Crashlytics;->setUserIdentifier(Ljava/lang/String;)V

    .line 149
    invoke-virtual {v6}, Lco/getair/meerkat/dtos/User;->getUsername()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/crashlytics/android/Crashlytics;->setUserName(Ljava/lang/String;)V

    .line 151
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 153
    .local v5, "superProperties":Lorg/json/JSONObject;
    :try_start_0
    const-string v8, "handle"

    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v7

    invoke-interface {v7}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v7

    check-cast v7, Lcom/twitter/sdk/android/core/TwitterSession;

    invoke-virtual {v7}, Lcom/twitter/sdk/android/core/TwitterSession;->getUserName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 154
    const-string v7, "user id"

    invoke-virtual {v6}, Lco/getair/meerkat/dtos/User;->getId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 155
    const-string v7, "platform"

    const-string v8, "android"

    invoke-virtual {v5, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 156
    const-string v7, "following count"

    invoke-virtual {v6}, Lco/getair/meerkat/dtos/User;->getStats()Lco/getair/meerkat/dtos/User$Stats;

    move-result-object v8

    invoke-virtual {v8}, Lco/getair/meerkat/dtos/User$Stats;->getFollowingCount()I

    move-result v8

    invoke-virtual {v5, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 157
    const-string v7, "followers count"

    invoke-virtual {v6}, Lco/getair/meerkat/dtos/User;->getStats()Lco/getair/meerkat/dtos/User$Stats;

    move-result-object v8

    invoke-virtual {v8}, Lco/getair/meerkat/dtos/User$Stats;->getFollowersCount()I

    move-result v8

    invoke-virtual {v5, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    :goto_1
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 164
    .local v4, "peopleProperties":Lorg/json/JSONObject;
    :try_start_1
    const-string v7, "user id"

    invoke-virtual {v6}, Lco/getair/meerkat/dtos/User;->getId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 165
    const-string v7, "$username"

    invoke-virtual {v6}, Lco/getair/meerkat/dtos/User;->getUsername()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 166
    const-string v7, "handle"

    invoke-virtual {v6}, Lco/getair/meerkat/dtos/User;->getUsername()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 167
    const-string v7, "$name"

    invoke-virtual {v6}, Lco/getair/meerkat/dtos/User;->getDisplayName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 168
    const-string v7, "twitter id"

    invoke-virtual {v6}, Lco/getair/meerkat/dtos/User;->getTwitterId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 169
    const-string v7, "followers count"

    invoke-virtual {v6}, Lco/getair/meerkat/dtos/User;->getStats()Lco/getair/meerkat/dtos/User$Stats;

    move-result-object v8

    invoke-virtual {v8}, Lco/getair/meerkat/dtos/User$Stats;->getFollowersCount()I

    move-result v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 170
    const-string v7, "following count"

    invoke-virtual {v6}, Lco/getair/meerkat/dtos/User;->getStats()Lco/getair/meerkat/dtos/User$Stats;

    move-result-object v8

    invoke-virtual {v8}, Lco/getair/meerkat/dtos/User$Stats;->getFollowingCount()I

    move-result v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 172
    iget-object v7, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$1$1;->this$1:Lco/getair/meerkat/proxies/AuthorizeProxy$1;

    iget-object v7, v7, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->val$type:Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    sget-object v8, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;->SIGNUP:Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    if-ne v7, v8, :cond_1

    .line 173
    const-string v7, "signup platform"

    const-string v8, "android"

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 174
    const-string v7, "join date"

    invoke-static {}, Lorg/joda/time/DateTime;->now()Lorg/joda/time/DateTime;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 175
    const-string v7, "stream count"

    const/4 v8, 0x0

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 176
    const-string v7, "schedule count"

    const/4 v8, 0x0

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 177
    const-string v7, "schedule retweets count"

    const/4 v8, 0x0

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 178
    const-string v7, "watch count"

    const/4 v8, 0x0

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 179
    const-string v7, "comments count"

    const/4 v8, 0x0

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 180
    const-string v7, "restream count"

    const/4 v8, 0x0

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 181
    const-string v7, "subscribe count"

    const/4 v8, 0x0

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 182
    const-string v7, "schedule comments count"

    const/4 v8, 0x0

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 188
    :cond_1
    :goto_2
    iget-object v7, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$1$1;->this$1:Lco/getair/meerkat/proxies/AuthorizeProxy$1;

    iget-object v7, v7, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->this$0:Lco/getair/meerkat/proxies/AuthorizeProxy;

    # invokes: Lco/getair/meerkat/proxies/AuthorizeProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v7}, Lco/getair/meerkat/proxies/AuthorizeProxy;->access$100(Lco/getair/meerkat/proxies/AuthorizeProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v7

    const-string v8, "identifyUserOnMixpanel"

    invoke-virtual {v6}, Lco/getair/meerkat/dtos/User;->getId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9, v10}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 189
    iget-object v7, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$1$1;->this$1:Lco/getair/meerkat/proxies/AuthorizeProxy$1;

    iget-object v7, v7, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->this$0:Lco/getair/meerkat/proxies/AuthorizeProxy;

    # invokes: Lco/getair/meerkat/proxies/AuthorizeProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v7}, Lco/getair/meerkat/proxies/AuthorizeProxy;->access$200(Lco/getair/meerkat/proxies/AuthorizeProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v7

    const-string v8, "seMixpanelSuperProperties"

    invoke-virtual {v7, v8, v5, v10}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 190
    iget-object v7, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$1$1;->this$1:Lco/getair/meerkat/proxies/AuthorizeProxy$1;

    iget-object v7, v7, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->this$0:Lco/getair/meerkat/proxies/AuthorizeProxy;

    # invokes: Lco/getair/meerkat/proxies/AuthorizeProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v7}, Lco/getair/meerkat/proxies/AuthorizeProxy;->access$300(Lco/getair/meerkat/proxies/AuthorizeProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v7

    const-string v8, "setMixpanelPeopleProperties"

    invoke-virtual {v7, v8, v4, v10}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 192
    iget-object v7, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$1$1;->this$1:Lco/getair/meerkat/proxies/AuthorizeProxy$1;

    iget-object v7, v7, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->val$type:Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    sget-object v8, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;->SIGNUP:Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    if-ne v7, v8, :cond_2

    .line 193
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 195
    .local v3, "param":Lorg/json/JSONObject;
    :try_start_2
    const-string v8, "handle"

    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v7

    invoke-interface {v7}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v7

    check-cast v7, Lcom/twitter/sdk/android/core/TwitterSession;

    invoke-virtual {v7}, Lcom/twitter/sdk/android/core/TwitterSession;->getUserName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 200
    :goto_3
    new-instance v2, Lco/getair/meerkat/dtos/MixpanelEventParams;

    const-string v7, "sign up"

    invoke-direct {v2, v7, v3}, Lco/getair/meerkat/dtos/MixpanelEventParams;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 201
    .local v2, "mixpanelEventParams":Lco/getair/meerkat/dtos/MixpanelEventParams;
    iget-object v7, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$1$1;->this$1:Lco/getair/meerkat/proxies/AuthorizeProxy$1;

    iget-object v7, v7, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->this$0:Lco/getair/meerkat/proxies/AuthorizeProxy;

    # invokes: Lco/getair/meerkat/proxies/AuthorizeProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v7}, Lco/getair/meerkat/proxies/AuthorizeProxy;->access$400(Lco/getair/meerkat/proxies/AuthorizeProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v7

    const-string v8, "trackMixpanelEvent"

    invoke-virtual {v7, v8, v2, v10}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 204
    .end local v2    # "mixpanelEventParams":Lco/getair/meerkat/dtos/MixpanelEventParams;
    .end local v3    # "param":Lorg/json/JSONObject;
    :cond_2
    iget-object v7, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$1$1;->this$1:Lco/getair/meerkat/proxies/AuthorizeProxy$1;

    iget-object v7, v7, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->val$deviceToken:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lco/getair/meerkat/dtos/User;->setDeviceToken(Ljava/lang/String;)V

    .line 205
    invoke-static {}, Lco/getair/meerkat/utilities/DiskWriter;->getInstance()Lco/getair/meerkat/utilities/DiskWriter;

    move-result-object v7

    iget-object v8, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$1$1;->this$1:Lco/getair/meerkat/proxies/AuthorizeProxy$1;

    iget-object v8, v8, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->this$0:Lco/getair/meerkat/proxies/AuthorizeProxy;

    # getter for: Lco/getair/meerkat/proxies/AuthorizeProxy;->context:Landroid/content/Context;
    invoke-static {v8}, Lco/getair/meerkat/proxies/AuthorizeProxy;->access$000(Lco/getair/meerkat/proxies/AuthorizeProxy;)Landroid/content/Context;

    move-result-object v8

    invoke-static {}, Lco/getair/meerkat/dtos/User;->getMyUserFileName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v6, v9}, Lco/getair/meerkat/utilities/DiskWriter;->saveObject(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/String;)V

    .line 207
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lco/getair/meerkat/facades/ApplicationFacade;->getInstance(Ljava/lang/String;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v7

    const-string v8, "graphProxy"

    invoke-virtual {v7, v8}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/GraphProxy;

    .line 209
    .local v1, "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    invoke-virtual {v1, v6}, Lco/getair/meerkat/proxies/GraphProxy;->setMyUser(Lco/getair/meerkat/dtos/User;)V

    .line 211
    iget-object v7, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$1$1;->this$1:Lco/getair/meerkat/proxies/AuthorizeProxy$1;

    iget-object v7, v7, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->val$completion:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    const/4 v8, 0x1

    iput-boolean v8, v7, Lco/getair/meerkat/utilities/RunnableWithResultObject;->success:Z

    .line 212
    iget-object v7, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$1$1;->this$1:Lco/getair/meerkat/proxies/AuthorizeProxy$1;

    iget-object v7, v7, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->val$completion:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    iput-object v6, v7, Lco/getair/meerkat/utilities/RunnableWithResultObject;->resultObject:Ljava/lang/Object;

    .line 213
    iget-object v7, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$1$1;->this$1:Lco/getair/meerkat/proxies/AuthorizeProxy$1;

    iget-object v7, v7, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->val$completion:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-virtual {v7}, Lco/getair/meerkat/utilities/RunnableWithResultObject;->run()V

    goto/16 :goto_0

    .line 158
    .end local v1    # "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    .end local v4    # "peopleProperties":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 159
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_1

    .line 184
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v4    # "peopleProperties":Lorg/json/JSONObject;
    :catch_1
    move-exception v0

    .line 185
    .restart local v0    # "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_2

    .line 196
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v3    # "param":Lorg/json/JSONObject;
    :catch_2
    move-exception v0

    .line 197
    .restart local v0    # "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_3
.end method
