.class public final Lcom/instabug/library/invoker/a;
.super Ljava/lang/Object;
.source "FloatingButtonInvoker.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/invoker/a$d;,
        Lcom/instabug/library/invoker/a$a;,
        Lcom/instabug/library/invoker/a$b;,
        Lcom/instabug/library/invoker/a$c;,
        Lcom/instabug/library/invoker/a$e;
    }
.end annotation


# instance fields
.field a:I

.field b:I

.field private c:Landroid/widget/FrameLayout$LayoutParams;

.field private d:I

.field private e:I

.field private f:Lcom/instabug/library/invoker/a$e;

.field private g:Lcom/instabug/library/invoker/a$b;

.field private h:Lcom/instabug/library/invoker/a$c;

.field private i:I

.field private j:Lcom/instabug/library/invoker/a$d;


# direct methods
.method public constructor <init>(Lcom/instabug/library/invoker/a$e;)V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput v0, p0, Lcom/instabug/library/invoker/a;->b:I

    .line 45
    iput-object p1, p0, Lcom/instabug/library/invoker/a;->f:Lcom/instabug/library/invoker/a$e;

    .line 46
    return-void
.end method

.method static synthetic a(Lcom/instabug/library/invoker/a;Landroid/widget/FrameLayout$LayoutParams;)Landroid/widget/FrameLayout$LayoutParams;
    .locals 0

    .prologue
    .line 31
    iput-object p1, p0, Lcom/instabug/library/invoker/a;->c:Landroid/widget/FrameLayout$LayoutParams;

    return-object p1
.end method

.method static synthetic a(Lcom/instabug/library/invoker/a;)Lcom/instabug/library/invoker/a$d;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/instabug/library/invoker/a;->j:Lcom/instabug/library/invoker/a$d;

    return-object v0
.end method

.method static synthetic b(Lcom/instabug/library/invoker/a;)I
    .locals 1

    .prologue
    .line 31
    iget v0, p0, Lcom/instabug/library/invoker/a;->d:I

    return v0
.end method

.method static synthetic c(Lcom/instabug/library/invoker/a;)I
    .locals 1

    .prologue
    .line 31
    iget v0, p0, Lcom/instabug/library/invoker/a;->i:I

    return v0
.end method

.method static synthetic d(Lcom/instabug/library/invoker/a;)I
    .locals 1

    .prologue
    .line 31
    iget v0, p0, Lcom/instabug/library/invoker/a;->e:I

    return v0
.end method

.method static synthetic e(Lcom/instabug/library/invoker/a;)Landroid/widget/FrameLayout$LayoutParams;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/instabug/library/invoker/a;->c:Landroid/widget/FrameLayout$LayoutParams;

    return-object v0
.end method


# virtual methods
.method public final a()V
    .locals 2

    .prologue
    .line 111
    iget-object v0, p0, Lcom/instabug/library/invoker/a;->h:Lcom/instabug/library/invoker/a$c;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/instabug/library/invoker/a$c;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    iget-object v0, p0, Lcom/instabug/library/invoker/a;->h:Lcom/instabug/library/invoker/a$c;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/invoker/a;->h:Lcom/instabug/library/invoker/a$c;

    invoke-virtual {v0}, Lcom/instabug/library/invoker/a$c;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/invoker/a;->h:Lcom/instabug/library/invoker/a$c;

    invoke-virtual {v0}, Lcom/instabug/library/invoker/a$c;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 113
    iget-object v0, p0, Lcom/instabug/library/invoker/a;->h:Lcom/instabug/library/invoker/a$c;

    invoke-virtual {v0}, Lcom/instabug/library/invoker/a$c;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 114
    iget-object v1, p0, Lcom/instabug/library/invoker/a;->h:Lcom/instabug/library/invoker/a$c;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 116
    :cond_0
    return-void
.end method

.method public final a(Landroid/app/Activity;)V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v7, -0x1

    const/4 v6, 0x2

    const/4 v1, 0x0

    .line 53
    new-instance v0, Lcom/instabug/library/invoker/a$c;

    invoke-direct {v0, p1}, Lcom/instabug/library/invoker/a$c;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/instabug/library/invoker/a;->h:Lcom/instabug/library/invoker/a$c;

    .line 55
    iget-object v0, p0, Lcom/instabug/library/invoker/a;->j:Lcom/instabug/library/invoker/a$d;

    if-nez v0, :cond_0

    .line 56
    new-instance v0, Lcom/instabug/library/invoker/a$d;

    invoke-direct {v0}, Lcom/instabug/library/invoker/a$d;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/invoker/a;->j:Lcom/instabug/library/invoker/a$d;

    .line 59
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 60
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v2, p0, Lcom/instabug/library/invoker/a;->e:I

    .line 61
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v2, p0, Lcom/instabug/library/invoker/a;->d:I

    .line 62
    const/high16 v2, 0x42480000    # 50.0f

    mul-float/2addr v0, v2

    float-to-int v0, v0

    iput v0, p0, Lcom/instabug/library/invoker/a;->i:I

    .line 63
    new-instance v0, Lcom/instabug/library/invoker/a$b;

    invoke-direct {v0, p0, p1}, Lcom/instabug/library/invoker/a$b;-><init>(Lcom/instabug/library/invoker/a;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/instabug/library/invoker/a;->g:Lcom/instabug/library/invoker/a$b;

    .line 65
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v2, Landroid/graphics/drawable/shapes/OvalShape;

    invoke-direct {v2}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    invoke-direct {v0, v2}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 66
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v2

    iget-object v3, p0, Lcom/instabug/library/invoker/a;->j:Lcom/instabug/library/invoker/a$d;

    iget v3, v3, Lcom/instabug/library/invoker/a$d;->b:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 68
    new-instance v2, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v3, Landroid/graphics/drawable/shapes/OvalShape;

    invoke-direct {v3}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 69
    invoke-virtual {v2}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v3

    iget-object v4, p0, Lcom/instabug/library/invoker/a;->j:Lcom/instabug/library/invoker/a$d;

    iget v4, v4, Lcom/instabug/library/invoker/a$d;->a:I

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 70
    new-instance v3, Lcom/instabug/library/invoker/b;

    invoke-direct {v3, p0}, Lcom/instabug/library/invoker/b;-><init>(Lcom/instabug/library/invoker/a;)V

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/ShapeDrawable;->setShaderFactory(Landroid/graphics/drawable/ShapeDrawable$ShaderFactory;)V

    .line 77
    new-array v3, v6, [Landroid/graphics/drawable/Drawable;

    aput-object v2, v3, v1

    aput-object v0, v3, v8

    .line 78
    new-instance v0, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {v0, v3}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    move v2, v1

    move v3, v1

    move v4, v1

    move v5, v1

    .line 80
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    move v1, v8

    move v2, v6

    move v3, v6

    move v4, v6

    move v5, v6

    .line 81
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 83
    iget-object v1, p0, Lcom/instabug/library/invoker/a;->g:Lcom/instabug/library/invoker/a$b;

    invoke-virtual {v1, v0}, Lcom/instabug/library/invoker/a$b;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 84
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "instabug_logo"

    const-string v3, "drawable"

    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v4

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 85
    new-instance v1, Landroid/graphics/PorterDuffColorFilter;

    iget-object v2, p0, Lcom/instabug/library/invoker/a;->j:Lcom/instabug/library/invoker/a$d;

    iget v2, v2, Lcom/instabug/library/invoker/a$d;->a:I

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2, v3}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 86
    iget-object v1, p0, Lcom/instabug/library/invoker/a;->g:Lcom/instabug/library/invoker/a$b;

    invoke-virtual {v1, v0}, Lcom/instabug/library/invoker/a$b;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 88
    iget-object v0, p0, Lcom/instabug/library/invoker/a;->c:Landroid/widget/FrameLayout$LayoutParams;

    if-nez v0, :cond_2

    .line 89
    iget-object v0, p0, Lcom/instabug/library/invoker/a;->j:Lcom/instabug/library/invoker/a$d;

    iget-object v0, v0, Lcom/instabug/library/invoker/a$d;->c:Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    sget-object v1, Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;->Left:Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    if-ne v0, v1, :cond_1

    .line 90
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    iget v1, p0, Lcom/instabug/library/invoker/a;->i:I

    iget v2, p0, Lcom/instabug/library/invoker/a;->i:I

    const/16 v3, 0x33

    invoke-direct {v0, v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    iput-object v0, p0, Lcom/instabug/library/invoker/a;->c:Landroid/widget/FrameLayout$LayoutParams;

    .line 91
    iget-object v0, p0, Lcom/instabug/library/invoker/a;->g:Lcom/instabug/library/invoker/a$b;

    iget-object v1, p0, Lcom/instabug/library/invoker/a;->c:Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v0, v1}, Lcom/instabug/library/invoker/a$b;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 92
    iget-object v0, p0, Lcom/instabug/library/invoker/a;->g:Lcom/instabug/library/invoker/a$b;

    const/16 v1, -0xa

    iget-object v2, p0, Lcom/instabug/library/invoker/a;->j:Lcom/instabug/library/invoker/a$d;

    iget v2, v2, Lcom/instabug/library/invoker/a$d;->d:I

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/invoker/a$b;->a(II)V

    .line 102
    :goto_0
    iget-object v0, p0, Lcom/instabug/library/invoker/a;->g:Lcom/instabug/library/invoker/a$b;

    invoke-virtual {v0, p0}, Lcom/instabug/library/invoker/a$b;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 103
    iget-object v0, p0, Lcom/instabug/library/invoker/a;->g:Lcom/instabug/library/invoker/a$b;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Lcom/instabug/library/invoker/a$b;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 104
    iget-object v0, p0, Lcom/instabug/library/invoker/a;->h:Lcom/instabug/library/invoker/a$c;

    iget-object v1, p0, Lcom/instabug/library/invoker/a;->g:Lcom/instabug/library/invoker/a$b;

    invoke-virtual {v0, v1}, Lcom/instabug/library/invoker/a$c;->addView(Landroid/view/View;)V

    .line 106
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/invoker/a;->h:Lcom/instabug/library/invoker/a$c;

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, v7, v7}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 108
    return-void

    .line 94
    :cond_1
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    iget v1, p0, Lcom/instabug/library/invoker/a;->i:I

    iget v2, p0, Lcom/instabug/library/invoker/a;->i:I

    const/16 v3, 0x35

    invoke-direct {v0, v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    iput-object v0, p0, Lcom/instabug/library/invoker/a;->c:Landroid/widget/FrameLayout$LayoutParams;

    .line 95
    iget-object v0, p0, Lcom/instabug/library/invoker/a;->g:Lcom/instabug/library/invoker/a$b;

    iget-object v1, p0, Lcom/instabug/library/invoker/a;->c:Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v0, v1}, Lcom/instabug/library/invoker/a$b;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 96
    iget-object v0, p0, Lcom/instabug/library/invoker/a;->g:Lcom/instabug/library/invoker/a$b;

    iget v1, p0, Lcom/instabug/library/invoker/a;->d:I

    add-int/lit8 v1, v1, 0xa

    iget-object v2, p0, Lcom/instabug/library/invoker/a;->j:Lcom/instabug/library/invoker/a$d;

    iget v2, v2, Lcom/instabug/library/invoker/a$d;->d:I

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/invoker/a$b;->a(II)V

    goto :goto_0

    .line 99
    :cond_2
    iget-object v0, p0, Lcom/instabug/library/invoker/a;->g:Lcom/instabug/library/invoker/a$b;

    iget-object v1, p0, Lcom/instabug/library/invoker/a;->c:Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v0, v1}, Lcom/instabug/library/invoker/a$b;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method

.method public final a(Lcom/instabug/library/invoker/a$d;)V
    .locals 0

    .prologue
    .line 49
    iput-object p1, p0, Lcom/instabug/library/invoker/a;->j:Lcom/instabug/library/invoker/a$d;

    .line 50
    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/instabug/library/invoker/a;->f:Lcom/instabug/library/invoker/a$e;

    if-eqz v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/instabug/library/invoker/a;->f:Lcom/instabug/library/invoker/a$e;

    invoke-interface {v0}, Lcom/instabug/library/invoker/a$e;->w()V

    .line 123
    :cond_0
    return-void
.end method
