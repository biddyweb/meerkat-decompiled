.class public Lcom/instabug/library/view/AnnotationView;
.super Landroid/widget/ImageView;
.source "AnnotationView.java"


# instance fields
.field private a:Landroid/graphics/Canvas;

.field private b:Landroid/graphics/Path;

.field private c:Landroid/graphics/Paint;

.field private d:I

.field private e:Z

.field private f:Ljava/util/LinkedHashMap;

.field private g:F

.field private h:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 37
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/instabug/library/view/AnnotationView;->e:Z

    .line 23
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/view/AnnotationView;->f:Ljava/util/LinkedHashMap;

    .line 38
    invoke-virtual {p0, v1}, Lcom/instabug/library/view/AnnotationView;->setFocusable(Z)V

    .line 39
    invoke-virtual {p0, v1}, Lcom/instabug/library/view/AnnotationView;->setFocusableInTouchMode(Z)V

    .line 40
    invoke-direct {p0}, Lcom/instabug/library/view/AnnotationView;->b()V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 28
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/instabug/library/view/AnnotationView;->e:Z

    .line 23
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/view/AnnotationView;->f:Ljava/util/LinkedHashMap;

    .line 29
    invoke-virtual {p0, v1}, Lcom/instabug/library/view/AnnotationView;->setFocusable(Z)V

    .line 30
    invoke-virtual {p0, v1}, Lcom/instabug/library/view/AnnotationView;->setFocusableInTouchMode(Z)V

    .line 32
    invoke-direct {p0}, Lcom/instabug/library/view/AnnotationView;->b()V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 44
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/instabug/library/view/AnnotationView;->e:Z

    .line 23
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/view/AnnotationView;->f:Ljava/util/LinkedHashMap;

    .line 45
    invoke-virtual {p0, v1}, Lcom/instabug/library/view/AnnotationView;->setFocusable(Z)V

    .line 46
    invoke-virtual {p0, v1}, Lcom/instabug/library/view/AnnotationView;->setFocusableInTouchMode(Z)V

    .line 48
    invoke-direct {p0}, Lcom/instabug/library/view/AnnotationView;->b()V

    .line 50
    return-void
.end method

.method private b()V
    .locals 5

    .prologue
    const/4 v1, 0x1

    .line 53
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/view/AnnotationView;->c:Landroid/graphics/Paint;

    .line 54
    iget-object v0, p0, Lcom/instabug/library/view/AnnotationView;->c:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 55
    iget-object v0, p0, Lcom/instabug/library/view/AnnotationView;->c:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 56
    invoke-virtual {p0}, Lcom/instabug/library/view/AnnotationView;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_0

    .line 57
    invoke-virtual {p0}, Lcom/instabug/library/view/AnnotationView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Lcom/instabug/library/view/AnnotationView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "instabug_annotation_color_default"

    const-string v3, "color"

    invoke-virtual {p0}, Lcom/instabug/library/view/AnnotationView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/instabug/library/view/AnnotationView;->d:I

    .line 61
    :goto_0
    iget-object v0, p0, Lcom/instabug/library/view/AnnotationView;->c:Landroid/graphics/Paint;

    iget v1, p0, Lcom/instabug/library/view/AnnotationView;->d:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 62
    iget-object v0, p0, Lcom/instabug/library/view/AnnotationView;->c:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 63
    iget-object v0, p0, Lcom/instabug/library/view/AnnotationView;->c:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 64
    iget-object v0, p0, Lcom/instabug/library/view/AnnotationView;->c:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 65
    iget-object v0, p0, Lcom/instabug/library/view/AnnotationView;->c:Landroid/graphics/Paint;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {p0}, Lcom/instabug/library/view/AnnotationView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 66
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/view/AnnotationView;->a:Landroid/graphics/Canvas;

    .line 67
    return-void

    .line 59
    :cond_0
    const v0, -0xff5551

    iput v0, p0, Lcom/instabug/library/view/AnnotationView;->d:I

    goto :goto_0
.end method


# virtual methods
.method public final a()V
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/instabug/library/view/AnnotationView;->f:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    .line 137
    invoke-virtual {p0}, Lcom/instabug/library/view/AnnotationView;->invalidate()V

    .line 138
    return-void
.end method

.method public final a(I)V
    .locals 1

    .prologue
    .line 141
    invoke-virtual {p0}, Lcom/instabug/library/view/AnnotationView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/instabug/library/view/AnnotationView;->d:I

    .line 142
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    .prologue
    .line 71
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 72
    iget-object v0, p0, Lcom/instabug/library/view/AnnotationView;->f:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 73
    iget-object v0, p0, Lcom/instabug/library/view/AnnotationView;->f:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 75
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 76
    iget-object v3, p0, Lcom/instabug/library/view/AnnotationView;->c:Landroid/graphics/Paint;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 77
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Path;

    iget-object v1, p0, Lcom/instabug/library/view/AnnotationView;->c:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 78
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 80
    :cond_1
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/high16 v4, 0x40800000    # 4.0f

    const/high16 v7, 0x40000000    # 2.0f

    .line 112
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 113
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    .line 115
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 132
    :goto_0
    return v8

    .line 117
    :pswitch_0
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/instabug/library/view/AnnotationView;->e:Z

    .line 118
    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    iput-object v2, p0, Lcom/instabug/library/view/AnnotationView;->b:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/instabug/library/view/AnnotationView;->f:Ljava/util/LinkedHashMap;

    iget-object v3, p0, Lcom/instabug/library/view/AnnotationView;->b:Landroid/graphics/Path;

    iget v4, p0, Lcom/instabug/library/view/AnnotationView;->d:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p0, Lcom/instabug/library/view/AnnotationView;->b:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    iget-object v2, p0, Lcom/instabug/library/view/AnnotationView;->b:Landroid/graphics/Path;

    invoke-virtual {v2, v0, v1}, Landroid/graphics/Path;->moveTo(FF)V

    iput v0, p0, Lcom/instabug/library/view/AnnotationView;->g:F

    iput v1, p0, Lcom/instabug/library/view/AnnotationView;->h:F

    goto :goto_0

    .line 121
    :pswitch_1
    iput-boolean v8, p0, Lcom/instabug/library/view/AnnotationView;->e:Z

    .line 122
    iget v2, p0, Lcom/instabug/library/view/AnnotationView;->g:F

    sub-float v2, v0, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget v3, p0, Lcom/instabug/library/view/AnnotationView;->h:F

    sub-float v3, v1, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v2, v2, v4

    if-gez v2, :cond_0

    cmpl-float v2, v3, v4

    if-ltz v2, :cond_1

    :cond_0
    iget-object v2, p0, Lcom/instabug/library/view/AnnotationView;->b:Landroid/graphics/Path;

    iget v3, p0, Lcom/instabug/library/view/AnnotationView;->g:F

    iget v4, p0, Lcom/instabug/library/view/AnnotationView;->h:F

    iget v5, p0, Lcom/instabug/library/view/AnnotationView;->g:F

    add-float/2addr v5, v0

    div-float/2addr v5, v7

    iget v6, p0, Lcom/instabug/library/view/AnnotationView;->h:F

    add-float/2addr v6, v1

    div-float/2addr v6, v7

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/Path;->quadTo(FFFF)V

    iput v0, p0, Lcom/instabug/library/view/AnnotationView;->g:F

    iput v1, p0, Lcom/instabug/library/view/AnnotationView;->h:F

    .line 123
    :cond_1
    invoke-virtual {p0}, Lcom/instabug/library/view/AnnotationView;->invalidate()V

    goto :goto_0

    .line 126
    :pswitch_2
    iget-object v0, p0, Lcom/instabug/library/view/AnnotationView;->b:Landroid/graphics/Path;

    iget v1, p0, Lcom/instabug/library/view/AnnotationView;->g:F

    iget v2, p0, Lcom/instabug/library/view/AnnotationView;->h:F

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v0, p0, Lcom/instabug/library/view/AnnotationView;->a:Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/instabug/library/view/AnnotationView;->b:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/instabug/library/view/AnnotationView;->c:Landroid/graphics/Paint;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 127
    iget-boolean v0, p0, Lcom/instabug/library/view/AnnotationView;->e:Z

    if-nez v0, :cond_2

    .line 128
    invoke-virtual {p0}, Lcom/instabug/library/view/AnnotationView;->performClick()Z

    .line 129
    :cond_2
    invoke-virtual {p0}, Lcom/instabug/library/view/AnnotationView;->invalidate()V

    goto :goto_0

    .line 115
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
