.class public Lco/getair/meerkat/proxies/GraphProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "GraphProxy.java"


# instance fields
.field private final FOLLOWERS_KEY:Ljava/lang/String;

.field private final FOLLOWING_KEY:Ljava/lang/String;

.field private final LOG_TAG:Ljava/lang/String;

.field private final MY_USER_KEY:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private myUser:Lco/getair/meerkat/dtos/User;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 1
    .param p1, "proxyName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;)V

    .line 37
    const-string v0, "GraphProxy"

    iput-object v0, p0, Lco/getair/meerkat/proxies/GraphProxy;->LOG_TAG:Ljava/lang/String;

    .line 38
    const-string v0, "following"

    iput-object v0, p0, Lco/getair/meerkat/proxies/GraphProxy;->FOLLOWING_KEY:Ljava/lang/String;

    .line 39
    const-string v0, "followers"

    iput-object v0, p0, Lco/getair/meerkat/proxies/GraphProxy;->FOLLOWERS_KEY:Ljava/lang/String;

    .line 40
    const-string v0, "myUserKey"

    iput-object v0, p0, Lco/getair/meerkat/proxies/GraphProxy;->MY_USER_KEY:Ljava/lang/String;

    .line 48
    iput-object p2, p0, Lco/getair/meerkat/proxies/GraphProxy;->context:Landroid/content/Context;

    .line 49
    return-void
.end method

.method private getListForUser(Ljava/lang/String;Lco/getair/meerkat/dtos/User;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 6
    .param p1, "follwupActionKey"    # Ljava/lang/String;
    .param p2, "user"    # Lco/getair/meerkat/dtos/User;
    .param p3, "completionRunnable"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    .line 92
    if-nez p3, :cond_0

    .line 110
    :goto_0
    return-void

    .line 94
    :cond_0
    invoke-virtual {p2}, Lco/getair/meerkat/dtos/User;->getFollowupActions()Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 96
    .local v2, "followrsUrl":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x0

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/proxies/GraphProxy$1;

    invoke-direct {v4, p0, p3}, Lco/getair/meerkat/proxies/GraphProxy$1;-><init>(Lco/getair/meerkat/proxies/GraphProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    new-instance v5, Lco/getair/meerkat/proxies/GraphProxy$2;

    invoke-direct {v5, p0, p3}, Lco/getair/meerkat/proxies/GraphProxy$2;-><init>(Lco/getair/meerkat/proxies/GraphProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 109
    .local v0, "followUserRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/GraphProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    goto :goto_0
.end method


# virtual methods
.method public amIFollowingUser(Ljava/lang/String;)Z
    .locals 6
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    .line 227
    const/4 v2, 0x0

    .line 229
    .local v2, "result":Z
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/GraphProxy;->getMyFollowingList()Ljava/util/ArrayList;

    move-result-object v1

    .line 230
    .local v1, "following":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 235
    .local v3, "user":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    const-string v4, "id"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-eqz v4, :cond_0

    .line 237
    const/4 v2, 0x1

    .line 247
    .end local v3    # "user":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    return v2

    .line 240
    .restart local v3    # "user":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v0

    .line 242
    .local v0, "ex":Ljava/lang/Exception;
    const-string v4, "Malformed user in following"

    invoke-static {v4}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public deleteMyUser()V
    .locals 3

    .prologue
    .line 72
    invoke-static {}, Lco/getair/meerkat/utilities/DiskWriter;->getInstance()Lco/getair/meerkat/utilities/DiskWriter;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/proxies/GraphProxy;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "myUserKey"

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/utilities/DiskWriter;->deleteObject(Landroid/content/Context;Ljava/lang/String;)V

    .line 73
    return-void
.end method

.method public followUser(Lco/getair/meerkat/dtos/IUserToFollow;)V
    .locals 9
    .param p1, "user"    # Lco/getair/meerkat/dtos/IUserToFollow;

    .prologue
    .line 113
    invoke-interface {p1}, Lco/getair/meerkat/dtos/IUserToFollow;->getFollowUrl()Ljava/lang/String;

    move-result-object v2

    .line 114
    .local v2, "followUserUrl":Ljava/lang/String;
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v1

    const-string v4, "inboxProxy"

    invoke-virtual {v1, v4}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v7

    check-cast v7, Lco/getair/meerkat/proxies/InboxProxy;

    .line 115
    .local v7, "inboxProxy":Lco/getair/meerkat/proxies/InboxProxy;
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 116
    .local v8, "userJson":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "id"

    invoke-interface {p1}, Lco/getair/meerkat/dtos/IUserToFollow;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    const-string v1, "username"

    invoke-interface {p1}, Lco/getair/meerkat/dtos/IUserToFollow;->getUsername()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    const-string v1, "vname"

    invoke-interface {p1}, Lco/getair/meerkat/dtos/IUserToFollow;->getDisplayName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    const-string v1, "following"

    invoke-virtual {v7, v1, v8}, Lco/getair/meerkat/proxies/InboxProxy;->addItem(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 121
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 123
    .local v3, "params":Lorg/json/JSONObject;
    :try_start_0
    const-string v1, "auth"

    iget-object v4, p0, Lco/getair/meerkat/proxies/GraphProxy;->context:Landroid/content/Context;

    invoke-static {v4}, Lco/getair/meerkat/dtos/Session;->loadSession(Landroid/content/Context;)Lco/getair/meerkat/dtos/Session;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/dtos/Session;->getAuthToken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 124
    const-string v1, "mute"

    const/4 v4, 0x0

    invoke-virtual {v3, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    :goto_0
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x1

    new-instance v4, Lco/getair/meerkat/proxies/GraphProxy$3;

    invoke-direct {v4, p0}, Lco/getair/meerkat/proxies/GraphProxy$3;-><init>(Lco/getair/meerkat/proxies/GraphProxy;)V

    new-instance v5, Lco/getair/meerkat/proxies/GraphProxy$4;

    invoke-direct {v5, p0, v7, v8}, Lco/getair/meerkat/proxies/GraphProxy$4;-><init>(Lco/getair/meerkat/proxies/GraphProxy;Lco/getair/meerkat/proxies/InboxProxy;Ljava/util/HashMap;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 142
    .local v0, "followUserRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/GraphProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 143
    return-void

    .line 125
    .end local v0    # "followUserRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    :catch_0
    move-exception v6

    .line 126
    .local v6, "e":Lorg/json/JSONException;
    invoke-virtual {v6}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public getFollowedDisplayNameForUserId(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    .line 172
    const/4 v1, 0x0

    .line 174
    .local v1, "displayName":Ljava/lang/String;
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/GraphProxy;->getMyFollowingList()Ljava/util/ArrayList;

    move-result-object v3

    .line 175
    .local v3, "following":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    .line 179
    .local v5, "user":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    const-string v6, "id"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 181
    const-string v6, "vname"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 182
    .local v4, "tempDisplayName":Ljava/lang/String;
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 184
    :cond_1
    const-string v6, "username"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object v1, v0

    .line 198
    .end local v4    # "tempDisplayName":Ljava/lang/String;
    .end local v5    # "user":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    :goto_1
    return-object v1

    .line 186
    .restart local v4    # "tempDisplayName":Ljava/lang/String;
    .restart local v5    # "user":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    const-string v6, "vname"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object v1, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 191
    .end local v4    # "tempDisplayName":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 193
    .local v2, "ex":Ljava/lang/Exception;
    const-string v6, "Malformed user in following"

    invoke-static {v6}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getFollowedUsernameForUserId(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    .line 203
    const/4 v4, 0x0

    .line 205
    .local v4, "username":Ljava/lang/String;
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/GraphProxy;->getMyFollowingList()Ljava/util/ArrayList;

    move-result-object v2

    .line 206
    .local v2, "following":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 211
    .local v3, "user":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    const-string v5, "id"

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 213
    const-string v5, "username"

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Ljava/lang/String;

    move-object v4, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 223
    .end local v3    # "user":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    return-object v4

    .line 216
    .restart local v3    # "user":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 218
    .local v1, "ex":Ljava/lang/Exception;
    const-string v5, "Malformed user in following"

    invoke-static {v5}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getFollowersForUser(Lco/getair/meerkat/dtos/User;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 1
    .param p1, "user"    # Lco/getair/meerkat/dtos/User;
    .param p2, "completionRunnable"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    .line 87
    const-string v0, "followers"

    invoke-direct {p0, v0, p1, p2}, Lco/getair/meerkat/proxies/GraphProxy;->getListForUser(Ljava/lang/String;Lco/getair/meerkat/dtos/User;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 88
    return-void
.end method

.method public getMyFollowingCount()Ljava/lang/Integer;
    .locals 2

    .prologue
    .line 76
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/GraphProxy;->getMyFollowingList()Ljava/util/ArrayList;

    move-result-object v0

    .line 77
    .local v0, "following":Ljava/util/ArrayList;
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    return-object v1
.end method

.method public getMyFollowingList()Ljava/util/ArrayList;
    .locals 4

    .prologue
    .line 66
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v2

    const-string v3, "inboxProxy"

    invoke-virtual {v2, v3}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/InboxProxy;

    .line 67
    .local v1, "inboxProxy":Lco/getair/meerkat/proxies/InboxProxy;
    const-string v2, "following"

    invoke-virtual {v1, v2}, Lco/getair/meerkat/proxies/InboxProxy;->getBucket(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 68
    .local v0, "following":Ljava/util/ArrayList;
    return-object v0
.end method

.method public getMyFollowingList(Lco/getair/meerkat/dtos/User;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 1
    .param p1, "user"    # Lco/getair/meerkat/dtos/User;
    .param p2, "completionRunnable"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    .line 82
    const-string v0, "following"

    invoke-direct {p0, v0, p1, p2}, Lco/getair/meerkat/proxies/GraphProxy;->getListForUser(Ljava/lang/String;Lco/getair/meerkat/dtos/User;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 83
    return-void
.end method

.method public getMyUser()Lco/getair/meerkat/dtos/User;
    .locals 4

    .prologue
    .line 52
    iget-object v0, p0, Lco/getair/meerkat/proxies/GraphProxy;->myUser:Lco/getair/meerkat/dtos/User;

    .line 53
    .local v0, "result":Lco/getair/meerkat/dtos/User;
    if-nez v0, :cond_0

    .line 54
    invoke-static {}, Lco/getair/meerkat/utilities/DiskWriter;->getInstance()Lco/getair/meerkat/utilities/DiskWriter;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/proxies/GraphProxy;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "myUserKey"

    invoke-virtual {v1, v2, v3}, Lco/getair/meerkat/utilities/DiskWriter;->loadObject(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "result":Lco/getair/meerkat/dtos/User;
    check-cast v0, Lco/getair/meerkat/dtos/User;

    .line 57
    .restart local v0    # "result":Lco/getair/meerkat/dtos/User;
    :cond_0
    return-object v0
.end method

.method public setMyUser(Lco/getair/meerkat/dtos/User;)V
    .locals 3
    .param p1, "myUser"    # Lco/getair/meerkat/dtos/User;

    .prologue
    .line 61
    iput-object p1, p0, Lco/getair/meerkat/proxies/GraphProxy;->myUser:Lco/getair/meerkat/dtos/User;

    .line 62
    invoke-static {}, Lco/getair/meerkat/utilities/DiskWriter;->getInstance()Lco/getair/meerkat/utilities/DiskWriter;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/proxies/GraphProxy;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "myUserKey"

    invoke-virtual {v0, v1, p1, v2}, Lco/getair/meerkat/utilities/DiskWriter;->saveObject(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/String;)V

    .line 63
    return-void
.end method

.method public unfollowUser(Lco/getair/meerkat/dtos/IUserToFollow;)V
    .locals 8
    .param p1, "user"    # Lco/getair/meerkat/dtos/IUserToFollow;

    .prologue
    .line 146
    const-string v1, "%s&auth=%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-interface {p1}, Lco/getair/meerkat/dtos/IUserToFollow;->getFollowUrl()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lco/getair/meerkat/proxies/GraphProxy;->context:Landroid/content/Context;

    invoke-static {v5}, Lco/getair/meerkat/dtos/Session;->loadSession(Landroid/content/Context;)Lco/getair/meerkat/dtos/Session;

    move-result-object v5

    invoke-virtual {v5}, Lco/getair/meerkat/dtos/Session;->getAuthToken()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 147
    .local v2, "followUserUrl":Ljava/lang/String;
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v1

    const-string v3, "inboxProxy"

    invoke-virtual {v1, v3}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v6

    check-cast v6, Lco/getair/meerkat/proxies/InboxProxy;

    .line 148
    .local v6, "inboxProxy":Lco/getair/meerkat/proxies/InboxProxy;
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 150
    .local v7, "userJson":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "id"

    invoke-interface {p1}, Lco/getair/meerkat/dtos/IUserToFollow;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    const-string v1, "username"

    invoke-interface {p1}, Lco/getair/meerkat/dtos/IUserToFollow;->getUsername()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    const-string v1, "vname"

    invoke-interface {p1}, Lco/getair/meerkat/dtos/IUserToFollow;->getDisplayName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    const-string v1, "following"

    invoke-virtual {v6, v1, v7}, Lco/getair/meerkat/proxies/InboxProxy;->removeItem(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 155
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x3

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/proxies/GraphProxy$5;

    invoke-direct {v4, p0}, Lco/getair/meerkat/proxies/GraphProxy$5;-><init>(Lco/getair/meerkat/proxies/GraphProxy;)V

    new-instance v5, Lco/getair/meerkat/proxies/GraphProxy$6;

    invoke-direct {v5, p0, v6, v7}, Lco/getair/meerkat/proxies/GraphProxy$6;-><init>(Lco/getair/meerkat/proxies/GraphProxy;Lco/getair/meerkat/proxies/InboxProxy;Ljava/util/HashMap;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 167
    .local v0, "followUserRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/GraphProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 168
    return-void
.end method
