.class public Lcom/instabug/library/internal/view/AnimatedImageView;
.super Landroid/widget/ImageView;
.source "AnimatedImageView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/internal/view/AnimatedImageView$a;
    }
.end annotation


# instance fields
.field private a:[Lcom/instabug/library/internal/view/AnimatedImageView$a;

.field private b:Landroid/graphics/drawable/Drawable;

.field private final c:Landroid/os/Handler;

.field private d:Z

.field private e:Ljava/lang/Thread;

.field private final f:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 12
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->b:Landroid/graphics/drawable/Drawable;

    .line 14
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->c:Landroid/os/Handler;

    .line 15
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->d:Z

    .line 17
    new-instance v0, Lcom/instabug/library/internal/view/a;

    invoke-direct {v0, p0}, Lcom/instabug/library/internal/view/a;-><init>(Lcom/instabug/library/internal/view/AnimatedImageView;)V

    iput-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->f:Ljava/lang/Runnable;

    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 12
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->b:Landroid/graphics/drawable/Drawable;

    .line 14
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->c:Landroid/os/Handler;

    .line 15
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->d:Z

    .line 17
    new-instance v0, Lcom/instabug/library/internal/view/a;

    invoke-direct {v0, p0}, Lcom/instabug/library/internal/view/a;-><init>(Lcom/instabug/library/internal/view/AnimatedImageView;)V

    iput-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->f:Ljava/lang/Runnable;

    .line 28
    return-void
.end method

.method static synthetic a(Lcom/instabug/library/internal/view/AnimatedImageView;)Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 9
    iget-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->b:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method private c()Z
    .locals 1

    .prologue
    .line 68
    iget-boolean v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->d:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->a:[Lcom/instabug/library/internal/view/AnimatedImageView$a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->e:Ljava/lang/Thread;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public final a()V
    .locals 1

    .prologue
    .line 50
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->d:Z

    .line 52
    invoke-direct {p0}, Lcom/instabug/library/internal/view/AnimatedImageView;->c()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->e:Ljava/lang/Thread;

    .line 54
    iget-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->e:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 56
    :cond_0
    return-void
.end method

.method public final a([Lcom/instabug/library/internal/view/AnimatedImageView$a;)V
    .locals 2

    .prologue
    .line 35
    iput-object p1, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->a:[Lcom/instabug/library/internal/view/AnimatedImageView$a;

    .line 37
    :try_start_0
    invoke-virtual {p0}, Lcom/instabug/library/internal/view/AnimatedImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v1, p1, v1

    iget v1, v1, Lcom/instabug/library/internal/view/AnimatedImageView$a;->a:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->b:Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    invoke-direct {p0}, Lcom/instabug/library/internal/view/AnimatedImageView;->c()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 44
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->e:Ljava/lang/Thread;

    .line 45
    iget-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->e:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 47
    :cond_0
    :goto_0
    return-void

    .line 39
    :catch_0
    move-exception v0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->a:[Lcom/instabug/library/internal/view/AnimatedImageView$a;

    goto :goto_0
.end method

.method public final b()V
    .locals 1

    .prologue
    .line 59
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->d:Z

    .line 61
    iget-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->e:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 62
    iget-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->e:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 63
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->e:Ljava/lang/Thread;

    .line 65
    :cond_0
    return-void
.end method

.method public run()V
    .locals 5

    .prologue
    .line 73
    iget-object v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->a:[Lcom/instabug/library/internal/view/AnimatedImageView$a;

    array-length v1, v0

    .line 75
    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_2

    .line 76
    iget-object v2, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->b:Landroid/graphics/drawable/Drawable;

    .line 78
    invoke-virtual {p0}, Lcom/instabug/library/internal/view/AnimatedImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget-object v4, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->a:[Lcom/instabug/library/internal/view/AnimatedImageView$a;

    aget-object v4, v4, v0

    iget v4, v4, Lcom/instabug/library/internal/view/AnimatedImageView$a;->a:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->b:Landroid/graphics/drawable/Drawable;

    .line 79
    if-eqz v2, :cond_1

    .line 80
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 82
    :cond_1
    iget-object v2, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->c:Landroid/os/Handler;

    iget-object v3, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->f:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 85
    :try_start_0
    iget-object v2, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->a:[Lcom/instabug/library/internal/view/AnimatedImageView$a;

    aget-object v2, v2, v0

    iget v2, v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;->b:I

    int-to-long v2, v2

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 90
    :cond_2
    iget-boolean v0, p0, Lcom/instabug/library/internal/view/AnimatedImageView;->d:Z

    if-nez v0, :cond_0

    .line 91
    return-void

    :catch_0
    move-exception v2

    goto :goto_1
.end method
