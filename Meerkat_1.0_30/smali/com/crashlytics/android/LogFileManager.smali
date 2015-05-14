.class Lcom/crashlytics/android/LogFileManager;
.super Ljava/lang/Object;
.source "LogFileManager.java"


# static fields
.field static final MAX_LOG_SIZE:I = 0x10000


# instance fields
.field private final context:Landroid/content/Context;

.field private final filesDir:Ljava/io/File;

.field private logFile:Lio/fabric/sdk/android/services/common/QueueFile;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/io/File;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "filesDir"    # Ljava/io/File;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/crashlytics/android/LogFileManager;->context:Landroid/content/Context;

    .line 30
    iput-object p2, p0, Lcom/crashlytics/android/LogFileManager;->filesDir:Ljava/io/File;

    .line 31
    return-void
.end method

.method static getByteStringForLog(Lio/fabric/sdk/android/services/common/QueueFile;)Lcom/crashlytics/android/ByteString;
    .locals 7
    .param p0, "logFile"    # Lio/fabric/sdk/android/services/common/QueueFile;

    .prologue
    const/4 v6, 0x0

    .line 150
    if-nez p0, :cond_0

    .line 151
    const/4 v3, 0x0

    .line 178
    :goto_0
    return-object v3

    .line 157
    :cond_0
    const/4 v3, 0x1

    new-array v2, v3, [I

    aput v6, v2, v6

    .line 159
    .local v2, "offsetHolder":[I
    invoke-virtual {p0}, Lio/fabric/sdk/android/services/common/QueueFile;->usedBytes()I

    move-result v3

    new-array v1, v3, [B

    .line 162
    .local v1, "logBytes":[B
    :try_start_0
    new-instance v3, Lcom/crashlytics/android/LogFileManager$1;

    invoke-direct {v3, v1, v2}, Lcom/crashlytics/android/LogFileManager$1;-><init>([B[I)V

    invoke-virtual {p0, v3}, Lio/fabric/sdk/android/services/common/QueueFile;->forEach(Lio/fabric/sdk/android/services/common/QueueFile$ElementReader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    :goto_1
    aget v3, v2, v6

    invoke-static {v1, v6, v3}, Lcom/crashlytics/android/ByteString;->copyFrom([BII)Lcom/crashlytics/android/ByteString;

    move-result-object v3

    goto :goto_0

    .line 173
    :catch_0
    move-exception v0

    .line 174
    .local v0, "e":Ljava/io/IOException;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v3

    const-string v4, "Fabric"

    const-string v5, "A problem occurred while reading the Crashlytics log file."

    invoke-interface {v3, v4, v5, v0}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private initLogFile()Z
    .locals 10

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 57
    iget-object v7, p0, Lcom/crashlytics/android/LogFileManager;->context:Landroid/content/Context;

    const-string v8, "com.crashlytics.CollectCustomLogs"

    invoke-static {v7, v8, v6}, Lio/fabric/sdk/android/services/common/CommonUtils;->getBooleanResourceValue(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    .line 61
    .local v0, "collectLogs":Z
    if-nez v0, :cond_0

    .line 62
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v6

    const-string v7, "Fabric"

    const-string v8, "Preferences requested no custom logs. Aborting log file creation."

    invoke-interface {v6, v7, v8}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    :goto_0
    return v5

    .line 68
    :cond_0
    iget-object v7, p0, Lcom/crashlytics/android/LogFileManager;->logFile:Lio/fabric/sdk/android/services/common/QueueFile;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Could not close log file: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/crashlytics/android/LogFileManager;->logFile:Lio/fabric/sdk/android/services/common/QueueFile;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    .line 70
    const/4 v2, 0x0

    .line 81
    .local v2, "f":Ljava/io/File;
    :try_start_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "crashlytics-userlog-"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".temp"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 82
    .local v4, "filename":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    iget-object v7, p0, Lcom/crashlytics/android/LogFileManager;->filesDir:Ljava/io/File;

    invoke-direct {v3, v7, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    .end local v2    # "f":Ljava/io/File;
    .local v3, "f":Ljava/io/File;
    :try_start_1
    new-instance v7, Lio/fabric/sdk/android/services/common/QueueFile;

    invoke-direct {v7, v3}, Lio/fabric/sdk/android/services/common/QueueFile;-><init>(Ljava/io/File;)V

    iput-object v7, p0, Lcom/crashlytics/android/LogFileManager;->logFile:Lio/fabric/sdk/android/services/common/QueueFile;

    .line 84
    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move v5, v6

    .line 90
    goto :goto_0

    .line 85
    .end local v3    # "f":Ljava/io/File;
    .end local v4    # "filename":Ljava/lang/String;
    .restart local v2    # "f":Ljava/io/File;
    :catch_0
    move-exception v1

    .line 86
    .local v1, "e":Ljava/lang/Exception;
    :goto_1
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v6

    const-string v7, "Fabric"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Could not create log file: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8, v1}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 85
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "f":Ljava/io/File;
    .restart local v3    # "f":Ljava/io/File;
    .restart local v4    # "filename":Ljava/lang/String;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3    # "f":Ljava/io/File;
    .restart local v2    # "f":Ljava/io/File;
    goto :goto_1
.end method


# virtual methods
.method doWriteToLog(Lio/fabric/sdk/android/services/common/QueueFile;IJLjava/lang/String;)V
    .locals 9
    .param p1, "logFile"    # Lio/fabric/sdk/android/services/common/QueueFile;
    .param p2, "maxLogSize"    # I
    .param p3, "timestamp"    # J
    .param p5, "msg"    # Ljava/lang/String;

    .prologue
    .line 97
    if-nez p1, :cond_1

    .line 143
    :cond_0
    :goto_0
    return-void

    .line 100
    :cond_1
    if-nez p5, :cond_2

    .line 101
    const-string p5, "null"

    .line 121
    :cond_2
    :try_start_0
    div-int/lit8 v2, p2, 0x4

    .line 123
    .local v2, "quarterMaxLogSize":I
    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v2, :cond_3

    .line 124
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "..."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {p5, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    .line 127
    :cond_3
    const-string v3, "\r"

    const-string v4, " "

    invoke-virtual {p5, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p5

    .line 128
    const-string v3, "\n"

    const-string v4, " "

    invoke-virtual {p5, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p5

    .line 130
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "%d %s%n"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    aput-object p5, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "UTF-8"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 133
    .local v1, "msgBytes":[B
    invoke-virtual {p1, v1}, Lio/fabric/sdk/android/services/common/QueueFile;->add([B)V

    .line 136
    :goto_1
    invoke-virtual {p1}, Lio/fabric/sdk/android/services/common/QueueFile;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {p1}, Lio/fabric/sdk/android/services/common/QueueFile;->usedBytes()I

    move-result v3

    if-le v3, p2, :cond_0

    .line 137
    invoke-virtual {p1}, Lio/fabric/sdk/android/services/common/QueueFile;->remove()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 139
    .end local v1    # "msgBytes":[B
    .end local v2    # "quarterMaxLogSize":I
    :catch_0
    move-exception v0

    .line 140
    .local v0, "e":Ljava/io/IOException;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v3

    const-string v4, "Fabric"

    const-string v5, "There was a problem writing to the Crashlytics log."

    invoke-interface {v3, v4, v5, v0}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method getLogFile()Lio/fabric/sdk/android/services/common/QueueFile;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/crashlytics/android/LogFileManager;->logFile:Lio/fabric/sdk/android/services/common/QueueFile;

    return-object v0
.end method

.method public writeToLog(JLjava/lang/String;)V
    .locals 7
    .param p1, "timestamp"    # J
    .param p3, "msg"    # Ljava/lang/String;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/crashlytics/android/LogFileManager;->logFile:Lio/fabric/sdk/android/services/common/QueueFile;

    if-nez v0, :cond_0

    .line 38
    invoke-direct {p0}, Lcom/crashlytics/android/LogFileManager;->initLogFile()Z

    .line 40
    :cond_0
    iget-object v2, p0, Lcom/crashlytics/android/LogFileManager;->logFile:Lio/fabric/sdk/android/services/common/QueueFile;

    const/high16 v3, 0x10000

    move-object v1, p0

    move-wide v4, p1

    move-object v6, p3

    invoke-virtual/range {v1 .. v6}, Lcom/crashlytics/android/LogFileManager;->doWriteToLog(Lio/fabric/sdk/android/services/common/QueueFile;IJLjava/lang/String;)V

    .line 41
    return-void
.end method
