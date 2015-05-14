.class Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;
.super Ljava/lang/Object;
.source "ManifestFetcher.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/Loader$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/util/ManifestFetcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SingleFetchHelper"
.end annotation


# instance fields
.field private final callbackLooper:Landroid/os/Looper;

.field private final singleUseLoadable:Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer/util/ManifestFetcher",
            "<TT;>.Manifest",
            "Loadable;"
        }
    .end annotation
.end field

.field private final singleUseLoader:Lcom/google/android/exoplayer/upstream/Loader;

.field final synthetic this$0:Lcom/google/android/exoplayer/util/ManifestFetcher;

.field private final wrappedCallback:Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/util/ManifestFetcher;Landroid/os/Looper;Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback;)V
    .locals 2
    .param p2, "callbackLooper"    # Landroid/os/Looper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Looper;",
            "Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 291
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>.SingleFetchHelper;"
    .local p3, "wrappedCallback":Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback;, "Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback<TT;>;"
    iput-object p1, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->this$0:Lcom/google/android/exoplayer/util/ManifestFetcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 292
    iput-object p2, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->callbackLooper:Landroid/os/Looper;

    .line 293
    iput-object p3, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->wrappedCallback:Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback;

    .line 294
    new-instance v0, Lcom/google/android/exoplayer/upstream/Loader;

    const-string v1, "manifestLoader:single"

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/upstream/Loader;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->singleUseLoader:Lcom/google/android/exoplayer/upstream/Loader;

    .line 295
    new-instance v0, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;-><init>(Lcom/google/android/exoplayer/util/ManifestFetcher;Lcom/google/android/exoplayer/util/ManifestFetcher$1;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->singleUseLoadable:Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;

    .line 296
    return-void
.end method

.method private releaseLoader()V
    .locals 1

    .prologue
    .line 334
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>.SingleFetchHelper;"
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->singleUseLoader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->release()V

    .line 335
    return-void
.end method


# virtual methods
.method public onLoadCanceled(Lcom/google/android/exoplayer/upstream/Loader$Loadable;)V
    .locals 3
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;

    .prologue
    .line 317
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>.SingleFetchHelper;"
    :try_start_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Load cancelled"

    new-instance v2, Ljava/util/concurrent/CancellationException;

    invoke-direct {v2}, Ljava/util/concurrent/CancellationException;-><init>()V

    invoke-direct {v0, v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 318
    .local v0, "exception":Ljava/io/IOException;
    iget-object v1, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->wrappedCallback:Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback;

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->this$0:Lcom/google/android/exoplayer/util/ManifestFetcher;

    iget-object v2, v2, Lcom/google/android/exoplayer/util/ManifestFetcher;->contentId:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback;->onManifestError(Ljava/lang/String;Ljava/io/IOException;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 320
    invoke-direct {p0}, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->releaseLoader()V

    .line 322
    return-void

    .line 320
    .end local v0    # "exception":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    invoke-direct {p0}, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->releaseLoader()V

    throw v1
.end method

.method public onLoadCompleted(Lcom/google/android/exoplayer/upstream/Loader$Loadable;)V
    .locals 4
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;

    .prologue
    .line 305
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>.SingleFetchHelper;"
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->this$0:Lcom/google/android/exoplayer/util/ManifestFetcher;

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->singleUseLoadable:Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;

    iget-object v1, v1, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;->result:Ljava/lang/Object;

    # setter for: Lcom/google/android/exoplayer/util/ManifestFetcher;->manifest:Ljava/lang/Object;
    invoke-static {v0, v1}, Lcom/google/android/exoplayer/util/ManifestFetcher;->access$202(Lcom/google/android/exoplayer/util/ManifestFetcher;Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->this$0:Lcom/google/android/exoplayer/util/ManifestFetcher;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    # setter for: Lcom/google/android/exoplayer/util/ManifestFetcher;->manifestLoadTimestamp:J
    invoke-static {v0, v2, v3}, Lcom/google/android/exoplayer/util/ManifestFetcher;->access$302(Lcom/google/android/exoplayer/util/ManifestFetcher;J)J

    .line 307
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->wrappedCallback:Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback;

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->this$0:Lcom/google/android/exoplayer/util/ManifestFetcher;

    iget-object v1, v1, Lcom/google/android/exoplayer/util/ManifestFetcher;->contentId:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->singleUseLoadable:Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;

    iget-object v2, v2, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;->result:Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback;->onManifest(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 309
    invoke-direct {p0}, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->releaseLoader()V

    .line 311
    return-void

    .line 309
    :catchall_0
    move-exception v0

    invoke-direct {p0}, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->releaseLoader()V

    throw v0
.end method

.method public onLoadError(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Ljava/io/IOException;)V
    .locals 2
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;
    .param p2, "exception"    # Ljava/io/IOException;

    .prologue
    .line 327
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>.SingleFetchHelper;"
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->wrappedCallback:Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback;

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->this$0:Lcom/google/android/exoplayer/util/ManifestFetcher;

    iget-object v1, v1, Lcom/google/android/exoplayer/util/ManifestFetcher;->contentId:Ljava/lang/String;

    invoke-interface {v0, v1, p2}, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback;->onManifestError(Ljava/lang/String;Ljava/io/IOException;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 329
    invoke-direct {p0}, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->releaseLoader()V

    .line 331
    return-void

    .line 329
    :catchall_0
    move-exception v0

    invoke-direct {p0}, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->releaseLoader()V

    throw v0
.end method

.method public startLoading()V
    .locals 3

    .prologue
    .line 299
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>.SingleFetchHelper;"
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->singleUseLoader:Lcom/google/android/exoplayer/upstream/Loader;

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->callbackLooper:Landroid/os/Looper;

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper;->singleUseLoadable:Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;

    invoke-virtual {v0, v1, v2, p0}, Lcom/google/android/exoplayer/upstream/Loader;->startLoading(Landroid/os/Looper;Lcom/google/android/exoplayer/upstream/Loader$Loadable;Lcom/google/android/exoplayer/upstream/Loader$Callback;)V

    .line 300
    return-void
.end method
