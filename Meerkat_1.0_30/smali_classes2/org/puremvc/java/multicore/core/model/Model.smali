.class public Lorg/puremvc/java/multicore/core/model/Model;
.super Ljava/lang/Object;
.source "Model.java"

# interfaces
.implements Lorg/puremvc/java/multicore/interfaces/IModel;


# static fields
.field protected static instance:Lorg/puremvc/java/multicore/core/model/Model;

.field protected static instanceMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/puremvc/java/multicore/core/model/Model;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected multitonKey:Ljava/lang/String;

.field protected proxyMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/puremvc/java/multicore/interfaces/IProxy;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/puremvc/java/multicore/core/model/Model;->instanceMap:Ljava/util/Map;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput-object p1, p0, Lorg/puremvc/java/multicore/core/model/Model;->multitonKey:Ljava/lang/String;

    .line 74
    sget-object v0, Lorg/puremvc/java/multicore/core/model/Model;->instanceMap:Ljava/util/Map;

    iget-object v1, p0, Lorg/puremvc/java/multicore/core/model/Model;->multitonKey:Ljava/lang/String;

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/puremvc/java/multicore/core/model/Model;->proxyMap:Ljava/util/Map;

    .line 76
    invoke-virtual {p0}, Lorg/puremvc/java/multicore/core/model/Model;->initializeModel()V

    .line 77
    return-void
.end method

.method public static declared-synchronized getInstance(Ljava/lang/String;)Lorg/puremvc/java/multicore/core/model/Model;
    .locals 2
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 98
    const-class v1, Lorg/puremvc/java/multicore/core/model/Model;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/puremvc/java/multicore/core/model/Model;->instanceMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 99
    new-instance v0, Lorg/puremvc/java/multicore/core/model/Model;

    invoke-direct {v0, p0}, Lorg/puremvc/java/multicore/core/model/Model;-><init>(Ljava/lang/String;)V

    .line 101
    :cond_0
    sget-object v0, Lorg/puremvc/java/multicore/core/model/Model;->instanceMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/puremvc/java/multicore/core/model/Model;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 98
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized removeModel(Ljava/lang/String;)V
    .locals 2
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 148
    const-class v1, Lorg/puremvc/java/multicore/core/model/Model;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/puremvc/java/multicore/core/model/Model;->instanceMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    monitor-exit v1

    return-void

    .line 148
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public clearModel()V
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lorg/puremvc/java/multicore/core/model/Model;->proxyMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 163
    return-void
.end method

.method public hasProxy(Ljava/lang/String;)Z
    .locals 1
    .param p1, "proxyName"    # Ljava/lang/String;

    .prologue
    .line 158
    iget-object v0, p0, Lorg/puremvc/java/multicore/core/model/Model;->proxyMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected initializeModel()V
    .locals 0

    .prologue
    .line 90
    return-void
.end method

.method public registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V
    .locals 2
    .param p1, "proxy"    # Lorg/puremvc/java/multicore/interfaces/IProxy;

    .prologue
    .line 111
    iget-object v0, p0, Lorg/puremvc/java/multicore/core/model/Model;->multitonKey:Ljava/lang/String;

    invoke-interface {p1, v0}, Lorg/puremvc/java/multicore/interfaces/IProxy;->initializeNotifier(Ljava/lang/String;)V

    .line 112
    iget-object v0, p0, Lorg/puremvc/java/multicore/core/model/Model;->proxyMap:Ljava/util/Map;

    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/IProxy;->getProxyName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/IProxy;->onRegister()V

    .line 114
    return-void
.end method

.method public removeProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;
    .locals 2
    .param p1, "proxyName"    # Ljava/lang/String;

    .prologue
    .line 123
    iget-object v1, p0, Lorg/puremvc/java/multicore/core/model/Model;->proxyMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/puremvc/java/multicore/interfaces/IProxy;

    .line 124
    .local v0, "proxy":Lorg/puremvc/java/multicore/interfaces/IProxy;
    if-eqz v0, :cond_0

    .line 125
    iget-object v1, p0, Lorg/puremvc/java/multicore/core/model/Model;->proxyMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    invoke-interface {v0}, Lorg/puremvc/java/multicore/interfaces/IProxy;->onRemove()V

    .line 128
    :cond_0
    return-object v0
.end method

.method public retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;
    .locals 1
    .param p1, "proxy"    # Ljava/lang/String;

    .prologue
    .line 139
    iget-object v0, p0, Lorg/puremvc/java/multicore/core/model/Model;->proxyMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/puremvc/java/multicore/interfaces/IProxy;

    return-object v0
.end method
