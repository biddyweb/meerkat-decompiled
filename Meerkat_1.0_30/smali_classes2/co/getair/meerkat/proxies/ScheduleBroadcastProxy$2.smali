.class Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$2;
.super Ljava/lang/Object;
.source "ScheduleBroadcastProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->scheduleBroadcast(Lco/getair/meerkat/dtos/ScheduleBroadcastParams;)V
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
.field final synthetic this$0:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

.field final synthetic val$scheduleBroadcastParams:Lco/getair/meerkat/dtos/ScheduleBroadcastParams;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;Lco/getair/meerkat/dtos/ScheduleBroadcastParams;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    .prologue
    .line 98
    iput-object p1, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$2;->this$0:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$2;->val$scheduleBroadcastParams:Lco/getair/meerkat/dtos/ScheduleBroadcastParams;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 98
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$2;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 14
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 106
    :try_start_0
    const-string v9, "result"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 107
    .local v5, "resultJson":Lorg/json/JSONObject;
    const-string v9, "followupActions"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 108
    .local v3, "followupActionsJson":Lorg/json/JSONObject;
    new-instance v9, Lcom/google/gson/Gson;

    invoke-direct {v9}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    const-class v11, Ljava/util/HashMap;

    invoke-virtual {v9, v10, v11}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    .line 109
    .local v4, "result":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v10, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$2;->this$0:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    new-instance v9, Lcom/google/gson/Gson;

    invoke-direct {v9}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    const-class v12, Ljava/util/HashMap;

    invoke-virtual {v9, v11, v12}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/HashMap;

    # setter for: Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->followupActions:Ljava/util/HashMap;
    invoke-static {v10, v9}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->access$002(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;Ljava/util/HashMap;)Ljava/util/HashMap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    const-string v9, "tweetFormat"

    invoke-virtual {v4, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 120
    .local v7, "tweetFormat":Ljava/lang/String;
    iget-object v9, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$2;->val$scheduleBroadcastParams:Lco/getair/meerkat/dtos/ScheduleBroadcastParams;

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;->getTimeOfBroadcast()Ljava/util/Date;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    const-wide/16 v12, 0x3e8

    div-long/2addr v10, v12

    const-string v9, "%d %s"

    invoke-static {v10, v11, v9}, Lco/getair/meerkat/utilities/DateFormatter;->futureTimeString(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 121
    .local v8, "tweetTimeFromNow":Ljava/lang/String;
    const-string v9, "{@caption@}"

    invoke-virtual {v7, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    const/4 v10, -0x1

    if-le v9, v10, :cond_3

    const-string v9, "{@time@}"

    invoke-virtual {v7, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    const/4 v10, -0x1

    if-le v9, v10, :cond_3

    .line 123
    const-string v9, "{@time@}"

    invoke-virtual {v7, v9, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    .line 124
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v6, v9, -0xb

    .line 125
    .local v6, "totalLength":I
    const/16 v0, 0x63

    .line 126
    .local v0, "captionAllowedLength":I
    iget-object v9, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$2;->val$scheduleBroadcastParams:Lco/getair/meerkat/dtos/ScheduleBroadcastParams;

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;->getCaption()Ljava/lang/String;

    move-result-object v1

    .line 127
    .local v1, "captionText":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v9

    if-le v9, v0, :cond_0

    .line 129
    const/4 v9, 0x0

    invoke-virtual {v1, v9, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 132
    :cond_0
    const-string v9, "{@caption@}"

    invoke-virtual {v7, v9, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    .line 140
    .end local v0    # "captionAllowedLength":I
    .end local v1    # "captionText":Ljava/lang/String;
    .end local v6    # "totalLength":I
    :cond_1
    :goto_0
    iget-object v10, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$2;->this$0:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    iget-object v9, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$2;->this$0:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    # getter for: Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->followupActions:Ljava/util/HashMap;
    invoke-static {v9}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->access$000(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;)Ljava/util/HashMap;

    move-result-object v11

    const-string v9, "id"

    invoke-virtual {v4, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    # invokes: Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->tweetBroadcast(Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;)V
    invoke-static {v10, v7, v11, v9}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->access$100(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;)V

    .line 143
    iget-object v9, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$2;->val$scheduleBroadcastParams:Lco/getair/meerkat/dtos/ScheduleBroadcastParams;

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;->getCoverImage()Landroid/graphics/Bitmap;

    move-result-object v9

    if-eqz v9, :cond_2

    .line 145
    iget-object v9, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$2;->this$0:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    iget-object v10, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$2;->val$scheduleBroadcastParams:Lco/getair/meerkat/dtos/ScheduleBroadcastParams;

    invoke-virtual {v10}, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;->getCoverImage()Landroid/graphics/Bitmap;

    move-result-object v10

    invoke-virtual {v9, v10}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->uploadCoverImage(Landroid/graphics/Bitmap;)V

    .line 148
    :cond_2
    iget-object v9, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$2;->this$0:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    iget-object v10, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$2;->val$scheduleBroadcastParams:Lco/getair/meerkat/dtos/ScheduleBroadcastParams;

    # invokes: Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->scheduleBroadcastReminder(Lco/getair/meerkat/dtos/ScheduleBroadcastParams;)V
    invoke-static {v9, v10}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->access$200(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;Lco/getair/meerkat/dtos/ScheduleBroadcastParams;)V

    .line 150
    .end local v3    # "followupActionsJson":Lorg/json/JSONObject;
    .end local v4    # "result":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "resultJson":Lorg/json/JSONObject;
    .end local v7    # "tweetFormat":Ljava/lang/String;
    .end local v8    # "tweetTimeFromNow":Ljava/lang/String;
    :goto_1
    return-void

    .line 111
    :catch_0
    move-exception v2

    .line 114
    .local v2, "ex":Ljava/lang/Exception;
    goto :goto_1

    .line 134
    .end local v2    # "ex":Ljava/lang/Exception;
    .restart local v3    # "followupActionsJson":Lorg/json/JSONObject;
    .restart local v4    # "result":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "resultJson":Lorg/json/JSONObject;
    .restart local v7    # "tweetFormat":Ljava/lang/String;
    .restart local v8    # "tweetTimeFromNow":Ljava/lang/String;
    :cond_3
    const-string v9, "{@time@}"

    invoke-virtual {v7, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    const/4 v10, -0x1

    if-le v9, v10, :cond_1

    .line 136
    const-string v9, "{@time@}"

    invoke-virtual {v7, v9, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    goto :goto_0
.end method
