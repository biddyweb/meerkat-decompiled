.class Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;
.super Ljava/lang/Object;
.source "CrashlyticsUncaughtExceptionHandler.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$AnySessionPartFileFilter;,
        Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$SessionPartFileFilter;,
        Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$FileNameContainsFilter;
    }
.end annotation


# static fields
.field private static final ANALYZER_VERSION:I = 0x1

.field static final ANY_SESSION_FILENAME_FILTER:Ljava/io/FilenameFilter;

.field static final CLS_CRASH_MARKER_FILE_NAME:Ljava/lang/String; = "crash_marker"

.field private static final EVENT_TYPE_CRASH:Ljava/lang/String; = "crash"

.field private static final EVENT_TYPE_LOGGED:Ljava/lang/String; = "error"

.field private static final GENERATOR_FORMAT:Ljava/lang/String; = "Crashlytics Android SDK/%s"

.field static final INVALID_CLS_CACHE_DIR:Ljava/lang/String; = "invalidClsFiles"

.field static final LARGEST_FILE_NAME_FIRST:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAX_COMPLETE_SESSIONS_COUNT:I = 0x4

.field private static final MAX_LOCAL_LOGGED_EXCEPTIONS:I = 0x40

.field static final MAX_OPEN_SESSIONS:I = 0x8

.field private static final SEND_AT_CRASHTIME_HEADER:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final SESSION_APP_TAG:Ljava/lang/String; = "SessionApp"

.field static final SESSION_BEGIN_TAG:Ljava/lang/String; = "BeginSession"

.field static final SESSION_DEVICE_TAG:Ljava/lang/String; = "SessionDevice"

.field static final SESSION_FATAL_TAG:Ljava/lang/String; = "SessionCrash"

.field static final SESSION_FILE_FILTER:Ljava/io/FilenameFilter;

.field private static final SESSION_FILE_PATTERN:Ljava/util/regex/Pattern;

.field private static final SESSION_ID_LENGTH:I = 0x23

.field static final SESSION_NON_FATAL_TAG:Ljava/lang/String; = "SessionEvent"

.field static final SESSION_OS_TAG:Ljava/lang/String; = "SessionOS"

.field static final SESSION_USER_TAG:Ljava/lang/String; = "SessionUser"

.field static final SMALLEST_FILE_NAME_FIRST:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final crashlytics:Lcom/crashlytics/android/Crashlytics;

.field private final defaultHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

.field private final eventCounter:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final executorServiceWrapper:Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;

.field private final filesDir:Ljava/io/File;

.field private final idManager:Lio/fabric/sdk/android/services/common/IdManager;

.field private final isHandlingException:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final logFileManager:Lcom/crashlytics/android/LogFileManager;

.field private powerConnected:Z

.field private final powerConnectedReceiver:Landroid/content/BroadcastReceiver;

.field private final powerDisconnectedReceiver:Landroid/content/BroadcastReceiver;

.field private final receiversRegistered:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final sessionDataWriter:Lcom/crashlytics/android/SessionDataWriter;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 122
    new-instance v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$1;

    invoke-direct {v0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$1;-><init>()V

    sput-object v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->SESSION_FILE_FILTER:Ljava/io/FilenameFilter;

    .line 130
    new-instance v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$2;

    invoke-direct {v0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$2;-><init>()V

    sput-object v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->LARGEST_FILE_NAME_FIRST:Ljava/util/Comparator;

    .line 137
    new-instance v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$3;

    invoke-direct {v0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$3;-><init>()V

    sput-object v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->SMALLEST_FILE_NAME_FIRST:Ljava/util/Comparator;

    .line 147
    new-instance v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$4;

    invoke-direct {v0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$4;-><init>()V

    sput-object v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->ANY_SESSION_FILENAME_FILTER:Ljava/io/FilenameFilter;

    .line 154
    const-string v0, "([\\d|A-Z|a-z]{12}\\-[\\d|A-Z|a-z]{4}\\-[\\d|A-Z|a-z]{4}\\-[\\d|A-Z|a-z]{12}).+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->SESSION_FILE_PATTERN:Ljava/util/regex/Pattern;

    .line 157
    const-string v0, "X-CRASHLYTICS-SEND-FLAGS"

    const-string v1, "1"

    invoke-static {v0, v1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->SEND_AT_CRASHTIME_HEADER:Ljava/util/Map;

    return-void
.end method

.method constructor <init>(Ljava/lang/Thread$UncaughtExceptionHandler;Lcom/crashlytics/android/CrashlyticsListener;Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;Lio/fabric/sdk/android/services/common/IdManager;Lcom/crashlytics/android/SessionDataWriter;Lcom/crashlytics/android/Crashlytics;)V
    .locals 6
    .param p1, "handler"    # Ljava/lang/Thread$UncaughtExceptionHandler;
    .param p2, "listener"    # Lcom/crashlytics/android/CrashlyticsListener;
    .param p3, "executorServiceWrapper"    # Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;
    .param p4, "idManager"    # Lio/fabric/sdk/android/services/common/IdManager;
    .param p5, "sessionDataWriter"    # Lcom/crashlytics/android/SessionDataWriter;
    .param p6, "crashlytics"    # Lcom/crashlytics/android/Crashlytics;

    .prologue
    const/4 v4, 0x0

    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 184
    new-instance v3, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v3, v4}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->eventCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 185
    new-instance v3, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v3, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->receiversRegistered:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 217
    iput-object p1, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->defaultHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 218
    iput-object p3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->executorServiceWrapper:Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;

    .line 219
    iput-object p4, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->idManager:Lio/fabric/sdk/android/services/common/IdManager;

    .line 220
    iput-object p6, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    .line 221
    iput-object p5, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->sessionDataWriter:Lcom/crashlytics/android/SessionDataWriter;

    .line 222
    new-instance v3, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v3, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->isHandlingException:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 223
    invoke-virtual {p6}, Lcom/crashlytics/android/Crashlytics;->getSdkDirectory()Ljava/io/File;

    move-result-object v3

    iput-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->filesDir:Ljava/io/File;

    .line 224
    new-instance v3, Lcom/crashlytics/android/LogFileManager;

    invoke-virtual {p6}, Lcom/crashlytics/android/Crashlytics;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->filesDir:Ljava/io/File;

    invoke-direct {v3, v4, v5}, Lcom/crashlytics/android/LogFileManager;-><init>(Landroid/content/Context;Ljava/io/File;)V

    iput-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->logFileManager:Lcom/crashlytics/android/LogFileManager;

    .line 226
    invoke-direct {p0, p2}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->notifyCrashlyticsListenerOfPreviousCrash(Lcom/crashlytics/android/CrashlyticsListener;)V

    .line 228
    new-instance v3, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$5;

    invoke-direct {v3, p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$5;-><init>(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;)V

    iput-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->powerConnectedReceiver:Landroid/content/BroadcastReceiver;

    .line 235
    new-instance v1, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.ACTION_POWER_CONNECTED"

    invoke-direct {v1, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 237
    .local v1, "powerConnectedFilter":Landroid/content/IntentFilter;
    new-instance v3, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$6;

    invoke-direct {v3, p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$6;-><init>(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;)V

    iput-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->powerDisconnectedReceiver:Landroid/content/BroadcastReceiver;

    .line 244
    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.ACTION_POWER_DISCONNECTED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 247
    .local v2, "powerDisconnectedFilter":Landroid/content/IntentFilter;
    invoke-virtual {p6}, Lcom/crashlytics/android/Crashlytics;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 248
    .local v0, "context":Landroid/content/Context;
    iget-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->powerConnectedReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v3, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 249
    iget-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->powerDisconnectedReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v3, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 250
    iget-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->receiversRegistered:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 251
    return-void
.end method

.method static synthetic access$000()Ljava/util/regex/Pattern;
    .locals 1

    .prologue
    .line 56
    sget-object v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->SESSION_FILE_PATTERN:Ljava/util/regex/Pattern;

    return-object v0
.end method

.method static synthetic access$102(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;
    .param p1, "x1"    # Z

    .prologue
    .line 56
    iput-boolean p1, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->powerConnected:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;Ljava/io/FilenameFilter;)[Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;
    .param p1, "x1"    # Ljava/io/FilenameFilter;

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->listFilesMatching(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1200()Ljava/util/Map;
    .locals 1

    .prologue
    .line 56
    sget-object v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->SEND_AT_CRASHTIME_HEADER:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$200(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;Ljava/util/Date;Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 0
    .param p0, "x0"    # Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;
    .param p1, "x1"    # Ljava/util/Date;
    .param p2, "x2"    # Ljava/lang/Thread;
    .param p3, "x3"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 56
    invoke-direct {p0, p1, p2, p3}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->handleUncaughtException(Ljava/util/Date;Ljava/lang/Thread;Ljava/lang/Throwable;)V

    return-void
.end method

.method static synthetic access$300(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1
    .param p0, "x0"    # Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->isHandlingException:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic access$400(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;)Lcom/crashlytics/android/LogFileManager;
    .locals 1
    .param p0, "x0"    # Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->logFileManager:Lcom/crashlytics/android/LogFileManager;

    return-object v0
.end method

.method static synthetic access$500(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;Ljava/util/Date;Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 0
    .param p0, "x0"    # Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;
    .param p1, "x1"    # Ljava/util/Date;
    .param p2, "x2"    # Ljava/lang/Thread;
    .param p3, "x3"    # Ljava/lang/Throwable;

    .prologue
    .line 56
    invoke-direct {p0, p1, p2, p3}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->doWriteNonFatal(Ljava/util/Date;Ljava/lang/Thread;Ljava/lang/Throwable;)V

    return-void
.end method

.method static synthetic access$600(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;)V
    .locals 0
    .param p0, "x0"    # Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->doOpenSession()V

    return-void
.end method

.method static synthetic access$700(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;)Lcom/crashlytics/android/Crashlytics;
    .locals 1
    .param p0, "x0"    # Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    return-object v0
.end method

.method static synthetic access$800(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;Lcom/crashlytics/android/internal/models/SessionEventData;)V
    .locals 0
    .param p0, "x0"    # Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;
    .param p1, "x1"    # Lcom/crashlytics/android/internal/models/SessionEventData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeExternalCrashEvent(Lcom/crashlytics/android/internal/models/SessionEventData;)V

    return-void
.end method

.method static synthetic access$900(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;)V
    .locals 0
    .param p0, "x0"    # Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->doCloseSessions()V

    return-void
.end method

.method private closeWithoutRenamingOrLog(Lcom/crashlytics/android/ClsFileOutputStream;)V
    .locals 4
    .param p1, "fos"    # Lcom/crashlytics/android/ClsFileOutputStream;

    .prologue
    .line 601
    if-eqz p1, :cond_0

    .line 603
    :try_start_0
    invoke-virtual {p1}, Lcom/crashlytics/android/ClsFileOutputStream;->closeInProgressStream()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 609
    :cond_0
    :goto_0
    return-void

    .line 604
    :catch_0
    move-exception v0

    .line 605
    .local v0, "ex":Ljava/io/IOException;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const-string v2, "Fabric"

    const-string v3, "Error closing session file stream in the presence of an exception"

    invoke-interface {v1, v2, v3, v0}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private deleteLegacyInvalidCacheDir()V
    .locals 7

    .prologue
    .line 760
    new-instance v1, Ljava/io/File;

    iget-object v5, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    invoke-virtual {v5}, Lcom/crashlytics/android/Crashlytics;->getSdkDirectory()Ljava/io/File;

    move-result-object v5

    const-string v6, "invalidClsFiles"

    invoke-direct {v1, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 762
    .local v1, "cacheDir":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 765
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 766
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .local v0, "arr$":[Ljava/io/File;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v2, v0, v3

    .line 767
    .local v2, "cacheFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 766
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 771
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v2    # "cacheFile":Ljava/io/File;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 773
    :cond_1
    return-void
.end method

.method private deleteSessionPartFilesFor(Ljava/lang/String;)V
    .locals 4
    .param p1, "sessionId"    # Ljava/lang/String;

    .prologue
    .line 615
    invoke-direct {p0, p1}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->listSessionPartFilesFor(Ljava/lang/String;)[Ljava/io/File;

    move-result-object v0

    .local v0, "arr$":[Ljava/io/File;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 616
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 615
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 618
    .end local v1    # "file":Ljava/io/File;
    :cond_0
    return-void
.end method

.method private doCloseSessions()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 554
    const/16 v9, 0x8

    invoke-direct {p0, v9}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->trimOpenSessions(I)V

    .line 556
    invoke-direct {p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->getCurrentSessionId()Ljava/lang/String;

    move-result-object v1

    .line 558
    .local v1, "currentSessionId":Ljava/lang/String;
    if-eqz v1, :cond_2

    .line 561
    invoke-direct {p0, v1}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeSessionUser(Ljava/lang/String;)V

    .line 563
    iget-object v9, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    invoke-virtual {v9}, Lcom/crashlytics/android/Crashlytics;->getSessionSettingsData()Lio/fabric/sdk/android/services/settings/SessionSettingsData;

    move-result-object v8

    .line 565
    .local v8, "settingsData":Lio/fabric/sdk/android/services/settings/SessionSettingsData;
    if-eqz v8, :cond_0

    .line 566
    iget v4, v8, Lio/fabric/sdk/android/services/settings/SessionSettingsData;->maxCustomExceptionEvents:I

    .line 568
    .local v4, "maxLoggedExceptionsCount":I
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v9

    const-string v10, "Fabric"

    const-string v11, "Closing all open sessions."

    invoke-interface {v9, v10, v11}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 569
    invoke-virtual {p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->listSessionBeginFiles()[Ljava/io/File;

    move-result-object v6

    .line 571
    .local v6, "sessionBeginFiles":[Ljava/io/File;
    if-eqz v6, :cond_1

    array-length v9, v6

    if-lez v9, :cond_1

    .line 572
    move-object v0, v6

    .local v0, "arr$":[Ljava/io/File;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v5, v0, v2

    .line 573
    .local v5, "sessionBeginFile":Ljava/io/File;
    invoke-direct {p0, v5}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->getSessionIdFromSessionFile(Ljava/io/File;)Ljava/lang/String;

    move-result-object v7

    .line 575
    .local v7, "sessionIdentifier":Ljava/lang/String;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v9

    const-string v10, "Fabric"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Closing session: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v9, v10, v11}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 577
    invoke-direct {p0, v5, v7, v4}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeSessionPartsToSessionFile(Ljava/io/File;Ljava/lang/String;I)V

    .line 572
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 582
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "maxLoggedExceptionsCount":I
    .end local v5    # "sessionBeginFile":Ljava/io/File;
    .end local v6    # "sessionBeginFiles":[Ljava/io/File;
    .end local v7    # "sessionIdentifier":Ljava/lang/String;
    :cond_0
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v9

    const-string v10, "Fabric"

    const-string v11, "Unable to close session. Settings are not loaded."

    invoke-interface {v9, v10, v11}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 588
    .end local v8    # "settingsData":Lio/fabric/sdk/android/services/settings/SessionSettingsData;
    :cond_1
    :goto_1
    return-void

    .line 586
    :cond_2
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v9

    const-string v10, "Fabric"

    const-string v11, "No open sessions exist."

    invoke-interface {v9, v10, v11}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method private doOpenSession()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 538
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 539
    .local v1, "startedAt":Ljava/util/Date;
    new-instance v2, Lcom/crashlytics/android/CLSUUID;

    iget-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->idManager:Lio/fabric/sdk/android/services/common/IdManager;

    invoke-direct {v2, v3}, Lcom/crashlytics/android/CLSUUID;-><init>(Lio/fabric/sdk/android/services/common/IdManager;)V

    invoke-virtual {v2}, Lcom/crashlytics/android/CLSUUID;->toString()Ljava/lang/String;

    move-result-object v0

    .line 541
    .local v0, "sessionIdentifier":Ljava/lang/String;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v2

    const-string v3, "Fabric"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Opening an new session with ID "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 544
    invoke-direct {p0, v0, v1}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeBeginSession(Ljava/lang/String;Ljava/util/Date;)V

    .line 545
    invoke-direct {p0, v0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeSessionApp(Ljava/lang/String;)V

    .line 546
    invoke-direct {p0, v0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeSessionOS(Ljava/lang/String;)V

    .line 547
    invoke-direct {p0, v0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeSessionDevice(Ljava/lang/String;)V

    .line 548
    return-void
.end method

.method private doWriteNonFatal(Ljava/util/Date;Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 14
    .param p1, "time"    # Ljava/util/Date;
    .param p2, "thread"    # Ljava/lang/Thread;
    .param p3, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 967
    invoke-direct {p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->getCurrentSessionId()Ljava/lang/String;

    move-result-object v9

    .line 969
    .local v9, "currentSessionId":Ljava/lang/String;
    if-eqz v9, :cond_0

    .line 972
    invoke-static {v9}, Lcom/crashlytics/android/Crashlytics;->recordLoggedExceptionEvent(Ljava/lang/String;)V

    .line 974
    const/4 v11, 0x0

    .line 975
    .local v11, "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    const/4 v2, 0x0

    .line 977
    .local v2, "cos":Lcom/crashlytics/android/CodedOutputStream;
    :try_start_0
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const-string v3, "Fabric"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Crashlytics is logging non-fatal exception \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\" from thread "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 981
    iget-object v1, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->eventCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v1

    invoke-static {v1}, Lio/fabric/sdk/android/services/common/CommonUtils;->padWithZerosToMaxIntWidth(I)Ljava/lang/String;

    move-result-object v8

    .line 983
    .local v8, "counterString":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "SessionEvent"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 985
    .local v13, "nonFatalFileName":Ljava/lang/String;
    new-instance v12, Lcom/crashlytics/android/ClsFileOutputStream;

    iget-object v1, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->filesDir:Ljava/io/File;

    invoke-direct {v12, v1, v13}, Lcom/crashlytics/android/ClsFileOutputStream;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 987
    .end local v11    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .local v12, "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :try_start_1
    invoke-static {v12}, Lcom/crashlytics/android/CodedOutputStream;->newInstance(Ljava/io/OutputStream;)Lcom/crashlytics/android/CodedOutputStream;

    move-result-object v2

    .line 988
    const-string v6, "error"

    const/4 v7, 0x0

    move-object v1, p0

    move-object v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    invoke-direct/range {v1 .. v7}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeSessionEvent(Lcom/crashlytics/android/CodedOutputStream;Ljava/util/Date;Ljava/lang/Thread;Ljava/lang/Throwable;Ljava/lang/String;Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 994
    const-string v1, "Failed to flush to non-fatal file."

    invoke-static {v2, v1}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 995
    const-string v1, "Failed to close non-fatal file output stream."

    invoke-static {v12, v1}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    move-object v11, v12

    .line 1001
    .end local v8    # "counterString":Ljava/lang/String;
    .end local v12    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .end local v13    # "nonFatalFileName":Ljava/lang/String;
    .restart local v11    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :goto_0
    const/16 v1, 0x40

    :try_start_2
    invoke-direct {p0, v9, v1}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->trimSessionEventFiles(Ljava/lang/String;I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 1010
    .end local v2    # "cos":Lcom/crashlytics/android/CodedOutputStream;
    .end local v11    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :goto_1
    return-void

    .line 989
    .restart local v2    # "cos":Lcom/crashlytics/android/CodedOutputStream;
    .restart local v11    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :catch_0
    move-exception v10

    .line 990
    .local v10, "e":Ljava/lang/Exception;
    :goto_2
    :try_start_3
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const-string v3, "Fabric"

    const-string v4, "An error occurred in the non-fatal exception logger"

    invoke-interface {v1, v3, v4, v10}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 992
    invoke-static {v10, v11}, Lcom/crashlytics/android/ExceptionUtils;->writeStackTraceIfNotNull(Ljava/lang/Throwable;Ljava/io/OutputStream;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 994
    const-string v1, "Failed to flush to non-fatal file."

    invoke-static {v2, v1}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 995
    const-string v1, "Failed to close non-fatal file output stream."

    invoke-static {v11, v1}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    goto :goto_0

    .line 994
    .end local v10    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    :goto_3
    const-string v3, "Failed to flush to non-fatal file."

    invoke-static {v2, v3}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 995
    const-string v3, "Failed to close non-fatal file output stream."

    invoke-static {v11, v3}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    throw v1

    .line 1002
    :catch_1
    move-exception v10

    .line 1003
    .restart local v10    # "e":Ljava/lang/Exception;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const-string v3, "Fabric"

    const-string v4, "An error occurred when trimming non-fatal files."

    invoke-interface {v1, v3, v4, v10}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 1007
    .end local v2    # "cos":Lcom/crashlytics/android/CodedOutputStream;
    .end local v10    # "e":Ljava/lang/Exception;
    .end local v11    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :cond_0
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const-string v3, "Fabric"

    const-string v4, "Tried to write a non-fatal exception while no session was open."

    const/4 v5, 0x0

    invoke-interface {v1, v3, v4, v5}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 994
    .restart local v2    # "cos":Lcom/crashlytics/android/CodedOutputStream;
    .restart local v8    # "counterString":Ljava/lang/String;
    .restart local v12    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v13    # "nonFatalFileName":Ljava/lang/String;
    :catchall_1
    move-exception v1

    move-object v11, v12

    .end local v12    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v11    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    goto :goto_3

    .line 989
    .end local v11    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v12    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :catch_2
    move-exception v10

    move-object v11, v12

    .end local v12    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v11    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    goto :goto_2
.end method

.method private ensureFileArrayNotNull([Ljava/io/File;)[Ljava/io/File;
    .locals 1
    .param p1, "files"    # [Ljava/io/File;

    .prologue
    .line 647
    if-nez p1, :cond_0

    const/4 v0, 0x0

    new-array p1, v0, [Ljava/io/File;

    .end local p1    # "files":[Ljava/io/File;
    :cond_0
    return-object p1
.end method

.method private getCurrentSessionId()Ljava/lang/String;
    .locals 3

    .prologue
    .line 473
    new-instance v1, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$FileNameContainsFilter;

    const-string v2, "BeginSession"

    invoke-direct {v1, v2}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$FileNameContainsFilter;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->listFilesMatching(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v0

    .line 475
    .local v0, "sessionBeginFiles":[Ljava/io/File;
    sget-object v1, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->LARGEST_FILE_NAME_FIRST:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 476
    array-length v1, v0

    if-lez v1, :cond_0

    const/4 v1, 0x0

    aget-object v1, v0, v1

    invoke-direct {p0, v1}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->getSessionIdFromSessionFile(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getSessionIdFromSessionFile(Ljava/io/File;)Ljava/lang/String;
    .locals 3
    .param p1, "sessionFile"    # Ljava/io/File;

    .prologue
    .line 490
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/16 v2, 0x23

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private handleUncaughtException(Ljava/util/Date;Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "time"    # Ljava/util/Date;
    .param p2, "thread"    # Ljava/lang/Thread;
    .param p3, "ex"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 297
    invoke-direct {p0, p1, p2, p3}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeFatal(Ljava/util/Date;Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 299
    invoke-direct {p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->doCloseSessions()V

    .line 300
    invoke-direct {p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->doOpenSession()V

    .line 302
    invoke-virtual {p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->trimSessionFiles()V

    .line 304
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    invoke-virtual {v0}, Lcom/crashlytics/android/Crashlytics;->shouldPromptUserBeforeSendingCrashReports()Z

    move-result v0

    if-nez v0, :cond_0

    .line 305
    invoke-direct {p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->sendSessionReports()V

    .line 307
    :cond_0
    return-void
.end method

.method private listCompleteSessionFiles()[Ljava/io/File;
    .locals 1

    .prologue
    .line 628
    sget-object v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->SESSION_FILE_FILTER:Ljava/io/FilenameFilter;

    invoke-direct {p0, v0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->listFilesMatching(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private listFilesMatching(Ljava/io/FilenameFilter;)[Ljava/io/File;
    .locals 1
    .param p1, "filter"    # Ljava/io/FilenameFilter;

    .prologue
    .line 643
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->filesDir:Ljava/io/File;

    invoke-virtual {v0, p1}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->ensureFileArrayNotNull([Ljava/io/File;)[Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private listSessionPartFilesFor(Ljava/lang/String;)[Ljava/io/File;
    .locals 1
    .param p1, "sessionId"    # Ljava/lang/String;

    .prologue
    .line 624
    new-instance v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$SessionPartFileFilter;

    invoke-direct {v0, p1}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$SessionPartFileFilter;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->listFilesMatching(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private notifyCrashlyticsListenerOfPreviousCrash(Lcom/crashlytics/android/CrashlyticsListener;)V
    .locals 5
    .param p1, "listener"    # Lcom/crashlytics/android/CrashlyticsListener;

    .prologue
    .line 318
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v2

    const-string v3, "Fabric"

    const-string v4, "Checking for previous crash marker."

    invoke-interface {v2, v3, v4}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    invoke-virtual {v2}, Lcom/crashlytics/android/Crashlytics;->getSdkDirectory()Ljava/io/File;

    move-result-object v2

    const-string v3, "crash_marker"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 322
    .local v1, "markerFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 323
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 325
    if-eqz p1, :cond_0

    .line 327
    :try_start_0
    invoke-interface {p1}, Lcom/crashlytics/android/CrashlyticsListener;->crashlyticsDidDetectCrashDuringPreviousExecution()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 335
    :cond_0
    :goto_0
    return-void

    .line 328
    :catch_0
    move-exception v0

    .line 329
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v2

    const-string v3, "Fabric"

    const-string v4, "Exception thrown by CrashlyticsListener while notifying of previous crash."

    invoke-interface {v2, v3, v4, v0}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private sendSessionReports()V
    .locals 7

    .prologue
    .line 1177
    invoke-direct {p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->listCompleteSessionFiles()[Ljava/io/File;

    move-result-object v0

    .local v0, "arr$":[Ljava/io/File;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 1178
    .local v1, "finishedSessionFile":Ljava/io/File;
    move-object v4, v1

    .line 1181
    .local v4, "toSend":Ljava/io/File;
    iget-object v5, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->executorServiceWrapper:Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;

    new-instance v6, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$14;

    invoke-direct {v6, p0, v4}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$14;-><init>(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;Ljava/io/File;)V

    invoke-virtual {v5, v6}, Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;->executeAsync(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 1177
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1202
    .end local v1    # "finishedSessionFile":Ljava/io/File;
    .end local v4    # "toSend":Ljava/io/File;
    :cond_0
    return-void
.end method

.method private trimOpenSessions(I)V
    .locals 17
    .param p1, "maxOpenSessionCount"    # I

    .prologue
    .line 683
    new-instance v11, Ljava/util/HashSet;

    invoke-direct {v11}, Ljava/util/HashSet;-><init>()V

    .line 685
    .local v11, "sessionIdsToKeep":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->listSessionBeginFiles()[Ljava/io/File;

    move-result-object v3

    .line 686
    .local v3, "beginSessionFiles":[Ljava/io/File;
    sget-object v13, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->LARGEST_FILE_NAME_FIRST:Ljava/util/Comparator;

    invoke-static {v3, v13}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 687
    array-length v13, v3

    move/from16 v0, p1

    invoke-static {v0, v13}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 689
    .local v4, "count":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    if-ge v6, v4, :cond_0

    .line 690
    aget-object v13, v3, v6

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->getSessionIdFromSessionFile(Ljava/io/File;)Ljava/lang/String;

    move-result-object v10

    .line 691
    .local v10, "sessionId":Ljava/lang/String;
    invoke-interface {v11, v10}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 689
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 694
    .end local v10    # "sessionId":Ljava/lang/String;
    :cond_0
    new-instance v13, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$AnySessionPartFileFilter;

    const/4 v14, 0x0

    invoke-direct {v13, v14}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$AnySessionPartFileFilter;-><init>(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$1;)V

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->listFilesMatching(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v1

    .line 696
    .local v1, "allSessionPartFiles":[Ljava/io/File;
    move-object v2, v1

    .local v2, "arr$":[Ljava/io/File;
    array-length v8, v2

    .local v8, "len$":I
    const/4 v7, 0x0

    .local v7, "i$":I
    :goto_1
    if-ge v7, v8, :cond_2

    aget-object v12, v2, v7

    .line 697
    .local v12, "sessionPartFile":Ljava/io/File;
    invoke-virtual {v12}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    .line 698
    .local v5, "fileName":Ljava/lang/String;
    sget-object v13, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->SESSION_FILE_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v13, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v9

    .line 700
    .local v9, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v9}, Ljava/util/regex/Matcher;->matches()Z

    .line 701
    const/4 v13, 0x1

    invoke-virtual {v9, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v10

    .line 703
    .restart local v10    # "sessionId":Ljava/lang/String;
    invoke-interface {v11, v10}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_1

    .line 704
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v13

    const-string v14, "Fabric"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Trimming open session file: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v13, v14, v15}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 705
    invoke-virtual {v12}, Ljava/io/File;->delete()Z

    .line 696
    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 708
    .end local v5    # "fileName":Ljava/lang/String;
    .end local v9    # "matcher":Ljava/util/regex/Matcher;
    .end local v10    # "sessionId":Ljava/lang/String;
    .end local v12    # "sessionPartFile":Ljava/io/File;
    :cond_2
    return-void
.end method

.method private trimSessionEventFiles(Ljava/lang/String;I)V
    .locals 4
    .param p1, "sessionId"    # Ljava/lang/String;
    .param p2, "limit"    # I

    .prologue
    .line 660
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->filesDir:Ljava/io/File;

    new-instance v1, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$FileNameContainsFilter;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "SessionEvent"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$FileNameContainsFilter;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->SMALLEST_FILE_NAME_FIRST:Ljava/util/Comparator;

    invoke-static {v0, v1, p2, v2}, Lcom/crashlytics/android/Utils;->capFileCount(Ljava/io/File;Ljava/io/FilenameFilter;ILjava/util/Comparator;)V

    .line 662
    return-void
.end method

.method private writeBeginSession(Ljava/lang/String;Ljava/util/Date;)V
    .locals 14
    .param p1, "sessionId"    # Ljava/lang/String;
    .param p2, "startedAt"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 776
    const/4 v7, 0x0

    .line 777
    .local v7, "fos":Ljava/io/FileOutputStream;
    const/4 v1, 0x0

    .line 779
    .local v1, "cos":Lcom/crashlytics/android/CodedOutputStream;
    :try_start_0
    new-instance v8, Lcom/crashlytics/android/ClsFileOutputStream;

    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->filesDir:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v9, "BeginSession"

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v8, v0, v2}, Lcom/crashlytics/android/ClsFileOutputStream;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 780
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .local v8, "fos":Ljava/io/FileOutputStream;
    :try_start_1
    invoke-static {v8}, Lcom/crashlytics/android/CodedOutputStream;->newInstance(Ljava/io/OutputStream;)Lcom/crashlytics/android/CodedOutputStream;

    move-result-object v1

    .line 782
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "Crashlytics Android SDK/%s"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    invoke-virtual {v11}, Lcom/crashlytics/android/Crashlytics;->getVersion()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v0, v2, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 784
    .local v3, "generator":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    const-wide/16 v12, 0x3e8

    div-long v4, v10, v12

    .line 786
    .local v4, "startedAtSeconds":J
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->sessionDataWriter:Lcom/crashlytics/android/SessionDataWriter;

    move-object v2, p1

    invoke-virtual/range {v0 .. v5}, Lcom/crashlytics/android/SessionDataWriter;->writeBeginSession(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/String;Ljava/lang/String;J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 791
    const-string v0, "Failed to flush to session begin file."

    invoke-static {v1, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 792
    const-string v0, "Failed to close begin session file."

    invoke-static {v8, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    .line 794
    return-void

    .line 787
    .end local v3    # "generator":Ljava/lang/String;
    .end local v4    # "startedAtSeconds":J
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "fos":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v6

    .line 788
    .local v6, "e":Ljava/lang/Exception;
    :goto_0
    :try_start_2
    invoke-static {v6, v7}, Lcom/crashlytics/android/ExceptionUtils;->writeStackTraceIfNotNull(Ljava/lang/Throwable;Ljava/io/OutputStream;)V

    .line 789
    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 791
    .end local v6    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    :goto_1
    const-string v2, "Failed to flush to session begin file."

    invoke-static {v1, v2}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 792
    const-string v2, "Failed to close begin session file."

    invoke-static {v7, v2}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    throw v0

    .line 791
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v0

    move-object v7, v8

    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "fos":Ljava/io/FileOutputStream;
    goto :goto_1

    .line 787
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v6

    move-object v7, v8

    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "fos":Ljava/io/FileOutputStream;
    goto :goto_0
.end method

.method private writeExternalCrashEvent(Lcom/crashlytics/android/internal/models/SessionEventData;)V
    .locals 9
    .param p1, "crashEventData"    # Lcom/crashlytics/android/internal/models/SessionEventData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 420
    const/4 v3, 0x0

    .line 421
    .local v3, "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    const/4 v0, 0x0

    .line 423
    .local v0, "cos":Lcom/crashlytics/android/CodedOutputStream;
    :try_start_0
    invoke-direct {p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->getCurrentSessionId()Ljava/lang/String;

    move-result-object v1

    .line 425
    .local v1, "currentSessionId":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 426
    new-instance v4, Lcom/crashlytics/android/ClsFileOutputStream;

    iget-object v5, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->filesDir:Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "SessionCrash"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/crashlytics/android/ClsFileOutputStream;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 427
    .end local v3    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .local v4, "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :try_start_1
    invoke-static {v4}, Lcom/crashlytics/android/CodedOutputStream;->newInstance(Ljava/io/OutputStream;)Lcom/crashlytics/android/CodedOutputStream;

    move-result-object v0

    .line 429
    invoke-static {p1, v0}, Lcom/crashlytics/android/NativeCrashWriter;->writeNativeCrash(Lcom/crashlytics/android/internal/models/SessionEventData;Lcom/crashlytics/android/CodedOutputStream;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v3, v4

    .line 439
    .end local v4    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v3    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :goto_0
    const-string v5, "Failed to flush to session begin file."

    invoke-static {v0, v5}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 440
    const-string v5, "Failed to close fatal exception file output stream."

    invoke-static {v3, v5}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    .line 442
    .end local v1    # "currentSessionId":Ljava/lang/String;
    :goto_1
    return-void

    .line 431
    .restart local v1    # "currentSessionId":Ljava/lang/String;
    :cond_0
    :try_start_2
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v5

    const-string v6, "Fabric"

    const-string v7, "Tried to write a native crash while no session was open."

    const/4 v8, 0x0

    invoke-interface {v5, v6, v7, v8}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 434
    .end local v1    # "currentSessionId":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 435
    .local v2, "e":Ljava/lang/Exception;
    :goto_2
    :try_start_3
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v5

    const-string v6, "Fabric"

    const-string v7, "An error occurred in the native crash logger"

    invoke-interface {v5, v6, v7, v2}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 437
    invoke-static {v2, v3}, Lcom/crashlytics/android/ExceptionUtils;->writeStackTraceIfNotNull(Ljava/lang/Throwable;Ljava/io/OutputStream;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 439
    const-string v5, "Failed to flush to session begin file."

    invoke-static {v0, v5}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 440
    const-string v5, "Failed to close fatal exception file output stream."

    invoke-static {v3, v5}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    goto :goto_1

    .line 439
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    :goto_3
    const-string v6, "Failed to flush to session begin file."

    invoke-static {v0, v6}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 440
    const-string v6, "Failed to close fatal exception file output stream."

    invoke-static {v3, v6}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    throw v5

    .line 439
    .end local v3    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v1    # "currentSessionId":Ljava/lang/String;
    .restart local v4    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :catchall_1
    move-exception v5

    move-object v3, v4

    .end local v4    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v3    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    goto :goto_3

    .line 434
    .end local v3    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v4    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :catch_1
    move-exception v2

    move-object v3, v4

    .end local v4    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v3    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    goto :goto_2
.end method

.method private writeFatal(Ljava/util/Date;Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 11
    .param p1, "time"    # Ljava/util/Date;
    .param p2, "thread"    # Ljava/lang/Thread;
    .param p3, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 378
    const/4 v9, 0x0

    .line 379
    .local v9, "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    const/4 v1, 0x0

    .line 383
    .local v1, "cos":Lcom/crashlytics/android/CodedOutputStream;
    :try_start_0
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->filesDir:Ljava/io/File;

    const-string v3, "crash_marker"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    .line 385
    invoke-direct {p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->getCurrentSessionId()Ljava/lang/String;

    move-result-object v7

    .line 387
    .local v7, "currentSessionId":Ljava/lang/String;
    if-eqz v7, :cond_0

    .line 390
    invoke-static {v7}, Lcom/crashlytics/android/Crashlytics;->recordFatalExceptionEvent(Ljava/lang/String;)V

    .line 392
    new-instance v10, Lcom/crashlytics/android/ClsFileOutputStream;

    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->filesDir:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "SessionCrash"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v10, v0, v2}, Lcom/crashlytics/android/ClsFileOutputStream;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 393
    .end local v9    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .local v10, "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :try_start_1
    invoke-static {v10}, Lcom/crashlytics/android/CodedOutputStream;->newInstance(Ljava/io/OutputStream;)Lcom/crashlytics/android/CodedOutputStream;

    move-result-object v1

    .line 394
    const-string v5, "crash"

    const/4 v6, 0x1

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v6}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeSessionEvent(Lcom/crashlytics/android/CodedOutputStream;Ljava/util/Date;Ljava/lang/Thread;Ljava/lang/Throwable;Ljava/lang/String;Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v9, v10

    .line 404
    .end local v10    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v9    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :goto_0
    const-string v0, "Failed to flush to session begin file."

    invoke-static {v1, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 405
    const-string v0, "Failed to close fatal exception file output stream."

    invoke-static {v9, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    .line 407
    .end local v7    # "currentSessionId":Ljava/lang/String;
    :goto_1
    return-void

    .line 396
    .restart local v7    # "currentSessionId":Ljava/lang/String;
    :cond_0
    :try_start_2
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v2, "Fabric"

    const-string v3, "Tried to write a fatal exception while no session was open."

    const/4 v4, 0x0

    invoke-interface {v0, v2, v3, v4}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 399
    .end local v7    # "currentSessionId":Ljava/lang/String;
    :catch_0
    move-exception v8

    .line 400
    .local v8, "e":Ljava/lang/Exception;
    :goto_2
    :try_start_3
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v2, "Fabric"

    const-string v3, "An error occurred in the fatal exception logger"

    invoke-interface {v0, v2, v3, v8}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 402
    invoke-static {v8, v9}, Lcom/crashlytics/android/ExceptionUtils;->writeStackTraceIfNotNull(Ljava/lang/Throwable;Ljava/io/OutputStream;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 404
    const-string v0, "Failed to flush to session begin file."

    invoke-static {v1, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 405
    const-string v0, "Failed to close fatal exception file output stream."

    invoke-static {v9, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    goto :goto_1

    .line 404
    .end local v8    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    :goto_3
    const-string v2, "Failed to flush to session begin file."

    invoke-static {v1, v2}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 405
    const-string v2, "Failed to close fatal exception file output stream."

    invoke-static {v9, v2}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    throw v0

    .line 404
    .end local v9    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v7    # "currentSessionId":Ljava/lang/String;
    .restart local v10    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :catchall_1
    move-exception v0

    move-object v9, v10

    .end local v10    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v9    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    goto :goto_3

    .line 399
    .end local v9    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v10    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :catch_1
    move-exception v8

    move-object v9, v10

    .end local v10    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v9    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    goto :goto_2
.end method

.method private writeInitialPartsTo(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/String;)V
    .locals 11
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .param p2, "sessionId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 1117
    const/4 v6, 0x4

    new-array v5, v6, [Ljava/lang/String;

    const-string v6, "SessionUser"

    aput-object v6, v5, v10

    const/4 v6, 0x1

    const-string v7, "SessionApp"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "SessionOS"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string v7, "SessionDevice"

    aput-object v7, v5, v6

    .line 1121
    .local v5, "tags":[Ljava/lang/String;
    move-object v0, v5

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v4, v0, v1

    .line 1122
    .local v4, "tag":Ljava/lang/String;
    new-instance v6, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$FileNameContainsFilter;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$FileNameContainsFilter;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v6}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->listFilesMatching(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v3

    .line 1125
    .local v3, "sessionPartFiles":[Ljava/io/File;
    array-length v6, v3

    if-nez v6, :cond_0

    .line 1126
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v6

    const-string v7, "Fabric"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Can\'t find "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " data for session ID "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-interface {v6, v7, v8, v9}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1121
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1129
    :cond_0
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v6

    const-string v7, "Fabric"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Collecting "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " data for session ID "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1131
    aget-object v6, v3, v10

    invoke-direct {p0, p1, v6}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeToCosFromFile(Lcom/crashlytics/android/CodedOutputStream;Ljava/io/File;)V

    goto :goto_1

    .line 1134
    .end local v3    # "sessionPartFiles":[Ljava/io/File;
    .end local v4    # "tag":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private writeNonFatalEventsTo(Lcom/crashlytics/android/CodedOutputStream;[Ljava/io/File;Ljava/lang/String;)V
    .locals 12
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .param p2, "nonFatalFiles"    # [Ljava/io/File;
    .param p3, "sessionId"    # Ljava/lang/String;

    .prologue
    .line 1102
    sget-object v5, Lio/fabric/sdk/android/services/common/CommonUtils;->FILE_MODIFIED_COMPARATOR:Ljava/util/Comparator;

    invoke-static {p2, v5}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 1104
    move-object v0, p2

    .local v0, "arr$":[Ljava/io/File;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v4, v0, v2

    .line 1106
    .local v4, "nonFatalFile":Ljava/io/File;
    :try_start_0
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v5

    const-string v6, "Fabric"

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "Found Non Fatal for session ID %s in %s "

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object p3, v9, v10

    const/4 v10, 0x1

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1109
    invoke-direct {p0, p1, v4}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeToCosFromFile(Lcom/crashlytics/android/CodedOutputStream;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1104
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1110
    :catch_0
    move-exception v1

    .line 1111
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v5

    const-string v6, "Fabric"

    const-string v7, "Error writting non-fatal to session."

    invoke-interface {v5, v6, v7, v1}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 1114
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v4    # "nonFatalFile":Ljava/io/File;
    :cond_0
    return-void
.end method

.method private writeSessionApp(Ljava/lang/String;)V
    .locals 12
    .param p1, "sessionId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 797
    const/4 v8, 0x0

    .line 798
    .local v8, "fos":Ljava/io/FileOutputStream;
    const/4 v1, 0x0

    .line 800
    .local v1, "cos":Lcom/crashlytics/android/CodedOutputStream;
    :try_start_0
    new-instance v9, Lcom/crashlytics/android/ClsFileOutputStream;

    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->filesDir:Ljava/io/File;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "SessionApp"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v0, v10}, Lcom/crashlytics/android/ClsFileOutputStream;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 801
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .local v9, "fos":Ljava/io/FileOutputStream;
    :try_start_1
    invoke-static {v9}, Lcom/crashlytics/android/CodedOutputStream;->newInstance(Ljava/io/OutputStream;)Lcom/crashlytics/android/CodedOutputStream;

    move-result-object v1

    .line 803
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    invoke-virtual {v0}, Lcom/crashlytics/android/Crashlytics;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 804
    .local v2, "packageName":Ljava/lang/String;
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    invoke-virtual {v0}, Lcom/crashlytics/android/Crashlytics;->getVersionCode()Ljava/lang/String;

    move-result-object v3

    .line 805
    .local v3, "versionCode":Ljava/lang/String;
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    invoke-virtual {v0}, Lcom/crashlytics/android/Crashlytics;->getVersionName()Ljava/lang/String;

    move-result-object v4

    .line 806
    .local v4, "versionName":Ljava/lang/String;
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->idManager:Lio/fabric/sdk/android/services/common/IdManager;

    invoke-virtual {v0}, Lio/fabric/sdk/android/services/common/IdManager;->getAppInstallIdentifier()Ljava/lang/String;

    move-result-object v5

    .line 807
    .local v5, "installUuid":Ljava/lang/String;
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    invoke-virtual {v0}, Lcom/crashlytics/android/Crashlytics;->getInstallerPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lio/fabric/sdk/android/services/common/DeliveryMechanism;->determineFrom(Ljava/lang/String;)Lio/fabric/sdk/android/services/common/DeliveryMechanism;

    move-result-object v0

    invoke-virtual {v0}, Lio/fabric/sdk/android/services/common/DeliveryMechanism;->getId()I

    move-result v6

    .line 810
    .local v6, "deliveryMechanism":I
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->sessionDataWriter:Lcom/crashlytics/android/SessionDataWriter;

    invoke-virtual/range {v0 .. v6}, Lcom/crashlytics/android/SessionDataWriter;->writeSessionApp(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 817
    const-string v0, "Failed to flush to session app file."

    invoke-static {v1, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 818
    const-string v0, "Failed to close session app file."

    invoke-static {v9, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    .line 820
    return-void

    .line 813
    .end local v2    # "packageName":Ljava/lang/String;
    .end local v3    # "versionCode":Ljava/lang/String;
    .end local v4    # "versionName":Ljava/lang/String;
    .end local v5    # "installUuid":Ljava/lang/String;
    .end local v6    # "deliveryMechanism":I
    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v7

    .line 814
    .local v7, "e":Ljava/lang/Exception;
    :goto_0
    :try_start_2
    invoke-static {v7, v8}, Lcom/crashlytics/android/ExceptionUtils;->writeStackTraceIfNotNull(Ljava/lang/Throwable;Ljava/io/OutputStream;)V

    .line 815
    throw v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 817
    .end local v7    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    :goto_1
    const-string v10, "Failed to flush to session app file."

    invoke-static {v1, v10}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 818
    const-string v10, "Failed to close session app file."

    invoke-static {v8, v10}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    throw v0

    .line 817
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .restart local v9    # "fos":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v0

    move-object v8, v9

    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    goto :goto_1

    .line 813
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .restart local v9    # "fos":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v7

    move-object v8, v9

    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    goto :goto_0
.end method

.method private writeSessionDevice(Ljava/lang/String;)V
    .locals 26
    .param p1, "sessionId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 845
    const/16 v19, 0x0

    .line 846
    .local v19, "fos":Ljava/io/FileOutputStream;
    const/4 v3, 0x0

    .line 848
    .local v3, "cos":Lcom/crashlytics/android/CodedOutputStream;
    :try_start_0
    new-instance v20, Lcom/crashlytics/android/ClsFileOutputStream;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->filesDir:Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v15, "SessionDevice"

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v20

    invoke-direct {v0, v2, v6}, Lcom/crashlytics/android/ClsFileOutputStream;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 849
    .end local v19    # "fos":Ljava/io/FileOutputStream;
    .local v20, "fos":Ljava/io/FileOutputStream;
    :try_start_1
    invoke-static/range {v20 .. v20}, Lcom/crashlytics/android/CodedOutputStream;->newInstance(Ljava/io/OutputStream;)Lcom/crashlytics/android/CodedOutputStream;

    move-result-object v3

    .line 851
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    invoke-virtual {v2}, Lcom/crashlytics/android/Crashlytics;->getContext()Landroid/content/Context;

    move-result-object v17

    .line 852
    .local v17, "context":Landroid/content/Context;
    new-instance v21, Landroid/os/StatFs;

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v21

    invoke-direct {v0, v2}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 854
    .local v21, "statFs":Landroid/os/StatFs;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->idManager:Lio/fabric/sdk/android/services/common/IdManager;

    invoke-virtual {v2}, Lio/fabric/sdk/android/services/common/IdManager;->getDeviceUUID()Ljava/lang/String;

    move-result-object v4

    .line 855
    .local v4, "clsDeviceId":Ljava/lang/String;
    invoke-static {}, Lio/fabric/sdk/android/services/common/CommonUtils;->getCpuArchitectureInt()I

    move-result v5

    .line 856
    .local v5, "arch":I
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v7

    .line 857
    .local v7, "availableProcessors":I
    invoke-static {}, Lio/fabric/sdk/android/services/common/CommonUtils;->getTotalRamInBytes()J

    move-result-wide v8

    .line 858
    .local v8, "totalRam":J
    invoke-virtual/range {v21 .. v21}, Landroid/os/StatFs;->getBlockCount()I

    move-result v2

    int-to-long v0, v2

    move-wide/from16 v22, v0

    invoke-virtual/range {v21 .. v21}, Landroid/os/StatFs;->getBlockSize()I

    move-result v2

    int-to-long v0, v2

    move-wide/from16 v24, v0

    mul-long v10, v22, v24

    .line 859
    .local v10, "diskSpace":J
    invoke-static/range {v17 .. v17}, Lio/fabric/sdk/android/services/common/CommonUtils;->isEmulator(Landroid/content/Context;)Z

    move-result v12

    .line 861
    .local v12, "isEmulator":Z
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->idManager:Lio/fabric/sdk/android/services/common/IdManager;

    invoke-virtual {v2}, Lio/fabric/sdk/android/services/common/IdManager;->getDeviceIdentifiers()Ljava/util/Map;

    move-result-object v13

    .line 863
    .local v13, "ids":Ljava/util/Map;, "Ljava/util/Map<Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;Ljava/lang/String;>;"
    invoke-static/range {v17 .. v17}, Lio/fabric/sdk/android/services/common/CommonUtils;->getDeviceState(Landroid/content/Context;)I

    move-result v14

    .line 865
    .local v14, "state":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->sessionDataWriter:Lcom/crashlytics/android/SessionDataWriter;

    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v15, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    sget-object v16, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual/range {v2 .. v16}, Lcom/crashlytics/android/SessionDataWriter;->writeSessionDevice(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/String;ILjava/lang/String;IJJZLjava/util/Map;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 873
    const-string v2, "Failed to flush session device info."

    invoke-static {v3, v2}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 874
    const-string v2, "Failed to close session device file."

    move-object/from16 v0, v20

    invoke-static {v0, v2}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    .line 876
    return-void

    .line 869
    .end local v4    # "clsDeviceId":Ljava/lang/String;
    .end local v5    # "arch":I
    .end local v7    # "availableProcessors":I
    .end local v8    # "totalRam":J
    .end local v10    # "diskSpace":J
    .end local v12    # "isEmulator":Z
    .end local v13    # "ids":Ljava/util/Map;, "Ljava/util/Map<Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;Ljava/lang/String;>;"
    .end local v14    # "state":I
    .end local v17    # "context":Landroid/content/Context;
    .end local v20    # "fos":Ljava/io/FileOutputStream;
    .end local v21    # "statFs":Landroid/os/StatFs;
    .restart local v19    # "fos":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v18

    .line 870
    .local v18, "e":Ljava/lang/Exception;
    :goto_0
    :try_start_2
    invoke-static/range {v18 .. v19}, Lcom/crashlytics/android/ExceptionUtils;->writeStackTraceIfNotNull(Ljava/lang/Throwable;Ljava/io/OutputStream;)V

    .line 871
    throw v18
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 873
    .end local v18    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    :goto_1
    const-string v6, "Failed to flush session device info."

    invoke-static {v3, v6}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 874
    const-string v6, "Failed to close session device file."

    move-object/from16 v0, v19

    invoke-static {v0, v6}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    throw v2

    .line 873
    .end local v19    # "fos":Ljava/io/FileOutputStream;
    .restart local v20    # "fos":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v2

    move-object/from16 v19, v20

    .end local v20    # "fos":Ljava/io/FileOutputStream;
    .restart local v19    # "fos":Ljava/io/FileOutputStream;
    goto :goto_1

    .line 869
    .end local v19    # "fos":Ljava/io/FileOutputStream;
    .restart local v20    # "fos":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v18

    move-object/from16 v19, v20

    .end local v20    # "fos":Ljava/io/FileOutputStream;
    .restart local v19    # "fos":Ljava/io/FileOutputStream;
    goto :goto_0
.end method

.method private writeSessionEvent(Lcom/crashlytics/android/CodedOutputStream;Ljava/util/Date;Ljava/lang/Thread;Ljava/lang/Throwable;Ljava/lang/String;Z)V
    .locals 29
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .param p2, "time"    # Ljava/util/Date;
    .param p3, "thread"    # Ljava/lang/Thread;
    .param p4, "ex"    # Ljava/lang/Throwable;
    .param p5, "eventType"    # Ljava/lang/String;
    .param p6, "includeAllThreads"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 907
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    invoke-virtual {v2}, Lcom/crashlytics/android/Crashlytics;->getContext()Landroid/content/Context;

    move-result-object v25

    .line 908
    .local v25, "context":Landroid/content/Context;
    invoke-virtual/range {p2 .. p2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    const-wide/16 v6, 0x3e8

    div-long v4, v2, v6

    .line 909
    .local v4, "eventTime":J
    invoke-static/range {v25 .. v25}, Lio/fabric/sdk/android/services/common/CommonUtils;->getBatteryLevel(Landroid/content/Context;)F

    move-result v10

    .line 910
    .local v10, "batteryLevel":F
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->powerConnected:Z

    move-object/from16 v0, v25

    invoke-static {v0, v2}, Lio/fabric/sdk/android/services/common/CommonUtils;->getBatteryVelocity(Landroid/content/Context;Z)I

    move-result v11

    .line 911
    .local v11, "batteryVelocity":I
    invoke-static/range {v25 .. v25}, Lio/fabric/sdk/android/services/common/CommonUtils;->getProximitySensorEnabled(Landroid/content/Context;)Z

    move-result v12

    .line 912
    .local v12, "proximityEnabled":Z
    invoke-virtual/range {v25 .. v25}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v13, v2, Landroid/content/res/Configuration;->orientation:I

    .line 913
    .local v13, "orientation":I
    invoke-static {}, Lio/fabric/sdk/android/services/common/CommonUtils;->getTotalRamInBytes()J

    move-result-wide v2

    invoke-static/range {v25 .. v25}, Lio/fabric/sdk/android/services/common/CommonUtils;->calculateFreeRamInBytes(Landroid/content/Context;)J

    move-result-wide v6

    sub-long v14, v2, v6

    .line 915
    .local v14, "usedRamBytes":J
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lio/fabric/sdk/android/services/common/CommonUtils;->calculateUsedDiskSpaceInBytes(Ljava/lang/String;)J

    move-result-wide v16

    .line 918
    .local v16, "diskUsedBytes":J
    invoke-virtual/range {v25 .. v25}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v25

    invoke-static {v2, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->getAppProcessInfo(Ljava/lang/String;Landroid/content/Context;)Landroid/app/ActivityManager$RunningAppProcessInfo;

    move-result-object v18

    .line 920
    .local v18, "runningAppProcessInfo":Landroid/app/ActivityManager$RunningAppProcessInfo;
    new-instance v19, Ljava/util/LinkedList;

    invoke-direct/range {v19 .. v19}, Ljava/util/LinkedList;-><init>()V

    .line 921
    .local v19, "stacks":Ljava/util/List;, "Ljava/util/List<[Ljava/lang/StackTraceElement;>;"
    invoke-virtual/range {p4 .. p4}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v20

    .line 924
    .local v20, "exceptionStack":[Ljava/lang/StackTraceElement;
    if-eqz p6, :cond_0

    .line 925
    invoke-static {}, Ljava/lang/Thread;->getAllStackTraces()Ljava/util/Map;

    move-result-object v23

    .line 926
    .local v23, "allStackTraces":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Thread;[Ljava/lang/StackTraceElement;>;"
    invoke-interface/range {v23 .. v23}, Ljava/util/Map;->size()I

    move-result v2

    new-array v9, v2, [Ljava/lang/Thread;

    .line 927
    .local v9, "threads":[Ljava/lang/Thread;
    const/16 v27, 0x0

    .line 928
    .local v27, "i":I
    invoke-interface/range {v23 .. v23}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v28

    .local v28, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface/range {v28 .. v28}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface/range {v28 .. v28}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Ljava/util/Map$Entry;

    .line 929
    .local v26, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Thread;[Ljava/lang/StackTraceElement;>;"
    invoke-interface/range {v26 .. v26}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Thread;

    aput-object v2, v9, v27

    .line 930
    invoke-interface/range {v26 .. v26}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, v19

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 931
    add-int/lit8 v27, v27, 0x1

    .line 932
    goto :goto_0

    .line 936
    .end local v9    # "threads":[Ljava/lang/Thread;
    .end local v23    # "allStackTraces":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Thread;[Ljava/lang/StackTraceElement;>;"
    .end local v26    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Thread;[Ljava/lang/StackTraceElement;>;"
    .end local v27    # "i":I
    .end local v28    # "i$":Ljava/util/Iterator;
    :cond_0
    const/4 v2, 0x0

    new-array v9, v2, [Ljava/lang/Thread;

    .line 940
    .restart local v9    # "threads":[Ljava/lang/Thread;
    :cond_1
    const-string v2, "com.crashlytics.CollectCustomKeys"

    const/4 v3, 0x1

    move-object/from16 v0, v25

    invoke-static {v0, v2, v3}, Lio/fabric/sdk/android/services/common/CommonUtils;->getBooleanResourceValue(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_3

    .line 941
    new-instance v22, Ljava/util/TreeMap;

    invoke-direct/range {v22 .. v22}, Ljava/util/TreeMap;-><init>()V

    .line 952
    .local v22, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    :goto_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->sessionDataWriter:Lcom/crashlytics/android/SessionDataWriter;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->logFileManager:Lcom/crashlytics/android/LogFileManager;

    invoke-virtual {v3}, Lcom/crashlytics/android/LogFileManager;->getLogFile()Lio/fabric/sdk/android/services/common/QueueFile;

    move-result-object v21

    move-object/from16 v3, p1

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    invoke-virtual/range {v2 .. v22}, Lcom/crashlytics/android/SessionDataWriter;->writeSessionEvent(Lcom/crashlytics/android/CodedOutputStream;JLjava/lang/Thread;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Thread;FIZIJJLandroid/app/ActivityManager$RunningAppProcessInfo;Ljava/util/List;[Ljava/lang/StackTraceElement;Lio/fabric/sdk/android/services/common/QueueFile;Ljava/util/Map;)V

    .line 956
    return-void

    .line 943
    .end local v22    # "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    invoke-virtual {v2}, Lcom/crashlytics/android/Crashlytics;->getAttributes()Ljava/util/Map;

    move-result-object v22

    .line 944
    .restart local v22    # "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v22, :cond_2

    invoke-interface/range {v22 .. v22}, Ljava/util/Map;->size()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_2

    .line 948
    new-instance v24, Ljava/util/TreeMap;

    move-object/from16 v0, v24

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    .end local v22    # "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local v24, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    move-object/from16 v22, v24

    .end local v24    # "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v22    # "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_1
.end method

.method private writeSessionOS(Ljava/lang/String;)V
    .locals 8
    .param p1, "sessionId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 823
    const/4 v2, 0x0

    .line 824
    .local v2, "fos":Ljava/io/FileOutputStream;
    const/4 v0, 0x0

    .line 827
    .local v0, "cos":Lcom/crashlytics/android/CodedOutputStream;
    :try_start_0
    new-instance v3, Lcom/crashlytics/android/ClsFileOutputStream;

    iget-object v5, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->filesDir:Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "SessionOS"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v5, v6}, Lcom/crashlytics/android/ClsFileOutputStream;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 829
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .local v3, "fos":Ljava/io/FileOutputStream;
    :try_start_1
    invoke-static {v3}, Lcom/crashlytics/android/CodedOutputStream;->newInstance(Ljava/io/OutputStream;)Lcom/crashlytics/android/CodedOutputStream;

    move-result-object v0

    .line 831
    iget-object v5, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    invoke-virtual {v5}, Lcom/crashlytics/android/Crashlytics;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lio/fabric/sdk/android/services/common/CommonUtils;->isRooted(Landroid/content/Context;)Z

    move-result v4

    .line 833
    .local v4, "isRooted":Z
    iget-object v5, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->sessionDataWriter:Lcom/crashlytics/android/SessionDataWriter;

    invoke-virtual {v5, v0, v4}, Lcom/crashlytics/android/SessionDataWriter;->writeSessionOS(Lcom/crashlytics/android/CodedOutputStream;Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 838
    const-string v5, "Failed to flush to session OS file."

    invoke-static {v0, v5}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 839
    const-string v5, "Failed to close session OS file."

    invoke-static {v3, v5}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    .line 841
    return-void

    .line 834
    .end local v3    # "fos":Ljava/io/FileOutputStream;
    .end local v4    # "isRooted":Z
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v1

    .line 835
    .local v1, "e":Ljava/lang/Exception;
    :goto_0
    :try_start_2
    invoke-static {v1, v2}, Lcom/crashlytics/android/ExceptionUtils;->writeStackTraceIfNotNull(Ljava/lang/Throwable;Ljava/io/OutputStream;)V

    .line 836
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 838
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    :goto_1
    const-string v6, "Failed to flush to session OS file."

    invoke-static {v0, v6}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 839
    const-string v6, "Failed to close session OS file."

    invoke-static {v2, v6}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    throw v5

    .line 838
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fos":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v5

    move-object v2, v3

    .end local v3    # "fos":Ljava/io/FileOutputStream;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    goto :goto_1

    .line 834
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fos":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3    # "fos":Ljava/io/FileOutputStream;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    goto :goto_0
.end method

.method private writeSessionPartsToSessionFile(Ljava/io/File;Ljava/lang/String;I)V
    .locals 20
    .param p1, "sessionBeginFile"    # Ljava/io/File;
    .param p2, "sessionId"    # Ljava/lang/String;
    .param p3, "maxLoggedExceptionsCount"    # I

    .prologue
    .line 1019
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v13

    const-string v14, "Fabric"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Collecting session parts for ID "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v13, v14, v15}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1021
    new-instance v13, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$FileNameContainsFilter;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "SessionCrash"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$FileNameContainsFilter;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->listFilesMatching(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v7

    .line 1023
    .local v7, "fatalFiles":[Ljava/io/File;
    if-eqz v7, :cond_4

    array-length v13, v7

    if-lez v13, :cond_4

    const/4 v10, 0x1

    .line 1024
    .local v10, "hasFatal":Z
    :goto_0
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v13

    const-string v14, "Fabric"

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v16, "Session %s has fatal exception: %s"

    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aput-object p2, v17, v18

    const/16 v18, 0x1

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v19

    aput-object v19, v17, v18

    invoke-static/range {v15 .. v17}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-interface {v13, v14, v15}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1027
    new-instance v13, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$FileNameContainsFilter;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "SessionEvent"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$FileNameContainsFilter;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->listFilesMatching(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v12

    .line 1029
    .local v12, "nonFatalFiles":[Ljava/io/File;
    if-eqz v12, :cond_5

    array-length v13, v12

    if-lez v13, :cond_5

    const/4 v11, 0x1

    .line 1030
    .local v11, "hasNonFatal":Z
    :goto_1
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v13

    const-string v14, "Fabric"

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v16, "Session %s has non-fatal exceptions: %s"

    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aput-object p2, v17, v18

    const/16 v18, 0x1

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v19

    aput-object v19, v17, v18

    invoke-static/range {v15 .. v17}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-interface {v13, v14, v15}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1033
    if-nez v10, :cond_0

    if-eqz v11, :cond_9

    .line 1034
    :cond_0
    const/4 v8, 0x0

    .line 1035
    .local v8, "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    const/4 v4, 0x0

    .line 1036
    .local v4, "cos":Lcom/crashlytics/android/CodedOutputStream;
    const/4 v6, 0x0

    .line 1039
    .local v6, "exceptionDuringWrite":Z
    :try_start_0
    new-instance v9, Lcom/crashlytics/android/ClsFileOutputStream;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->filesDir:Ljava/io/File;

    move-object/from16 v0, p2

    invoke-direct {v9, v13, v0}, Lcom/crashlytics/android/ClsFileOutputStream;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1040
    .end local v8    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .local v9, "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :try_start_1
    invoke-static {v9}, Lcom/crashlytics/android/CodedOutputStream;->newInstance(Ljava/io/OutputStream;)Lcom/crashlytics/android/CodedOutputStream;

    move-result-object v4

    .line 1042
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v13

    const-string v14, "Fabric"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Collecting SessionStart data for session ID "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v13, v14, v15}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1044
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v4, v1}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeToCosFromFile(Lcom/crashlytics/android/CodedOutputStream;Ljava/io/File;)V

    .line 1046
    const/4 v13, 0x4

    new-instance v14, Ljava/util/Date;

    invoke-direct {v14}, Ljava/util/Date;-><init>()V

    invoke-virtual {v14}, Ljava/util/Date;->getTime()J

    move-result-wide v14

    const-wide/16 v16, 0x3e8

    div-long v14, v14, v16

    invoke-virtual {v4, v13, v14, v15}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt64(IJ)V

    .line 1047
    const/4 v13, 0x5

    invoke-virtual {v4, v13, v10}, Lcom/crashlytics/android/CodedOutputStream;->writeBool(IZ)V

    .line 1049
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v4, v1}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeInitialPartsTo(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/String;)V

    .line 1051
    if-eqz v11, :cond_2

    .line 1052
    array-length v13, v12

    move/from16 v0, p3

    if-le v13, v0, :cond_1

    .line 1053
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v13

    const-string v14, "Fabric"

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v16, "Trimming down to %d logged exceptions."

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    aput-object v19, v17, v18

    invoke-static/range {v15 .. v17}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-interface {v13, v14, v15}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1056
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->trimSessionEventFiles(Ljava/lang/String;I)V

    .line 1057
    new-instance v13, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$FileNameContainsFilter;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "SessionEvent"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$FileNameContainsFilter;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->listFilesMatching(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v12

    .line 1061
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v4, v12, v1}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeNonFatalEventsTo(Lcom/crashlytics/android/CodedOutputStream;[Ljava/io/File;Ljava/lang/String;)V

    .line 1064
    :cond_2
    if-eqz v10, :cond_3

    .line 1065
    const/4 v13, 0x0

    aget-object v13, v7, v13

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v13}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeToCosFromFile(Lcom/crashlytics/android/CodedOutputStream;Ljava/io/File;)V

    .line 1068
    :cond_3
    const/16 v13, 0xb

    const/4 v14, 0x1

    invoke-virtual {v4, v13, v14}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt32(II)V

    .line 1070
    const/16 v13, 0xc

    const/4 v14, 0x3

    invoke-virtual {v4, v13, v14}, Lcom/crashlytics/android/CodedOutputStream;->writeEnum(II)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1080
    const-string v13, "Error flushing session file stream"

    invoke-static {v4, v13}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 1082
    if-eqz v6, :cond_6

    .line 1085
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->closeWithoutRenamingOrLog(Lcom/crashlytics/android/ClsFileOutputStream;)V

    move-object v8, v9

    .line 1096
    .end local v4    # "cos":Lcom/crashlytics/android/CodedOutputStream;
    .end local v6    # "exceptionDuringWrite":Z
    .end local v9    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :goto_2
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v13

    const-string v14, "Fabric"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Removing session part files for ID "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v13, v14, v15}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1097
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->deleteSessionPartFilesFor(Ljava/lang/String;)V

    .line 1098
    return-void

    .line 1023
    .end local v10    # "hasFatal":Z
    .end local v11    # "hasNonFatal":Z
    .end local v12    # "nonFatalFiles":[Ljava/io/File;
    :cond_4
    const/4 v10, 0x0

    goto/16 :goto_0

    .line 1029
    .restart local v10    # "hasFatal":Z
    .restart local v12    # "nonFatalFiles":[Ljava/io/File;
    :cond_5
    const/4 v11, 0x0

    goto/16 :goto_1

    .line 1089
    .restart local v4    # "cos":Lcom/crashlytics/android/CodedOutputStream;
    .restart local v6    # "exceptionDuringWrite":Z
    .restart local v9    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v11    # "hasNonFatal":Z
    :cond_6
    const-string v13, "Failed to close CLS file"

    invoke-static {v9, v13}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    move-object v8, v9

    .line 1091
    .end local v9    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v8    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    goto :goto_2

    .line 1071
    :catch_0
    move-exception v5

    .line 1072
    .local v5, "e":Ljava/lang/Exception;
    :goto_3
    :try_start_2
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v13

    const-string v14, "Fabric"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Failed to write session file for session ID: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v13, v14, v15, v5}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1074
    invoke-static {v5, v8}, Lcom/crashlytics/android/ExceptionUtils;->writeStackTraceIfNotNull(Ljava/lang/Throwable;Ljava/io/OutputStream;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1077
    const/4 v6, 0x1

    .line 1080
    const-string v13, "Error flushing session file stream"

    invoke-static {v4, v13}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 1082
    if-eqz v6, :cond_7

    .line 1085
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->closeWithoutRenamingOrLog(Lcom/crashlytics/android/ClsFileOutputStream;)V

    goto :goto_2

    .line 1089
    :cond_7
    const-string v13, "Failed to close CLS file"

    invoke-static {v8, v13}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    goto :goto_2

    .line 1080
    .end local v5    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v13

    :goto_4
    const-string v14, "Error flushing session file stream"

    invoke-static {v4, v14}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 1082
    if-eqz v6, :cond_8

    .line 1085
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->closeWithoutRenamingOrLog(Lcom/crashlytics/android/ClsFileOutputStream;)V

    .line 1089
    :goto_5
    throw v13

    :cond_8
    const-string v14, "Failed to close CLS file"

    invoke-static {v8, v14}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    goto :goto_5

    .line 1093
    .end local v4    # "cos":Lcom/crashlytics/android/CodedOutputStream;
    .end local v6    # "exceptionDuringWrite":Z
    .end local v8    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :cond_9
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v13

    const-string v14, "Fabric"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "No events present for session ID "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v13, v14, v15}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 1080
    .restart local v4    # "cos":Lcom/crashlytics/android/CodedOutputStream;
    .restart local v6    # "exceptionDuringWrite":Z
    .restart local v9    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :catchall_1
    move-exception v13

    move-object v8, v9

    .end local v9    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v8    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    goto :goto_4

    .line 1071
    .end local v8    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v9    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    :catch_1
    move-exception v5

    move-object v8, v9

    .end local v9    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    .restart local v8    # "fos":Lcom/crashlytics/android/ClsFileOutputStream;
    goto :goto_3
.end method

.method private writeSessionUser(Ljava/lang/String;)V
    .locals 10
    .param p1, "sessionId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 879
    const/4 v3, 0x0

    .line 880
    .local v3, "fos":Ljava/io/FileOutputStream;
    const/4 v0, 0x0

    .line 882
    .local v0, "cos":Lcom/crashlytics/android/CodedOutputStream;
    :try_start_0
    new-instance v4, Lcom/crashlytics/android/ClsFileOutputStream;

    iget-object v7, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->filesDir:Ljava/io/File;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "SessionUser"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v7, v8}, Lcom/crashlytics/android/ClsFileOutputStream;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 883
    .end local v3    # "fos":Ljava/io/FileOutputStream;
    .local v4, "fos":Ljava/io/FileOutputStream;
    :try_start_1
    invoke-static {v4}, Lcom/crashlytics/android/CodedOutputStream;->newInstance(Ljava/io/OutputStream;)Lcom/crashlytics/android/CodedOutputStream;

    move-result-object v0

    .line 885
    iget-object v7, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    invoke-virtual {v7}, Lcom/crashlytics/android/Crashlytics;->getUserIdentifier()Ljava/lang/String;

    move-result-object v5

    .line 886
    .local v5, "id":Ljava/lang/String;
    iget-object v7, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    invoke-virtual {v7}, Lcom/crashlytics/android/Crashlytics;->getUserName()Ljava/lang/String;

    move-result-object v6

    .line 887
    .local v6, "name":Ljava/lang/String;
    iget-object v7, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    invoke-virtual {v7}, Lcom/crashlytics/android/Crashlytics;->getUserEmail()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v2

    .line 890
    .local v2, "email":Ljava/lang/String;
    if-nez v5, :cond_0

    if-nez v6, :cond_0

    if-nez v2, :cond_0

    .line 899
    const-string v7, "Failed to flush session user file."

    invoke-static {v0, v7}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 900
    const-string v7, "Failed to close session user file."

    invoke-static {v4, v7}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    .line 902
    :goto_0
    return-void

    .line 894
    :cond_0
    :try_start_2
    iget-object v7, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->sessionDataWriter:Lcom/crashlytics/android/SessionDataWriter;

    invoke-virtual {v7, v0, v5, v6, v2}, Lcom/crashlytics/android/SessionDataWriter;->writeSessionUser(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 899
    const-string v7, "Failed to flush session user file."

    invoke-static {v0, v7}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 900
    const-string v7, "Failed to close session user file."

    invoke-static {v4, v7}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    goto :goto_0

    .line 895
    .end local v2    # "email":Ljava/lang/String;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .end local v5    # "id":Ljava/lang/String;
    .end local v6    # "name":Ljava/lang/String;
    .restart local v3    # "fos":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v1

    .line 896
    .local v1, "e":Ljava/lang/Exception;
    :goto_1
    :try_start_3
    invoke-static {v1, v3}, Lcom/crashlytics/android/ExceptionUtils;->writeStackTraceIfNotNull(Ljava/lang/Throwable;Ljava/io/OutputStream;)V

    .line 897
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 899
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    :goto_2
    const-string v8, "Failed to flush session user file."

    invoke-static {v0, v8}, Lio/fabric/sdk/android/services/common/CommonUtils;->flushOrLog(Ljava/io/Flushable;Ljava/lang/String;)V

    .line 900
    const-string v8, "Failed to close session user file."

    invoke-static {v3, v8}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    throw v7

    .line 899
    .end local v3    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v7

    move-object v3, v4

    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fos":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 895
    .end local v3    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v1

    move-object v3, v4

    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fos":Ljava/io/FileOutputStream;
    goto :goto_1
.end method

.method private writeToCosFromFile(Lcom/crashlytics/android/CodedOutputStream;Ljava/io/File;)V
    .locals 11
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .param p2, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1140
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1142
    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 1143
    .local v4, "length":J
    long-to-int v7, v4

    new-array v0, v7, [B

    .line 1145
    .local v0, "bytes":[B
    const/4 v1, 0x0

    .line 1148
    .local v1, "fis":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1150
    .end local v1    # "fis":Ljava/io/FileInputStream;
    .local v2, "fis":Ljava/io/FileInputStream;
    const/4 v6, 0x0

    .line 1151
    .local v6, "offset":I
    const/4 v3, 0x0

    .line 1153
    .local v3, "numRead":I
    :goto_0
    :try_start_1
    array-length v7, v0

    if-ge v6, v7, :cond_0

    array-length v7, v0

    sub-int/2addr v7, v6

    invoke-virtual {v2, v0, v6, v7}, Ljava/io/FileInputStream;->read([BII)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v3

    if-ltz v3, :cond_0

    .line 1155
    add-int/2addr v6, v3

    goto :goto_0

    .line 1158
    :cond_0
    const-string v7, "Failed to close file input stream."

    invoke-static {v2, v7}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    .line 1161
    invoke-virtual {p1, v0}, Lcom/crashlytics/android/CodedOutputStream;->writeRawBytes([B)V

    .line 1166
    .end local v0    # "bytes":[B
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v3    # "numRead":I
    .end local v4    # "length":J
    .end local v6    # "offset":I
    :goto_1
    return-void

    .line 1158
    .restart local v0    # "bytes":[B
    .restart local v1    # "fis":Ljava/io/FileInputStream;
    .restart local v4    # "length":J
    :catchall_0
    move-exception v7

    :goto_2
    const-string v8, "Failed to close file input stream."

    invoke-static {v1, v8}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    throw v7

    .line 1163
    .end local v0    # "bytes":[B
    .end local v1    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "length":J
    :cond_1
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v7

    const-string v8, "Fabric"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Tried to include a file that doesn\'t exist: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    invoke-interface {v7, v8, v9, v10}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 1158
    .restart local v0    # "bytes":[B
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v3    # "numRead":I
    .restart local v4    # "length":J
    .restart local v6    # "offset":I
    :catchall_1
    move-exception v7

    move-object v1, v2

    .end local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v1    # "fis":Ljava/io/FileInputStream;
    goto :goto_2
.end method


# virtual methods
.method cleanInvalidTempFiles()V
    .locals 2

    .prologue
    .line 714
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->executorServiceWrapper:Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;

    new-instance v1, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$12;

    invoke-direct {v1, p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$12;-><init>(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;)V

    invoke-virtual {v0, v1}, Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;->executeAsync(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 721
    return-void
.end method

.method doCleanInvalidTempFiles([Ljava/io/File;)V
    .locals 14
    .param p1, "invalidFiles"    # [Ljava/io/File;

    .prologue
    .line 729
    invoke-direct {p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->deleteLegacyInvalidCacheDir()V

    .line 734
    move-object v0, p1

    .local v0, "arr$":[Ljava/io/File;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    move v3, v2

    .end local v0    # "arr$":[Ljava/io/File;
    .end local v2    # "i$":I
    .end local v5    # "len$":I
    .local v3, "i$":I
    :goto_0
    if-ge v3, v5, :cond_1

    aget-object v4, v0, v3

    .line 735
    .local v4, "invalidFile":Ljava/io/File;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v10

    const-string v11, "Fabric"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Found invalid session part file: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v10, v11, v12}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 737
    invoke-direct {p0, v4}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->getSessionIdFromSessionFile(Ljava/io/File;)Ljava/lang/String;

    move-result-object v9

    .line 738
    .local v9, "sessionId":Ljava/lang/String;
    new-instance v8, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$13;

    invoke-direct {v8, p0, v9}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$13;-><init>(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;Ljava/lang/String;)V

    .line 745
    .local v8, "sessionFilter":Ljava/io/FilenameFilter;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v10

    const-string v11, "Fabric"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Deleting all part files for invalid session: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v10, v11, v12}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 747
    invoke-direct {p0, v8}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->listFilesMatching(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v1

    .local v1, "arr$":[Ljava/io/File;
    array-length v6, v1

    .local v6, "len$":I
    const/4 v2, 0x0

    .end local v3    # "i$":I
    .restart local v2    # "i$":I
    :goto_1
    if-ge v2, v6, :cond_0

    aget-object v7, v1, v2

    .line 748
    .local v7, "sessionFile":Ljava/io/File;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v10

    const-string v11, "Fabric"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Deleting session file: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v10, v11, v12}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 749
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 747
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 734
    .end local v7    # "sessionFile":Ljava/io/File;
    :cond_0
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    .end local v2    # "i$":I
    .restart local v3    # "i$":I
    goto :goto_0

    .line 752
    .end local v1    # "arr$":[Ljava/io/File;
    .end local v4    # "invalidFile":Ljava/io/File;
    .end local v6    # "len$":I
    .end local v8    # "sessionFilter":Ljava/io/FilenameFilter;
    .end local v9    # "sessionId":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method ensureOpenSessionExists()V
    .locals 2

    .prologue
    .line 452
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->executorServiceWrapper:Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;

    new-instance v1, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$10;

    invoke-direct {v1, p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$10;-><init>(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;)V

    invoke-virtual {v0, v1}, Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;->executeAsync(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 461
    return-void
.end method

.method finalizeSessions()Z
    .locals 2

    .prologue
    .line 513
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->executorServiceWrapper:Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;

    new-instance v1, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$11;

    invoke-direct {v1, p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$11;-><init>(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;)V

    invoke-virtual {v0, v1}, Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;->executeSyncLoggingException(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method hasOpenSession()Z
    .locals 1

    .prologue
    .line 495
    invoke-virtual {p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->listSessionBeginFiles()[Ljava/io/File;

    move-result-object v0

    array-length v0, v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isHandlingException()Z
    .locals 1

    .prologue
    .line 310
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->isHandlingException:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method listSessionBeginFiles()[Ljava/io/File;
    .locals 2

    .prologue
    .line 632
    new-instance v0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$FileNameContainsFilter;

    const-string v1, "BeginSession"

    invoke-direct {v0, v1}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$FileNameContainsFilter;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->listFilesMatching(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method trimSessionFiles()V
    .locals 4

    .prologue
    .line 675
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->filesDir:Ljava/io/File;

    sget-object v1, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->SESSION_FILE_FILTER:Ljava/io/FilenameFilter;

    const/4 v2, 0x4

    sget-object v3, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->SMALLEST_FILE_NAME_FIRST:Ljava/util/Comparator;

    invoke-static {v0, v1, v2, v3}, Lcom/crashlytics/android/Utils;->capFileCount(Ljava/io/File;Ljava/io/FilenameFilter;ILjava/util/Comparator;)V

    .line 677
    return-void
.end method

.method public declared-synchronized uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 7
    .param p1, "thread"    # Ljava/lang/Thread;
    .param p2, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 259
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->isHandlingException:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 261
    :try_start_1
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v3

    const-string v4, "Fabric"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Crashlytics is handling uncaught exception \""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\" from thread "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    iget-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->receiversRegistered:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v3

    if-nez v3, :cond_0

    .line 265
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v3

    const-string v4, "Fabric"

    const-string v5, "Unregistering power receivers."

    invoke-interface {v3, v4, v5}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    iget-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;

    invoke-virtual {v3}, Lcom/crashlytics/android/Crashlytics;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 267
    .local v0, "context":Landroid/content/Context;
    iget-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->powerConnectedReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v3}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 268
    iget-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->powerDisconnectedReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v3}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 273
    .end local v0    # "context":Landroid/content/Context;
    :cond_0
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 274
    .local v2, "now":Ljava/util/Date;
    iget-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->executorServiceWrapper:Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;

    new-instance v4, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$7;

    invoke-direct {v4, p0, v2, p1, p2}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$7;-><init>(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;Ljava/util/Date;Ljava/lang/Thread;Ljava/lang/Throwable;)V

    invoke-virtual {v3, v4}, Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;->executeSyncLoggingException(Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 285
    :try_start_2
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v3

    const-string v4, "Fabric"

    const-string v5, "Crashlytics completed exception processing. Invoking default exception handler."

    invoke-interface {v3, v4, v5}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    iget-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->defaultHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v3, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 289
    iget-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->isHandlingException:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 291
    .end local v2    # "now":Ljava/util/Date;
    :goto_0
    monitor-exit p0

    return-void

    .line 281
    :catch_0
    move-exception v1

    .line 282
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v3

    const-string v4, "Fabric"

    const-string v5, "An error occurred in the uncaught exception handler"

    invoke-interface {v3, v4, v5, v1}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 285
    :try_start_4
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v3

    const-string v4, "Fabric"

    const-string v5, "Crashlytics completed exception processing. Invoking default exception handler."

    invoke-interface {v3, v4, v5}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    iget-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->defaultHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v3, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 289
    iget-object v3, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->isHandlingException:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 259
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 285
    :catchall_1
    move-exception v3

    :try_start_5
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v4

    const-string v5, "Fabric"

    const-string v6, "Crashlytics completed exception processing. Invoking default exception handler."

    invoke-interface {v4, v5, v6}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    iget-object v4, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->defaultHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v4, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 289
    iget-object v4, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->isHandlingException:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    throw v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
.end method

.method writeNonFatalException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "thread"    # Ljava/lang/Thread;
    .param p2, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 362
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 364
    .local v0, "now":Ljava/util/Date;
    iget-object v1, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->executorServiceWrapper:Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;

    new-instance v2, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$9;

    invoke-direct {v2, p0, v0, p1, p2}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$9;-><init>(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;Ljava/util/Date;Ljava/lang/Thread;Ljava/lang/Throwable;)V

    invoke-virtual {v1, v2}, Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;->executeAsync(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 372
    return-void
.end method

.method writeToLog(JLjava/lang/String;)V
    .locals 3
    .param p1, "timestamp"    # J
    .param p3, "msg"    # Ljava/lang/String;

    .prologue
    .line 345
    iget-object v0, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->executorServiceWrapper:Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;

    new-instance v1, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$8;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$8;-><init>(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;JLjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/crashlytics/android/CrashlyticsExecutorServiceWrapper;->executeAsync(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 354
    return-void
.end method
