.class Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;
.super Ljava/lang/Object;
.source "ScribeFilesSender.java"

# interfaces
.implements Lio/fabric/sdk/android/services/events/FilesSender;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$ConfigRequestInterceptor;,
        Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$ScribeService;
    }
.end annotation


# static fields
.field private static final COMMA:[B

.field private static final END_JSON_ARRAY:[B

.field private static final SEND_FILE_FAILURE_ERROR:Ljava/lang/String; = "Failed sending files"

.field private static final START_JSON_ARRAY:[B


# instance fields
.field private final apiAdapter:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lretrofit/RestAdapter;",
            ">;"
        }
    .end annotation
.end field

.field private final authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

.field private final context:Landroid/content/Context;

.field private final executorService:Ljava/util/concurrent/ExecutorService;

.field private final idManager:Lio/fabric/sdk/android/services/common/IdManager;

.field private final ownerId:J

.field private final scribeConfig:Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;

.field private final sessionManagers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<+",
            "Lcom/twitter/sdk/android/core/Session;",
            ">;>;"
        }
    .end annotation
.end field

.field private final sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 44
    new-array v0, v3, [B

    const/16 v1, 0x5b

    aput-byte v1, v0, v2

    sput-object v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->START_JSON_ARRAY:[B

    .line 48
    new-array v0, v3, [B

    const/16 v1, 0x2c

    aput-byte v1, v0, v2

    sput-object v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->COMMA:[B

    .line 52
    new-array v0, v3, [B

    const/16 v1, 0x5d

    aput-byte v1, v0, v2

    sput-object v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->END_JSON_ARRAY:[B

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;JLcom/twitter/sdk/android/core/TwitterAuthConfig;Ljava/util/List;Ljavax/net/ssl/SSLSocketFactory;Ljava/util/concurrent/ExecutorService;Lio/fabric/sdk/android/services/common/IdManager;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "scribeConfig"    # Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;
    .param p3, "ownerId"    # J
    .param p5, "authConfig"    # Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    .param p7, "sslSocketFactory"    # Ljavax/net/ssl/SSLSocketFactory;
    .param p8, "executorService"    # Ljava/util/concurrent/ExecutorService;
    .param p9, "idManager"    # Lio/fabric/sdk/android/services/common/IdManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;",
            "J",
            "Lcom/twitter/sdk/android/core/TwitterAuthConfig;",
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<+",
            "Lcom/twitter/sdk/android/core/Session;",
            ">;>;",
            "Ljavax/net/ssl/SSLSocketFactory;",
            "Ljava/util/concurrent/ExecutorService;",
            "Lio/fabric/sdk/android/services/common/IdManager;",
            ")V"
        }
    .end annotation

    .prologue
    .line 67
    .local p6, "sessionManagers":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/core/SessionManager<+Lcom/twitter/sdk/android/core/Session;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->context:Landroid/content/Context;

    .line 69
    iput-object p2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->scribeConfig:Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;

    .line 70
    iput-wide p3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->ownerId:J

    .line 71
    iput-object p5, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    .line 72
    iput-object p6, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->sessionManagers:Ljava/util/List;

    .line 73
    iput-object p7, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 74
    iput-object p8, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 75
    iput-object p9, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->idManager:Lio/fabric/sdk/android/services/common/IdManager;

    .line 76
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->apiAdapter:Ljava/util/concurrent/atomic/AtomicReference;

    .line 77
    return-void
.end method

.method static synthetic access$000()[B
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->COMMA:[B

    return-object v0
.end method

.method private getSession(J)Lcom/twitter/sdk/android/core/Session;
    .locals 5
    .param p1, "ownerId"    # J

    .prologue
    .line 180
    const/4 v2, 0x0

    .line 181
    .local v2, "sessionToReturn":Lcom/twitter/sdk/android/core/Session;
    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->sessionManagers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/twitter/sdk/android/core/SessionManager;

    .line 182
    .local v1, "sessionManager":Lcom/twitter/sdk/android/core/SessionManager;, "Lcom/twitter/sdk/android/core/SessionManager<+Lcom/twitter/sdk/android/core/Session;>;"
    invoke-interface {v1, p1, p2}, Lcom/twitter/sdk/android/core/SessionManager;->getSession(J)Lcom/twitter/sdk/android/core/Session;

    move-result-object v2

    .line 183
    if-eqz v2, :cond_0

    .line 187
    .end local v1    # "sessionManager":Lcom/twitter/sdk/android/core/SessionManager;, "Lcom/twitter/sdk/android/core/SessionManager<+Lcom/twitter/sdk/android/core/Session;>;"
    :cond_1
    return-object v2
.end method

.method private hasApiAdapter()Z
    .locals 1

    .prologue
    .line 144
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->getApiAdapter()Lretrofit/RestAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isValidSession(Lcom/twitter/sdk/android/core/Session;)Z
    .locals 1
    .param p1, "session"    # Lcom/twitter/sdk/android/core/Session;

    .prologue
    .line 191
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/twitter/sdk/android/core/Session;->getAuthToken()Lcom/twitter/sdk/android/core/AuthToken;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method declared-synchronized getApiAdapter()Lretrofit/RestAdapter;
    .locals 8

    .prologue
    .line 158
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->apiAdapter:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_0

    .line 159
    iget-wide v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->ownerId:J

    invoke-direct {p0, v2, v3}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->getSession(J)Lcom/twitter/sdk/android/core/Session;

    move-result-object v1

    .line 160
    .local v1, "session":Lcom/twitter/sdk/android/core/Session;
    new-instance v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$ConfigRequestInterceptor;

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->scribeConfig:Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;

    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->idManager:Lio/fabric/sdk/android/services/common/IdManager;

    invoke-direct {v0, v2, v3}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$ConfigRequestInterceptor;-><init>(Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;Lio/fabric/sdk/android/services/common/IdManager;)V

    .line 162
    .local v0, "interceptor":Lretrofit/RequestInterceptor;
    invoke-direct {p0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->isValidSession(Lcom/twitter/sdk/android/core/Session;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 163
    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->apiAdapter:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v3, 0x0

    new-instance v4, Lretrofit/RestAdapter$Builder;

    invoke-direct {v4}, Lretrofit/RestAdapter$Builder;-><init>()V

    iget-object v5, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->scribeConfig:Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;

    iget-object v5, v5, Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;->baseUrl:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lretrofit/RestAdapter$Builder;->setEndpoint(Ljava/lang/String;)Lretrofit/RestAdapter$Builder;

    move-result-object v4

    iget-object v5, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v6, Lretrofit/android/MainThreadExecutor;

    invoke-direct {v6}, Lretrofit/android/MainThreadExecutor;-><init>()V

    invoke-virtual {v4, v5, v6}, Lretrofit/RestAdapter$Builder;->setExecutors(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;)Lretrofit/RestAdapter$Builder;

    move-result-object v4

    invoke-virtual {v4, v0}, Lretrofit/RestAdapter$Builder;->setRequestInterceptor(Lretrofit/RequestInterceptor;)Lretrofit/RestAdapter$Builder;

    move-result-object v4

    new-instance v5, Lcom/twitter/sdk/android/core/AuthenticatedClient;

    iget-object v6, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    iget-object v7, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-direct {v5, v6, v1, v7}, Lcom/twitter/sdk/android/core/AuthenticatedClient;-><init>(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/Session;Ljavax/net/ssl/SSLSocketFactory;)V

    invoke-virtual {v4, v5}, Lretrofit/RestAdapter$Builder;->setClient(Lretrofit/client/Client;)Lretrofit/RestAdapter$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lretrofit/RestAdapter$Builder;->build()Lretrofit/RestAdapter;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 176
    .end local v0    # "interceptor":Lretrofit/RequestInterceptor;
    .end local v1    # "session":Lcom/twitter/sdk/android/core/Session;
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->apiAdapter:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lretrofit/RestAdapter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v2

    .line 173
    .restart local v0    # "interceptor":Lretrofit/RequestInterceptor;
    .restart local v1    # "session":Lcom/twitter/sdk/android/core/Session;
    :cond_1
    :try_start_1
    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->context:Landroid/content/Context;

    const-string v3, "No valid session at this time"

    invoke-static {v2, v3}, Lio/fabric/sdk/android/services/common/CommonUtils;->logControlled(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 158
    .end local v0    # "interceptor":Lretrofit/RequestInterceptor;
    .end local v1    # "session":Lcom/twitter/sdk/android/core/Session;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method getScribeEventsAsJsonArrayString(Ljava/util/List;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 109
    .local p1, "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    const/16 v6, 0x400

    invoke-direct {v3, v6}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 110
    .local v3, "out":Ljava/io/ByteArrayOutputStream;
    const/4 v6, 0x1

    new-array v0, v6, [Z

    .line 111
    .local v0, "appendComma":[Z
    sget-object v6, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->START_JSON_ARRAY:[B

    invoke-virtual {v3, v6}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 112
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 113
    .local v1, "f":Ljava/io/File;
    const/4 v4, 0x0

    .line 115
    .local v4, "qf":Lio/fabric/sdk/android/services/common/QueueFile;
    :try_start_0
    new-instance v5, Lio/fabric/sdk/android/services/common/QueueFile;

    invoke-direct {v5, v1}, Lio/fabric/sdk/android/services/common/QueueFile;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    .end local v4    # "qf":Lio/fabric/sdk/android/services/common/QueueFile;
    .local v5, "qf":Lio/fabric/sdk/android/services/common/QueueFile;
    :try_start_1
    new-instance v6, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$1;

    invoke-direct {v6, p0, v0, v3}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$1;-><init>(Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;[ZLjava/io/ByteArrayOutputStream;)V

    invoke-virtual {v5, v6}, Lio/fabric/sdk/android/services/common/QueueFile;->forEach(Lio/fabric/sdk/android/services/common/QueueFile$ElementReader;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 132
    invoke-static {v5}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_0

    .end local v5    # "qf":Lio/fabric/sdk/android/services/common/QueueFile;
    .restart local v4    # "qf":Lio/fabric/sdk/android/services/common/QueueFile;
    :catchall_0
    move-exception v6

    :goto_1
    invoke-static {v4}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v6

    .line 135
    .end local v1    # "f":Ljava/io/File;
    .end local v4    # "qf":Lio/fabric/sdk/android/services/common/QueueFile;
    :cond_0
    sget-object v6, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->END_JSON_ARRAY:[B

    invoke-virtual {v3, v6}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 137
    const-string v6, "UTF-8"

    invoke-virtual {v3, v6}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 132
    .restart local v1    # "f":Ljava/io/File;
    .restart local v5    # "qf":Lio/fabric/sdk/android/services/common/QueueFile;
    :catchall_1
    move-exception v6

    move-object v4, v5

    .end local v5    # "qf":Lio/fabric/sdk/android/services/common/QueueFile;
    .restart local v4    # "qf":Lio/fabric/sdk/android/services/common/QueueFile;
    goto :goto_1
.end method

.method public send(Ljava/util/List;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p1, "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    const/4 v3, 0x1

    .line 81
    invoke-direct {p0}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->hasApiAdapter()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 83
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->getScribeEventsAsJsonArrayString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    .line 84
    .local v2, "scribeEvents":Ljava/lang/String;
    iget-object v4, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->context:Landroid/content/Context;

    invoke-static {v4, v2}, Lio/fabric/sdk/android/services/common/CommonUtils;->logControlled(Landroid/content/Context;Ljava/lang/String;)V

    .line 86
    invoke-virtual {p0, v2}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->upload(Ljava/lang/String;)Lretrofit/client/Response;

    move-result-object v1

    .line 87
    .local v1, "response":Lretrofit/client/Response;
    invoke-virtual {v1}, Lretrofit/client/Response;->getStatus()I

    move-result v4

    const/16 v5, 0xc8

    if-ne v4, v5, :cond_1

    .line 105
    .end local v1    # "response":Lretrofit/client/Response;
    .end local v2    # "scribeEvents":Ljava/lang/String;
    :cond_0
    :goto_0
    return v3

    .line 90
    .restart local v1    # "response":Lretrofit/client/Response;
    .restart local v2    # "scribeEvents":Ljava/lang/String;
    :cond_1
    iget-object v4, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->context:Landroid/content/Context;

    const-string v5, "Failed sending files"

    const/4 v6, 0x0

    invoke-static {v4, v5, v6}, Lio/fabric/sdk/android/services/common/CommonUtils;->logControlledError(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_0
    .catch Lretrofit/RetrofitError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 105
    .end local v1    # "response":Lretrofit/client/Response;
    .end local v2    # "scribeEvents":Ljava/lang/String;
    :cond_2
    :goto_1
    const/4 v3, 0x0

    goto :goto_0

    .line 92
    :catch_0
    move-exception v0

    .line 93
    .local v0, "e":Lretrofit/RetrofitError;
    iget-object v4, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->context:Landroid/content/Context;

    const-string v5, "Failed sending files"

    invoke-static {v4, v5, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->logControlledError(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 94
    invoke-virtual {v0}, Lretrofit/RetrofitError;->getResponse()Lretrofit/client/Response;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-virtual {v0}, Lretrofit/RetrofitError;->getResponse()Lretrofit/client/Response;

    move-result-object v4

    invoke-virtual {v4}, Lretrofit/client/Response;->getStatus()I

    move-result v4

    const/16 v5, 0x1f4

    if-eq v4, v5, :cond_0

    invoke-virtual {v0}, Lretrofit/RetrofitError;->getResponse()Lretrofit/client/Response;

    move-result-object v4

    invoke-virtual {v4}, Lretrofit/client/Response;->getStatus()I

    move-result v4

    const/16 v5, 0x190

    if-ne v4, v5, :cond_2

    goto :goto_0

    .line 99
    .end local v0    # "e":Lretrofit/RetrofitError;
    :catch_1
    move-exception v0

    .line 100
    .local v0, "e":Ljava/io/IOException;
    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->context:Landroid/content/Context;

    const-string v4, "Failed sending files"

    invoke-static {v3, v4, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->logControlledError(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 103
    .end local v0    # "e":Ljava/io/IOException;
    :cond_3
    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->context:Landroid/content/Context;

    const-string v4, "Cannot attempt upload at this time"

    invoke-static {v3, v4}, Lio/fabric/sdk/android/services/common/CommonUtils;->logControlled(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1
.end method

.method setApiAdapter(Lretrofit/RestAdapter;)V
    .locals 1
    .param p1, "restAdapter"    # Lretrofit/RestAdapter;

    .prologue
    .line 151
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->apiAdapter:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 152
    return-void
.end method

.method upload(Ljava/lang/String;)Lretrofit/client/Response;
    .locals 3
    .param p1, "scribeEvents"    # Ljava/lang/String;

    .prologue
    .line 198
    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->apiAdapter:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lretrofit/RestAdapter;

    const-class v2, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$ScribeService;

    invoke-virtual {v1, v2}, Lretrofit/RestAdapter;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$ScribeService;

    .line 199
    .local v0, "service":Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$ScribeService;
    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->scribeConfig:Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;

    iget-object v1, v1, Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;->sequence:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 200
    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->scribeConfig:Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;

    iget-object v1, v1, Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;->sequence:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$ScribeService;->uploadSequence(Ljava/lang/String;Ljava/lang/String;)Lretrofit/client/Response;

    move-result-object v1

    .line 202
    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->scribeConfig:Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;

    iget-object v1, v1, Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;->pathVersion:Ljava/lang/String;

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->scribeConfig:Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;

    iget-object v2, v2, Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;->pathType:Ljava/lang/String;

    invoke-interface {v0, v1, v2, p1}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$ScribeService;->upload(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lretrofit/client/Response;

    move-result-object v1

    goto :goto_0
.end method
