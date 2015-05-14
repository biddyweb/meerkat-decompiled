.class public Lcom/google/android/exoplayer/util/ManifestFetcher;
.super Ljava/lang/Object;
.source "ManifestFetcher.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/Loader$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;,
        Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;,
        Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback;,
        Lcom/google/android/exoplayer/util/ManifestFetcher$EventListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/android/exoplayer/upstream/Loader$Callback;"
    }
.end annotation


# instance fields
.field final contentId:Ljava/lang/String;

.field private currentLoadable:Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer/util/ManifestFetcher",
            "<TT;>.Manifest",
            "Loadable;"
        }
    .end annotation
.end field

.field private enabledCount:I

.field private final eventHandler:Landroid/os/Handler;

.field private final eventListener:Lcom/google/android/exoplayer/util/ManifestFetcher$EventListener;

.field private loadException:Ljava/io/IOException;

.field private loadExceptionCount:I

.field private loadExceptionTimestamp:J

.field private loader:Lcom/google/android/exoplayer/upstream/Loader;

.field private volatile manifest:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private volatile manifestLoadTimestamp:J

.field volatile manifestUrl:Ljava/lang/String;

.field final parser:Lcom/google/android/exoplayer/util/ManifestParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer/util/ManifestParser",
            "<TT;>;"
        }
    .end annotation
.end field

.field final userAgent:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/util/ManifestParser;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p2, "contentId"    # Ljava/lang/String;
    .param p3, "manifestUrl"    # Ljava/lang/String;
    .param p4, "userAgent"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ManifestParser",
            "<TT;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>;"
    .local p1, "parser":Lcom/google/android/exoplayer/util/ManifestParser;, "Lcom/google/android/exoplayer/util/ManifestParser<TT;>;"
    const/4 v5, 0x0

    .line 98
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v6, v5

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/util/ManifestFetcher;-><init>(Lcom/google/android/exoplayer/util/ManifestParser;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;Lcom/google/android/exoplayer/util/ManifestFetcher$EventListener;)V

    .line 99
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/util/ManifestParser;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;Lcom/google/android/exoplayer/util/ManifestFetcher$EventListener;)V
    .locals 0
    .param p2, "contentId"    # Ljava/lang/String;
    .param p3, "manifestUrl"    # Ljava/lang/String;
    .param p4, "userAgent"    # Ljava/lang/String;
    .param p5, "eventHandler"    # Landroid/os/Handler;
    .param p6, "eventListener"    # Lcom/google/android/exoplayer/util/ManifestFetcher$EventListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ManifestParser",
            "<TT;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/os/Handler;",
            "Lcom/google/android/exoplayer/util/ManifestFetcher$EventListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 108
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>;"
    .local p1, "parser":Lcom/google/android/exoplayer/util/ManifestParser;, "Lcom/google/android/exoplayer/util/ManifestParser<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    iput-object p1, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->parser:Lcom/google/android/exoplayer/util/ManifestParser;

    .line 110
    iput-object p2, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->contentId:Ljava/lang/String;

    .line 111
    iput-object p3, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->manifestUrl:Ljava/lang/String;

    .line 112
    iput-object p4, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->userAgent:Ljava/lang/String;

    .line 113
    iput-object p5, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->eventHandler:Landroid/os/Handler;

    .line 114
    iput-object p6, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->eventListener:Lcom/google/android/exoplayer/util/ManifestFetcher$EventListener;

    .line 115
    return-void
.end method

.method static synthetic access$100(Lcom/google/android/exoplayer/util/ManifestFetcher;)Lcom/google/android/exoplayer/util/ManifestFetcher$EventListener;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/util/ManifestFetcher;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->eventListener:Lcom/google/android/exoplayer/util/ManifestFetcher$EventListener;

    return-object v0
.end method

.method static synthetic access$202(Lcom/google/android/exoplayer/util/ManifestFetcher;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer/util/ManifestFetcher;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->manifest:Ljava/lang/Object;

    return-object p1
.end method

.method static synthetic access$302(Lcom/google/android/exoplayer/util/ManifestFetcher;J)J
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/util/ManifestFetcher;
    .param p1, "x1"    # J

    .prologue
    .line 37
    iput-wide p1, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->manifestLoadTimestamp:J

    return-wide p1
.end method

.method private getRetryDelayMillis(J)J
    .locals 5
    .param p1, "errorCount"    # J

    .prologue
    .line 248
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>;"
    const-wide/16 v0, 0x1

    sub-long v0, p1, v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x1388

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method private notifyManifestError(Ljava/io/IOException;)V
    .locals 2
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    .line 274
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>;"
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->eventListener:Lcom/google/android/exoplayer/util/ManifestFetcher$EventListener;

    if-eqz v0, :cond_0

    .line 275
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/util/ManifestFetcher$3;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/util/ManifestFetcher$3;-><init>(Lcom/google/android/exoplayer/util/ManifestFetcher;Ljava/io/IOException;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 282
    :cond_0
    return-void
.end method

.method private notifyManifestRefreshStarted()V
    .locals 2

    .prologue
    .line 252
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>;"
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->eventListener:Lcom/google/android/exoplayer/util/ManifestFetcher$EventListener;

    if-eqz v0, :cond_0

    .line 253
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/util/ManifestFetcher$1;

    invoke-direct {v1, p0}, Lcom/google/android/exoplayer/util/ManifestFetcher$1;-><init>(Lcom/google/android/exoplayer/util/ManifestFetcher;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 260
    :cond_0
    return-void
.end method

.method private notifyManifestRefreshed()V
    .locals 2

    .prologue
    .line 263
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>;"
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->eventListener:Lcom/google/android/exoplayer/util/ManifestFetcher$EventListener;

    if-eqz v0, :cond_0

    .line 264
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/util/ManifestFetcher$2;

    invoke-direct {v1, p0}, Lcom/google/android/exoplayer/util/ManifestFetcher$2;-><init>(Lcom/google/android/exoplayer/util/ManifestFetcher;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 271
    :cond_0
    return-void
.end method


# virtual methods
.method public disable()V
    .locals 1

    .prologue
    .line 186
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>;"
    iget v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->enabledCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->enabledCount:I

    if-nez v0, :cond_0

    .line 187
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    if-eqz v0, :cond_0

    .line 188
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->release()V

    .line 189
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    .line 192
    :cond_0
    return-void
.end method

.method public enable()V
    .locals 2

    .prologue
    .line 176
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>;"
    iget v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->enabledCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->enabledCount:I

    if-nez v0, :cond_0

    .line 177
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loadExceptionCount:I

    .line 178
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loadException:Ljava/io/IOException;

    .line 180
    :cond_0
    return-void
.end method

.method public getError()Ljava/io/IOException;
    .locals 2

    .prologue
    .line 165
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>;"
    iget v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loadExceptionCount:I

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    .line 167
    const/4 v0, 0x0

    .line 169
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loadException:Ljava/io/IOException;

    goto :goto_0
.end method

.method public getManifest()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 146
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>;"
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->manifest:Ljava/lang/Object;

    return-object v0
.end method

.method public getManifestLoadTimestamp()J
    .locals 2

    .prologue
    .line 155
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>;"
    iget-wide v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->manifestLoadTimestamp:J

    return-wide v0
.end method

.method public onLoadCanceled(Lcom/google/android/exoplayer/upstream/Loader$Loadable;)V
    .locals 0
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;

    .prologue
    .line 231
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>;"
    return-void
.end method

.method public onLoadCompleted(Lcom/google/android/exoplayer/upstream/Loader$Loadable;)V
    .locals 2
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;

    .prologue
    .line 215
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>;"
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->currentLoadable:Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;

    if-eq v0, p1, :cond_0

    .line 226
    :goto_0
    return-void

    .line 220
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->currentLoadable:Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;->result:Ljava/lang/Object;

    iput-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->manifest:Ljava/lang/Object;

    .line 221
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->manifestLoadTimestamp:J

    .line 222
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loadExceptionCount:I

    .line 223
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loadException:Ljava/io/IOException;

    .line 225
    invoke-direct {p0}, Lcom/google/android/exoplayer/util/ManifestFetcher;->notifyManifestRefreshed()V

    goto :goto_0
.end method

.method public onLoadError(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Ljava/io/IOException;)V
    .locals 2
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;
    .param p2, "exception"    # Ljava/io/IOException;

    .prologue
    .line 235
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>;"
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->currentLoadable:Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;

    if-eq v0, p1, :cond_0

    .line 245
    :goto_0
    return-void

    .line 240
    :cond_0
    iget v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loadExceptionCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loadExceptionCount:I

    .line 241
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loadExceptionTimestamp:J

    .line 242
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, p2}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loadException:Ljava/io/IOException;

    .line 244
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loadException:Ljava/io/IOException;

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/util/ManifestFetcher;->notifyManifestError(Ljava/io/IOException;)V

    goto :goto_0
.end method

.method public requestRefresh()V
    .locals 6

    .prologue
    .line 198
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>;"
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loadException:Ljava/io/IOException;

    if-eqz v0, :cond_1

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loadExceptionTimestamp:J

    iget v4, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loadExceptionCount:I

    int-to-long v4, v4

    .line 199
    invoke-direct {p0, v4, v5}, Lcom/google/android/exoplayer/util/ManifestFetcher;->getRetryDelayMillis(J)J

    move-result-wide v4

    add-long/2addr v2, v4

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    .line 211
    :cond_0
    :goto_0
    return-void

    .line 203
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    if-nez v0, :cond_2

    .line 204
    new-instance v0, Lcom/google/android/exoplayer/upstream/Loader;

    const-string v1, "manifestLoader"

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/upstream/Loader;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    .line 206
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->isLoading()Z

    move-result v0

    if-nez v0, :cond_0

    .line 207
    new-instance v0, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;-><init>(Lcom/google/android/exoplayer/util/ManifestFetcher;Lcom/google/android/exoplayer/util/ManifestFetcher$1;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->currentLoadable:Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;

    .line 208
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->currentLoadable:Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;

    invoke-virtual {v0, v1, p0}, Lcom/google/android/exoplayer/upstream/Loader;->startLoading(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Lcom/google/android/exoplayer/upstream/Loader$Callback;)V

    .line 209
    invoke-direct {p0}, Lcom/google/android/exoplayer/util/ManifestFetcher;->notifyManifestRefreshStarted()V

    goto :goto_0
.end method

.method public singleLoad(Landroid/os/Looper;Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback;)V
    .locals 1
    .param p1, "callbackLooper"    # Landroid/os/Looper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Looper;",
            "Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 134
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>;"
    .local p2, "callback":Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback;, "Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback<TT;>;"
    new-instance v0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;-><init>(Lcom/google/android/exoplayer/util/ManifestFetcher;Landroid/os/Looper;Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback;)V

    .line 135
    .local v0, "fetchHelper":Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>.SingleFetchHelper;"
    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->startLoading()V

    .line 136
    return-void
.end method

.method public updateManifestUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "manifestUrl"    # Ljava/lang/String;

    .prologue
    .line 123
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>;"
    iput-object p1, p0, Lcom/google/android/exoplayer/util/ManifestFetcher;->manifestUrl:Ljava/lang/String;

    .line 124
    return-void
.end method
