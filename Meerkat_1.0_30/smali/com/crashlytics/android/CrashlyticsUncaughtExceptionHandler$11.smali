.class Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$11;
.super Ljava/lang/Object;
.source "CrashlyticsUncaughtExceptionHandler.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->finalizeSessions()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;


# direct methods
.method constructor <init>(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;)V
    .locals 0

    .prologue
    .line 513
    iput-object p1, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$11;->this$0:Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Boolean;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 516
    iget-object v1, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$11;->this$0:Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    # getter for: Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->isHandlingException:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v1}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->access$300(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_1

    .line 517
    iget-object v1, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$11;->this$0:Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    # getter for: Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->crashlytics:Lcom/crashlytics/android/Crashlytics;
    invoke-static {v1}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->access$700(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;)Lcom/crashlytics/android/Crashlytics;

    move-result-object v1

    invoke-virtual {v1}, Lcom/crashlytics/android/Crashlytics;->getExternalCrashEventData()Lcom/crashlytics/android/internal/models/SessionEventData;

    move-result-object v0

    .line 518
    .local v0, "crashEventData":Lcom/crashlytics/android/internal/models/SessionEventData;
    if-eqz v0, :cond_0

    .line 519
    iget-object v1, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$11;->this$0:Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    # invokes: Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->writeExternalCrashEvent(Lcom/crashlytics/android/internal/models/SessionEventData;)V
    invoke-static {v1, v0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->access$800(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;Lcom/crashlytics/android/internal/models/SessionEventData;)V

    .line 521
    :cond_0
    iget-object v1, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$11;->this$0:Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    # invokes: Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->doCloseSessions()V
    invoke-static {v1}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->access$900(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;)V

    .line 522
    iget-object v1, p0, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$11;->this$0:Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;

    # invokes: Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->doOpenSession()V
    invoke-static {v1}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;->access$600(Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler;)V

    .line 523
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const-string v2, "Fabric"

    const-string v3, "Open sessions were closed and a new session was opened."

    invoke-interface {v1, v2, v3}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 525
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 529
    .end local v0    # "crashEventData":Lcom/crashlytics/android/internal/models/SessionEventData;
    :goto_0
    return-object v1

    .line 527
    :cond_1
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const-string v2, "Fabric"

    const-string v3, "Skipping session finalization because a crash has already occurred."

    invoke-interface {v1, v2, v3}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 529
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 513
    invoke-virtual {p0}, Lcom/crashlytics/android/CrashlyticsUncaughtExceptionHandler$11;->call()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
