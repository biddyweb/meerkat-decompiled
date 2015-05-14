.class public final Lcom/instabug/library/internal/module/a;
.super Ljava/lang/Object;
.source "InstabugModule.java"


# instance fields
.field private final a:Landroid/app/Application;

.field private b:Lcom/instabug/library/a;

.field private c:Lcom/instabug/library/internal/module/c;

.field private d:Lcom/instabug/library/internal/module/d;


# direct methods
.method public constructor <init>(Landroid/app/Application;)V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/instabug/library/internal/module/a;->a:Landroid/app/Application;

    .line 25
    return-void
.end method


# virtual methods
.method public final a()Lcom/instabug/library/a;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/instabug/library/internal/module/a;->b:Lcom/instabug/library/a;

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Lcom/instabug/library/a;

    invoke-direct {v0}, Lcom/instabug/library/a;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/internal/module/a;->b:Lcom/instabug/library/a;

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/internal/module/a;->b:Lcom/instabug/library/a;

    return-object v0
.end method

.method public final a(Lcom/instabug/library/invoker/c$a;)Lcom/instabug/library/invoker/c;
    .locals 3

    .prologue
    .line 76
    new-instance v1, Lcom/instabug/library/internal/sensor/a;

    invoke-direct {v1}, Lcom/instabug/library/internal/sensor/a;-><init>()V

    .line 77
    iget-object v0, p0, Lcom/instabug/library/internal/module/a;->a:Landroid/app/Application;

    const-string v2, "sensor"

    invoke-virtual {v0, v2}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    .line 78
    new-instance v2, Lcom/instabug/library/invoker/c;

    invoke-direct {v2, v1, p1, v0}, Lcom/instabug/library/invoker/c;-><init>(Lcom/instabug/library/internal/sensor/a;Lcom/instabug/library/invoker/c$a;Landroid/hardware/SensorManager;)V

    return-object v2
.end method

.method public final b()Lcom/instabug/library/internal/module/d;
    .locals 8

    .prologue
    .line 44
    iget-object v0, p0, Lcom/instabug/library/internal/module/a;->d:Lcom/instabug/library/internal/module/d;

    if-nez v0, :cond_0

    .line 45
    iget-object v0, p0, Lcom/instabug/library/internal/module/a;->a:Landroid/app/Application;

    invoke-virtual {p0}, Lcom/instabug/library/internal/module/a;->c()Lcom/instabug/library/internal/module/c;

    move-result-object v5

    invoke-virtual {p0}, Lcom/instabug/library/internal/module/a;->a()Lcom/instabug/library/a;

    move-result-object v6

    invoke-static {v0}, Lcom/instabug/library/internal/storage/db/d;->a(Landroid/content/Context;)Lcom/instabug/library/internal/storage/db/d;

    move-result-object v1

    new-instance v2, Lcom/instabug/library/internal/storage/a;

    invoke-direct {v2, v0}, Lcom/instabug/library/internal/storage/a;-><init>(Landroid/content/Context;)V

    new-instance v3, Lcom/instabug/library/x;

    invoke-direct {v3}, Lcom/instabug/library/x;-><init>()V

    new-instance v7, Lcom/instabug/library/internal/device/a;

    invoke-direct {v7, v0}, Lcom/instabug/library/internal/device/a;-><init>(Landroid/content/Context;)V

    new-instance v0, Lcom/instabug/library/internal/storage/d;

    invoke-direct {v0, v1}, Lcom/instabug/library/internal/storage/d;-><init>(Lcom/instabug/library/internal/storage/db/d;)V

    new-instance v4, Lcom/instabug/library/internal/storage/e;

    invoke-direct {v4, v0}, Lcom/instabug/library/internal/storage/e;-><init>(Lcom/instabug/library/internal/storage/d;)V

    new-instance v0, Lcom/instabug/library/internal/storage/g;

    invoke-virtual {v5}, Lcom/instabug/library/internal/module/c;->a()Lcom/instabug/library/network/restapi/a;

    move-result-object v5

    invoke-direct {v0, v4, v5, v2}, Lcom/instabug/library/internal/storage/g;-><init>(Lcom/instabug/library/internal/storage/e;Lcom/instabug/library/network/restapi/a;Lcom/instabug/library/internal/storage/a;)V

    invoke-static {v0}, Lcom/instabug/library/internal/storage/q;->a(Lcom/instabug/library/internal/storage/p;)Lcom/instabug/library/internal/storage/q;

    move-result-object v5

    invoke-static {v3, v6, v7}, Lcom/instabug/library/model/b;->a(Lcom/instabug/library/x;Lcom/instabug/library/a;Lcom/instabug/library/internal/device/a;)Lcom/instabug/library/model/b;

    move-result-object v6

    new-instance v0, Lcom/instabug/library/internal/module/d;

    invoke-direct/range {v0 .. v7}, Lcom/instabug/library/internal/module/d;-><init>(Lcom/instabug/library/internal/storage/db/d;Lcom/instabug/library/internal/storage/a;Lcom/instabug/library/x;Lcom/instabug/library/internal/storage/e;Lcom/instabug/library/internal/storage/s;Lcom/instabug/library/model/b;Lcom/instabug/library/internal/device/a;)V

    iput-object v0, p0, Lcom/instabug/library/internal/module/a;->d:Lcom/instabug/library/internal/module/d;

    .line 47
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/internal/module/a;->d:Lcom/instabug/library/internal/module/d;

    return-object v0
.end method

.method public final c()Lcom/instabug/library/internal/module/c;
    .locals 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/instabug/library/internal/module/a;->c:Lcom/instabug/library/internal/module/c;

    if-nez v0, :cond_0

    .line 52
    new-instance v0, Lcom/instabug/library/internal/module/c;

    iget-object v1, p0, Lcom/instabug/library/internal/module/a;->a:Landroid/app/Application;

    invoke-direct {v0, v1}, Lcom/instabug/library/internal/module/c;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/instabug/library/internal/module/a;->c:Lcom/instabug/library/internal/module/c;

    .line 54
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/internal/module/a;->c:Lcom/instabug/library/internal/module/c;

    return-object v0
.end method

.method public final d()Lcom/instabug/library/util/crash/a;
    .locals 4

    .prologue
    .line 61
    new-instance v0, Lcom/instabug/library/interactor/a;

    invoke-virtual {p0}, Lcom/instabug/library/internal/module/a;->b()Lcom/instabug/library/internal/module/d;

    move-result-object v1

    invoke-virtual {v1}, Lcom/instabug/library/internal/module/d;->f()Lcom/instabug/library/internal/storage/e;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/instabug/library/interactor/a;-><init>(Lcom/instabug/library/internal/storage/e;)V

    .line 62
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v1

    .line 64
    new-instance v2, Lcom/instabug/library/internal/module/b;

    invoke-direct {v2, p0, v1}, Lcom/instabug/library/internal/module/b;-><init>(Lcom/instabug/library/internal/module/a;Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 71
    new-instance v1, Lcom/instabug/library/util/crash/a;

    .line 72
    invoke-virtual {p0}, Lcom/instabug/library/internal/module/a;->b()Lcom/instabug/library/internal/module/d;

    move-result-object v3

    invoke-direct {v1, v0, v3, v2}, Lcom/instabug/library/util/crash/a;-><init>(Lcom/instabug/library/interactor/a;Lcom/instabug/library/internal/module/d;Lcom/instabug/library/util/a;)V

    return-object v1
.end method
