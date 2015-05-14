.class public final Lcom/instabug/library/util/crash/a;
.super Ljava/lang/Object;
.source "IBUncaughtExceptionHandler.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# instance fields
.field private a:Lcom/instabug/library/interactor/a;

.field private b:Lcom/instabug/library/util/a;

.field private c:Lcom/instabug/library/model/b;

.field private d:Lcom/instabug/library/x;


# direct methods
.method public constructor <init>(Lcom/instabug/library/interactor/a;Lcom/instabug/library/internal/module/d;Lcom/instabug/library/util/a;)V
    .locals 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/instabug/library/util/crash/a;->a:Lcom/instabug/library/interactor/a;

    .line 23
    iput-object p3, p0, Lcom/instabug/library/util/crash/a;->b:Lcom/instabug/library/util/a;

    .line 24
    invoke-virtual {p2}, Lcom/instabug/library/internal/module/d;->d()Lcom/instabug/library/model/b;

    move-result-object v0

    iput-object v0, p0, Lcom/instabug/library/util/crash/a;->c:Lcom/instabug/library/model/b;

    .line 25
    invoke-virtual {p2}, Lcom/instabug/library/internal/module/d;->c()Lcom/instabug/library/x;

    move-result-object v0

    iput-object v0, p0, Lcom/instabug/library/util/crash/a;->d:Lcom/instabug/library/x;

    .line 26
    return-void
.end method

.method static synthetic a(Lcom/instabug/library/util/crash/a;)Lcom/instabug/library/util/a;
    .locals 1

    .prologue
    .line 14
    iget-object v0, p0, Lcom/instabug/library/util/crash/a;->b:Lcom/instabug/library/util/a;

    return-object v0
.end method


# virtual methods
.method public final uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 6

    .prologue
    .line 30
    iget-object v0, p0, Lcom/instabug/library/util/crash/a;->d:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->m()Z

    move-result v0

    if-nez v0, :cond_0

    .line 31
    iget-object v0, p0, Lcom/instabug/library/util/crash/a;->b:Lcom/instabug/library/util/a;

    invoke-interface {v0, p1, p2}, Lcom/instabug/library/util/a;->a(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 76
    :goto_0
    return-void

    .line 33
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Instabug Caught an Unhandled Exception: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 35
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 37
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 38
    const-string v2, "threadName"

    invoke-virtual {p1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 39
    const-string v2, "threadId"

    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    invoke-virtual {v0, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 40
    const-string v2, "threadPriority"

    invoke-virtual {p1}, Ljava/lang/Thread;->getPriority()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 41
    const-string v2, "threadState"

    invoke-virtual {p1}, Ljava/lang/Thread;->getState()Ljava/lang/Thread$State;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread$State;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 43
    const-string v3, "name"

    invoke-virtual {p1}, Ljava/lang/Thread;->getThreadGroup()Ljava/lang/ThreadGroup;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/ThreadGroup;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 44
    const-string v3, "maxPriority"

    invoke-virtual {p1}, Ljava/lang/Thread;->getThreadGroup()Ljava/lang/ThreadGroup;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/ThreadGroup;->getMaxPriority()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 45
    const-string v3, "activeCount"

    invoke-virtual {p1}, Ljava/lang/Thread;->getThreadGroup()Ljava/lang/ThreadGroup;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/ThreadGroup;->activeCount()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 46
    const-string v3, "threadGroup"

    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 48
    const-string v2, "thread"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 49
    const-string v0, "error"

    invoke-static {p2}, Lcom/instabug/library/Instabug$a;->b(Ljava/lang/Throwable;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    :goto_1
    iget-object v0, p0, Lcom/instabug/library/util/crash/a;->d:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->d()Ljava/lang/Runnable;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 56
    :try_start_1
    iget-object v0, p0, Lcom/instabug/library/util/crash/a;->d:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->d()Ljava/lang/Runnable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 61
    :cond_1
    :goto_2
    iget-object v0, p0, Lcom/instabug/library/util/crash/a;->c:Lcom/instabug/library/model/b;

    iget-object v2, p0, Lcom/instabug/library/util/crash/a;->d:Lcom/instabug/library/x;

    invoke-virtual {v2}, Lcom/instabug/library/x;->x()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    const/4 v4, 0x3

    invoke-virtual {v0, v2, v1, v3, v4}, Lcom/instabug/library/model/b;->a(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;I)Lcom/instabug/library/model/a;

    move-result-object v0

    .line 62
    iget-object v1, p0, Lcom/instabug/library/util/crash/a;->a:Lcom/instabug/library/interactor/a;

    new-instance v2, Lcom/instabug/library/util/crash/b;

    invoke-direct {v2, p0, p1, p2}, Lcom/instabug/library/util/crash/b;-><init>(Lcom/instabug/library/util/crash/a;Ljava/lang/Thread;Ljava/lang/Throwable;)V

    invoke-virtual {v1, v0, v2}, Lcom/instabug/library/interactor/a;->a(Lcom/instabug/library/model/a;Lcom/instabug/library/interactor/a$a;)V

    goto/16 :goto_0

    .line 50
    :catch_0
    move-exception v0

    .line 51
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 57
    :catch_1
    move-exception v0

    .line 58
    const-string v2, "Pre sending runnable failed to run."

    invoke-static {v2, v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2
.end method
