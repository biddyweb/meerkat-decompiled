.class public Lco/getair/meerkat/ApiProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "ApiProxy.java"


# static fields
.field private static mInstance:Lco/getair/meerkat/ApiProxy;


# instance fields
.field private LOG_TAG:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private followupActions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private proxyHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/puremvc/java/multicore/interfaces/IProxy;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 1
    .param p1, "proxyName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;)V

    .line 26
    const-string v0, "ApiProxy"

    iput-object v0, p0, Lco/getair/meerkat/ApiProxy;->LOG_TAG:Ljava/lang/String;

    .line 48
    invoke-direct {p0, p2}, Lco/getair/meerkat/ApiProxy;->loadPreviousState(Landroid/content/Context;)V

    .line 49
    iput-object p2, p0, Lco/getair/meerkat/ApiProxy;->context:Landroid/content/Context;

    .line 50
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    const-class v1, Lco/getair/meerkat/ApiProxy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lco/getair/meerkat/ApiProxy;->mInstance:Lco/getair/meerkat/ApiProxy;

    if-nez v0, :cond_0

    .line 39
    new-instance v0, Lco/getair/meerkat/ApiProxy;

    const-string v2, "apiProxy"

    invoke-direct {v0, v2, p0}, Lco/getair/meerkat/ApiProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    sput-object v0, Lco/getair/meerkat/ApiProxy;->mInstance:Lco/getair/meerkat/ApiProxy;

    .line 42
    :cond_0
    sget-object v0, Lco/getair/meerkat/ApiProxy;->mInstance:Lco/getair/meerkat/ApiProxy;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 38
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private loadPreviousState(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 196
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lco/getair/meerkat/ApiProxy;->getProxyName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "followupActions"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v1

    .line 197
    .local v1, "fis":Ljava/io/FileInputStream;
    new-instance v3, Ljava/io/ObjectInputStream;

    invoke-direct {v3, v1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 198
    .local v3, "is":Ljava/io/ObjectInputStream;
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 199
    .local v2, "followupActions":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->close()V

    .line 201
    if-eqz v2, :cond_0

    .line 202
    iput-object v2, p0, Lco/getair/meerkat/ApiProxy;->followupActions:Ljava/util/HashMap;

    .line 230
    .end local v1    # "fis":Ljava/io/FileInputStream;
    .end local v2    # "followupActions":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "is":Ljava/io/ObjectInputStream;
    :goto_0
    return-void

    .line 204
    .restart local v1    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "followupActions":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v3    # "is":Ljava/io/ObjectInputStream;
    :cond_0
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, p0, Lco/getair/meerkat/ApiProxy;->followupActions:Ljava/util/HashMap;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 218
    .end local v1    # "fis":Ljava/io/FileInputStream;
    .end local v2    # "followupActions":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "is":Ljava/io/ObjectInputStream;
    :catch_0
    move-exception v0

    .line 219
    .local v0, "ex":Ljava/io/FileNotFoundException;
    iget-object v4, p0, Lco/getair/meerkat/ApiProxy;->LOG_TAG:Ljava/lang/String;

    const-string v5, "FileNotFoundException"

    invoke-static {v4, v5}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 222
    .end local v0    # "ex":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v0

    .line 223
    .local v0, "ex":Ljava/io/IOException;
    iget-object v4, p0, Lco/getair/meerkat/ApiProxy;->LOG_TAG:Ljava/lang/String;

    const-string v5, "IOException"

    invoke-static {v4, v5}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 225
    .end local v0    # "ex":Ljava/io/IOException;
    :catch_2
    move-exception v0

    .line 226
    .local v0, "ex":Ljava/lang/ClassNotFoundException;
    iget-object v4, p0, Lco/getair/meerkat/ApiProxy;->LOG_TAG:Ljava/lang/String;

    const-string v5, "ClassNotFoundException"

    invoke-static {v4, v5}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method private saveFollowupActions(Landroid/content/Context;)Z
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 150
    const/4 v3, 0x0

    .line 152
    .local v3, "result":Z
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lco/getair/meerkat/ApiProxy;->getProxyName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "followupActions"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {p1, v4, v5}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v1

    .line 153
    .local v1, "fos":Ljava/io/FileOutputStream;
    new-instance v2, Ljava/io/ObjectOutputStream;

    invoke-direct {v2, v1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 154
    .local v2, "os":Ljava/io/ObjectOutputStream;
    iget-object v4, p0, Lco/getair/meerkat/ApiProxy;->followupActions:Ljava/util/HashMap;

    invoke-virtual {v2, v4}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 155
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 157
    const/4 v3, 0x1

    .line 168
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .end local v2    # "os":Ljava/io/ObjectOutputStream;
    :goto_0
    return v3

    .line 158
    :catch_0
    move-exception v0

    .line 159
    .local v0, "ex":Ljava/io/FileNotFoundException;
    iget-object v4, p0, Lco/getair/meerkat/ApiProxy;->LOG_TAG:Ljava/lang/String;

    const-string v5, "FileNotFoundException"

    invoke-static {v4, v5}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 162
    .end local v0    # "ex":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v0

    .line 163
    .local v0, "ex":Ljava/io/IOException;
    iget-object v4, p0, Lco/getair/meerkat/ApiProxy;->LOG_TAG:Ljava/lang/String;

    const-string v5, "IOException"

    invoke-static {v4, v5}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 137
    const/4 v0, 0x0

    .line 139
    .local v0, "url":Ljava/lang/String;
    iget-object v1, p0, Lco/getair/meerkat/ApiProxy;->followupActions:Ljava/util/HashMap;

    if-eqz v1, :cond_0

    .line 141
    iget-object v1, p0, Lco/getair/meerkat/ApiProxy;->followupActions:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 144
    .restart local v0    # "url":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method public registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V
    .locals 2
    .param p1, "proxy"    # Lorg/puremvc/java/multicore/interfaces/IProxy;

    .prologue
    .line 62
    if-nez p1, :cond_0

    .line 71
    :goto_0
    return-void

    .line 64
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/ApiProxy;->proxyHashMap:Ljava/util/HashMap;

    if-nez v0, :cond_1

    .line 66
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/ApiProxy;->proxyHashMap:Ljava/util/HashMap;

    .line 69
    :cond_1
    iget-object v0, p0, Lco/getair/meerkat/ApiProxy;->proxyHashMap:Ljava/util/HashMap;

    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/IProxy;->getProxyName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;
    .locals 1
    .param p1, "proxyName"    # Ljava/lang/String;

    .prologue
    .line 80
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lco/getair/meerkat/ApiProxy;->retrieveProxy(Ljava/lang/String;Ljava/util/concurrent/Callable;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    return-object v0
.end method

.method public retrieveProxy(Ljava/lang/String;Ljava/util/concurrent/Callable;)Lorg/puremvc/java/multicore/interfaces/IProxy;
    .locals 4
    .param p1, "proxyName"    # Ljava/lang/String;
    .param p2, "constructor"    # Ljava/util/concurrent/Callable;

    .prologue
    .line 91
    const/4 v2, 0x0

    .line 92
    .local v2, "proxy":Lorg/puremvc/java/multicore/interfaces/IProxy;
    iget-object v3, p0, Lco/getair/meerkat/ApiProxy;->proxyHashMap:Ljava/util/HashMap;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lco/getair/meerkat/ApiProxy;->proxyHashMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 95
    :cond_0
    :try_start_0
    invoke-interface {p2}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-object v2, v0

    .line 97
    if-eqz v2, :cond_1

    .line 99
    invoke-virtual {p0, v2}, Lco/getair/meerkat/ApiProxy;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    :cond_1
    :goto_0
    return-object v2

    .line 101
    :catch_0
    move-exception v1

    .line 103
    .local v1, "ex":Ljava/lang/Exception;
    const/4 v2, 0x0

    .line 104
    goto :goto_0

    .line 107
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_2
    iget-object v3, p0, Lco/getair/meerkat/ApiProxy;->proxyHashMap:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "proxy":Lorg/puremvc/java/multicore/interfaces/IProxy;
    check-cast v2, Lorg/puremvc/java/multicore/interfaces/IProxy;

    .restart local v2    # "proxy":Lorg/puremvc/java/multicore/interfaces/IProxy;
    goto :goto_0
.end method

.method public setFollowupActions(Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 117
    .local p1, "followupActions":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lco/getair/meerkat/ApiProxy;->followupActions:Ljava/util/HashMap;

    .line 118
    iget-object v0, p0, Lco/getair/meerkat/ApiProxy;->context:Landroid/content/Context;

    invoke-direct {p0, v0}, Lco/getair/meerkat/ApiProxy;->saveFollowupActions(Landroid/content/Context;)Z

    .line 119
    return-void
.end method

.method public setFollowupActionsFromJson(Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "jsonObject"    # Lorg/json/JSONObject;

    .prologue
    .line 124
    :try_start_0
    const-string v3, "followupActions"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 125
    .local v1, "followupActions":Lorg/json/JSONObject;
    invoke-static {v1}, Lco/getair/meerkat/utilities/JSONObjectParser;->toMap(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v2

    .line 126
    .local v2, "followupActionsMap":Ljava/util/HashMap;
    invoke-virtual {p0, v2}, Lco/getair/meerkat/ApiProxy;->setFollowupActions(Ljava/util/HashMap;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    .end local v1    # "followupActions":Lorg/json/JSONObject;
    .end local v2    # "followupActionsMap":Ljava/util/HashMap;
    :goto_0
    return-void

    .line 127
    :catch_0
    move-exception v0

    .line 129
    .local v0, "ex":Ljava/lang/Exception;
    const-string v3, "Failed parsing FollowUpActions from given object"

    invoke-static {v3}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method
