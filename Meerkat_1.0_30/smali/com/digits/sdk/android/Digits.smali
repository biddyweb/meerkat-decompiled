.class public Lcom/digits/sdk/android/Digits;
.super Lio/fabric/sdk/android/Kit;
.source "Digits.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/fabric/sdk/android/Kit",
        "<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation

.annotation runtime Lio/fabric/sdk/android/services/concurrency/DependsOn;
    value = {
        Lcom/twitter/sdk/android/core/TwitterCore;
    }
.end annotation


# static fields
.field private static final KIT_SCRIBE_NAME:Ljava/lang/String; = "Digits"

.field static final PREF_KEY_ACTIVE_SESSION:Ljava/lang/String; = "active_session"

.field static final PREF_KEY_SESSION:Ljava/lang/String; = "session"

.field public static final TAG:Ljava/lang/String; = "Digits"


# instance fields
.field private activityClassManager:Lcom/digits/sdk/android/ActivityClassManager;

.field private volatile contactsClient:Lcom/digits/sdk/android/ContactsClient;

.field private volatile digitsClient:Lcom/digits/sdk/android/DigitsClient;

.field scribeClient:Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;

.field private sessionManager:Lcom/twitter/sdk/android/core/SessionManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<",
            "Lcom/digits/sdk/android/DigitsSession;",
            ">;"
        }
    .end annotation
.end field

.field private sessionMonitor:Lcom/twitter/sdk/android/core/internal/SessionMonitor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/twitter/sdk/android/core/internal/SessionMonitor",
            "<",
            "Lcom/digits/sdk/android/DigitsSession;",
            ">;"
        }
    .end annotation
.end field

.field private themeResId:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lio/fabric/sdk/android/Kit;-><init>()V

    return-void
.end method

.method public static authenticate(Lcom/digits/sdk/android/AuthCallback;)V
    .locals 1
    .param p0, "callback"    # Lcom/digits/sdk/android/AuthCallback;

    .prologue
    .line 68
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/digits/sdk/android/Digits;->authenticate(Lcom/digits/sdk/android/AuthCallback;I)V

    .line 69
    return-void
.end method

.method public static authenticate(Lcom/digits/sdk/android/AuthCallback;I)V
    .locals 1
    .param p0, "callback"    # Lcom/digits/sdk/android/AuthCallback;
    .param p1, "themeResId"    # I

    .prologue
    .line 57
    invoke-static {}, Lcom/digits/sdk/android/Digits;->getInstance()Lcom/digits/sdk/android/Digits;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/digits/sdk/android/Digits;->setTheme(I)V

    .line 58
    invoke-static {}, Lcom/digits/sdk/android/Digits;->getInstance()Lcom/digits/sdk/android/Digits;

    move-result-object v0

    invoke-virtual {v0}, Lcom/digits/sdk/android/Digits;->getDigitsClient()Lcom/digits/sdk/android/DigitsClient;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/digits/sdk/android/DigitsClient;->startSignUp(Lcom/digits/sdk/android/AuthCallback;)V

    .line 59
    return-void
.end method

.method private declared-synchronized createContactsClient()V
    .locals 1

    .prologue
    .line 143
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/digits/sdk/android/Digits;->contactsClient:Lcom/digits/sdk/android/ContactsClient;

    if-nez v0, :cond_0

    .line 144
    new-instance v0, Lcom/digits/sdk/android/ContactsClient;

    invoke-direct {v0}, Lcom/digits/sdk/android/ContactsClient;-><init>()V

    iput-object v0, p0, Lcom/digits/sdk/android/Digits;->contactsClient:Lcom/digits/sdk/android/ContactsClient;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 146
    :cond_0
    monitor-exit p0

    return-void

    .line 143
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized createDigitsClient()V
    .locals 1

    .prologue
    .line 130
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/digits/sdk/android/Digits;->digitsClient:Lcom/digits/sdk/android/DigitsClient;

    if-nez v0, :cond_0

    .line 131
    new-instance v0, Lcom/digits/sdk/android/DigitsClient;

    invoke-direct {v0}, Lcom/digits/sdk/android/DigitsClient;-><init>()V

    iput-object v0, p0, Lcom/digits/sdk/android/Digits;->digitsClient:Lcom/digits/sdk/android/DigitsClient;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 133
    :cond_0
    monitor-exit p0

    return-void

    .line 130
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public static getInstance()Lcom/digits/sdk/android/Digits;
    .locals 1

    .prologue
    .line 46
    const-class v0, Lcom/digits/sdk/android/Digits;

    invoke-static {v0}, Lio/fabric/sdk/android/Fabric;->getKit(Ljava/lang/Class;)Lio/fabric/sdk/android/Kit;

    move-result-object v0

    check-cast v0, Lcom/digits/sdk/android/Digits;

    return-object v0
.end method

.method public static getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<",
            "Lcom/digits/sdk/android/DigitsSession;",
            ">;"
        }
    .end annotation

    .prologue
    .line 72
    invoke-static {}, Lcom/digits/sdk/android/Digits;->getInstance()Lcom/digits/sdk/android/Digits;

    move-result-object v0

    iget-object v0, v0, Lcom/digits/sdk/android/Digits;->sessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    return-object v0
.end method

.method private setUpScribing()V
    .locals 4

    .prologue
    .line 153
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 154
    .local v0, "sessionManagers":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/core/SessionManager<+Lcom/twitter/sdk/android/core/Session;>;>;"
    iget-object v1, p0, Lcom/digits/sdk/android/Digits;->sessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    new-instance v1, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;

    const-string v2, "Digits"

    invoke-virtual {p0}, Lcom/digits/sdk/android/Digits;->getIdManager()Lio/fabric/sdk/android/services/common/IdManager;

    move-result-object v3

    invoke-direct {v1, p0, v2, v0, v3}, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;-><init>(Lio/fabric/sdk/android/Kit;Ljava/lang/String;Ljava/util/List;Lio/fabric/sdk/android/services/common/IdManager;)V

    iput-object v1, p0, Lcom/digits/sdk/android/Digits;->scribeClient:Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;

    .line 157
    return-void
.end method


# virtual methods
.method protected createActivityClassManager()V
    .locals 3

    .prologue
    .line 173
    new-instance v0, Lcom/digits/sdk/android/ActivityClassManagerFactory;

    invoke-direct {v0}, Lcom/digits/sdk/android/ActivityClassManagerFactory;-><init>()V

    .line 174
    .local v0, "factory":Lcom/digits/sdk/android/ActivityClassManagerFactory;
    invoke-virtual {p0}, Lcom/digits/sdk/android/Digits;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/digits/sdk/android/Digits;->themeResId:I

    invoke-virtual {v0, v1, v2}, Lcom/digits/sdk/android/ActivityClassManagerFactory;->createActivityClassManager(Landroid/content/Context;I)Lcom/digits/sdk/android/ActivityClassManager;

    move-result-object v1

    iput-object v1, p0, Lcom/digits/sdk/android/Digits;->activityClassManager:Lcom/digits/sdk/android/ActivityClassManager;

    .line 175
    return-void
.end method

.method protected bridge synthetic doInBackground()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 26
    invoke-virtual {p0}, Lcom/digits/sdk/android/Digits;->doInBackground()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected doInBackground()Ljava/lang/Void;
    .locals 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/digits/sdk/android/Digits;->sessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    invoke-interface {v0}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    .line 93
    invoke-direct {p0}, Lcom/digits/sdk/android/Digits;->createDigitsClient()V

    .line 94
    invoke-direct {p0}, Lcom/digits/sdk/android/Digits;->createContactsClient()V

    .line 95
    invoke-direct {p0}, Lcom/digits/sdk/android/Digits;->setUpScribing()V

    .line 96
    iget-object v0, p0, Lcom/digits/sdk/android/Digits;->sessionMonitor:Lcom/twitter/sdk/android/core/internal/SessionMonitor;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->triggerVerificationIfNecessary()V

    .line 99
    iget-object v0, p0, Lcom/digits/sdk/android/Digits;->sessionMonitor:Lcom/twitter/sdk/android/core/internal/SessionMonitor;

    invoke-virtual {p0}, Lcom/digits/sdk/android/Digits;->getFabric()Lio/fabric/sdk/android/Fabric;

    move-result-object v1

    invoke-virtual {v1}, Lio/fabric/sdk/android/Fabric;->getActivityLifecycleManager()Lio/fabric/sdk/android/ActivityLifecycleManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->monitorActivityLifecycle(Lio/fabric/sdk/android/ActivityLifecycleManager;)V

    .line 100
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getActivityClassManager()Lcom/digits/sdk/android/ActivityClassManager;
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lcom/digits/sdk/android/Digits;->activityClassManager:Lcom/digits/sdk/android/ActivityClassManager;

    if-nez v0, :cond_0

    .line 167
    invoke-virtual {p0}, Lcom/digits/sdk/android/Digits;->createActivityClassManager()V

    .line 169
    :cond_0
    iget-object v0, p0, Lcom/digits/sdk/android/Digits;->activityClassManager:Lcom/digits/sdk/android/ActivityClassManager;

    return-object v0
.end method

.method public getContactsClient()Lcom/digits/sdk/android/ContactsClient;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/digits/sdk/android/Digits;->contactsClient:Lcom/digits/sdk/android/ContactsClient;

    if-nez v0, :cond_0

    .line 137
    invoke-direct {p0}, Lcom/digits/sdk/android/Digits;->createContactsClient()V

    .line 139
    :cond_0
    iget-object v0, p0, Lcom/digits/sdk/android/Digits;->contactsClient:Lcom/digits/sdk/android/ContactsClient;

    return-object v0
.end method

.method getDigitsClient()Lcom/digits/sdk/android/DigitsClient;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/digits/sdk/android/Digits;->digitsClient:Lcom/digits/sdk/android/DigitsClient;

    if-nez v0, :cond_0

    .line 124
    invoke-direct {p0}, Lcom/digits/sdk/android/Digits;->createDigitsClient()V

    .line 126
    :cond_0
    iget-object v0, p0, Lcom/digits/sdk/android/Digits;->digitsClient:Lcom/digits/sdk/android/DigitsClient;

    return-object v0
.end method

.method protected getExecutorService()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .prologue
    .line 149
    invoke-virtual {p0}, Lcom/digits/sdk/android/Digits;->getFabric()Lio/fabric/sdk/android/Fabric;

    move-result-object v0

    invoke-virtual {v0}, Lio/fabric/sdk/android/Fabric;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    return-object v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 119
    const-string v0, "com.digits.sdk.android:digits"

    return-object v0
.end method

.method getTheme()I
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 105
    iget v0, p0, Lcom/digits/sdk/android/Digits;->themeResId:I

    if-eqz v0, :cond_0

    .line 106
    iget v0, p0, Lcom/digits/sdk/android/Digits;->themeResId:I

    .line 109
    :goto_0
    return v0

    :cond_0
    sget v0, Lcom/digits/sdk/android/R$style;->Digits_default:I

    goto :goto_0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 77
    const-string v0, "1.3.0.37"

    return-object v0
.end method

.method protected onPreExecute()Z
    .locals 5

    .prologue
    .line 82
    new-instance v0, Lcom/twitter/sdk/android/core/PersistedSessionManager;

    new-instance v1, Lio/fabric/sdk/android/services/persistence/PreferenceStoreImpl;

    invoke-direct {v1, p0}, Lio/fabric/sdk/android/services/persistence/PreferenceStoreImpl;-><init>(Lio/fabric/sdk/android/Kit;)V

    new-instance v2, Lcom/digits/sdk/android/DigitsSession$Serializer;

    invoke-direct {v2}, Lcom/digits/sdk/android/DigitsSession$Serializer;-><init>()V

    const-string v3, "active_session"

    const-string v4, "session"

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/twitter/sdk/android/core/PersistedSessionManager;-><init>(Lio/fabric/sdk/android/services/persistence/PreferenceStore;Lio/fabric/sdk/android/services/persistence/SerializationStrategy;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/digits/sdk/android/Digits;->sessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    .line 85
    new-instance v0, Lcom/twitter/sdk/android/core/internal/SessionMonitor;

    iget-object v1, p0, Lcom/digits/sdk/android/Digits;->sessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    invoke-virtual {p0}, Lcom/digits/sdk/android/Digits;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/twitter/sdk/android/core/internal/SessionMonitor;-><init>(Lcom/twitter/sdk/android/core/SessionManager;Ljava/util/concurrent/ExecutorService;)V

    iput-object v0, p0, Lcom/digits/sdk/android/Digits;->sessionMonitor:Lcom/twitter/sdk/android/core/internal/SessionMonitor;

    .line 86
    invoke-super {p0}, Lio/fabric/sdk/android/Kit;->onPreExecute()Z

    move-result v0

    return v0
.end method

.method protected varargs scribe([Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;)V
    .locals 1
    .param p1, "namespaces"    # [Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/digits/sdk/android/Digits;->scribeClient:Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;

    if-eqz v0, :cond_0

    .line 161
    iget-object v0, p0, Lcom/digits/sdk/android/Digits;->scribeClient:Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;

    invoke-virtual {v0, p1}, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->scribeSyndicatedSdkImpressionEvents([Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;)V

    .line 163
    :cond_0
    return-void
.end method

.method protected setTheme(I)V
    .locals 0
    .param p1, "themeResId"    # I

    .prologue
    .line 113
    iput p1, p0, Lcom/digits/sdk/android/Digits;->themeResId:I

    .line 114
    invoke-virtual {p0}, Lcom/digits/sdk/android/Digits;->createActivityClassManager()V

    .line 115
    return-void
.end method
