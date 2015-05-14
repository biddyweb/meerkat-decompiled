.class public Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;
.super Ljava/lang/Object;
.source "ScribeClient.java"


# static fields
.field private static final STORAGE_DIR_BASE:Ljava/lang/String; = "_se_to_send"

.field private static final WORKING_FILENAME_BASE:Ljava/lang/String; = "_se.tap"


# instance fields
.field private final authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

.field private final executor:Ljava/util/concurrent/ScheduledExecutorService;

.field private final idManager:Lio/fabric/sdk/android/services/common/IdManager;

.field private final kit:Lio/fabric/sdk/android/Kit;

.field private final scribeConfig:Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;

.field final scribeHandlers:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/twitter/sdk/android/core/internal/scribe/ScribeHandler;",
            ">;"
        }
    .end annotation
.end field

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

.field private final transform:Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent$Transform;


# direct methods
.method public constructor <init>(Lio/fabric/sdk/android/Kit;Ljava/util/concurrent/ScheduledExecutorService;Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent$Transform;Lcom/twitter/sdk/android/core/TwitterAuthConfig;Ljava/util/List;Ljavax/net/ssl/SSLSocketFactory;Lio/fabric/sdk/android/services/common/IdManager;)V
    .locals 2
    .param p1, "kit"    # Lio/fabric/sdk/android/Kit;
    .param p2, "executor"    # Ljava/util/concurrent/ScheduledExecutorService;
    .param p3, "scribeConfig"    # Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;
    .param p4, "transform"    # Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent$Transform;
    .param p5, "authConfig"    # Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    .param p7, "sslSocketFactory"    # Ljavax/net/ssl/SSLSocketFactory;
    .param p8, "idManager"    # Lio/fabric/sdk/android/services/common/IdManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/fabric/sdk/android/Kit;",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            "Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;",
            "Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent$Transform;",
            "Lcom/twitter/sdk/android/core/TwitterAuthConfig;",
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<+",
            "Lcom/twitter/sdk/android/core/Session;",
            ">;>;",
            "Ljavax/net/ssl/SSLSocketFactory;",
            "Lio/fabric/sdk/android/services/common/IdManager;",
            ")V"
        }
    .end annotation

    .prologue
    .line 84
    .local p6, "sessionManagers":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/core/SessionManager<+Lcom/twitter/sdk/android/core/Session;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    iput-object p1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->kit:Lio/fabric/sdk/android/Kit;

    .line 86
    iput-object p2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    .line 87
    iput-object p3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->scribeConfig:Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;

    .line 88
    iput-object p4, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->transform:Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent$Transform;

    .line 89
    iput-object p5, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    .line 90
    iput-object p6, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->sessionManagers:Ljava/util/List;

    .line 91
    iput-object p7, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 92
    iput-object p8, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->idManager:Lio/fabric/sdk/android/services/common/IdManager;

    .line 95
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(I)V

    iput-object v0, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->scribeHandlers:Ljava/util/concurrent/ConcurrentHashMap;

    .line 96
    return-void
.end method

.method private newScribeHandler(J)Lcom/twitter/sdk/android/core/internal/scribe/ScribeHandler;
    .locals 7
    .param p1, "ownerId"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->kit:Lio/fabric/sdk/android/Kit;

    invoke-virtual {v2}, Lio/fabric/sdk/android/Kit;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 133
    .local v1, "context":Landroid/content/Context;
    new-instance v4, Lio/fabric/sdk/android/services/events/QueueFileEventStorage;

    new-instance v2, Lio/fabric/sdk/android/services/persistence/FileStoreImpl;

    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->kit:Lio/fabric/sdk/android/Kit;

    invoke-direct {v2, v3}, Lio/fabric/sdk/android/services/persistence/FileStoreImpl;-><init>(Lio/fabric/sdk/android/Kit;)V

    invoke-virtual {v2}, Lio/fabric/sdk/android/services/persistence/FileStoreImpl;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {p0, p1, p2}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->getWorkingFileNameForOwner(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, p1, p2}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->getStorageDirForOwner(J)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v1, v2, v3, v5}, Lio/fabric/sdk/android/services/events/QueueFileEventStorage;-><init>(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    .local v4, "storage":Lio/fabric/sdk/android/services/events/QueueFileEventStorage;
    new-instance v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesManager;

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->transform:Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent$Transform;

    new-instance v3, Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;

    invoke-direct {v3}, Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;-><init>()V

    iget-object v5, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->scribeConfig:Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;

    iget v5, v5, Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;->maxFilesToKeep:I

    invoke-direct/range {v0 .. v5}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesManager;-><init>(Landroid/content/Context;Lio/fabric/sdk/android/services/events/EventTransform;Lio/fabric/sdk/android/services/common/CurrentTimeProvider;Lio/fabric/sdk/android/services/events/QueueFileEventStorage;I)V

    .line 138
    .local v0, "filesManager":Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesManager;
    new-instance v2, Lcom/twitter/sdk/android/core/internal/scribe/ScribeHandler;

    invoke-virtual {p0, p1, p2, v0}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->getScribeStrategy(JLcom/twitter/sdk/android/core/internal/scribe/ScribeFilesManager;)Lio/fabric/sdk/android/services/events/EventsStrategy;

    move-result-object v3

    iget-object v5, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-direct {v2, v1, v3, v0, v5}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeHandler;-><init>(Landroid/content/Context;Lio/fabric/sdk/android/services/events/EventsStrategy;Lio/fabric/sdk/android/services/events/EventsFilesManager;Ljava/util/concurrent/ScheduledExecutorService;)V

    return-object v2
.end method


# virtual methods
.method getScribeHandler(J)Lcom/twitter/sdk/android/core/internal/scribe/ScribeHandler;
    .locals 3
    .param p1, "ownerId"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->scribeHandlers:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->scribeHandlers:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-direct {p0, p1, p2}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->newScribeHandler(J)Lcom/twitter/sdk/android/core/internal/scribe/ScribeHandler;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->scribeHandlers:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeHandler;

    return-object v0
.end method

.method getScribeStrategy(JLcom/twitter/sdk/android/core/internal/scribe/ScribeFilesManager;)Lio/fabric/sdk/android/services/events/EventsStrategy;
    .locals 13
    .param p1, "ownerId"    # J
    .param p3, "filesManager"    # Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesManager;",
            ")",
            "Lio/fabric/sdk/android/services/events/EventsStrategy",
            "<",
            "Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 143
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->kit:Lio/fabric/sdk/android/Kit;

    invoke-virtual {v0}, Lio/fabric/sdk/android/Kit;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 144
    .local v2, "context":Landroid/content/Context;
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->scribeConfig:Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;

    iget-boolean v0, v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;->isEnabled:Z

    if-eqz v0, :cond_0

    .line 145
    const-string v0, "Scribe enabled"

    invoke-static {v2, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->logControlled(Landroid/content/Context;Ljava/lang/String;)V

    .line 146
    new-instance v0, Lcom/twitter/sdk/android/core/internal/scribe/EnabledScribeStrategy;

    iget-object v11, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    iget-object v12, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->scribeConfig:Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;

    new-instance v1, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;

    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->scribeConfig:Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;

    iget-object v6, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    iget-object v7, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->sessionManagers:Ljava/util/List;

    iget-object v8, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    iget-object v9, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    iget-object v10, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->idManager:Lio/fabric/sdk/android/services/common/IdManager;

    move-wide v4, p1

    invoke-direct/range {v1 .. v10}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;-><init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;JLcom/twitter/sdk/android/core/TwitterAuthConfig;Ljava/util/List;Ljavax/net/ssl/SSLSocketFactory;Ljava/util/concurrent/ExecutorService;Lio/fabric/sdk/android/services/common/IdManager;)V

    move-object v3, v0

    move-object v4, v2

    move-object v5, v11

    move-object/from16 v6, p3

    move-object v7, v12

    move-object v8, v1

    invoke-direct/range {v3 .. v8}, Lcom/twitter/sdk/android/core/internal/scribe/EnabledScribeStrategy;-><init>(Landroid/content/Context;Ljava/util/concurrent/ScheduledExecutorService;Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesManager;Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;)V

    .line 151
    :goto_0
    return-object v0

    .line 150
    :cond_0
    const-string v0, "Scribe disabled"

    invoke-static {v2, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->logControlled(Landroid/content/Context;Ljava/lang/String;)V

    .line 151
    new-instance v0, Lio/fabric/sdk/android/services/events/DisabledEventsStrategy;

    invoke-direct {v0}, Lio/fabric/sdk/android/services/events/DisabledEventsStrategy;-><init>()V

    goto :goto_0
.end method

.method getStorageDirForOwner(J)Ljava/lang/String;
    .locals 3
    .param p1, "ownerId"    # J

    .prologue
    .line 160
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_se_to_send"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getWorkingFileNameForOwner(J)Ljava/lang/String;
    .locals 3
    .param p1, "ownerId"    # J

    .prologue
    .line 156
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_se.tap"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public scribe(Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;J)Z
    .locals 4
    .param p1, "event"    # Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;
    .param p2, "ownerId"    # J

    .prologue
    .line 103
    :try_start_0
    invoke-virtual {p0, p2, p3}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->getScribeHandler(J)Lcom/twitter/sdk/android/core/internal/scribe/ScribeHandler;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeHandler;->scribe(Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    const/4 v1, 0x1

    .line 107
    :goto_0
    return v1

    .line 105
    :catch_0
    move-exception v0

    .line 106
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->kit:Lio/fabric/sdk/android/Kit;

    invoke-virtual {v1}, Lio/fabric/sdk/android/Kit;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "Failed to scribe event"

    invoke-static {v1, v2, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->logControlledError(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 107
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public scribeAndFlush(Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;J)Z
    .locals 4
    .param p1, "event"    # Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;
    .param p2, "ownerId"    # J

    .prologue
    .line 116
    :try_start_0
    invoke-virtual {p0, p2, p3}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->getScribeHandler(J)Lcom/twitter/sdk/android/core/internal/scribe/ScribeHandler;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeHandler;->scribeAndFlush(Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    const/4 v1, 0x1

    .line 120
    :goto_0
    return v1

    .line 118
    :catch_0
    move-exception v0

    .line 119
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->kit:Lio/fabric/sdk/android/Kit;

    invoke-virtual {v1}, Lio/fabric/sdk/android/Kit;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "Failed to scribe event"

    invoke-static {v1, v2, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->logControlledError(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 120
    const/4 v1, 0x0

    goto :goto_0
.end method
