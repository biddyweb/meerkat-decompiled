.class public Lco/getair/meerkat/utilities/NetworkQueue;
.super Ljava/lang/Object;
.source "NetworkQueue.java"


# static fields
.field private static context:Landroid/content/Context;

.field private static instance:Lco/getair/meerkat/utilities/NetworkQueue;


# instance fields
.field private imageLoader:Lcom/android/volley/toolbox/ImageLoader;

.field private requestQueue:Lcom/android/volley/RequestQueue;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    sput-object p1, Lco/getair/meerkat/utilities/NetworkQueue;->context:Landroid/content/Context;

    .line 24
    invoke-virtual {p0}, Lco/getair/meerkat/utilities/NetworkQueue;->getRequestQueue()Lcom/android/volley/RequestQueue;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/utilities/NetworkQueue;->requestQueue:Lcom/android/volley/RequestQueue;

    .line 26
    new-instance v0, Lcom/android/volley/toolbox/ImageLoader;

    iget-object v1, p0, Lco/getair/meerkat/utilities/NetworkQueue;->requestQueue:Lcom/android/volley/RequestQueue;

    new-instance v2, Lco/getair/meerkat/utilities/NetworkQueue$1;

    invoke-direct {v2, p0}, Lco/getair/meerkat/utilities/NetworkQueue$1;-><init>(Lco/getair/meerkat/utilities/NetworkQueue;)V

    invoke-direct {v0, v1, v2}, Lcom/android/volley/toolbox/ImageLoader;-><init>(Lcom/android/volley/RequestQueue;Lcom/android/volley/toolbox/ImageLoader$ImageCache;)V

    iput-object v0, p0, Lco/getair/meerkat/utilities/NetworkQueue;->imageLoader:Lcom/android/volley/toolbox/ImageLoader;

    .line 41
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 44
    const-class v1, Lco/getair/meerkat/utilities/NetworkQueue;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lco/getair/meerkat/utilities/NetworkQueue;->instance:Lco/getair/meerkat/utilities/NetworkQueue;

    if-nez v0, :cond_0

    .line 45
    new-instance v0, Lco/getair/meerkat/utilities/NetworkQueue;

    invoke-direct {v0, p0}, Lco/getair/meerkat/utilities/NetworkQueue;-><init>(Landroid/content/Context;)V

    sput-object v0, Lco/getair/meerkat/utilities/NetworkQueue;->instance:Lco/getair/meerkat/utilities/NetworkQueue;

    .line 47
    :cond_0
    sget-object v0, Lco/getair/meerkat/utilities/NetworkQueue;->instance:Lco/getair/meerkat/utilities/NetworkQueue;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 44
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public addToRequestQueue(Lcom/android/volley/Request;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/volley/Request",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 60
    .local p1, "req":Lcom/android/volley/Request;, "Lcom/android/volley/Request<TT;>;"
    invoke-virtual {p0}, Lco/getair/meerkat/utilities/NetworkQueue;->getRequestQueue()Lcom/android/volley/RequestQueue;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 61
    return-void
.end method

.method public getImageLoader()Lcom/android/volley/toolbox/ImageLoader;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lco/getair/meerkat/utilities/NetworkQueue;->imageLoader:Lcom/android/volley/toolbox/ImageLoader;

    return-object v0
.end method

.method public getRequestQueue()Lcom/android/volley/RequestQueue;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lco/getair/meerkat/utilities/NetworkQueue;->requestQueue:Lcom/android/volley/RequestQueue;

    if-nez v0, :cond_0

    .line 54
    sget-object v0, Lco/getair/meerkat/utilities/NetworkQueue;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/utilities/NetworkQueue;->requestQueue:Lcom/android/volley/RequestQueue;

    .line 56
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/utilities/NetworkQueue;->requestQueue:Lcom/android/volley/RequestQueue;

    return-object v0
.end method
