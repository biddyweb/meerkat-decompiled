.class Lco/getair/meerkat/proxies/AuthorizeProxy$1;
.super Ljava/lang/Object;
.source "AuthorizeProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/AuthorizeProxy;->authorizeWithNewToken(Ljava/lang/Boolean;Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
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
.field final synthetic this$0:Lco/getair/meerkat/proxies/AuthorizeProxy;

.field final synthetic val$completion:Lco/getair/meerkat/utilities/RunnableWithResultObject;

.field final synthetic val$deviceToken:Ljava/lang/String;

.field final synthetic val$type:Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/AuthorizeProxy;Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/AuthorizeProxy;

    .prologue
    .line 93
    iput-object p1, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->this$0:Lco/getair/meerkat/proxies/AuthorizeProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->val$type:Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    iput-object p3, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->val$deviceToken:Ljava/lang/String;

    iput-object p4, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->val$completion:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 93
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 24
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 96
    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lco/getair/meerkat/utilities/MLog;->i(Ljava/lang/String;)V

    .line 99
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->this$0:Lco/getair/meerkat/proxies/AuthorizeProxy;

    move-object/from16 v20, v0

    # getter for: Lco/getair/meerkat/proxies/AuthorizeProxy;->context:Landroid/content/Context;
    invoke-static/range {v20 .. v20}, Lco/getair/meerkat/proxies/AuthorizeProxy;->access$000(Lco/getair/meerkat/proxies/AuthorizeProxy;)Landroid/content/Context;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/ApiProxy;->setFollowupActionsFromJson(Lorg/json/JSONObject;)V

    .line 101
    invoke-static/range {p1 .. p1}, Lco/getair/meerkat/utilities/JSONObjectParser;->toMap(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v20

    const-string v21, "result"

    invoke-virtual/range {v20 .. v21}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/HashMap;

    .line 104
    .local v15, "resultMap":Ljava/util/HashMap;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->this$0:Lco/getair/meerkat/proxies/AuthorizeProxy;

    move-object/from16 v20, v0

    # getter for: Lco/getair/meerkat/proxies/AuthorizeProxy;->context:Landroid/content/Context;
    invoke-static/range {v20 .. v20}, Lco/getair/meerkat/proxies/AuthorizeProxy;->access$000(Lco/getair/meerkat/proxies/AuthorizeProxy;)Landroid/content/Context;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v20

    const-string v21, "addWatcherTemplate"

    invoke-virtual/range {v20 .. v21}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 105
    .local v4, "addWatcherTemplate":Ljava/lang/String;
    new-instance v5, Lco/getair/meerkat/utilities/ApplicationPreferences;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->this$0:Lco/getair/meerkat/proxies/AuthorizeProxy;

    move-object/from16 v20, v0

    # getter for: Lco/getair/meerkat/proxies/AuthorizeProxy;->context:Landroid/content/Context;
    invoke-static/range {v20 .. v20}, Lco/getair/meerkat/proxies/AuthorizeProxy;->access$000(Lco/getair/meerkat/proxies/AuthorizeProxy;)Landroid/content/Context;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-direct {v5, v0}, Lco/getair/meerkat/utilities/ApplicationPreferences;-><init>(Landroid/content/Context;)V

    .line 106
    .local v5, "applicationPreferences":Lco/getair/meerkat/utilities/ApplicationPreferences;
    invoke-virtual {v5, v4}, Lco/getair/meerkat/utilities/ApplicationPreferences;->saveAddWatchersTemplate(Ljava/lang/String;)V

    .line 108
    invoke-virtual {v5}, Lco/getair/meerkat/utilities/ApplicationPreferences;->isFirstTimeUploadingProfileImage()Z

    move-result v20

    if-eqz v20, :cond_0

    .line 109
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->this$0:Lco/getair/meerkat/proxies/AuthorizeProxy;

    move-object/from16 v20, v0

    const-string v21, "uploadProfileImage"

    const/16 v22, 0x0

    const/16 v23, 0x0

    invoke-virtual/range {v20 .. v23}, Lco/getair/meerkat/proxies/AuthorizeProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 110
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v5, v0}, Lco/getair/meerkat/utilities/ApplicationPreferences;->saveIsFirstTimeUploadingProfileImage(Z)V

    .line 114
    :cond_0
    const-string v20, "auth"

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 115
    .local v6, "auth":Ljava/lang/String;
    const-string v20, "expire"

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 117
    .local v12, "expiresInString":Ljava/lang/String;
    new-instance v8, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    move-wide/from16 v0, v20

    invoke-direct {v8, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 118
    .local v8, "date":Ljava/util/Date;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v7

    .line 119
    .local v7, "calendar":Ljava/util/Calendar;
    invoke-virtual {v7, v8}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 120
    const/16 v20, 0xc

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v7, v0, v1}, Ljava/util/Calendar;->add(II)V

    .line 122
    invoke-virtual {v7}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v10

    .line 124
    .local v10, "expirationTime":J
    const-string v20, "shouldProvidePhoneNumber"

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/Boolean;

    .line 126
    .local v17, "shouldProvidePhoneNumber":Ljava/lang/Boolean;
    new-instance v16, Lco/getair/meerkat/dtos/Session;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v20

    move-object/from16 v0, v16

    move/from16 v1, v20

    invoke-direct {v0, v6, v10, v11, v1}, Lco/getair/meerkat/dtos/Session;-><init>(Ljava/lang/String;JZ)V

    .line 127
    .local v16, "session":Lco/getair/meerkat/dtos/Session;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->this$0:Lco/getair/meerkat/proxies/AuthorizeProxy;

    move-object/from16 v20, v0

    # getter for: Lco/getair/meerkat/proxies/AuthorizeProxy;->context:Landroid/content/Context;
    invoke-static/range {v20 .. v20}, Lco/getair/meerkat/proxies/AuthorizeProxy;->access$000(Lco/getair/meerkat/proxies/AuthorizeProxy;)Landroid/content/Context;

    move-result-object v20

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lco/getair/meerkat/dtos/Session;->saveSession(Landroid/content/Context;)V

    .line 129
    const-string v20, "user"

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/util/HashMap;

    .line 130
    .local v18, "user":Ljava/util/HashMap;
    const-string v20, "inbox"

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    .line 132
    .local v14, "inboxString":Ljava/lang/String;
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v20

    const-string v21, "inboxProxy"

    invoke-virtual/range {v20 .. v21}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v13

    check-cast v13, Lco/getair/meerkat/proxies/InboxProxy;

    .line 133
    .local v13, "inboxProxy":Lco/getair/meerkat/proxies/InboxProxy;
    invoke-virtual {v13, v14}, Lco/getair/meerkat/proxies/InboxProxy;->updateInbox(Ljava/lang/String;)V

    .line 135
    const-string v20, "id"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 137
    .local v19, "userId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/proxies/AuthorizeProxy$1;->this$0:Lco/getair/meerkat/proxies/AuthorizeProxy;

    move-object/from16 v20, v0

    # getter for: Lco/getair/meerkat/proxies/AuthorizeProxy;->context:Landroid/content/Context;
    invoke-static/range {v20 .. v20}, Lco/getair/meerkat/proxies/AuthorizeProxy;->access$000(Lco/getair/meerkat/proxies/AuthorizeProxy;)Landroid/content/Context;

    move-result-object v20

    new-instance v21, Lco/getair/meerkat/proxies/AuthorizeProxy$1$1;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/getair/meerkat/proxies/AuthorizeProxy$1$1;-><init>(Lco/getair/meerkat/proxies/AuthorizeProxy$1;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lco/getair/meerkat/dtos/User;->fetchUser(Landroid/content/Context;Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 225
    .end local v4    # "addWatcherTemplate":Ljava/lang/String;
    .end local v5    # "applicationPreferences":Lco/getair/meerkat/utilities/ApplicationPreferences;
    .end local v6    # "auth":Ljava/lang/String;
    .end local v7    # "calendar":Ljava/util/Calendar;
    .end local v8    # "date":Ljava/util/Date;
    .end local v10    # "expirationTime":J
    .end local v12    # "expiresInString":Ljava/lang/String;
    .end local v13    # "inboxProxy":Lco/getair/meerkat/proxies/InboxProxy;
    .end local v14    # "inboxString":Ljava/lang/String;
    .end local v15    # "resultMap":Ljava/util/HashMap;
    .end local v16    # "session":Lco/getair/meerkat/dtos/Session;
    .end local v17    # "shouldProvidePhoneNumber":Ljava/lang/Boolean;
    .end local v18    # "user":Ljava/util/HashMap;
    .end local v19    # "userId":Ljava/lang/String;
    :goto_0
    return-void

    .line 218
    :catch_0
    move-exception v9

    .line 219
    .local v9, "ex":Lorg/json/JSONException;
    const-string v20, "Error parsing response JSON data for authorizing: %s, %s"

    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x1

    invoke-virtual {v9}, Lorg/json/JSONException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 220
    .end local v9    # "ex":Lorg/json/JSONException;
    :catch_1
    move-exception v9

    .line 221
    .local v9, "ex":Ljava/lang/Exception;
    const-string v20, "Error while processing authorizing response: %s, %s"

    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x1

    invoke-virtual {v9}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method
