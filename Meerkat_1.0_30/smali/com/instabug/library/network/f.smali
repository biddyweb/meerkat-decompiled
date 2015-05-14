.class final Lcom/instabug/library/network/f;
.super Ljava/lang/Object;
.source "UploadCacheService.java"

# interfaces
.implements Lcom/instabug/library/network/toolbox/b$a;


# instance fields
.field private synthetic a:Landroid/content/Intent;

.field private synthetic b:Lcom/instabug/library/internal/device/a;

.field private synthetic c:Lcom/instabug/library/network/UploadCacheService;


# direct methods
.method constructor <init>(Lcom/instabug/library/network/UploadCacheService;Landroid/content/Intent;Lcom/instabug/library/internal/device/a;)V
    .locals 0

    .prologue
    .line 57
    iput-object p1, p0, Lcom/instabug/library/network/f;->c:Lcom/instabug/library/network/UploadCacheService;

    iput-object p2, p0, Lcom/instabug/library/network/f;->a:Landroid/content/Intent;

    iput-object p3, p0, Lcom/instabug/library/network/f;->b:Lcom/instabug/library/internal/device/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/android/volley/toolbox/HttpStack;)V
    .locals 5

    .prologue
    .line 60
    iget-object v0, p0, Lcom/instabug/library/network/f;->c:Lcom/instabug/library/network/UploadCacheService;

    invoke-static {v0, p1}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;Lcom/android/volley/toolbox/HttpStack;)Lcom/android/volley/RequestQueue;

    move-result-object v0

    .line 61
    new-instance v1, Lcom/instabug/library/network/restapi/a;

    iget-object v2, p0, Lcom/instabug/library/network/f;->c:Lcom/instabug/library/network/UploadCacheService;

    invoke-virtual {v2}, Lcom/instabug/library/network/UploadCacheService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Lcom/instabug/library/network/restapi/c;

    invoke-direct {v3}, Lcom/instabug/library/network/restapi/c;-><init>()V

    invoke-direct {v1, v2, v3}, Lcom/instabug/library/network/restapi/a;-><init>(Landroid/content/Context;Lcom/instabug/library/network/restapi/c;)V

    .line 62
    iget-object v2, p0, Lcom/instabug/library/network/f;->c:Lcom/instabug/library/network/UploadCacheService;

    iget-object v3, p0, Lcom/instabug/library/network/f;->a:Landroid/content/Intent;

    iget-object v4, p0, Lcom/instabug/library/network/f;->b:Lcom/instabug/library/internal/device/a;

    invoke-static {v2, v3, v0, v4}, Lcom/instabug/library/network/UploadCacheService;->a(Lcom/instabug/library/network/UploadCacheService;Landroid/content/Intent;Lcom/android/volley/RequestQueue;Lcom/instabug/library/internal/device/a;)V

    .line 64
    iget-object v0, p0, Lcom/instabug/library/network/f;->c:Lcom/instabug/library/network/UploadCacheService;

    invoke-virtual {v0}, Lcom/instabug/library/network/UploadCacheService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/internal/storage/db/d;->a(Landroid/content/Context;)Lcom/instabug/library/internal/storage/db/d;

    move-result-object v0

    .line 66
    new-instance v2, Lcom/instabug/library/internal/storage/d;

    invoke-direct {v2, v0}, Lcom/instabug/library/internal/storage/d;-><init>(Lcom/instabug/library/internal/storage/db/d;)V

    .line 67
    new-instance v0, Lcom/instabug/library/internal/storage/e;

    invoke-direct {v0, v2}, Lcom/instabug/library/internal/storage/e;-><init>(Lcom/instabug/library/internal/storage/d;)V

    .line 69
    new-instance v2, Lcom/instabug/library/internal/storage/a;

    iget-object v3, p0, Lcom/instabug/library/network/f;->c:Lcom/instabug/library/network/UploadCacheService;

    invoke-virtual {v3}, Lcom/instabug/library/network/UploadCacheService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/instabug/library/internal/storage/a;-><init>(Landroid/content/Context;)V

    .line 71
    new-instance v3, Lcom/instabug/library/internal/storage/g;

    invoke-direct {v3, v0, v1, v2}, Lcom/instabug/library/internal/storage/g;-><init>(Lcom/instabug/library/internal/storage/e;Lcom/instabug/library/network/restapi/a;Lcom/instabug/library/internal/storage/a;)V

    .line 73
    iget-object v0, p0, Lcom/instabug/library/network/f;->c:Lcom/instabug/library/network/UploadCacheService;

    invoke-static {v3}, Lcom/instabug/library/internal/storage/q;->a(Lcom/instabug/library/internal/storage/p;)Lcom/instabug/library/internal/storage/q;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/instabug/library/network/UploadCacheService;->a(Lcom/instabug/library/network/UploadCacheService;Lcom/instabug/library/internal/storage/s;)Lcom/instabug/library/internal/storage/s;

    .line 75
    iget-object v0, p0, Lcom/instabug/library/network/f;->c:Lcom/instabug/library/network/UploadCacheService;

    invoke-static {v0}, Lcom/instabug/library/network/UploadCacheService;->a(Lcom/instabug/library/network/UploadCacheService;)Lcom/instabug/library/internal/storage/s;

    move-result-object v0

    invoke-interface {v0}, Lcom/instabug/library/internal/storage/s;->a()Ljava/util/ArrayList;

    move-result-object v0

    .line 76
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/instabug/library/network/f;->c:Lcom/instabug/library/network/UploadCacheService;

    invoke-static {v1, v0}, Lcom/instabug/library/network/UploadCacheService;->a(Lcom/instabug/library/network/UploadCacheService;Ljava/util/ArrayList;)V

    .line 77
    :cond_0
    return-void
.end method
