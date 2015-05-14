.class public Lcom/instabug/library/util/InstabugLogger;
.super Ljava/lang/Object;
.source "InstabugLogger.java"


# static fields
.field private static final LOG_FORMAT:Ljava/lang/String; = "%1$s\n%2$s"

.field private static mInstance:Lcom/instabug/library/util/InstabugLogger;


# instance fields
.field private final dateFormatter:Ljava/text/SimpleDateFormat;

.field private sb:Ljava/lang/StringBuilder;


# direct methods
.method private constructor <init>()V
    .locals 3

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    .line 20
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "MM-dd HH:MM:SS.sss"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->dateFormatter:Ljava/text/SimpleDateFormat;

    .line 21
    return-void
.end method

.method public static clear()V
    .locals 2

    .prologue
    .line 75
    invoke-static {}, Lcom/instabug/library/util/InstabugLogger;->getInstance()Lcom/instabug/library/util/InstabugLogger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v1, v0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    .line 76
    return-void
.end method

.method public static d(Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 35
    invoke-static {}, Lcom/instabug/library/util/InstabugLogger;->getInstance()Lcom/instabug/library/util/InstabugLogger;

    move-result-object v0

    const/4 v1, 0x3

    invoke-direct {v0, v1, v2, v2, p0}, Lcom/instabug/library/util/InstabugLogger;->log(ILjava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 39
    invoke-static {}, Lcom/instabug/library/util/InstabugLogger;->getInstance()Lcom/instabug/library/util/InstabugLogger;

    move-result-object v0

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p0, p1}, Lcom/instabug/library/util/InstabugLogger;->log(ILjava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    return-void
.end method

.method public static e(Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 59
    invoke-static {}, Lcom/instabug/library/util/InstabugLogger;->getInstance()Lcom/instabug/library/util/InstabugLogger;

    move-result-object v0

    const/4 v1, 0x6

    invoke-direct {v0, v1, v2, v2, p0}, Lcom/instabug/library/util/InstabugLogger;->log(ILjava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 55
    invoke-static {}, Lcom/instabug/library/util/InstabugLogger;->getInstance()Lcom/instabug/library/util/InstabugLogger;

    move-result-object v0

    const/4 v1, 0x6

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p0, p1}, Lcom/instabug/library/util/InstabugLogger;->log(ILjava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .prologue
    .line 67
    invoke-static {}, Lcom/instabug/library/util/InstabugLogger;->getInstance()Lcom/instabug/library/util/InstabugLogger;

    move-result-object v0

    const/4 v1, 0x6

    invoke-direct {v0, v1, p2, p0, p1}, Lcom/instabug/library/util/InstabugLogger;->log(ILjava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3

    .prologue
    .line 63
    invoke-static {}, Lcom/instabug/library/util/InstabugLogger;->getInstance()Lcom/instabug/library/util/InstabugLogger;

    move-result-object v0

    const/4 v1, 0x6

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, v2, p0}, Lcom/instabug/library/util/InstabugLogger;->log(ILjava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    return-void
.end method

.method public static e(Ljava/lang/Throwable;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 51
    invoke-static {}, Lcom/instabug/library/util/InstabugLogger;->getInstance()Lcom/instabug/library/util/InstabugLogger;

    move-result-object v0

    const/4 v1, 0x6

    invoke-direct {v0, v1, p0, v2, v2}, Lcom/instabug/library/util/InstabugLogger;->log(ILjava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    return-void
.end method

.method public static getInstabugLog()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    invoke-static {}, Lcom/instabug/library/util/InstabugLogger;->getInstance()Lcom/instabug/library/util/InstabugLogger;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/util/InstabugLogger;->getLog()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static declared-synchronized getInstance()Lcom/instabug/library/util/InstabugLogger;
    .locals 2

    .prologue
    .line 24
    const-class v1, Lcom/instabug/library/util/InstabugLogger;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/instabug/library/util/InstabugLogger;->mInstance:Lcom/instabug/library/util/InstabugLogger;

    if-nez v0, :cond_0

    .line 25
    new-instance v0, Lcom/instabug/library/util/InstabugLogger;

    invoke-direct {v0}, Lcom/instabug/library/util/InstabugLogger;-><init>()V

    sput-object v0, Lcom/instabug/library/util/InstabugLogger;->mInstance:Lcom/instabug/library/util/InstabugLogger;

    .line 27
    :cond_0
    sget-object v0, Lcom/instabug/library/util/InstabugLogger;->mInstance:Lcom/instabug/library/util/InstabugLogger;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 24
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static i(Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 43
    invoke-static {}, Lcom/instabug/library/util/InstabugLogger;->getInstance()Lcom/instabug/library/util/InstabugLogger;

    move-result-object v0

    const/4 v1, 0x4

    invoke-direct {v0, v1, v2, v2, p0}, Lcom/instabug/library/util/InstabugLogger;->log(ILjava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method private declared-synchronized log(ILjava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .prologue
    .line 86
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/instabug/library/util/InstabugLogger;->dateFormatter:Ljava/text/SimpleDateFormat;

    new-instance v2, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct {v2, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    iget-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    const-string v1, "     "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    packed-switch p1, :pswitch_data_0

    .line 109
    :goto_0
    if-eqz p3, :cond_0

    .line 110
    iget-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    iget-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    :cond_0
    if-nez p2, :cond_1

    .line 115
    iget-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    iget-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 123
    :goto_1
    monitor-exit p0

    return-void

    .line 90
    :pswitch_0
    :try_start_1
    iget-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    const-string v1, "E/ "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 86
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 93
    :pswitch_1
    :try_start_2
    iget-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    const-string v1, "D/ "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 96
    :pswitch_2
    iget-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    const-string v1, "A/ "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 99
    :pswitch_3
    iget-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    const-string v1, "I/ "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 102
    :pswitch_4
    iget-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    const-string v1, "W/ "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 105
    :pswitch_5
    iget-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    const-string v1, "V/ "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 118
    :cond_1
    if-nez p4, :cond_2

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p4

    .line 119
    :cond_2
    invoke-static {p2}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    .line 120
    iget-object v1, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    const-string v2, "%1$s\n%2$s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p4, v3, v4

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    iget-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 88
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_5
        :pswitch_1
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public static log(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 71
    invoke-static {}, Lcom/instabug/library/util/InstabugLogger;->getInstance()Lcom/instabug/library/util/InstabugLogger;

    move-result-object v0

    invoke-direct {v0, p0}, Lcom/instabug/library/util/InstabugLogger;->logMessage(Ljava/lang/String;)V

    .line 72
    return-void
.end method

.method private declared-synchronized logMessage(Ljava/lang/String;)V
    .locals 6

    .prologue
    .line 79
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/instabug/library/util/InstabugLogger;->dateFormatter:Ljava/text/SimpleDateFormat;

    new-instance v2, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct {v2, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    iget-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    iget-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    iget-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    monitor-exit p0

    return-void

    .line 79
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public static w(Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 47
    invoke-static {}, Lcom/instabug/library/util/InstabugLogger;->getInstance()Lcom/instabug/library/util/InstabugLogger;

    move-result-object v0

    const/4 v1, 0x5

    invoke-direct {v0, v1, v2, v2, p0}, Lcom/instabug/library/util/InstabugLogger;->log(ILjava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    return-void
.end method


# virtual methods
.method public getLog()Ljava/lang/String;
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lcom/instabug/library/util/InstabugLogger;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
