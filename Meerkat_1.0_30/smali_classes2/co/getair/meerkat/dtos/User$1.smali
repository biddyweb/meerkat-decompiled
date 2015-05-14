.class final Lco/getair/meerkat/dtos/User$1;
.super Ljava/lang/Object;
.source "User.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/dtos/User;->fetchUser(Landroid/content/Context;Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
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
.field final synthetic val$completionRunnable:Lco/getair/meerkat/utilities/RunnableWithResultObject;


# direct methods
.method constructor <init>(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 0

    .prologue
    .line 124
    iput-object p1, p0, Lco/getair/meerkat/dtos/User$1;->val$completionRunnable:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 124
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/dtos/User$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 12
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 127
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lco/getair/meerkat/utilities/MLog;->i(Ljava/lang/String;)V

    .line 130
    :try_start_0
    const-string v9, "result"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 131
    .local v3, "result":Lorg/json/JSONObject;
    const-string v9, "followupActions"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 132
    .local v1, "followupActionsJson":Lorg/json/JSONObject;
    new-instance v9, Lcom/google/gson/Gson;

    invoke-direct {v9}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    const-class v11, Ljava/util/HashMap;

    invoke-virtual {v9, v10, v11}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 134
    .local v2, "followupActios":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v9, "info"

    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    .line 135
    .local v8, "userJson":Lorg/json/JSONObject;
    const-string v9, "stats"

    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 137
    .local v5, "statsJson":Lorg/json/JSONObject;
    new-instance v9, Lcom/google/gson/Gson;

    invoke-direct {v9}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    const-class v11, Lco/getair/meerkat/dtos/User;

    invoke-virtual {v9, v10, v11}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lco/getair/meerkat/dtos/User;

    .line 138
    .local v7, "user":Lco/getair/meerkat/dtos/User;
    invoke-virtual {v7, v2}, Lco/getair/meerkat/dtos/User;->setFollowupActions(Ljava/util/HashMap;)V

    .line 140
    new-instance v9, Lcom/google/gson/Gson;

    invoke-direct {v9}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    const-class v11, Lco/getair/meerkat/dtos/User$Stats;

    invoke-virtual {v9, v10, v11}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/dtos/User$Stats;

    .line 141
    .local v4, "stats":Lco/getair/meerkat/dtos/User$Stats;
    invoke-virtual {v7, v4}, Lco/getair/meerkat/dtos/User;->setStats(Lco/getair/meerkat/dtos/User$Stats;)V

    .line 145
    iget-object v9, p0, Lco/getair/meerkat/dtos/User$1;->val$completionRunnable:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    iput-object v7, v9, Lco/getair/meerkat/utilities/RunnableWithResultObject;->resultObject:Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 158
    new-instance v6, Ljava/lang/Thread;

    iget-object v9, p0, Lco/getair/meerkat/dtos/User$1;->val$completionRunnable:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {v6, v9}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 159
    .local v6, "thread":Ljava/lang/Thread;
    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 161
    .end local v1    # "followupActionsJson":Lorg/json/JSONObject;
    .end local v2    # "followupActios":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "result":Lorg/json/JSONObject;
    .end local v4    # "stats":Lco/getair/meerkat/dtos/User$Stats;
    .end local v5    # "statsJson":Lorg/json/JSONObject;
    .end local v6    # "thread":Ljava/lang/Thread;
    .end local v7    # "user":Lco/getair/meerkat/dtos/User;
    .end local v8    # "userJson":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 148
    :catch_0
    move-exception v0

    .line 150
    .local v0, "ex":Lorg/json/JSONException;
    const-string v9, "Error parsing user object"

    invoke-static {v9}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 152
    .end local v0    # "ex":Lorg/json/JSONException;
    :catch_1
    move-exception v0

    .line 154
    .local v0, "ex":Ljava/lang/Exception;
    const-string v9, "Error parsing user object"

    invoke-static {v9}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method
