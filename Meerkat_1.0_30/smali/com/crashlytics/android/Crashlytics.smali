.class public Lcom/crashlytics/android/Crashlytics;
.super Lio/fabric/sdk/android/Kit;
.source "Crashlytics.java"

# interfaces
.implements Lio/fabric/sdk/android/KitGroup;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/crashlytics/android/Crashlytics$OptInLatch;,
        Lcom/crashlytics/android/Crashlytics$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/fabric/sdk/android/Kit",
        "<",
        "Ljava/lang/Void;",
        ">;",
        "Lio/fabric/sdk/android/KitGroup;"
    }
.end annotation

.annotation runtime Lio/fabric/sdk/android/services/concurrency/DependsOn;
    value = {
        Lcom/crashlytics/android/internal/CrashEventDataProvider;
    }
.end annotation


# static fields
.field static final CLS_DEFAULT_PROCESS_DELAY:F = 1.0f

.field static final COLLECT_CUSTOM_KEYS:Ljava/lang/String; = "com.crashlytics.CollectCustomKeys"

.field static final COLLECT_CUSTOM_LOGS:Ljava/lang/String; = "com.crashlytics.CollectCustomLogs"

.field static final CRASHLYTICS_API_ENDPOINT:Ljava/lang/String; = "com.crashlytics.ApiEndpoint"

.field static final CRASHLYTICS_REQUIRE_BUILD_ID:Ljava/lang/String; = "com.crashlytics.RequireBuildId"

.field static final CRASHLYTICS_REQUIRE_BUILD_ID_DEFAULT:Z = true

.field static final DEFAULT_MAIN_HANDLER_TIMEOUT_SEC:I = 0x4

.field private static final INITIALIZATION_MARKER_FILE_NAME:Ljava/lang/String; = "initialization_marker"

.field static final MAX_ATTRIBUTES:I = 0x40

.field static final MAX_ATTRIBUTE_SIZE:I = 0x400

.field private static final PREF_ALWAYS_SEND_REPORTS_KEY:Ljava/lang/String; = "always_send_reports_opt_in"

.field private static final SHOULD_PROMPT_BEFORE_SENDING_REPORTS_DEFAULT:Z = false

.field public static final TAG:Ljava/lang/String; = "Fabric"


# instance fields
.field private final attributes:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private buildId:Ljava/lang/String;

.field private delay:F

.field private disabled:Z

.field private executorServiceWrapper:Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;

.field private externalCrashEventDataProvider:Lcom/crashlytics/android/internal/CrashEventDataProvider;

.field private handler:Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

.field private httpRequestFactory:Lio/fabric/sdk/android/services/network/HttpRequestFactory;

.field private initializationMarkerFile:Ljava/io/File;

.field private installerPackageName:Ljava/lang/String;

.field private final kits:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lio/fabric/sdk/android/Kit",
            "<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field private listener:Lcom/crashlytics/android/CrashlyticsListener;

.field private packageName:Ljava/lang/String;

.field private final pinningInfo:Lcom/crashlytics/android/PinningInfoProvider;

.field private final startTime:J

.field private userEmail:Ljava/lang/String;

.field private userId:Ljava/lang/String;

.field private userName:Ljava/lang/String;

.field private versionCode:Ljava/lang/String;

.field private versionName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 202
    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    invoke-direct {p0, v0, v2, v2, v1}, Lcom/crashlytics/android/Crashlytics;-><init>(FLcom/crashlytics/android/CrashlyticsListener;Lcom/crashlytics/android/PinningInfoProvider;Z)V

    .line 203
    return-void
.end method

.method constructor <init>(FLcom/crashlytics/android/CrashlyticsListener;Lcom/crashlytics/android/PinningInfoProvider;Z)V
    .locals 6
    .param p1, "delay"    # F
    .param p2, "listener"    # Lcom/crashlytics/android/CrashlyticsListener;
    .param p3, "pinningInfo"    # Lcom/crashlytics/android/PinningInfoProvider;
    .param p4, "disabled"    # Z

    .prologue
    .line 207
    const-string v0, "Crashlytics Exception Handler"

    invoke-static {v0}, Lio/fabric/sdk/android/services/common/ExecutorUtils;->buildSingleThreadExecutorService(Ljava/lang/String;)Ljava/util/concurrent/ExecutorService;

    move-result-object v5

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/crashlytics/android/Crashlytics;-><init>(FLcom/crashlytics/android/CrashlyticsListener;Lcom/crashlytics/android/PinningInfoProvider;ZLjava/util/concurrent/ExecutorService;)V

    .line 209
    return-void
.end method

.method constructor <init>(FLcom/crashlytics/android/CrashlyticsListener;Lcom/crashlytics/android/PinningInfoProvider;ZLjava/util/concurrent/ExecutorService;)V
    .locals 3
    .param p1, "delay"    # F
    .param p2, "listener"    # Lcom/crashlytics/android/CrashlyticsListener;
    .param p3, "pinningInfo"    # Lcom/crashlytics/android/PinningInfoProvider;
    .param p4, "disabled"    # Z
    .param p5, "crashHandlerExecutor"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    const/4 v0, 0x0

    .line 216
    invoke-direct {p0}, Lio/fabric/sdk/android/Kit;-><init>()V

    .line 99
    iput-object v0, p0, Lcom/crashlytics/android/Crashlytics;->userId:Ljava/lang/String;

    .line 100
    iput-object v0, p0, Lcom/crashlytics/android/Crashlytics;->userEmail:Ljava/lang/String;

    .line 101
    iput-object v0, p0, Lcom/crashlytics/android/Crashlytics;->userName:Ljava/lang/String;

    .line 217
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/crashlytics/android/Crashlytics;->attributes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 218
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/crashlytics/android/Crashlytics;->startTime:J

    .line 219
    iput p1, p0, Lcom/crashlytics/android/Crashlytics;->delay:F

    .line 220
    iput-object p2, p0, Lcom/crashlytics/android/Crashlytics;->listener:Lcom/crashlytics/android/CrashlyticsListener;

    .line 221
    iput-object p3, p0, Lcom/crashlytics/android/Crashlytics;->pinningInfo:Lcom/crashlytics/android/PinningInfoProvider;

    .line 222
    iput-boolean p4, p0, Lcom/crashlytics/android/Crashlytics;->disabled:Z

    .line 223
    new-instance v0, Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;

    invoke-direct {v0, p5}, Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;-><init>(Ljava/util/concurrent/ExecutorService;)V

    iput-object v0, p0, Lcom/crashlytics/android/Crashlytics;->executorServiceWrapper:Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;

    .line 224
    const/4 v0, 0x2

    new-array v0, v0, [Lio/fabric/sdk/android/Kit;

    const/4 v1, 0x0

    new-instance v2, Lcom/crashlytics/android/answers/Answers;

    invoke-direct {v2}, Lcom/crashlytics/android/answers/Answers;-><init>()V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lcom/crashlytics/android/beta/Beta;

    invoke-direct {v2}, Lcom/crashlytics/android/beta/Beta;-><init>()V

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    iput-object v0, p0, Lcom/crashlytics/android/Crashlytics;->kits:Ljava/util/Collection;

    .line 225
    return-void
.end method

.method static synthetic access$000(Lcom/crashlytics/android/Crashlytics;)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lcom/crashlytics/android/Crashlytics;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/crashlytics/android/Crashlytics;->initializationMarkerFile:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$100(Lcom/crashlytics/android/Crashlytics;Landroid/app/Activity;Lio/fabric/sdk/android/services/settings/PromptSettingsData;)Z
    .locals 1
    .param p0, "x0"    # Lcom/crashlytics/android/Crashlytics;
    .param p1, "x1"    # Landroid/app/Activity;
    .param p2, "x2"    # Lio/fabric/sdk/android/services/settings/PromptSettingsData;

    .prologue
    .line 65
    invoke-direct {p0, p1, p2}, Lcom/crashlytics/android/Crashlytics;->getSendDecisionFromUser(Landroid/app/Activity;Lio/fabric/sdk/android/services/settings/PromptSettingsData;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/crashlytics/android/Crashlytics;FI)I
    .locals 1
    .param p0, "x0"    # Lcom/crashlytics/android/Crashlytics;
    .param p1, "x1"    # F
    .param p2, "x2"    # I

    .prologue
    .line 65
    invoke-direct {p0, p1, p2}, Lcom/crashlytics/android/Crashlytics;->dipsToPixels(FI)I

    move-result v0

    return v0
.end method

.method private dipsToPixels(FI)I
    .locals 1
    .param p1, "density"    # F
    .param p2, "dips"    # I

    .prologue
    .line 1112
    int-to-float v0, p2

    mul-float/2addr v0, p1

    float-to-int v0, v0

    return v0
.end method

.method private static doLog(ILjava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p0, "priority"    # I
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 473
    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->isDisabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 482
    :cond_0
    :goto_0
    return-void

    .line 477
    :cond_1
    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->getInstance()Lcom/crashlytics/android/Crashlytics;

    move-result-object v0

    .line 478
    .local v0, "instance":Lcom/crashlytics/android/Crashlytics;
    const-string v1, "prior to logging messages."

    invoke-static {v1, v0}, Lcom/crashlytics/android/Crashlytics;->ensureFabricWithCalled(Ljava/lang/String;Lcom/crashlytics/android/Crashlytics;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 479
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, v0, Lcom/crashlytics/android/Crashlytics;->startTime:J

    sub-long v2, v4, v6

    .line 480
    .local v2, "timestamp":J
    iget-object v1, v0, Lcom/crashlytics/android/Crashlytics;->handler:Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    invoke-static {p0, p1, p2}, Lcom/crashlytics/android/Crashlytics;->formatLogMessage(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeToLog(JLjava/lang/String;)V

    goto :goto_0
.end method

.method private static ensureFabricWithCalled(Ljava/lang/String;Lcom/crashlytics/android/Crashlytics;)Z
    .locals 4
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "instance"    # Lcom/crashlytics/android/Crashlytics;

    .prologue
    .line 1086
    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/crashlytics/android/Crashlytics;->handler:Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    if-nez v0, :cond_1

    .line 1087
    :cond_0
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "Fabric"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Crashlytics must be initialized by calling Fabric.with(Context) "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, v3}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1090
    const/4 v0, 0x0

    .line 1092
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private finishInitSynchronously()V
    .locals 8

    .prologue
    .line 719
    new-instance v0, Lcom/crashlytics/android/Crashlytics$1;

    invoke-direct {v0, p0}, Lcom/crashlytics/android/Crashlytics$1;-><init>(Lcom/crashlytics/android/Crashlytics;)V

    .line 731
    .local v0, "callable":Lio/fabric/sdk/android/services/concurrency/PriorityCallable;, "Lio/fabric/sdk/android/services/concurrency/PriorityCallable<Ljava/lang/Void;>;"
    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->getDependencies()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/fabric/sdk/android/services/concurrency/Task;

    .line 732
    .local v4, "task":Lio/fabric/sdk/android/services/concurrency/Task;
    invoke-virtual {v0, v4}, Lio/fabric/sdk/android/services/concurrency/PriorityCallable;->addDependency(Lio/fabric/sdk/android/services/concurrency/Task;)V

    goto :goto_0

    .line 735
    .end local v4    # "task":Lio/fabric/sdk/android/services/concurrency/Task;
    :cond_0
    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->getFabric()Lio/fabric/sdk/android/Fabric;

    move-result-object v5

    invoke-virtual {v5}, Lio/fabric/sdk/android/Fabric;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v5

    invoke-interface {v5, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v2

    .line 737
    .local v2, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Ljava/lang/Void;>;"
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v5

    const-string v6, "Fabric"

    const-string v7, "Crashlytics detected incomplete initialization on previous app launch. Will initialize synchronously."

    invoke-interface {v5, v6, v7}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 742
    const-wide/16 v6, 0x4

    :try_start_0
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v2, v6, v7, v5}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_2

    .line 750
    :goto_1
    return-void

    .line 743
    :catch_0
    move-exception v1

    .line 744
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v5

    const-string v6, "Fabric"

    const-string v7, "Crashlytics was interrupted during initialization."

    invoke-interface {v5, v6, v7, v1}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 745
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v1

    .line 746
    .local v1, "e":Ljava/util/concurrent/ExecutionException;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v5

    const-string v6, "Fabric"

    const-string v7, "Problem encountered during Crashlytics initialization."

    invoke-interface {v5, v6, v7, v1}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 747
    .end local v1    # "e":Ljava/util/concurrent/ExecutionException;
    :catch_2
    move-exception v1

    .line 748
    .local v1, "e":Ljava/util/concurrent/TimeoutException;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v5

    const-string v6, "Fabric"

    const-string v7, "Crashlytics timed out during initialization."

    invoke-interface {v5, v6, v7, v1}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private static formatLogMessage(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "priority"    # I
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 1082
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lio/fabric/sdk/android/services/common/CommonUtils;->logPriorityToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance()Lcom/crashlytics/android/Crashlytics;
    .locals 5

    .prologue
    .line 419
    :try_start_0
    const-class v1, Lcom/crashlytics/android/Crashlytics;

    invoke-static {v1}, Lio/fabric/sdk/android/Fabric;->getKit(Ljava/lang/Class;)Lio/fabric/sdk/android/Kit;

    move-result-object v1

    check-cast v1, Lcom/crashlytics/android/Crashlytics;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 420
    :catch_0
    move-exception v0

    .line 421
    .local v0, "ex":Ljava/lang/IllegalStateException;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const-string v2, "Fabric"

    const-string v3, "Crashlytics must be initialized by calling Fabric.with(Context) prior to calling Crashlytics.getInstance()"

    const/4 v4, 0x0

    invoke-interface {v1, v2, v3, v4}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 425
    throw v0
.end method

.method public static getPinningInfoProvider()Lcom/crashlytics/android/PinningInfoProvider;
    .locals 1

    .prologue
    .line 430
    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->isDisabled()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->getInstance()Lcom/crashlytics/android/Crashlytics;

    move-result-object v0

    iget-object v0, v0, Lcom/crashlytics/android/Crashlytics;->pinningInfo:Lcom/crashlytics/android/PinningInfoProvider;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getSendDecisionFromUser(Landroid/app/Activity;Lio/fabric/sdk/android/services/settings/PromptSettingsData;)Z
    .locals 6
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "promptData"    # Lio/fabric/sdk/android/services/settings/PromptSettingsData;

    .prologue
    .line 986
    new-instance v4, Lcom/crashlytics/android/DialogStringResolver;

    invoke-direct {v4, p1, p2}, Lcom/crashlytics/android/DialogStringResolver;-><init>(Landroid/content/Context;Lio/fabric/sdk/android/services/settings/PromptSettingsData;)V

    .line 990
    .local v4, "stringResolver":Lcom/crashlytics/android/DialogStringResolver;
    new-instance v3, Lcom/crashlytics/android/Crashlytics$OptInLatch;

    const/4 v0, 0x0

    invoke-direct {v3, p0, v0}, Lcom/crashlytics/android/Crashlytics$OptInLatch;-><init>(Lcom/crashlytics/android/Crashlytics;Lcom/crashlytics/android/Crashlytics$1;)V

    .line 992
    .local v3, "latch":Lcom/crashlytics/android/Crashlytics$OptInLatch;
    move-object v2, p1

    .line 994
    .local v2, "activity":Landroid/app/Activity;
    new-instance v0, Lcom/crashlytics/android/Crashlytics$7;

    move-object v1, p0

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/crashlytics/android/Crashlytics$7;-><init>(Lcom/crashlytics/android/Crashlytics;Landroid/app/Activity;Lcom/crashlytics/android/Crashlytics$OptInLatch;Lcom/crashlytics/android/DialogStringResolver;Lio/fabric/sdk/android/services/settings/PromptSettingsData;)V

    invoke-virtual {v2, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1059
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "Fabric"

    const-string v5, "Waiting for user opt-in."

    invoke-interface {v0, v1, v5}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1060
    invoke-virtual {v3}, Lcom/crashlytics/android/Crashlytics$OptInLatch;->await()V

    .line 1061
    invoke-virtual {v3}, Lcom/crashlytics/android/Crashlytics$OptInLatch;->getOptIn()Z

    move-result v0

    return v0
.end method

.method private static isDisabled()Z
    .locals 2

    .prologue
    .line 1107
    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->getInstance()Lcom/crashlytics/android/Crashlytics;

    move-result-object v0

    .line 1108
    .local v0, "instance":Lcom/crashlytics/android/Crashlytics;
    if-eqz v0, :cond_0

    iget-boolean v1, v0, Lcom/crashlytics/android/Crashlytics;->disabled:Z

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private isRequiringBuildId(Landroid/content/Context;)Z
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 1073
    const-string v0, "com.crashlytics.RequireBuildId"

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Lio/fabric/sdk/android/services/common/CommonUtils;->getBooleanResourceValue(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static log(ILjava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "priority"    # I
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 498
    invoke-static {p0, p1, p2}, Lcom/crashlytics/android/Crashlytics;->doLog(ILjava/lang/String;Ljava/lang/String;)V

    .line 501
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v0, p0, v1, v2, v3}, Lio/fabric/sdk/android/Logger;->log(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 502
    return-void
.end method

.method public static log(Ljava/lang/String;)V
    .locals 2
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 469
    const/4 v0, 0x3

    const-string v1, "Fabric"

    invoke-static {v0, v1, p0}, Lcom/crashlytics/android/Crashlytics;->doLog(ILjava/lang/String;Ljava/lang/String;)V

    .line 470
    return-void
.end method

.method public static logException(Ljava/lang/Throwable;)V
    .locals 5
    .param p0, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 442
    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->isDisabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 456
    :cond_0
    :goto_0
    return-void

    .line 446
    :cond_1
    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->getInstance()Lcom/crashlytics/android/Crashlytics;

    move-result-object v0

    .line 447
    .local v0, "instance":Lcom/crashlytics/android/Crashlytics;
    const-string v1, "prior to logging exceptions."

    invoke-static {v1, v0}, Lcom/crashlytics/android/Crashlytics;->ensureFabricWithCalled(Ljava/lang/String;Lcom/crashlytics/android/Crashlytics;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 448
    if-nez p0, :cond_2

    .line 449
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const/4 v2, 0x5

    const-string v3, "Fabric"

    const-string v4, "Crashlytics is ignoring a request to log a null exception."

    invoke-interface {v1, v2, v3, v4}, Lio/fabric/sdk/android/Logger;->log(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 454
    :cond_2
    iget-object v1, v0, Lcom/crashlytics/android/Crashlytics;->handler:Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v1, v2, p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeNonFatalException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method static recordFatalExceptionEvent(Ljava/lang/String;)V
    .locals 2
    .param p0, "sessionId"    # Ljava/lang/String;

    .prologue
    .line 771
    const-class v1, Lcom/crashlytics/android/answers/Answers;

    invoke-static {v1}, Lio/fabric/sdk/android/Fabric;->getKit(Ljava/lang/Class;)Lio/fabric/sdk/android/Kit;

    move-result-object v0

    check-cast v0, Lcom/crashlytics/android/answers/Answers;

    .line 772
    .local v0, "answers":Lcom/crashlytics/android/answers/Answers;
    if-eqz v0, :cond_0

    .line 773
    new-instance v1, Lio/fabric/sdk/android/services/common/Crash$FatalException;

    invoke-direct {v1, p0}, Lio/fabric/sdk/android/services/common/Crash$FatalException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/crashlytics/android/answers/Answers;->onException(Lio/fabric/sdk/android/services/common/Crash$FatalException;)V

    .line 776
    :cond_0
    return-void
.end method

.method static recordLoggedExceptionEvent(Ljava/lang/String;)V
    .locals 2
    .param p0, "sessionId"    # Ljava/lang/String;

    .prologue
    .line 760
    const-class v1, Lcom/crashlytics/android/answers/Answers;

    invoke-static {v1}, Lio/fabric/sdk/android/Fabric;->getKit(Ljava/lang/Class;)Lio/fabric/sdk/android/Kit;

    move-result-object v0

    check-cast v0, Lcom/crashlytics/android/answers/Answers;

    .line 761
    .local v0, "answers":Lcom/crashlytics/android/answers/Answers;
    if-eqz v0, :cond_0

    .line 762
    new-instance v1, Lio/fabric/sdk/android/services/common/Crash$LoggedException;

    invoke-direct {v1, p0}, Lio/fabric/sdk/android/services/common/Crash$LoggedException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/crashlytics/android/answers/Answers;->onException(Lio/fabric/sdk/android/services/common/Crash$LoggedException;)V

    .line 765
    :cond_0
    return-void
.end method

.method private static sanitizeAttribute(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    const/16 v1, 0x400

    .line 1097
    if-eqz p0, :cond_0

    .line 1098
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 1099
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_0

    .line 1100
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 1103
    :cond_0
    return-object p0
.end method

.method private setAndValidateKitProperties(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "apiKey"    # Ljava/lang/String;

    .prologue
    .line 308
    iget-object v4, p0, Lcom/crashlytics/android/Crashlytics;->pinningInfo:Lcom/crashlytics/android/PinningInfoProvider;

    if-eqz v4, :cond_0

    new-instance v1, Lcom/crashlytics/android/CrashlyticsPinningInfoProvider;

    iget-object v4, p0, Lcom/crashlytics/android/Crashlytics;->pinningInfo:Lcom/crashlytics/android/PinningInfoProvider;

    invoke-direct {v1, v4}, Lcom/crashlytics/android/CrashlyticsPinningInfoProvider;-><init>(Lcom/crashlytics/android/PinningInfoProvider;)V

    .line 310
    .local v1, "infoProvider":Lcom/crashlytics/android/CrashlyticsPinningInfoProvider;
    :goto_0
    new-instance v4, Lio/fabric/sdk/android/services/network/DefaultHttpRequestFactory;

    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v5

    invoke-direct {v4, v5}, Lio/fabric/sdk/android/services/network/DefaultHttpRequestFactory;-><init>(Lio/fabric/sdk/android/Logger;)V

    iput-object v4, p0, Lcom/crashlytics/android/Crashlytics;->httpRequestFactory:Lio/fabric/sdk/android/services/network/HttpRequestFactory;

    .line 311
    iget-object v4, p0, Lcom/crashlytics/android/Crashlytics;->httpRequestFactory:Lio/fabric/sdk/android/services/network/HttpRequestFactory;

    invoke-interface {v4, v1}, Lio/fabric/sdk/android/services/network/HttpRequestFactory;->setPinningInfoProvider(Lio/fabric/sdk/android/services/network/PinningInfoProvider;)V

    .line 314
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/crashlytics/android/Crashlytics;->packageName:Ljava/lang/String;

    .line 315
    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->getIdManager()Lio/fabric/sdk/android/services/common/IdManager;

    move-result-object v4

    invoke-virtual {v4}, Lio/fabric/sdk/android/services/common/IdManager;->getInstallerPackageName()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/crashlytics/android/Crashlytics;->installerPackageName:Ljava/lang/String;

    .line 316
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v4

    const-string v5, "Fabric"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Installer package name is: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/crashlytics/android/Crashlytics;->installerPackageName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 320
    .local v3, "packageManager":Landroid/content/pm/PackageManager;
    iget-object v4, p0, Lcom/crashlytics/android/Crashlytics;->packageName:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 321
    .local v2, "packageInfo":Landroid/content/pm/PackageInfo;
    iget v4, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/crashlytics/android/Crashlytics;->versionCode:Ljava/lang/String;

    .line 322
    iget-object v4, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    if-nez v4, :cond_1

    const-string v4, "0.0"

    :goto_1
    iput-object v4, p0, Lcom/crashlytics/android/Crashlytics;->versionName:Ljava/lang/String;

    .line 327
    invoke-static {p1}, Lio/fabric/sdk/android/services/common/CommonUtils;->resolveBuildId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/crashlytics/android/Crashlytics;->buildId:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 335
    .end local v2    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v3    # "packageManager":Landroid/content/pm/PackageManager;
    :goto_2
    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->getIdManager()Lio/fabric/sdk/android/services/common/IdManager;

    move-result-object v4

    invoke-virtual {v4}, Lio/fabric/sdk/android/services/common/IdManager;->getBluetoothMacAddress()Ljava/lang/String;

    .line 339
    iget-object v4, p0, Lcom/crashlytics/android/Crashlytics;->buildId:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/crashlytics/android/Crashlytics;->isRequiringBuildId(Landroid/content/Context;)Z

    move-result v5

    invoke-virtual {p0, v4, v5}, Lcom/crashlytics/android/Crashlytics;->getBuildIdValidator(Ljava/lang/String;Z)Lcom/crashlytics/android/BuildIdValidator;

    move-result-object v4

    iget-object v5, p0, Lcom/crashlytics/android/Crashlytics;->packageName:Ljava/lang/String;

    invoke-virtual {v4, p2, v5}, Lcom/crashlytics/android/BuildIdValidator;->validate(Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    return-void

    .line 308
    .end local v1    # "infoProvider":Lcom/crashlytics/android/CrashlyticsPinningInfoProvider;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 322
    .restart local v1    # "infoProvider":Lcom/crashlytics/android/CrashlyticsPinningInfoProvider;
    .restart local v2    # "packageInfo":Landroid/content/pm/PackageInfo;
    .restart local v3    # "packageManager":Landroid/content/pm/PackageManager;
    :cond_1
    :try_start_1
    iget-object v4, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 329
    .end local v2    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v3    # "packageManager":Landroid/content/pm/PackageManager;
    :catch_0
    move-exception v0

    .line 330
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v4

    const-string v5, "Fabric"

    const-string v6, "Error setting up app properties"

    invoke-interface {v4, v5, v6, v0}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2
.end method

.method public static setBool(Ljava/lang/String;Z)V
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Z

    .prologue
    .line 604
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/crashlytics/android/Crashlytics;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 605
    return-void
.end method

.method public static setDouble(Ljava/lang/String;D)V
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # D

    .prologue
    .line 613
    invoke-static {p1, p2}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/crashlytics/android/Crashlytics;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 614
    return-void
.end method

.method public static setFloat(Ljava/lang/String;F)V
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # F

    .prologue
    .line 622
    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/crashlytics/android/Crashlytics;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 623
    return-void
.end method

.method public static setInt(Ljava/lang/String;I)V
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # I

    .prologue
    .line 631
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/crashlytics/android/Crashlytics;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 632
    return-void
.end method

.method public static setLong(Ljava/lang/String;J)V
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # J

    .prologue
    .line 640
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/crashlytics/android/Crashlytics;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 641
    return-void
.end method

.method public static setPinningInfoProvider(Lcom/crashlytics/android/PinningInfoProvider;)V
    .locals 3
    .param p0, "pinningInfo"    # Lcom/crashlytics/android/PinningInfoProvider;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 710
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "Fabric"

    const-string v2, "Use of Crashlytics.setPinningInfoProvider is deprecated"

    invoke-interface {v0, v1, v2}, Lio/fabric/sdk/android/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 711
    return-void
.end method

.method public static setString(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 568
    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->isDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 596
    :goto_0
    return-void

    .line 572
    :cond_0
    if-nez p0, :cond_2

    .line 573
    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->getInstance()Lcom/crashlytics/android/Crashlytics;

    move-result-object v0

    invoke-virtual {v0}, Lcom/crashlytics/android/Crashlytics;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->getInstance()Lcom/crashlytics/android/Crashlytics;

    move-result-object v0

    invoke-virtual {v0}, Lcom/crashlytics/android/Crashlytics;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->isAppDebuggable(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 575
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Custom attribute key must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 577
    :cond_1
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "Fabric"

    const-string v2, "Attempting to set custom attribute with null key, ignoring."

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, v3}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 582
    :cond_2
    invoke-static {p0}, Lcom/crashlytics/android/Crashlytics;->sanitizeAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 583
    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->getInstance()Lcom/crashlytics/android/Crashlytics;

    move-result-object v0

    iget-object v0, v0, Lcom/crashlytics/android/Crashlytics;->attributes:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v0

    const/16 v1, 0x40

    if-lt v0, v1, :cond_3

    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->getInstance()Lcom/crashlytics/android/Crashlytics;

    move-result-object v0

    iget-object v0, v0, Lcom/crashlytics/android/Crashlytics;->attributes:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 586
    :cond_3
    if-nez p1, :cond_4

    .line 587
    const-string p1, ""

    .line 591
    :goto_1
    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->getInstance()Lcom/crashlytics/android/Crashlytics;

    move-result-object v0

    iget-object v0, v0, Lcom/crashlytics/android/Crashlytics;->attributes:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 589
    :cond_4
    invoke-static {p1}, Lcom/crashlytics/android/Crashlytics;->sanitizeAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 593
    :cond_5
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "Fabric"

    const-string v2, "Exceeded maximum number of custom attributes (64)"

    invoke-interface {v0, v1, v2}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static setUserEmail(Ljava/lang/String;)V
    .locals 2
    .param p0, "email"    # Ljava/lang/String;

    .prologue
    .line 552
    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->isDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 557
    :goto_0
    return-void

    .line 556
    :cond_0
    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->getInstance()Lcom/crashlytics/android/Crashlytics;

    move-result-object v0

    invoke-static {p0}, Lcom/crashlytics/android/Crashlytics;->sanitizeAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/crashlytics/android/Crashlytics;->userEmail:Ljava/lang/String;

    goto :goto_0
.end method

.method public static setUserIdentifier(Ljava/lang/String;)V
    .locals 2
    .param p0, "identifier"    # Ljava/lang/String;

    .prologue
    .line 526
    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->isDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 531
    :goto_0
    return-void

    .line 530
    :cond_0
    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->getInstance()Lcom/crashlytics/android/Crashlytics;

    move-result-object v0

    invoke-static {p0}, Lcom/crashlytics/android/Crashlytics;->sanitizeAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/crashlytics/android/Crashlytics;->userId:Ljava/lang/String;

    goto :goto_0
.end method

.method public static setUserName(Ljava/lang/String;)V
    .locals 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 539
    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->isDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 544
    :goto_0
    return-void

    .line 543
    :cond_0
    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->getInstance()Lcom/crashlytics/android/Crashlytics;

    move-result-object v0

    invoke-static {p0}, Lcom/crashlytics/android/Crashlytics;->sanitizeAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/crashlytics/android/Crashlytics;->userName:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method canSendWithUserApproval()Z
    .locals 3

    .prologue
    .line 955
    invoke-static {}, Lio/fabric/sdk/android/services/settings/Settings;->getInstance()Lio/fabric/sdk/android/services/settings/Settings;

    move-result-object v0

    new-instance v1, Lcom/crashlytics/android/Crashlytics$6;

    invoke-direct {v1, p0}, Lcom/crashlytics/android/Crashlytics$6;-><init>(Lcom/crashlytics/android/Crashlytics;)V

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lio/fabric/sdk/android/services/settings/Settings;->withSettings(Lio/fabric/sdk/android/services/settings/Settings$SettingsAccess;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public crash()V
    .locals 1

    .prologue
    .line 651
    new-instance v0, Lcom/crashlytics/android/CrashTest;

    invoke-direct {v0}, Lcom/crashlytics/android/CrashTest;-><init>()V

    invoke-virtual {v0}, Lcom/crashlytics/android/CrashTest;->indexOutOfBounds()V

    .line 652
    return-void
.end method

.method didPreviousInitializationComplete()Z
    .locals 2

    .prologue
    .line 880
    iget-object v0, p0, Lcom/crashlytics/android/Crashlytics;->executorServiceWrapper:Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;

    new-instance v1, Lcom/crashlytics/android/Crashlytics$4;

    invoke-direct {v1, p0}, Lcom/crashlytics/android/Crashlytics$4;-><init>(Lcom/crashlytics/android/Crashlytics;)V

    invoke-virtual {v0, v1}, Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;->executeSyncLoggingException(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method protected bridge synthetic doInBackground()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 63
    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->doInBackground()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected doInBackground()Ljava/lang/Void;
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 345
    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->markInitializationStarted()V

    .line 346
    iget-object v4, p0, Lcom/crashlytics/android/Crashlytics;->handler:Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    invoke-virtual {v4}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->cleanInvalidTempFiles()V

    .line 349
    const/4 v2, 0x1

    .line 352
    .local v2, "reportingDisabled":Z
    :try_start_0
    invoke-static {}, Lio/fabric/sdk/android/services/settings/Settings;->getInstance()Lio/fabric/sdk/android/services/settings/Settings;

    move-result-object v4

    invoke-virtual {v4}, Lio/fabric/sdk/android/services/settings/Settings;->awaitSettingsData()Lio/fabric/sdk/android/services/settings/SettingsData;

    move-result-object v3

    .line 354
    .local v3, "settingsData":Lio/fabric/sdk/android/services/settings/SettingsData;
    if-nez v3, :cond_0

    .line 355
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v4

    const-string v5, "Fabric"

    const-string v6, "Received null settings, skipping initialization!"

    invoke-interface {v4, v5, v6}, Lio/fabric/sdk/android/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 389
    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->markInitializationComplete()V

    .line 392
    .end local v3    # "settingsData":Lio/fabric/sdk/android/services/settings/SettingsData;
    :goto_0
    return-object v7

    .line 359
    .restart local v3    # "settingsData":Lio/fabric/sdk/android/services/settings/SettingsData;
    :cond_0
    :try_start_1
    iget-object v4, v3, Lio/fabric/sdk/android/services/settings/SettingsData;->featuresData:Lio/fabric/sdk/android/services/settings/FeaturesSettingsData;

    iget-boolean v4, v4, Lio/fabric/sdk/android/services/settings/FeaturesSettingsData;->collectReports:Z

    if-eqz v4, :cond_1

    .line 360
    const/4 v2, 0x0

    .line 361
    iget-object v4, p0, Lcom/crashlytics/android/Crashlytics;->handler:Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    invoke-virtual {v4}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->finalizeSessions()Z

    .line 363
    invoke-virtual {p0, v3}, Lcom/crashlytics/android/Crashlytics;->getCreateReportSpiCall(Lio/fabric/sdk/android/services/settings/SettingsData;)Lcom/crashlytics/android/CreateReportSpiCall;

    move-result-object v0

    .line 364
    .local v0, "call":Lcom/crashlytics/android/CreateReportSpiCall;
    if-eqz v0, :cond_3

    .line 365
    new-instance v4, Lcom/crashlytics/android/ReportUploader;

    invoke-direct {v4, v0}, Lcom/crashlytics/android/ReportUploader;-><init>(Lcom/crashlytics/android/CreateReportSpiCall;)V

    iget v5, p0, Lcom/crashlytics/android/Crashlytics;->delay:F

    invoke-virtual {v4, v5}, Lcom/crashlytics/android/ReportUploader;->uploadReports(F)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 374
    .end local v0    # "call":Lcom/crashlytics/android/CreateReportSpiCall;
    .end local v3    # "settingsData":Lio/fabric/sdk/android/services/settings/SettingsData;
    :cond_1
    :goto_1
    if-eqz v2, :cond_2

    .line 375
    :try_start_2
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v4

    const-string v5, "Fabric"

    const-string v6, "Crash reporting disabled."

    invoke-interface {v4, v5, v6}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 389
    :cond_2
    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->markInitializationComplete()V

    goto :goto_0

    .line 367
    .restart local v0    # "call":Lcom/crashlytics/android/CreateReportSpiCall;
    .restart local v3    # "settingsData":Lio/fabric/sdk/android/services/settings/SettingsData;
    :cond_3
    :try_start_3
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v4

    const-string v5, "Fabric"

    const-string v6, "Unable to create a call to upload reports."

    invoke-interface {v4, v5, v6}, Lio/fabric/sdk/android/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 370
    .end local v0    # "call":Lcom/crashlytics/android/CreateReportSpiCall;
    .end local v3    # "settingsData":Lio/fabric/sdk/android/services/settings/SettingsData;
    :catch_0
    move-exception v1

    .line 371
    .local v1, "e":Ljava/lang/Exception;
    :try_start_4
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v4

    const-string v5, "Fabric"

    const-string v6, "Error dealing with settings"

    invoke-interface {v4, v5, v6, v1}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 377
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v1

    .line 378
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_5
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v4

    const-string v5, "Fabric"

    const-string v6, "Problem encountered during Crashlytics initialization."

    invoke-interface {v4, v5, v6, v1}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 389
    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->markInitializationComplete()V

    goto :goto_0

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->markInitializationComplete()V

    throw v4
.end method

.method getAttributes()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 784
    iget-object v0, p0, Lcom/crashlytics/android/Crashlytics;->attributes:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method getBuildId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 819
    iget-object v0, p0, Lcom/crashlytics/android/Crashlytics;->buildId:Ljava/lang/String;

    return-object v0
.end method

.method getBuildIdValidator(Ljava/lang/String;Z)Lcom/crashlytics/android/BuildIdValidator;
    .locals 1
    .param p1, "buildId"    # Ljava/lang/String;
    .param p2, "requireBuildId"    # Z

    .prologue
    .line 788
    new-instance v0, Lcom/crashlytics/android/BuildIdValidator;

    invoke-direct {v0, p1, p2}, Lcom/crashlytics/android/BuildIdValidator;-><init>(Ljava/lang/String;Z)V

    return-object v0
.end method

.method getCreateReportSpiCall(Lio/fabric/sdk/android/services/settings/SettingsData;)Lcom/crashlytics/android/CreateReportSpiCall;
    .locals 4
    .param p1, "settingsData"    # Lio/fabric/sdk/android/services/settings/SettingsData;

    .prologue
    .line 976
    if-eqz p1, :cond_0

    .line 977
    new-instance v0, Lcom/crashlytics/android/DefaultCreateReportSpiCall;

    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->getOverridenSpiEndpoint()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lio/fabric/sdk/android/services/settings/SettingsData;->appData:Lio/fabric/sdk/android/services/settings/AppSettingsData;

    iget-object v2, v2, Lio/fabric/sdk/android/services/settings/AppSettingsData;->reportsUrl:Ljava/lang/String;

    iget-object v3, p0, Lcom/crashlytics/android/Crashlytics;->httpRequestFactory:Lio/fabric/sdk/android/services/network/HttpRequestFactory;

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/crashlytics/android/DefaultCreateReportSpiCall;-><init>(Lio/fabric/sdk/android/Kit;Ljava/lang/String;Ljava/lang/String;Lio/fabric/sdk/android/services/network/HttpRequestFactory;)V

    .line 981
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDebugMode()Z
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 700
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "Fabric"

    const-string v2, "Use of Crashlytics.getDebugMode is deprecated."

    invoke-interface {v0, v1, v2}, Lio/fabric/sdk/android/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 701
    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->getFabric()Lio/fabric/sdk/android/Fabric;

    invoke-static {}, Lio/fabric/sdk/android/Fabric;->isDebuggable()Z

    move-result v0

    return v0
.end method

.method getExternalCrashEventData()Lcom/crashlytics/android/internal/models/SessionEventData;
    .locals 2

    .prologue
    .line 901
    const/4 v0, 0x0

    .line 902
    .local v0, "eventData":Lcom/crashlytics/android/internal/models/SessionEventData;
    iget-object v1, p0, Lcom/crashlytics/android/Crashlytics;->externalCrashEventDataProvider:Lcom/crashlytics/android/internal/CrashEventDataProvider;

    if-eqz v1, :cond_0

    .line 903
    iget-object v1, p0, Lcom/crashlytics/android/Crashlytics;->externalCrashEventDataProvider:Lcom/crashlytics/android/internal/CrashEventDataProvider;

    invoke-interface {v1}, Lcom/crashlytics/android/internal/CrashEventDataProvider;->getCrashEventData()Lcom/crashlytics/android/internal/models/SessionEventData;

    move-result-object v0

    .line 905
    :cond_0
    return-object v0
.end method

.method getHandler()Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;
    .locals 1

    .prologue
    .line 823
    iget-object v0, p0, Lcom/crashlytics/android/Crashlytics;->handler:Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    return-object v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 397
    const-string v0, "com.crashlytics.sdk.android:crashlytics"

    return-object v0
.end method

.method getInstallerPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 802
    iget-object v0, p0, Lcom/crashlytics/android/Crashlytics;->installerPackageName:Ljava/lang/String;

    return-object v0
.end method

.method public getKits()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<+",
            "Lio/fabric/sdk/android/Kit;",
            ">;"
        }
    .end annotation

    .prologue
    .line 407
    iget-object v0, p0, Lcom/crashlytics/android/Crashlytics;->kits:Ljava/util/Collection;

    return-object v0
.end method

.method getOverridenSpiEndpoint()Ljava/lang/String;
    .locals 2

    .prologue
    .line 814
    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->getInstance()Lcom/crashlytics/android/Crashlytics;

    move-result-object v0

    invoke-virtual {v0}, Lcom/crashlytics/android/Crashlytics;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "com.crashlytics.ApiEndpoint"

    invoke-static {v0, v1}, Lio/fabric/sdk/android/services/common/CommonUtils;->getStringsFileValue(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 792
    iget-object v0, p0, Lcom/crashlytics/android/Crashlytics;->packageName:Ljava/lang/String;

    return-object v0
.end method

.method getSdkDirectory()Ljava/io/File;
    .locals 1

    .prologue
    .line 927
    new-instance v0, Lio/fabric/sdk/android/services/persistence/FileStoreImpl;

    invoke-direct {v0, p0}, Lio/fabric/sdk/android/services/persistence/FileStoreImpl;-><init>(Lio/fabric/sdk/android/Kit;)V

    invoke-virtual {v0}, Lio/fabric/sdk/android/services/persistence/FileStoreImpl;->getFilesDir()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method getSessionSettingsData()Lio/fabric/sdk/android/services/settings/SessionSettingsData;
    .locals 2

    .prologue
    .line 1068
    invoke-static {}, Lio/fabric/sdk/android/services/settings/Settings;->getInstance()Lio/fabric/sdk/android/services/settings/Settings;

    move-result-object v1

    invoke-virtual {v1}, Lio/fabric/sdk/android/services/settings/Settings;->awaitSettingsData()Lio/fabric/sdk/android/services/settings/SettingsData;

    move-result-object v0

    .line 1069
    .local v0, "settingsData":Lio/fabric/sdk/android/services/settings/SettingsData;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    iget-object v1, v0, Lio/fabric/sdk/android/services/settings/SettingsData;->sessionData:Lio/fabric/sdk/android/services/settings/SessionSettingsData;

    goto :goto_0
.end method

.method getUserEmail()Ljava/lang/String;
    .locals 1

    .prologue
    .line 831
    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->getIdManager()Lio/fabric/sdk/android/services/common/IdManager;

    move-result-object v0

    invoke-virtual {v0}, Lio/fabric/sdk/android/services/common/IdManager;->canCollectUserIds()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/crashlytics/android/Crashlytics;->userEmail:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getUserIdentifier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 827
    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->getIdManager()Lio/fabric/sdk/android/services/common/IdManager;

    move-result-object v0

    invoke-virtual {v0}, Lio/fabric/sdk/android/services/common/IdManager;->canCollectUserIds()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/crashlytics/android/Crashlytics;->userId:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getUserName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 835
    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->getIdManager()Lio/fabric/sdk/android/services/common/IdManager;

    move-result-object v0

    invoke-virtual {v0}, Lio/fabric/sdk/android/services/common/IdManager;->canCollectUserIds()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/crashlytics/android/Crashlytics;->userName:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 402
    const-string v0, "2.2.2.37"

    return-object v0
.end method

.method getVersionCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 810
    iget-object v0, p0, Lcom/crashlytics/android/Crashlytics;->versionCode:Ljava/lang/String;

    return-object v0
.end method

.method getVersionName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 806
    iget-object v0, p0, Lcom/crashlytics/android/Crashlytics;->versionName:Ljava/lang/String;

    return-object v0
.end method

.method internalVerifyPinning(Ljava/net/URL;)Z
    .locals 6
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    const/4 v2, 0x0

    .line 913
    invoke-static {}, Lcom/crashlytics/android/Crashlytics;->getPinningInfoProvider()Lcom/crashlytics/android/PinningInfoProvider;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 914
    iget-object v3, p0, Lcom/crashlytics/android/Crashlytics;->httpRequestFactory:Lio/fabric/sdk/android/services/network/HttpRequestFactory;

    sget-object v4, Lio/fabric/sdk/android/services/network/HttpMethod;->GET:Lio/fabric/sdk/android/services/network/HttpMethod;

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lio/fabric/sdk/android/services/network/HttpRequestFactory;->buildHttpRequest(Lio/fabric/sdk/android/services/network/HttpMethod;Ljava/lang/String;)Lio/fabric/sdk/android/services/network/HttpRequest;

    move-result-object v1

    .line 916
    .local v1, "httpRequest":Lio/fabric/sdk/android/services/network/HttpRequest;
    invoke-virtual {v1}, Lio/fabric/sdk/android/services/network/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    .line 917
    .local v0, "conn":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual {v0, v2}, Ljavax/net/ssl/HttpsURLConnection;->setInstanceFollowRedirects(Z)V

    .line 920
    invoke-virtual {v1}, Lio/fabric/sdk/android/services/network/HttpRequest;->code()I

    .line 921
    const/4 v2, 0x1

    .line 923
    .end local v0    # "conn":Ljavax/net/ssl/HttpsURLConnection;
    .end local v1    # "httpRequest":Lio/fabric/sdk/android/services/network/HttpRequest;
    :cond_0
    return v2
.end method

.method markInitializationComplete()V
    .locals 2

    .prologue
    .line 862
    iget-object v0, p0, Lcom/crashlytics/android/Crashlytics;->executorServiceWrapper:Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;

    new-instance v1, Lcom/crashlytics/android/Crashlytics$3;

    invoke-direct {v1, p0}, Lcom/crashlytics/android/Crashlytics$3;-><init>(Lcom/crashlytics/android/Crashlytics;)V

    invoke-virtual {v0, v1}, Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;->executeAsync(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 877
    return-void
.end method

.method markInitializationStarted()V
    .locals 2

    .prologue
    .line 846
    iget-object v0, p0, Lcom/crashlytics/android/Crashlytics;->executorServiceWrapper:Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;

    new-instance v1, Lcom/crashlytics/android/Crashlytics$2;

    invoke-direct {v1, p0}, Lcom/crashlytics/android/Crashlytics$2;-><init>(Lcom/crashlytics/android/Crashlytics;)V

    invoke-virtual {v0, v1}, Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;->executeSyncLoggingException(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 856
    return-void
.end method

.method protected onPreExecute()Z
    .locals 2

    .prologue
    .line 233
    invoke-super {p0}, Lio/fabric/sdk/android/Kit;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 234
    .local v0, "context":Landroid/content/Context;
    invoke-virtual {p0, v0}, Lcom/crashlytics/android/Crashlytics;->onPreExecute(Landroid/content/Context;)Z

    move-result v1

    return v1
.end method

.method onPreExecute(Landroid/content/Context;)Z
    .locals 11
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v10, 0x0

    .line 241
    iget-boolean v0, p0, Lcom/crashlytics/android/Crashlytics;->disabled:Z

    if-eqz v0, :cond_0

    move v0, v10

    .line 304
    :goto_0
    return v0

    .line 246
    :cond_0
    new-instance v0, Lio/fabric/sdk/android/services/common/ApiKey;

    invoke-direct {v0}, Lio/fabric/sdk/android/services/common/ApiKey;-><init>()V

    invoke-virtual {v0, p1}, Lio/fabric/sdk/android/services/common/ApiKey;->getValue(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    .line 248
    .local v7, "apiKey":Ljava/lang/String;
    if-nez v7, :cond_1

    move v0, v10

    .line 249
    goto :goto_0

    .line 252
    :cond_1
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "Fabric"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Initializing Crashlytics "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->getVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lio/fabric/sdk/android/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->getSdkDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "initialization_marker"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/crashlytics/android/Crashlytics;->initializationMarkerFile:Ljava/io/File;

    .line 256
    const/4 v9, 0x0

    .line 258
    .local v9, "initializeSynchronously":Z
    :try_start_0
    invoke-direct {p0, p1, v7}, Lcom/crashlytics/android/Crashlytics;->setAndValidateKitProperties(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/crashlytics/android/CrashlyticsMissingDependencyException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 261
    :try_start_1
    new-instance v5, Lcom/crashlytics/android/SessionDataWriter;

    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/crashlytics/android/Crashlytics;->buildId:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v5, v0, v1, v2}, Lcom/crashlytics/android/SessionDataWriter;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    .local v5, "sessionDataWriter":Lcom/crashlytics/android/SessionDataWriter;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "Fabric"

    const-string v2, "Installing exception handler..."

    invoke-interface {v0, v1, v2}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    new-instance v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v1

    iget-object v2, p0, Lcom/crashlytics/android/Crashlytics;->listener:Lcom/crashlytics/android/CrashlyticsListener;

    iget-object v3, p0, Lcom/crashlytics/android/Crashlytics;->executorServiceWrapper:Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;

    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->getIdManager()Lio/fabric/sdk/android/services/common/IdManager;

    move-result-object v4

    move-object v6, p0

    invoke-direct/range {v0 .. v6}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;-><init>(Ljava/lang/Thread$UncaughtExceptionHandler;Lcom/crashlytics/android/CrashlyticsListener;Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;Lio/fabric/sdk/android/services/common/IdManager;Lcom/crashlytics/android/SessionDataWriter;Lcom/crashlytics/android/Crashlytics;)V

    iput-object v0, p0, Lcom/crashlytics/android/Crashlytics;->handler:Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    .line 275
    invoke-virtual {p0}, Lcom/crashlytics/android/Crashlytics;->didPreviousInitializationComplete()Z

    move-result v9

    .line 280
    iget-object v0, p0, Lcom/crashlytics/android/Crashlytics;->handler:Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    invoke-virtual {v0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->ensureOpenSessionExists()V

    .line 282
    iget-object v0, p0, Lcom/crashlytics/android/Crashlytics;->handler:Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    invoke-static {v0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 283
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "Fabric"

    const-string v2, "Successfully installed exception handler."

    invoke-interface {v0, v1, v2}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lcom/crashlytics/android/CrashlyticsMissingDependencyException; {:try_start_1 .. :try_end_1} :catch_1

    .line 289
    .end local v5    # "sessionDataWriter":Lcom/crashlytics/android/SessionDataWriter;
    :goto_1
    if-eqz v9, :cond_2

    :try_start_2
    invoke-static {p1}, Lio/fabric/sdk/android/services/common/CommonUtils;->canTryConnection(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 292
    invoke-direct {p0}, Lcom/crashlytics/android/Crashlytics;->finishInitSynchronously()V

    move v0, v10

    .line 294
    goto/16 :goto_0

    .line 284
    :catch_0
    move-exception v8

    .line 285
    .local v8, "e":Ljava/lang/Exception;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "Fabric"

    const-string v2, "There was a problem installing the exception handler."

    invoke-interface {v0, v1, v2, v8}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Lcom/crashlytics/android/CrashlyticsMissingDependencyException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    .line 297
    .end local v8    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v8

    .line 299
    .local v8, "e":Lcom/crashlytics/android/CrashlyticsMissingDependencyException;
    new-instance v0, Lio/fabric/sdk/android/services/concurrency/UnmetDependencyException;

    invoke-direct {v0, v8}, Lio/fabric/sdk/android/services/concurrency/UnmetDependencyException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 296
    .end local v8    # "e":Lcom/crashlytics/android/CrashlyticsMissingDependencyException;
    :cond_2
    const/4 v0, 0x1

    goto/16 :goto_0

    .line 300
    :catch_2
    move-exception v8

    .line 301
    .local v8, "e":Ljava/lang/Exception;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "Fabric"

    const-string v2, "Crashlytics was not started due to an exception during initialization"

    invoke-interface {v0, v1, v2, v8}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move v0, v10

    .line 304
    goto/16 :goto_0
.end method

.method public setDebugMode(Z)V
    .locals 3
    .param p1, "debug"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 692
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "Fabric"

    const-string v2, "Use of Crashlytics.setDebugMode is deprecated."

    invoke-interface {v0, v1, v2}, Lio/fabric/sdk/android/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 693
    return-void
.end method

.method setExternalCrashEventDataProvider(Lcom/crashlytics/android/internal/CrashEventDataProvider;)V
    .locals 0
    .param p1, "provider"    # Lcom/crashlytics/android/internal/CrashEventDataProvider;

    .prologue
    .line 893
    iput-object p1, p0, Lcom/crashlytics/android/Crashlytics;->externalCrashEventDataProvider:Lcom/crashlytics/android/internal/CrashEventDataProvider;

    .line 894
    return-void
.end method

.method public declared-synchronized setListener(Lcom/crashlytics/android/CrashlyticsListener;)V
    .locals 3
    .param p1, "listener"    # Lcom/crashlytics/android/CrashlyticsListener;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 680
    monitor-enter p0

    :try_start_0
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "Fabric"

    const-string v2, "Use of Crashlytics.setListener is deprecated."

    invoke-interface {v0, v1, v2}, Lio/fabric/sdk/android/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 681
    if-nez p1, :cond_0

    .line 682
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "listener must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 680
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 684
    :cond_0
    :try_start_1
    iput-object p1, p0, Lcom/crashlytics/android/Crashlytics;->listener:Lcom/crashlytics/android/CrashlyticsListener;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 685
    monitor-exit p0

    return-void
.end method

.method setShouldSendUserReportsWithoutPrompting(Z)V
    .locals 3
    .param p1, "send"    # Z
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CommitPrefEdits"
        }
    .end annotation

    .prologue
    .line 950
    new-instance v0, Lio/fabric/sdk/android/services/persistence/PreferenceStoreImpl;

    invoke-direct {v0, p0}, Lio/fabric/sdk/android/services/persistence/PreferenceStoreImpl;-><init>(Lio/fabric/sdk/android/Kit;)V

    .line 951
    .local v0, "prefStore":Lio/fabric/sdk/android/services/persistence/PreferenceStore;
    invoke-interface {v0}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "always_send_reports_opt_in"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->save(Landroid/content/SharedPreferences$Editor;)Z

    .line 952
    return-void
.end method

.method shouldPromptUserBeforeSendingCrashReports()Z
    .locals 3

    .prologue
    .line 931
    invoke-static {}, Lio/fabric/sdk/android/services/settings/Settings;->getInstance()Lio/fabric/sdk/android/services/settings/Settings;

    move-result-object v0

    new-instance v1, Lcom/crashlytics/android/Crashlytics$5;

    invoke-direct {v1, p0}, Lcom/crashlytics/android/Crashlytics$5;-><init>(Lcom/crashlytics/android/Crashlytics;)V

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lio/fabric/sdk/android/services/settings/Settings;->withSettings(Lio/fabric/sdk/android/services/settings/Settings$SettingsAccess;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method shouldSendReportsWithoutPrompting()Z
    .locals 4

    .prologue
    .line 944
    new-instance v0, Lio/fabric/sdk/android/services/persistence/PreferenceStoreImpl;

    invoke-direct {v0, p0}, Lio/fabric/sdk/android/services/persistence/PreferenceStoreImpl;-><init>(Lio/fabric/sdk/android/Kit;)V

    .line 945
    .local v0, "prefStore":Lio/fabric/sdk/android/services/persistence/PreferenceStore;
    invoke-interface {v0}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->get()Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "always_send_reports_opt_in"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method public verifyPinning(Ljava/net/URL;)Z
    .locals 4
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 664
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/crashlytics/android/Crashlytics;->internalVerifyPinning(Ljava/net/URL;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 667
    :goto_0
    return v1

    .line 665
    :catch_0
    move-exception v0

    .line 666
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const-string v2, "Fabric"

    const-string v3, "Could not verify SSL pinning"

    invoke-interface {v1, v2, v3, v0}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 667
    const/4 v1, 0x0

    goto :goto_0
.end method
