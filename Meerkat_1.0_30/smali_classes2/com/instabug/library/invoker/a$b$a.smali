.class final Lcom/instabug/library/invoker/a$b$a;
.super Ljava/lang/Object;
.source "FloatingButtonInvoker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/instabug/library/invoker/a$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "a"
.end annotation


# instance fields
.field private a:Landroid/os/Handler;

.field private b:F

.field private c:F

.field private d:J

.field private synthetic e:Lcom/instabug/library/invoker/a$b;


# direct methods
.method private constructor <init>(Lcom/instabug/library/invoker/a$b;)V
    .locals 2

    .prologue
    .line 252
    iput-object p1, p0, Lcom/instabug/library/invoker/a$b$a;->e:Lcom/instabug/library/invoker/a$b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 253
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/instabug/library/invoker/a$b$a;->a:Landroid/os/Handler;

    return-void
.end method

.method synthetic constructor <init>(Lcom/instabug/library/invoker/a$b;B)V
    .locals 0

    .prologue
    .line 252
    invoke-direct {p0, p1}, Lcom/instabug/library/invoker/a$b$a;-><init>(Lcom/instabug/library/invoker/a$b;)V

    return-void
.end method

.method static synthetic a(Lcom/instabug/library/invoker/a$b$a;)V
    .locals 1

    .prologue
    .line 252
    iget-object v0, p0, Lcom/instabug/library/invoker/a$b$a;->a:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic a(Lcom/instabug/library/invoker/a$b$a;FF)V
    .locals 2

    .prologue
    .line 252
    iput p1, p0, Lcom/instabug/library/invoker/a$b$a;->b:F

    iput p2, p0, Lcom/instabug/library/invoker/a$b$a;->c:F

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/instabug/library/invoker/a$b$a;->d:J

    iget-object v0, p0, Lcom/instabug/library/invoker/a$b$a;->a:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .prologue
    const/high16 v5, 0x3f800000    # 1.0f

    .line 267
    iget-object v0, p0, Lcom/instabug/library/invoker/a$b$a;->e:Lcom/instabug/library/invoker/a$b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/invoker/a$b$a;->e:Lcom/instabug/library/invoker/a$b;

    invoke-virtual {v0}, Lcom/instabug/library/invoker/a$b;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 268
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/instabug/library/invoker/a$b$a;->d:J

    sub-long/2addr v0, v2

    long-to-float v0, v0

    const/high16 v1, 0x43c80000    # 400.0f

    div-float/2addr v0, v1

    invoke-static {v5, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 269
    iget v1, p0, Lcom/instabug/library/invoker/a$b$a;->b:F

    iget-object v2, p0, Lcom/instabug/library/invoker/a$b$a;->e:Lcom/instabug/library/invoker/a$b;

    iget-object v2, v2, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    iget v2, v2, Lcom/instabug/library/invoker/a;->a:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    mul-float/2addr v1, v0

    .line 270
    iget v2, p0, Lcom/instabug/library/invoker/a$b$a;->c:F

    iget-object v3, p0, Lcom/instabug/library/invoker/a$b$a;->e:Lcom/instabug/library/invoker/a$b;

    iget-object v3, v3, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    iget v3, v3, Lcom/instabug/library/invoker/a;->b:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    mul-float/2addr v2, v0

    .line 271
    iget-object v3, p0, Lcom/instabug/library/invoker/a$b$a;->e:Lcom/instabug/library/invoker/a$b;

    iget-object v4, p0, Lcom/instabug/library/invoker/a$b$a;->e:Lcom/instabug/library/invoker/a$b;

    iget-object v4, v4, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    iget v4, v4, Lcom/instabug/library/invoker/a;->a:I

    int-to-float v4, v4

    add-float/2addr v1, v4

    float-to-int v1, v1

    iget-object v4, p0, Lcom/instabug/library/invoker/a$b$a;->e:Lcom/instabug/library/invoker/a$b;

    iget-object v4, v4, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    iget v4, v4, Lcom/instabug/library/invoker/a;->b:I

    int-to-float v4, v4

    add-float/2addr v2, v4

    float-to-int v2, v2

    invoke-virtual {v3, v1, v2}, Lcom/instabug/library/invoker/a$b;->a(II)V

    .line 272
    cmpg-float v0, v0, v5

    if-gez v0, :cond_0

    .line 273
    iget-object v0, p0, Lcom/instabug/library/invoker/a$b$a;->a:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 276
    :cond_0
    return-void
.end method
