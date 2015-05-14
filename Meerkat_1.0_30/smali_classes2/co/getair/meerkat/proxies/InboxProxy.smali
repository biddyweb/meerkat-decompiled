.class public Lco/getair/meerkat/proxies/InboxProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "InboxProxy.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static executorService:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private GET_INBOX_URL_KEY:Ljava/lang/String;

.field private ID_KEY:Ljava/lang/String;

.field private INBOX_KEY:Ljava/lang/String;

.field private LOG_TAG:Ljava/lang/String;

.field private ORDER_KEY:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private inbox:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 47
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lco/getair/meerkat/proxies/InboxProxy;->executorService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 2
    .param p1, "proxyName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;)V

    .line 40
    const-string v1, "InboxProxy"

    iput-object v1, p0, Lco/getair/meerkat/proxies/InboxProxy;->LOG_TAG:Ljava/lang/String;

    .line 41
    const-string v1, "id"

    iput-object v1, p0, Lco/getair/meerkat/proxies/InboxProxy;->ID_KEY:Ljava/lang/String;

    .line 42
    const-string v1, "o"

    iput-object v1, p0, Lco/getair/meerkat/proxies/InboxProxy;->ORDER_KEY:Ljava/lang/String;

    .line 44
    const-string v1, "inbox"

    iput-object v1, p0, Lco/getair/meerkat/proxies/InboxProxy;->GET_INBOX_URL_KEY:Ljava/lang/String;

    .line 45
    const-string v1, "inboxKey"

    iput-object v1, p0, Lco/getair/meerkat/proxies/InboxProxy;->INBOX_KEY:Ljava/lang/String;

    .line 57
    invoke-direct {p0, p2}, Lco/getair/meerkat/proxies/InboxProxy;->loadInbox(Landroid/content/Context;)Ljava/util/HashMap;

    move-result-object v0

    .line 58
    .local v0, "inbox":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList;>;"
    if-eqz v0, :cond_0

    .end local v0    # "inbox":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList;>;"
    :goto_0
    iput-object v0, p0, Lco/getair/meerkat/proxies/InboxProxy;->inbox:Ljava/util/HashMap;

    .line 59
    iput-object p2, p0, Lco/getair/meerkat/proxies/InboxProxy;->context:Landroid/content/Context;

    .line 60
    return-void

    .line 58
    .restart local v0    # "inbox":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList;>;"
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    .end local v0    # "inbox":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList;>;"
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    goto :goto_0
.end method

.method private _addItem(Ljava/util/HashMap;Ljava/lang/String;Ljava/util/HashMap;)Ljava/util/HashMap;
    .locals 8
    .param p2, "bucketKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList;",
            ">;)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList;",
            ">;"
        }
    .end annotation

    .prologue
    .line 266
    .local p1, "itemToAdd":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p3, "inbox":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList;>;"
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4, p3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 268
    .local v4, "result":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList;>;"
    invoke-virtual {v4, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_1

    invoke-virtual {v4, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/ArrayList;

    move-object v0, v6

    .line 270
    .local v0, "bucket":Ljava/util/ArrayList;
    :goto_0
    const/4 v5, 0x0

    .line 271
    .local v5, "shouldUpdate":Z
    const/4 v2, 0x0

    .line 273
    .local v2, "insertionIndex":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v1, v6, :cond_0

    .line 274
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 275
    .local v3, "item":Ljava/util/HashMap;
    iget-object v6, p0, Lco/getair/meerkat/proxies/InboxProxy;->ID_KEY:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    iget-object v7, p0, Lco/getair/meerkat/proxies/InboxProxy;->ID_KEY:Ljava/lang/String;

    invoke-virtual {p1, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 276
    move v2, v1

    .line 277
    const/4 v5, 0x1

    .line 282
    .end local v3    # "item":Ljava/util/HashMap;
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-le v6, v2, :cond_3

    if-eqz v5, :cond_3

    .line 283
    invoke-virtual {v0, v2, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 288
    :goto_2
    invoke-virtual {v4, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    return-object v4

    .line 268
    .end local v0    # "bucket":Ljava/util/ArrayList;
    .end local v1    # "i":I
    .end local v2    # "insertionIndex":I
    .end local v5    # "shouldUpdate":Z
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0

    .line 273
    .restart local v0    # "bucket":Ljava/util/ArrayList;
    .restart local v1    # "i":I
    .restart local v2    # "insertionIndex":I
    .restart local v3    # "item":Ljava/util/HashMap;
    .restart local v5    # "shouldUpdate":Z
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 285
    .end local v3    # "item":Ljava/util/HashMap;
    :cond_3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method

.method private _clearBucketFromInbox(Ljava/lang/String;Ljava/util/HashMap;)Ljava/util/HashMap;
    .locals 1
    .param p1, "bucketKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList;",
            ">;)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList;",
            ">;"
        }
    .end annotation

    .prologue
    .line 237
    .local p2, "inbox":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 238
    .local v0, "result":Ljava/util/HashMap;
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    return-object v0
.end method

.method private _removeItem(Ljava/util/HashMap;Ljava/lang/String;Ljava/util/HashMap;)Ljava/util/HashMap;
    .locals 8
    .param p2, "bucketKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList;",
            ">;)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList;",
            ">;"
        }
    .end annotation

    .prologue
    .line 243
    .local p1, "itemToRemove":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p3, "inbox":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList;>;"
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5, p3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 244
    .local v5, "result":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList;>;"
    invoke-virtual {v5, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_2

    invoke-virtual {v5, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/ArrayList;

    move-object v0, v6

    .line 246
    .local v0, "bucket":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap;>;"
    :goto_0
    const/4 v1, -0x1

    .line 247
    .local v1, "deletionIndex":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v2, v6, :cond_0

    .line 248
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    .line 249
    .local v4, "item":Ljava/util/HashMap;
    iget-object v6, p0, Lco/getair/meerkat/proxies/InboxProxy;->ID_KEY:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    iget-object v7, p0, Lco/getair/meerkat/proxies/InboxProxy;->ID_KEY:Ljava/lang/String;

    invoke-virtual {p1, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 250
    move v1, v2

    .line 255
    .end local v4    # "item":Ljava/util/HashMap;
    :cond_0
    const/4 v3, 0x0

    .line 256
    .local v3, "ietm":Ljava/lang/Object;
    if-ltz v1, :cond_1

    .line 257
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v3

    .line 260
    .end local v3    # "ietm":Ljava/lang/Object;
    :cond_1
    invoke-virtual {v5, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    return-object v5

    .line 244
    .end local v0    # "bucket":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap;>;"
    .end local v1    # "deletionIndex":I
    .end local v2    # "i":I
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0

    .line 247
    .restart local v0    # "bucket":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap;>;"
    .restart local v1    # "deletionIndex":I
    .restart local v2    # "i":I
    .restart local v4    # "item":Ljava/util/HashMap;
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method static synthetic access$000(Lco/getair/meerkat/proxies/InboxProxy;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/InboxProxy;

    .prologue
    .line 38
    iget-object v0, p0, Lco/getair/meerkat/proxies/InboxProxy;->LOG_TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/proxies/InboxProxy;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/InboxProxy;

    .prologue
    .line 38
    iget-object v0, p0, Lco/getair/meerkat/proxies/InboxProxy;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Lco/getair/meerkat/proxies/InboxProxy;Landroid/content/Context;Ljava/util/HashMap;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/InboxProxy;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Ljava/util/HashMap;

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Lco/getair/meerkat/proxies/InboxProxy;->saveChanges(Landroid/content/Context;Ljava/util/HashMap;)V

    return-void
.end method

.method static synthetic access$300(Lco/getair/meerkat/proxies/InboxProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/InboxProxy;

    .prologue
    .line 38
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/InboxProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lco/getair/meerkat/proxies/InboxProxy;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/InboxProxy;

    .prologue
    .line 38
    iget-object v0, p0, Lco/getair/meerkat/proxies/InboxProxy;->inbox:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$500(Lco/getair/meerkat/proxies/InboxProxy;Ljava/lang/String;Ljava/util/HashMap;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/InboxProxy;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/util/HashMap;

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Lco/getair/meerkat/proxies/InboxProxy;->_clearBucketFromInbox(Ljava/lang/String;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lco/getair/meerkat/proxies/InboxProxy;Ljava/util/HashMap;Ljava/lang/String;Ljava/util/HashMap;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/InboxProxy;
    .param p1, "x1"    # Ljava/util/HashMap;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/util/HashMap;

    .prologue
    .line 38
    invoke-direct {p0, p1, p2, p3}, Lco/getair/meerkat/proxies/InboxProxy;->_removeItem(Ljava/util/HashMap;Ljava/lang/String;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lco/getair/meerkat/proxies/InboxProxy;Ljava/util/HashMap;Ljava/lang/String;Ljava/util/HashMap;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/InboxProxy;
    .param p1, "x1"    # Ljava/util/HashMap;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/util/HashMap;

    .prologue
    .line 38
    invoke-direct {p0, p1, p2, p3}, Lco/getair/meerkat/proxies/InboxProxy;->_addItem(Ljava/util/HashMap;Ljava/lang/String;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method private getInbox()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList;",
            ">;"
        }
    .end annotation

    .prologue
    .line 229
    iget-object v0, p0, Lco/getair/meerkat/proxies/InboxProxy;->inbox:Ljava/util/HashMap;

    return-object v0
.end method

.method private loadInbox(Landroid/content/Context;)Ljava/util/HashMap;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList;",
            ">;"
        }
    .end annotation

    .prologue
    .line 299
    const/4 v0, 0x0

    .line 301
    .local v0, "result":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList;>;"
    invoke-static {}, Lco/getair/meerkat/utilities/DiskWriter;->getInstance()Lco/getair/meerkat/utilities/DiskWriter;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/proxies/InboxProxy;->INBOX_KEY:Ljava/lang/String;

    invoke-virtual {v1, p1, v2}, Lco/getair/meerkat/utilities/DiskWriter;->loadObject(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "result":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList;>;"
    check-cast v0, Ljava/util/HashMap;

    .line 303
    .restart local v0    # "result":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList;>;"
    return-object v0
.end method

.method private saveChanges(Landroid/content/Context;Ljava/util/HashMap;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 294
    .local p2, "newInbox":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList;>;"
    iput-object p2, p0, Lco/getair/meerkat/proxies/InboxProxy;->inbox:Ljava/util/HashMap;

    .line 295
    invoke-static {}, Lco/getair/meerkat/utilities/DiskWriter;->getInstance()Lco/getair/meerkat/utilities/DiskWriter;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/proxies/InboxProxy;->INBOX_KEY:Ljava/lang/String;

    invoke-virtual {v0, p1, p2, v1}, Lco/getair/meerkat/utilities/DiskWriter;->saveObject(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/String;)V

    .line 296
    return-void
.end method

.method private setInbox(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 233
    .local p1, "inbox":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList;>;"
    iput-object p1, p0, Lco/getair/meerkat/proxies/InboxProxy;->inbox:Ljava/util/HashMap;

    .line 234
    return-void
.end method


# virtual methods
.method public addItem(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 2
    .param p1, "bucketKey"    # Ljava/lang/String;
    .param p2, "itemToAdd"    # Ljava/util/HashMap;

    .prologue
    .line 200
    sget-object v0, Lco/getair/meerkat/proxies/InboxProxy;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lco/getair/meerkat/proxies/InboxProxy$8;

    invoke-direct {v1, p0, p2, p1}, Lco/getair/meerkat/proxies/InboxProxy$8;-><init>(Lco/getair/meerkat/proxies/InboxProxy;Ljava/util/HashMap;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 208
    return-void
.end method

.method public clearBucket(Ljava/lang/String;)V
    .locals 2
    .param p1, "bucketKey"    # Ljava/lang/String;

    .prologue
    .line 178
    sget-object v0, Lco/getair/meerkat/proxies/InboxProxy;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lco/getair/meerkat/proxies/InboxProxy$6;

    invoke-direct {v1, p0, p1}, Lco/getair/meerkat/proxies/InboxProxy$6;-><init>(Lco/getair/meerkat/proxies/InboxProxy;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 186
    return-void
.end method

.method public clearInbox()V
    .locals 2

    .prologue
    .line 168
    sget-object v0, Lco/getair/meerkat/proxies/InboxProxy;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lco/getair/meerkat/proxies/InboxProxy$5;

    invoke-direct {v1, p0}, Lco/getair/meerkat/proxies/InboxProxy$5;-><init>(Lco/getair/meerkat/proxies/InboxProxy;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 175
    return-void
.end method

.method public fetchInbox()V
    .locals 6

    .prologue
    .line 64
    iget-object v1, p0, Lco/getair/meerkat/proxies/InboxProxy;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v1

    iget-object v3, p0, Lco/getair/meerkat/proxies/InboxProxy;->GET_INBOX_URL_KEY:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 66
    .local v2, "getInboxUrl":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x0

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/proxies/InboxProxy$1;

    invoke-direct {v4, p0}, Lco/getair/meerkat/proxies/InboxProxy$1;-><init>(Lco/getair/meerkat/proxies/InboxProxy;)V

    new-instance v5, Lco/getair/meerkat/proxies/InboxProxy$2;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/InboxProxy$2;-><init>(Lco/getair/meerkat/proxies/InboxProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 86
    .local v0, "getInboxRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/InboxProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 87
    return-void
.end method

.method public getBucket(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1
    .param p1, "bucketKey"    # Ljava/lang/String;

    .prologue
    .line 221
    iget-object v0, p0, Lco/getair/meerkat/proxies/InboxProxy;->inbox:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/getair/meerkat/proxies/InboxProxy;->inbox:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0
.end method

.method public removeItem(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 2
    .param p1, "bucketKey"    # Ljava/lang/String;
    .param p2, "itemToRemove"    # Ljava/util/HashMap;

    .prologue
    .line 189
    sget-object v0, Lco/getair/meerkat/proxies/InboxProxy;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lco/getair/meerkat/proxies/InboxProxy$7;

    invoke-direct {v1, p0, p2, p1}, Lco/getair/meerkat/proxies/InboxProxy$7;-><init>(Lco/getair/meerkat/proxies/InboxProxy;Ljava/util/HashMap;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 197
    return-void
.end method

.method public setBucket(Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 2
    .param p1, "bucketKey"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/util/ArrayList;

    .prologue
    .line 211
    sget-object v0, Lco/getair/meerkat/proxies/InboxProxy;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lco/getair/meerkat/proxies/InboxProxy$9;

    invoke-direct {v1, p0, p1, p2}, Lco/getair/meerkat/proxies/InboxProxy$9;-><init>(Lco/getair/meerkat/proxies/InboxProxy;Ljava/lang/String;Ljava/util/ArrayList;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 218
    return-void
.end method

.method public updateInbox(Ljava/lang/String;)V
    .locals 21
    .param p1, "itemsString"    # Ljava/lang/String;

    .prologue
    .line 90
    if-nez p1, :cond_0

    .line 165
    :goto_0
    return-void

    .line 93
    :cond_0
    const-string v17, "\\|"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 94
    .local v10, "items":[Ljava/lang/String;
    const-string v17, "(\\w+)(.)(.*)"

    invoke-static/range {v17 .. v17}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v13

    .line 96
    .local v13, "pattern":Ljava/util/regex/Pattern;
    new-instance v14, Ljava/util/HashMap;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/proxies/InboxProxy;->inbox:Ljava/util/HashMap;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-direct {v14, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 98
    .local v14, "updatedInbox":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList;>;"
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 100
    .local v3, "bucketItemsArrivedCount":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    array-length v0, v10

    move/from16 v19, v0

    const/16 v17, 0x0

    move/from16 v18, v17

    :goto_1
    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_5

    aget-object v9, v10, v18

    .line 101
    .local v9, "item":Ljava/lang/String;
    const-string v17, ""

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_2

    .line 100
    :cond_1
    :goto_2
    add-int/lit8 v17, v18, 0x1

    move/from16 v18, v17

    goto :goto_1

    .line 105
    :cond_2
    invoke-virtual {v13, v9}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v11

    .line 106
    .local v11, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v11}, Ljava/util/regex/Matcher;->matches()Z

    move-result v17

    if-eqz v17, :cond_1

    invoke-virtual {v11}, Ljava/util/regex/Matcher;->groupCount()I

    move-result v17

    const/16 v20, 0x3

    move/from16 v0, v17

    move/from16 v1, v20

    if-ne v0, v1, :cond_1

    .line 107
    const/16 v17, 0x1

    move/from16 v0, v17

    invoke-virtual {v11, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    .line 108
    .local v4, "bucketKey":Ljava/lang/String;
    const/16 v17, 0x2

    move/from16 v0, v17

    invoke-virtual {v11, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v12

    .line 109
    .local v12, "operation":Ljava/lang/String;
    const/16 v17, 0x3

    move/from16 v0, v17

    invoke-virtual {v11, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v16

    .line 110
    .local v16, "valueString":Ljava/lang/String;
    new-instance v8, Lcom/google/gson/Gson;

    invoke-direct {v8}, Lcom/google/gson/Gson;-><init>()V

    .line 111
    .local v8, "gson":Lcom/google/gson/Gson;
    new-instance v17, Lco/getair/meerkat/proxies/InboxProxy$3;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/getair/meerkat/proxies/InboxProxy$3;-><init>(Lco/getair/meerkat/proxies/InboxProxy;)V

    invoke-virtual/range {v17 .. v17}, Lco/getair/meerkat/proxies/InboxProxy$3;->getType()Ljava/lang/reflect/Type;

    move-result-object v5

    .line 112
    .local v5, "collectionType":Ljava/lang/reflect/Type;
    move-object/from16 v0, v16

    invoke-virtual {v8, v0, v5}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/HashMap;

    .line 114
    .local v15, "value":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/16 v17, -0x1

    invoke-virtual {v12}, Ljava/lang/String;->hashCode()I

    move-result v20

    sparse-switch v20, :sswitch_data_0

    :cond_3
    :goto_3
    packed-switch v17, :pswitch_data_0

    goto :goto_2

    .line 117
    :pswitch_0
    move-object/from16 v0, p0

    invoke-direct {v0, v4, v14}, Lco/getair/meerkat/proxies/InboxProxy;->_clearBucketFromInbox(Ljava/lang/String;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v14

    .line 118
    goto :goto_2

    .line 114
    :sswitch_0
    const-string v20, "!"

    move-object/from16 v0, v20

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_3

    const/16 v17, 0x0

    goto :goto_3

    :sswitch_1
    const-string v20, "+"

    move-object/from16 v0, v20

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_3

    const/16 v17, 0x1

    goto :goto_3

    :sswitch_2
    const-string v20, "-"

    move-object/from16 v0, v20

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_3

    const/16 v17, 0x2

    goto :goto_3

    .line 122
    :pswitch_1
    const/16 v17, 0x0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 123
    .local v2, "bucketCount":Ljava/lang/Integer;
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    if-eqz v17, :cond_4

    .line 124
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/Integer;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 127
    :cond_4
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v17

    add-int/lit8 v17, v17, 0x1

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 128
    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v4, v14}, Lco/getair/meerkat/proxies/InboxProxy;->_addItem(Ljava/util/HashMap;Ljava/lang/String;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v14

    .line 131
    goto/16 :goto_2

    .line 135
    .end local v2    # "bucketCount":Ljava/lang/Integer;
    :pswitch_2
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v4, v14}, Lco/getair/meerkat/proxies/InboxProxy;->_removeItem(Ljava/util/HashMap;Ljava/lang/String;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v14

    .line 136
    goto/16 :goto_2

    .line 144
    .end local v4    # "bucketKey":Ljava/lang/String;
    .end local v5    # "collectionType":Ljava/lang/reflect/Type;
    .end local v8    # "gson":Lcom/google/gson/Gson;
    .end local v9    # "item":Ljava/lang/String;
    .end local v11    # "matcher":Ljava/util/regex/Matcher;
    .end local v12    # "operation":Ljava/lang/String;
    .end local v15    # "value":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v16    # "valueString":Ljava/lang/String;
    :cond_5
    move-object v7, v14

    .line 145
    .local v7, "finalUpdatedInbox":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList;>;"
    move-object v6, v3

    .line 147
    .local v6, "finalBucketItemsArrivedCount":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    sget-object v17, Lco/getair/meerkat/proxies/InboxProxy;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v18, Lco/getair/meerkat/proxies/InboxProxy$4;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v7, v6}, Lco/getair/meerkat/proxies/InboxProxy$4;-><init>(Lco/getair/meerkat/proxies/InboxProxy;Ljava/util/HashMap;Ljava/util/HashMap;)V

    invoke-interface/range {v17 .. v18}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    goto/16 :goto_0

    .line 114
    nop

    :sswitch_data_0
    .sparse-switch
        0x21 -> :sswitch_0
        0x2b -> :sswitch_1
        0x2d -> :sswitch_2
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
