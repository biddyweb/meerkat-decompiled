.class public Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;
.super Ljava/lang/Object;
.source "ExpirableDiskLruCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache$1;,
        Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache$LazyHolder;
    }
.end annotation


# static fields
.field private static final DEFAULT_EVICTION_TIME_SPAN:Ljava/lang/Long;

.field private static final EVICTION_TIME:Ljava/lang/String; = "EVICTION_TIME"

.field private static final LOG_TAG:Ljava/lang/String; = "EXPIRABLE_DISK_CACHE"

.field private static sLogEnabled:Z


# instance fields
.field private mGson:Lcom/google/gson/Gson;

.field private mSimpleDiskCache:Lvijay/expirabledisklrucache/cache/SimpleDiskCache;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 22
    const-wide v0, 0x7fffffffffffffffL

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sput-object v0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->DEFAULT_EVICTION_TIME_SPAN:Ljava/lang/Long;

    .line 24
    const/4 v0, 0x0

    sput-boolean v0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->sLogEnabled:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method synthetic constructor <init>(Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache$1;)V
    .locals 0
    .param p1, "x0"    # Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache$1;

    .prologue
    .line 16
    invoke-direct {p0}, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;-><init>()V

    return-void
.end method

.method private getEvictionTime(Ljava/lang/Long;)Ljava/lang/Long;
    .locals 4
    .param p1, "evictionTimeSpan"    # Ljava/lang/Long;

    .prologue
    .line 106
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    add-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance()Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;
    .locals 1

    .prologue
    .line 114
    invoke-static {}, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache$LazyHolder;->access$100()Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public contains(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    iget-object v0, p0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->mSimpleDiskCache:Lvijay/expirabledisklrucache/cache/SimpleDiskCache;

    invoke-virtual {v0, p1}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->contains(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 8
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p2, "classOfT":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v3, 0x0

    .line 70
    iget-object v4, p0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->mSimpleDiskCache:Lvijay/expirabledisklrucache/cache/SimpleDiskCache;

    invoke-virtual {v4, p1}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->getString(Ljava/lang/String;)Lvijay/expirabledisklrucache/cache/SimpleDiskCache$StringEntry;

    move-result-object v0

    .line 71
    .local v0, "entry":Lvijay/expirabledisklrucache/cache/SimpleDiskCache$StringEntry;
    if-nez v0, :cond_1

    .line 72
    sget-boolean v4, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->sLogEnabled:Z

    if-eqz v4, :cond_0

    .line 73
    const-string v4, "EXPIRABLE_DISK_CACHE"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[MISS] : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    :cond_0
    :goto_0
    return-object v3

    .line 76
    :cond_1
    invoke-virtual {v0}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$StringEntry;->getMetadata()Ljava/util/Map;

    move-result-object v2

    .line 77
    .local v2, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/io/Serializable;>;"
    const-string v4, "EVICTION_TIME"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 78
    .local v1, "evictionTime":Ljava/lang/Long;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-gtz v4, :cond_3

    .line 79
    sget-boolean v3, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->sLogEnabled:Z

    if-eqz v3, :cond_2

    .line 80
    const-string v3, "EXPIRABLE_DISK_CACHE"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[HIT] : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    :cond_2
    iget-object v3, p0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->mGson:Lcom/google/gson/Gson;

    invoke-virtual {v0}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$StringEntry;->getString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, p2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_0

    .line 83
    :cond_3
    sget-boolean v4, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->sLogEnabled:Z

    if-eqz v4, :cond_4

    .line 84
    const-string v4, "EXPIRABLE_DISK_CACHE"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[EXPIRED] : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    :cond_4
    invoke-virtual {p0, p1}, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->remove(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public init(Landroid/content/Context;Ljava/lang/Long;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "size"    # Ljava/lang/Long;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 34
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    iput-object v0, p0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->mGson:Lcom/google/gson/Gson;

    .line 35
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->open(Ljava/io/File;IJ)Lvijay/expirabledisklrucache/cache/SimpleDiskCache;

    move-result-object v0

    iput-object v0, p0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->mSimpleDiskCache:Lvijay/expirabledisklrucache/cache/SimpleDiskCache;

    .line 36
    return-void
.end method

.method public init(Landroid/content/Context;Ljava/lang/Long;Z)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "size"    # Ljava/lang/Long;
    .param p3, "logEnabled"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    iput-object v0, p0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->mGson:Lcom/google/gson/Gson;

    .line 40
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->open(Ljava/io/File;IJ)Lvijay/expirabledisklrucache/cache/SimpleDiskCache;

    move-result-object v0

    iput-object v0, p0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->mSimpleDiskCache:Lvijay/expirabledisklrucache/cache/SimpleDiskCache;

    .line 41
    sput-boolean p3, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->sLogEnabled:Z

    .line 42
    return-void
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    sget-object v0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->DEFAULT_EVICTION_TIME_SPAN:Ljava/lang/Long;

    invoke-virtual {p0, p1, p2, v0}, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->put(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Long;)V

    .line 52
    return-void
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Long;)V
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "evictionTimeSpan"    # Ljava/lang/Long;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 63
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/io/Serializable;>;"
    const-string v1, "EVICTION_TIME"

    invoke-direct {p0, p3}, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->getEvictionTime(Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->mSimpleDiskCache:Lvijay/expirabledisklrucache/cache/SimpleDiskCache;

    iget-object v2, p0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->mGson:Lcom/google/gson/Gson;

    invoke-virtual {v2, p2}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, v2, v0}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->put(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 65
    sget-boolean v1, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->sLogEnabled:Z

    if-eqz v1, :cond_0

    .line 66
    const-string v1, "EXPIRABLE_DISK_CACHE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[PUT] : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    :cond_0
    return-void
.end method

.method public remove(Ljava/lang/String;)V
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    iget-object v0, p0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->mSimpleDiskCache:Lvijay/expirabledisklrucache/cache/SimpleDiskCache;

    invoke-virtual {v0, p1}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->remove(Ljava/lang/String;)V

    .line 91
    sget-boolean v0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->sLogEnabled:Z

    if-eqz v0, :cond_0

    .line 92
    const-string v0, "EXPIRABLE_DISK_CACHE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[REMOVED] : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    :cond_0
    return-void
.end method

.method public removeAll()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    iget-object v0, p0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->mSimpleDiskCache:Lvijay/expirabledisklrucache/cache/SimpleDiskCache;

    invoke-virtual {v0}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->clear()V

    .line 101
    sget-boolean v0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;->sLogEnabled:Z

    if-eqz v0, :cond_0

    .line 102
    const-string v0, "EXPIRABLE_DISK_CACHE"

    const-string v1, "[ALL CLEARED] : "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    :cond_0
    return-void
.end method
