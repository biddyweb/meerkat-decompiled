.class Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;
.super Ljava/lang/Object;
.source "ManifestFetcher.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/Loader$Loadable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/util/ManifestFetcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ManifestLoadable"
.end annotation


# static fields
.field private static final TIMEOUT_MILLIS:I = 0x2710


# instance fields
.field private volatile isCanceled:Z

.field volatile result:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/google/android/exoplayer/util/ManifestFetcher;


# direct methods
.method private constructor <init>(Lcom/google/android/exoplayer/util/ManifestFetcher;)V
    .locals 0

    .prologue
    .line 339
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>.ManifestLoadable;"
    iput-object p1, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;->this$0:Lcom/google/android/exoplayer/util/ManifestFetcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/exoplayer/util/ManifestFetcher;Lcom/google/android/exoplayer/util/ManifestFetcher$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/exoplayer/util/ManifestFetcher;
    .param p2, "x1"    # Lcom/google/android/exoplayer/util/ManifestFetcher$1;

    .prologue
    .line 339
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>.ManifestLoadable;"
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;-><init>(Lcom/google/android/exoplayer/util/ManifestFetcher;)V

    return-void
.end method

.method private configureConnection(Ljava/net/URL;)Ljava/net/URLConnection;
    .locals 3
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>.ManifestLoadable;"
    const/16 v1, 0x2710

    .line 376
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    .line 377
    .local v0, "connection":Ljava/net/URLConnection;
    invoke-virtual {v0, v1}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 378
    invoke-virtual {v0, v1}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 379
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 380
    const-string v1, "User-Agent"

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;->this$0:Lcom/google/android/exoplayer/util/ManifestFetcher;

    iget-object v2, v2, Lcom/google/android/exoplayer/util/ManifestFetcher;->userAgent:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    invoke-virtual {v0}, Ljava/net/URLConnection;->connect()V

    .line 382
    return-object v0
.end method


# virtual methods
.method public cancelLoad()V
    .locals 1

    .prologue
    .line 350
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>.ManifestLoadable;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;->isCanceled:Z

    .line 351
    return-void
.end method

.method public isLoadCanceled()Z
    .locals 1

    .prologue
    .line 355
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>.ManifestLoadable;"
    iget-boolean v0, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;->isCanceled:Z

    return v0
.end method

.method public load()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 361
    .local p0, "this":Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;, "Lcom/google/android/exoplayer/util/ManifestFetcher<TT;>.ManifestLoadable;"
    const/4 v2, 0x0

    .line 363
    .local v2, "inputStream":Ljava/io/InputStream;
    :try_start_0
    new-instance v3, Ljava/net/URL;

    iget-object v4, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;->this$0:Lcom/google/android/exoplayer/util/ManifestFetcher;

    iget-object v4, v4, Lcom/google/android/exoplayer/util/ManifestFetcher;->manifestUrl:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v3}, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;->configureConnection(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v0

    .line 364
    .local v0, "connection":Ljava/net/URLConnection;
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 365
    invoke-virtual {v0}, Ljava/net/URLConnection;->getContentEncoding()Ljava/lang/String;

    move-result-object v1

    .line 366
    .local v1, "inputEncoding":Ljava/lang/String;
    iget-object v3, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;->this$0:Lcom/google/android/exoplayer/util/ManifestFetcher;

    iget-object v3, v3, Lcom/google/android/exoplayer/util/ManifestFetcher;->parser:Lcom/google/android/exoplayer/util/ManifestParser;

    iget-object v4, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;->this$0:Lcom/google/android/exoplayer/util/ManifestFetcher;

    iget-object v4, v4, Lcom/google/android/exoplayer/util/ManifestFetcher;->contentId:Ljava/lang/String;

    .line 367
    invoke-virtual {v0}, Ljava/net/URLConnection;->getURL()Ljava/net/URL;

    move-result-object v5

    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/exoplayer/util/Util;->parseBaseUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 366
    invoke-interface {v3, v2, v1, v4, v5}, Lcom/google/android/exoplayer/util/ManifestParser;->parse(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestLoadable;->result:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 369
    if-eqz v2, :cond_0

    .line 370
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 373
    :cond_0
    return-void

    .line 369
    .end local v0    # "connection":Ljava/net/URLConnection;
    .end local v1    # "inputEncoding":Ljava/lang/String;
    :catchall_0
    move-exception v3

    if-eqz v2, :cond_1

    .line 370
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    :cond_1
    throw v3
.end method
