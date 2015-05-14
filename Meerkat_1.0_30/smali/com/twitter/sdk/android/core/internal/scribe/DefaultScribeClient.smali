.class public Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;
.super Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;
.source "DefaultScribeClient.java"


# static fields
.field private static final SCRIBE_PATH_TYPE:Ljava/lang/String; = "sdk"

.field private static final SCRIBE_PATH_VERSION:Ljava/lang/String; = "i"

.field private static final SCRIBE_URL:Ljava/lang/String; = "https://syndication.twitter.com"

.field private static volatile executor:Ljava/util/concurrent/ScheduledExecutorService;


# instance fields
.field private final advertisingId:Ljava/lang/String;

.field private final kit:Lio/fabric/sdk/android/Kit;

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


# direct methods
.method public constructor <init>(Lio/fabric/sdk/android/Kit;Ljava/lang/String;Lcom/google/gson/Gson;Ljava/util/List;Lio/fabric/sdk/android/services/common/IdManager;)V
    .locals 9
    .param p1, "kit"    # Lio/fabric/sdk/android/Kit;
    .param p2, "kitName"    # Ljava/lang/String;
    .param p3, "gson"    # Lcom/google/gson/Gson;
    .param p5, "idManager"    # Lio/fabric/sdk/android/services/common/IdManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/fabric/sdk/android/Kit;",
            "Ljava/lang/String;",
            "Lcom/google/gson/Gson;",
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<+",
            "Lcom/twitter/sdk/android/core/Session;",
            ">;>;",
            "Lio/fabric/sdk/android/services/common/IdManager;",
            ")V"
        }
    .end annotation

    .prologue
    .line 50
    .local p4, "sessionManagers":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/core/SessionManager<+Lcom/twitter/sdk/android/core/Session;>;>;"
    invoke-static {}, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->getExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    invoke-static {}, Lio/fabric/sdk/android/services/settings/Settings;->getInstance()Lio/fabric/sdk/android/services/settings/Settings;

    move-result-object v0

    invoke-virtual {v0}, Lio/fabric/sdk/android/services/settings/Settings;->awaitSettingsData()Lio/fabric/sdk/android/services/settings/SettingsData;

    move-result-object v0

    invoke-static {p2, p1}, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->getUserAgent(Ljava/lang/String;Lio/fabric/sdk/android/Kit;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->getScribeConfig(Lio/fabric/sdk/android/services/settings/SettingsData;Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;

    move-result-object v3

    new-instance v4, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent$Transform;

    invoke-direct {v4, p3}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent$Transform;-><init>(Lcom/google/gson/Gson;)V

    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->getInstance()Lcom/twitter/sdk/android/core/TwitterCore;

    move-result-object v0

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/TwitterCore;->getAuthConfig()Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    move-result-object v5

    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->getInstance()Lcom/twitter/sdk/android/core/TwitterCore;

    move-result-object v0

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/TwitterCore;->getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v7

    move-object v0, p0

    move-object v1, p1

    move-object v6, p4

    move-object v8, p5

    invoke-direct/range {v0 .. v8}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;-><init>(Lio/fabric/sdk/android/Kit;Ljava/util/concurrent/ScheduledExecutorService;Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent$Transform;Lcom/twitter/sdk/android/core/TwitterAuthConfig;Ljava/util/List;Ljavax/net/ssl/SSLSocketFactory;Lio/fabric/sdk/android/services/common/IdManager;)V

    .line 58
    iput-object p4, p0, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->sessionManagers:Ljava/util/List;

    .line 59
    iput-object p1, p0, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->kit:Lio/fabric/sdk/android/Kit;

    .line 60
    invoke-virtual {p5}, Lio/fabric/sdk/android/services/common/IdManager;->getAdvertisingId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->advertisingId:Ljava/lang/String;

    .line 61
    return-void
.end method

.method public constructor <init>(Lio/fabric/sdk/android/Kit;Ljava/lang/String;Ljava/util/List;Lio/fabric/sdk/android/services/common/IdManager;)V
    .locals 6
    .param p1, "kit"    # Lio/fabric/sdk/android/Kit;
    .param p2, "kitName"    # Ljava/lang/String;
    .param p4, "idManager"    # Lio/fabric/sdk/android/services/common/IdManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/fabric/sdk/android/Kit;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<+",
            "Lcom/twitter/sdk/android/core/Session;",
            ">;>;",
            "Lio/fabric/sdk/android/services/common/IdManager;",
            ")V"
        }
    .end annotation

    .prologue
    .line 45
    .local p3, "sessionManagers":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/core/SessionManager<+Lcom/twitter/sdk/android/core/Session;>;>;"
    invoke-static {}, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->getGson()Lcom/google/gson/Gson;

    move-result-object v3

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;-><init>(Lio/fabric/sdk/android/Kit;Ljava/lang/String;Lcom/google/gson/Gson;Ljava/util/List;Lio/fabric/sdk/android/services/common/IdManager;)V

    .line 46
    return-void
.end method

.method private static getExecutor()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 2

    .prologue
    .line 118
    sget-object v0, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    if-nez v0, :cond_1

    .line 119
    const-class v1, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;

    monitor-enter v1

    .line 120
    :try_start_0
    sget-object v0, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    if-nez v0, :cond_0

    .line 121
    const-string v0, "scribe"

    invoke-static {v0}, Lio/fabric/sdk/android/services/common/ExecutorUtils;->buildSingleThreadScheduledExecutorService(Ljava/lang/String;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    sput-object v0, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    .line 123
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    :cond_1
    sget-object v0, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    return-object v0

    .line 123
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private static getGson()Lcom/google/gson/Gson;
    .locals 2

    .prologue
    .line 112
    new-instance v0, Lcom/google/gson/GsonBuilder;

    invoke-direct {v0}, Lcom/google/gson/GsonBuilder;-><init>()V

    sget-object v1, Lcom/google/gson/FieldNamingPolicy;->LOWER_CASE_WITH_UNDERSCORES:Lcom/google/gson/FieldNamingPolicy;

    invoke-virtual {v0, v1}, Lcom/google/gson/GsonBuilder;->setFieldNamingPolicy(Lcom/google/gson/FieldNamingPolicy;)Lcom/google/gson/GsonBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    move-result-object v0

    return-object v0
.end method

.method static getScribeConfig(Lio/fabric/sdk/android/services/settings/SettingsData;Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;
    .locals 9
    .param p0, "settingsData"    # Lio/fabric/sdk/android/services/settings/SettingsData;
    .param p1, "userAgent"    # Ljava/lang/String;

    .prologue
    .line 134
    if-eqz p0, :cond_0

    iget-object v0, p0, Lio/fabric/sdk/android/services/settings/SettingsData;->analyticsSettingsData:Lio/fabric/sdk/android/services/settings/AnalyticsSettingsData;

    if-eqz v0, :cond_0

    .line 135
    iget-object v0, p0, Lio/fabric/sdk/android/services/settings/SettingsData;->analyticsSettingsData:Lio/fabric/sdk/android/services/settings/AnalyticsSettingsData;

    iget v7, v0, Lio/fabric/sdk/android/services/settings/AnalyticsSettingsData;->maxPendingSendFileCount:I

    .line 136
    .local v7, "maxFilesToKeep":I
    iget-object v0, p0, Lio/fabric/sdk/android/services/settings/SettingsData;->analyticsSettingsData:Lio/fabric/sdk/android/services/settings/AnalyticsSettingsData;

    iget v8, v0, Lio/fabric/sdk/android/services/settings/AnalyticsSettingsData;->flushIntervalSeconds:I

    .line 142
    .local v8, "sendIntervalSeconds":I
    :goto_0
    const-string v0, "https://syndication.twitter.com"

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->getScribeUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 143
    .local v2, "scribeUrl":Ljava/lang/String;
    new-instance v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;

    const/4 v1, 0x1

    const-string v3, "i"

    const-string v4, "sdk"

    const-string v5, ""

    move-object v6, p1

    invoke-direct/range {v0 .. v8}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;-><init>(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V

    return-object v0

    .line 138
    .end local v2    # "scribeUrl":Ljava/lang/String;
    .end local v7    # "maxFilesToKeep":I
    .end local v8    # "sendIntervalSeconds":I
    :cond_0
    const/16 v7, 0x64

    .line 139
    .restart local v7    # "maxFilesToKeep":I
    const/16 v8, 0x258

    .restart local v8    # "sendIntervalSeconds":I
    goto :goto_0
.end method

.method static getScribeUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "defaultUrl"    # Ljava/lang/String;
    .param p1, "overrideUrl"    # Ljava/lang/String;

    .prologue
    .line 163
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 166
    .end local p1    # "overrideUrl":Ljava/lang/String;
    :goto_0
    return-object p1

    .restart local p1    # "overrideUrl":Ljava/lang/String;
    :cond_0
    move-object p1, p0

    goto :goto_0
.end method

.method static getUserAgent(Ljava/lang/String;Lio/fabric/sdk/android/Kit;)Ljava/lang/String;
    .locals 2
    .param p0, "kitName"    # Ljava/lang/String;
    .param p1, "kit"    # Lio/fabric/sdk/android/Kit;

    .prologue
    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Fabric/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lio/fabric/sdk/android/Kit;->getFabric()Lio/fabric/sdk/android/Fabric;

    move-result-object v1

    invoke-virtual {v1}, Lio/fabric/sdk/android/Fabric;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " (Android "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lio/fabric/sdk/android/Kit;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method getActiveSession()Lcom/twitter/sdk/android/core/Session;
    .locals 4

    .prologue
    .line 87
    const/4 v1, 0x0

    .line 88
    .local v1, "session":Lcom/twitter/sdk/android/core/Session;
    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->sessionManagers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/twitter/sdk/android/core/SessionManager;

    .line 89
    .local v2, "sessionManager":Lcom/twitter/sdk/android/core/SessionManager;, "Lcom/twitter/sdk/android/core/SessionManager<+Lcom/twitter/sdk/android/core/Session;>;"
    invoke-interface {v2}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v1

    .line 90
    if-eqz v1, :cond_0

    .line 94
    .end local v2    # "sessionManager":Lcom/twitter/sdk/android/core/SessionManager;, "Lcom/twitter/sdk/android/core/SessionManager<+Lcom/twitter/sdk/android/core/Session;>;"
    :cond_1
    return-object v1
.end method

.method getScribeSessionId(Lcom/twitter/sdk/android/core/Session;)J
    .locals 2
    .param p1, "activeSession"    # Lcom/twitter/sdk/android/core/Session;

    .prologue
    .line 100
    if-eqz p1, :cond_0

    .line 101
    invoke-virtual {p1}, Lcom/twitter/sdk/android/core/Session;->getId()J

    move-result-wide v0

    .line 108
    .local v0, "scribeSessionId":J
    :goto_0
    return-wide v0

    .line 106
    .end local v0    # "scribeSessionId":J
    :cond_0
    const-wide/16 v0, 0x0

    .restart local v0    # "scribeSessionId":J
    goto :goto_0
.end method

.method public scribe(Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;)V
    .locals 2
    .param p1, "event"    # Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->getScribeSessionId(Lcom/twitter/sdk/android/core/Session;)J

    move-result-wide v0

    invoke-super {p0, p1, v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeClient;->scribe(Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;J)Z

    .line 83
    return-void
.end method

.method public varargs scribeSyndicatedSdkImpressionEvents([Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;)V
    .locals 9
    .param p1, "namespaces"    # [Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->kit:Lio/fabric/sdk/android/Kit;

    invoke-virtual {v0}, Lio/fabric/sdk/android/Kit;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 66
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->kit:Lio/fabric/sdk/android/Kit;

    invoke-virtual {v0}, Lio/fabric/sdk/android/Kit;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v4

    .line 70
    .local v4, "language":Ljava/lang/String;
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 76
    .local v2, "timestamp":J
    move-object v6, p1

    .local v6, "arr$":[Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
    array-length v8, v6

    .local v8, "len$":I
    const/4 v7, 0x0

    .local v7, "i$":I
    :goto_1
    if-ge v7, v8, :cond_1

    aget-object v1, v6, v7

    .line 77
    .local v1, "ns":Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
    new-instance v0, Lcom/twitter/sdk/android/core/internal/scribe/SyndicatedSdkImpressionEvent;

    iget-object v5, p0, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->advertisingId:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/twitter/sdk/android/core/internal/scribe/SyndicatedSdkImpressionEvent;-><init>(Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;JLjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->scribe(Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;)V

    .line 76
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 68
    .end local v1    # "ns":Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
    .end local v2    # "timestamp":J
    .end local v4    # "language":Ljava/lang/String;
    .end local v6    # "arr$":[Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
    .end local v7    # "i$":I
    .end local v8    # "len$":I
    :cond_0
    const-string v4, ""

    .restart local v4    # "language":Ljava/lang/String;
    goto :goto_0

    .line 79
    .restart local v2    # "timestamp":J
    .restart local v6    # "arr$":[Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
    .restart local v7    # "i$":I
    .restart local v8    # "len$":I
    :cond_1
    return-void
.end method
