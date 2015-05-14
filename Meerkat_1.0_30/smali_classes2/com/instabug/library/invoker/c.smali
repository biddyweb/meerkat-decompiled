.class public final Lcom/instabug/library/invoker/c;
.super Ljava/lang/Object;
.source "ShakeProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/invoker/c$a;
    }
.end annotation


# instance fields
.field private a:Lcom/instabug/library/internal/sensor/a;

.field private b:Landroid/os/Handler;

.field private c:Lcom/instabug/library/invoker/c$a;

.field private d:I

.field private e:Landroid/hardware/SensorManager;

.field private f:Ljava/lang/Runnable;

.field private g:Lcom/instabug/library/internal/sensor/a$a;


# direct methods
.method public constructor <init>(Lcom/instabug/library/internal/sensor/a;Lcom/instabug/library/invoker/c$a;Landroid/hardware/SensorManager;)V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const/4 v0, 0x0

    iput v0, p0, Lcom/instabug/library/invoker/c;->d:I

    .line 16
    new-instance v0, Lcom/instabug/library/invoker/d;

    invoke-direct {v0, p0}, Lcom/instabug/library/invoker/d;-><init>(Lcom/instabug/library/invoker/c;)V

    iput-object v0, p0, Lcom/instabug/library/invoker/c;->f:Ljava/lang/Runnable;

    .line 23
    new-instance v0, Lcom/instabug/library/invoker/e;

    invoke-direct {v0, p0}, Lcom/instabug/library/invoker/e;-><init>(Lcom/instabug/library/invoker/c;)V

    iput-object v0, p0, Lcom/instabug/library/invoker/c;->g:Lcom/instabug/library/internal/sensor/a$a;

    .line 35
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/invoker/c;->b:Landroid/os/Handler;

    .line 36
    iput-object p1, p0, Lcom/instabug/library/invoker/c;->a:Lcom/instabug/library/internal/sensor/a;

    .line 37
    iput-object p2, p0, Lcom/instabug/library/invoker/c;->c:Lcom/instabug/library/invoker/c$a;

    .line 38
    iput-object p3, p0, Lcom/instabug/library/invoker/c;->e:Landroid/hardware/SensorManager;

    .line 40
    iget-object v0, p0, Lcom/instabug/library/invoker/c;->g:Lcom/instabug/library/internal/sensor/a$a;

    invoke-virtual {p1, v0}, Lcom/instabug/library/internal/sensor/a;->a(Lcom/instabug/library/internal/sensor/a$a;)V

    .line 41
    return-void
.end method

.method static synthetic a(Lcom/instabug/library/invoker/c;)I
    .locals 2

    .prologue
    .line 9
    iget v0, p0, Lcom/instabug/library/invoker/c;->d:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/instabug/library/invoker/c;->d:I

    return v0
.end method

.method static synthetic a(Lcom/instabug/library/invoker/c;I)I
    .locals 1

    .prologue
    .line 9
    const/4 v0, 0x0

    iput v0, p0, Lcom/instabug/library/invoker/c;->d:I

    return v0
.end method

.method static synthetic b(Lcom/instabug/library/invoker/c;)I
    .locals 1

    .prologue
    .line 9
    iget v0, p0, Lcom/instabug/library/invoker/c;->d:I

    return v0
.end method

.method static synthetic c(Lcom/instabug/library/invoker/c;)Ljava/lang/Runnable;
    .locals 1

    .prologue
    .line 9
    iget-object v0, p0, Lcom/instabug/library/invoker/c;->f:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic d(Lcom/instabug/library/invoker/c;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 9
    iget-object v0, p0, Lcom/instabug/library/invoker/c;->b:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic e(Lcom/instabug/library/invoker/c;)Lcom/instabug/library/invoker/c$a;
    .locals 1

    .prologue
    .line 9
    iget-object v0, p0, Lcom/instabug/library/invoker/c;->c:Lcom/instabug/library/invoker/c$a;

    return-object v0
.end method


# virtual methods
.method public final a(F)V
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/instabug/library/invoker/c;->a:Lcom/instabug/library/internal/sensor/a;

    invoke-virtual {v0, p1}, Lcom/instabug/library/internal/sensor/a;->a(F)V

    .line 50
    return-void
.end method

.method public final a(Z)V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 44
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/instabug/library/invoker/c;->a:Lcom/instabug/library/internal/sensor/a;

    iget-object v1, p0, Lcom/instabug/library/invoker/c;->e:Landroid/hardware/SensorManager;

    if-eqz v1, :cond_0

    invoke-virtual {v1, v3}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v2

    invoke-virtual {v1, v0, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 46
    :cond_0
    :goto_0
    return-void

    .line 45
    :cond_1
    iget-object v0, p0, Lcom/instabug/library/invoker/c;->a:Lcom/instabug/library/internal/sensor/a;

    iget-object v1, p0, Lcom/instabug/library/invoker/c;->e:Landroid/hardware/SensorManager;

    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    goto :goto_0
.end method
