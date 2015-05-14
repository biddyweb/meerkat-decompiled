.class public Lcom/instabug/library/network/UploadCacheService;
.super Landroid/app/IntentService;
.source "UploadCacheService.java"


# instance fields
.field private a:Lcom/instabug/library/internal/storage/s;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    const-string v0, "worker"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 43
    return-void
.end method

.method static synthetic a(Lcom/instabug/library/network/UploadCacheService;)Lcom/instabug/library/internal/storage/s;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/instabug/library/network/UploadCacheService;->a:Lcom/instabug/library/internal/storage/s;

    return-object v0
.end method

.method static synthetic a(Lcom/instabug/library/network/UploadCacheService;Lcom/instabug/library/internal/storage/s;)Lcom/instabug/library/internal/storage/s;
    .locals 0

    .prologue
    .line 38
    iput-object p1, p0, Lcom/instabug/library/network/UploadCacheService;->a:Lcom/instabug/library/internal/storage/s;

    return-object p1
.end method

.method static synthetic a(Lcom/instabug/library/network/UploadCacheService;Landroid/content/Intent;Lcom/android/volley/RequestQueue;Lcom/instabug/library/internal/device/a;)V
    .locals 7

    .prologue
    .line 38
    new-instance v6, Ljava/io/File;

    invoke-virtual {p0}, Lcom/instabug/library/network/UploadCacheService;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/instabug/library/network/UploadCacheService;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    :goto_0
    const-string v1, "com.instabug.library.settings"

    invoke-direct {v6, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_0
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {v6}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    const-wide/32 v2, 0x5265c00

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    :cond_0
    invoke-static {}, Lcom/android/volley/toolbox/RequestFuture;->newFuture()Lcom/android/volley/toolbox/RequestFuture;

    move-result-object v4

    new-instance v3, Lcom/instabug/library/network/a;

    invoke-direct {v3}, Lcom/instabug/library/network/a;-><init>()V

    const-string v0, "com.instabug.token"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "token"

    invoke-virtual {v3, v1, v0}, Lcom/instabug/library/network/a;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    new-instance v0, Lcom/android/volley/toolbox/JsonObjectRequest;

    const/4 v1, 0x1

    const/4 v2, 0x1

    invoke-virtual {v3, v2}, Lcom/instabug/library/network/a;->a(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3}, Lcom/instabug/library/network/a;->b()Lorg/json/JSONObject;

    move-result-object v3

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/android/volley/toolbox/JsonObjectRequest;-><init>(ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/volley/toolbox/JsonObjectRequest;->setShouldCache(Z)Lcom/android/volley/Request;

    invoke-virtual {p2, v0}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    const-wide/16 v0, 0xa

    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v0, v1, v2}, Lcom/android/volley/toolbox/RequestFuture;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    const-string v1, "device"

    invoke-virtual {p3}, Lcom/instabug/library/internal/device/a;->j()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "white_label"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    new-instance v1, Ljava/io/FileWriter;

    invoke-direct {v1, v6}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_1
    return-void

    :cond_2
    invoke-virtual {p0}, Lcom/instabug/library/network/UploadCacheService;->getCacheDir()Ljava/io/File;

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method static synthetic a(Lcom/instabug/library/network/UploadCacheService;Ljava/util/ArrayList;)V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "UploadCacheService: Found "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " reports in cache"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/instabug/library/model/a;

    invoke-virtual {v0}, Lcom/instabug/library/model/a;->h()I

    move-result v2

    if-ne v2, v4, :cond_0

    invoke-virtual {v0}, Lcom/instabug/library/model/a;->d()V

    :cond_0
    invoke-virtual {v0}, Lcom/instabug/library/model/a;->i()I

    move-result v2

    if-ne v2, v4, :cond_1

    invoke-virtual {v0}, Lcom/instabug/library/model/a;->d()V

    :cond_1
    invoke-virtual {v0}, Lcom/instabug/library/model/a;->j()I

    move-result v2

    if-ne v2, v4, :cond_2

    invoke-virtual {v0}, Lcom/instabug/library/model/a;->d()V

    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "UploadCacheService: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/instabug/library/model/a;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/instabug/library/network/UploadCacheService;->a:Lcom/instabug/library/internal/storage/s;

    new-instance v3, Lcom/instabug/library/network/g;

    invoke-direct {v3, p0}, Lcom/instabug/library/network/g;-><init>(Lcom/instabug/library/network/UploadCacheService;)V

    invoke-interface {v2, v0, v3}, Lcom/instabug/library/internal/storage/s;->a(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    goto :goto_0

    :cond_3
    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 0

    .prologue
    .line 47
    invoke-super {p0}, Landroid/app/IntentService;->onCreate()V

    .line 48
    return-void
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 3

    .prologue
    .line 52
    const-string v0, "Instabug UploadCacheService"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 53
    new-instance v0, Lcom/instabug/library/internal/device/a;

    invoke-virtual {p0}, Lcom/instabug/library/network/UploadCacheService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/instabug/library/internal/device/a;-><init>(Landroid/content/Context;)V

    .line 54
    invoke-virtual {v0}, Lcom/instabug/library/internal/device/a;->i()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 57
    :try_start_0
    invoke-virtual {p0}, Lcom/instabug/library/network/UploadCacheService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/instabug/library/network/f;

    invoke-direct {v2, p0, p1, v0}, Lcom/instabug/library/network/f;-><init>(Lcom/instabug/library/network/UploadCacheService;Landroid/content/Intent;Lcom/instabug/library/internal/device/a;)V

    invoke-static {v1, v2}, Lcom/instabug/library/network/toolbox/b;->a(Landroid/content/Context;Lcom/instabug/library/network/toolbox/b$a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    :cond_0
    :goto_0
    return-void

    .line 80
    :catch_0
    move-exception v0

    .line 81
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 82
    const-string v1, "Error checking cached reports"

    invoke-static {v1, v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
