.class public final Lcom/instabug/library/invoker/a$b;
.super Landroid/widget/ImageButton;
.source "FloatingButtonInvoker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/instabug/library/invoker/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/invoker/a$b$a;
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/instabug/library/invoker/a;

.field private b:Landroid/view/GestureDetector;

.field private c:Z

.field private d:Lcom/instabug/library/invoker/a$b$a;

.field private e:J

.field private f:F

.field private g:F

.field private h:Z


# direct methods
.method public constructor <init>(Lcom/instabug/library/invoker/a;Landroid/content/Context;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 162
    iput-object p1, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    .line 163
    invoke-direct {p0, p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 155
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/instabug/library/invoker/a$b;->c:Z

    .line 159
    iput-boolean v2, p0, Lcom/instabug/library/invoker/a$b;->h:Z

    .line 164
    new-instance v0, Landroid/view/GestureDetector;

    new-instance v1, Lcom/instabug/library/invoker/a$a;

    invoke-direct {v1}, Lcom/instabug/library/invoker/a$a;-><init>()V

    invoke-direct {v0, p2, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/instabug/library/invoker/a$b;->b:Landroid/view/GestureDetector;

    .line 165
    new-instance v0, Lcom/instabug/library/invoker/a$b$a;

    invoke-direct {v0, p0, v2}, Lcom/instabug/library/invoker/a$b$a;-><init>(Lcom/instabug/library/invoker/a$b;B)V

    iput-object v0, p0, Lcom/instabug/library/invoker/a$b;->d:Lcom/instabug/library/invoker/a$b$a;

    .line 166
    return-void
.end method

.method private a()V
    .locals 5

    .prologue
    const/high16 v2, 0x40000000    # 2.0f

    .line 222
    iget-object v0, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v0}, Lcom/instabug/library/invoker/a;->a(Lcom/instabug/library/invoker/a;)Lcom/instabug/library/invoker/a$d;

    move-result-object v0

    iget-object v0, v0, Lcom/instabug/library/invoker/a$d;->c:Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    sget-object v1, Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;->Left:Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    if-ne v0, v1, :cond_2

    .line 223
    iget-object v0, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    iget v0, v0, Lcom/instabug/library/invoker/a;->a:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v1}, Lcom/instabug/library/invoker/a;->b(Lcom/instabug/library/invoker/a;)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v2

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v0}, Lcom/instabug/library/invoker/a;->b(Lcom/instabug/library/invoker/a;)I

    move-result v0

    iget-object v1, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v1}, Lcom/instabug/library/invoker/a;->c(Lcom/instabug/library/invoker/a;)I

    move-result v1

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0xa

    int-to-float v0, v0

    .line 224
    :goto_0
    iget-object v2, p0, Lcom/instabug/library/invoker/a$b;->d:Lcom/instabug/library/invoker/a$b$a;

    iget-object v1, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    iget v1, v1, Lcom/instabug/library/invoker/a;->b:I

    iget-object v3, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v3}, Lcom/instabug/library/invoker/a;->d(Lcom/instabug/library/invoker/a;)I

    move-result v3

    iget-object v4, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v4}, Lcom/instabug/library/invoker/a;->c(Lcom/instabug/library/invoker/a;)I

    move-result v4

    sub-int/2addr v3, v4

    if-le v1, v3, :cond_1

    iget-object v1, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v1}, Lcom/instabug/library/invoker/a;->d(Lcom/instabug/library/invoker/a;)I

    move-result v1

    iget-object v3, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v3}, Lcom/instabug/library/invoker/a;->c(Lcom/instabug/library/invoker/a;)I

    move-result v3

    shl-int/lit8 v3, v3, 0x1

    sub-int/2addr v1, v3

    int-to-float v1, v1

    :goto_1
    invoke-static {v2, v0, v1}, Lcom/instabug/library/invoker/a$b$a;->a(Lcom/instabug/library/invoker/a$b$a;FF)V

    .line 229
    :goto_2
    return-void

    .line 223
    :cond_0
    const/high16 v0, -0x3ee00000    # -10.0f

    goto :goto_0

    .line 224
    :cond_1
    iget-object v1, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    iget v1, v1, Lcom/instabug/library/invoker/a;->b:I

    int-to-float v1, v1

    goto :goto_1

    .line 226
    :cond_2
    iget-object v0, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    iget v0, v0, Lcom/instabug/library/invoker/a;->a:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v1}, Lcom/instabug/library/invoker/a;->b(Lcom/instabug/library/invoker/a;)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v2

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_3

    iget-object v0, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v0}, Lcom/instabug/library/invoker/a;->b(Lcom/instabug/library/invoker/a;)I

    move-result v0

    add-int/lit8 v0, v0, 0xa

    int-to-float v0, v0

    .line 227
    :goto_3
    iget-object v2, p0, Lcom/instabug/library/invoker/a$b;->d:Lcom/instabug/library/invoker/a$b$a;

    iget-object v1, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    iget v1, v1, Lcom/instabug/library/invoker/a;->b:I

    iget-object v3, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v3}, Lcom/instabug/library/invoker/a;->d(Lcom/instabug/library/invoker/a;)I

    move-result v3

    iget-object v4, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v4}, Lcom/instabug/library/invoker/a;->c(Lcom/instabug/library/invoker/a;)I

    move-result v4

    sub-int/2addr v3, v4

    if-le v1, v3, :cond_4

    iget-object v1, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v1}, Lcom/instabug/library/invoker/a;->d(Lcom/instabug/library/invoker/a;)I

    move-result v1

    iget-object v3, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v3}, Lcom/instabug/library/invoker/a;->c(Lcom/instabug/library/invoker/a;)I

    move-result v3

    shl-int/lit8 v3, v3, 0x1

    sub-int/2addr v1, v3

    int-to-float v1, v1

    :goto_4
    invoke-static {v2, v0, v1}, Lcom/instabug/library/invoker/a$b$a;->a(Lcom/instabug/library/invoker/a$b$a;FF)V

    goto :goto_2

    .line 226
    :cond_3
    iget-object v0, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v0}, Lcom/instabug/library/invoker/a;->c(Lcom/instabug/library/invoker/a;)I

    move-result v0

    add-int/lit8 v0, v0, -0xa

    int-to-float v0, v0

    goto :goto_3

    .line 227
    :cond_4
    iget-object v1, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    iget v1, v1, Lcom/instabug/library/invoker/a;->b:I

    int-to-float v1, v1

    goto :goto_4
.end method


# virtual methods
.method final a(II)V
    .locals 3

    .prologue
    .line 232
    iget-object v0, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    iput p1, v0, Lcom/instabug/library/invoker/a;->a:I

    .line 233
    iget-object v0, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    iput p2, v0, Lcom/instabug/library/invoker/a;->b:I

    .line 234
    iget-object v0, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v0}, Lcom/instabug/library/invoker/a;->e(Lcom/instabug/library/invoker/a;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    iget v1, v1, Lcom/instabug/library/invoker/a;->a:I

    add-int/lit8 v1, v1, 0x0

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 235
    iget-object v0, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v0}, Lcom/instabug/library/invoker/a;->e(Lcom/instabug/library/invoker/a;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v1}, Lcom/instabug/library/invoker/a;->b(Lcom/instabug/library/invoker/a;)I

    move-result v1

    iget-object v2, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    iget v2, v2, Lcom/instabug/library/invoker/a;->a:I

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 236
    iget-object v0, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v0}, Lcom/instabug/library/invoker/a;->e(Lcom/instabug/library/invoker/a;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    iget v1, v1, Lcom/instabug/library/invoker/a;->b:I

    add-int/lit8 v1, v1, 0x0

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 237
    iget-object v0, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v0}, Lcom/instabug/library/invoker/a;->e(Lcom/instabug/library/invoker/a;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v1}, Lcom/instabug/library/invoker/a;->d(Lcom/instabug/library/invoker/a;)I

    move-result v1

    iget-object v2, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    iget v2, v2, Lcom/instabug/library/invoker/a;->b:I

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 239
    iget-object v0, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v0}, Lcom/instabug/library/invoker/a;->e(Lcom/instabug/library/invoker/a;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/instabug/library/invoker/a$b;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 240
    return-void
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9

    .prologue
    const/4 v1, 0x0

    const/4 v8, 0x1

    .line 189
    .line 190
    iget-boolean v0, p0, Lcom/instabug/library/invoker/a$b;->c:Z

    if-eqz v0, :cond_5

    .line 191
    iget-object v0, p0, Lcom/instabug/library/invoker/a$b;->b:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 193
    :goto_0
    if-eqz v0, :cond_0

    .line 194
    invoke-direct {p0}, Lcom/instabug/library/invoker/a$b;->a()V

    .line 217
    :goto_1
    return v8

    .line 196
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    .line 197
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v2

    .line 198
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    .line 199
    if-nez v3, :cond_2

    .line 200
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/instabug/library/invoker/a$b;->e:J

    .line 201
    iget-object v1, p0, Lcom/instabug/library/invoker/a$b;->d:Lcom/instabug/library/invoker/a$b$a;

    invoke-static {v1}, Lcom/instabug/library/invoker/a$b$a;->a(Lcom/instabug/library/invoker/a$b$a;)V

    .line 202
    iput-boolean v8, p0, Lcom/instabug/library/invoker/a$b;->h:Z

    .line 214
    :cond_1
    :goto_2
    iput v0, p0, Lcom/instabug/library/invoker/a$b;->f:F

    .line 215
    iput v2, p0, Lcom/instabug/library/invoker/a$b;->g:F

    goto :goto_1

    .line 203
    :cond_2
    if-ne v3, v8, :cond_4

    .line 204
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/instabug/library/invoker/a$b;->e:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0xc8

    cmp-long v3, v4, v6

    if-gez v3, :cond_3

    .line 205
    invoke-virtual {p0}, Lcom/instabug/library/invoker/a$b;->performClick()Z

    .line 207
    :cond_3
    iput-boolean v1, p0, Lcom/instabug/library/invoker/a$b;->h:Z

    .line 208
    invoke-direct {p0}, Lcom/instabug/library/invoker/a$b;->a()V

    goto :goto_2

    .line 209
    :cond_4
    const/4 v1, 0x2

    if-ne v3, v1, :cond_1

    .line 210
    iget-boolean v1, p0, Lcom/instabug/library/invoker/a$b;->h:Z

    if-eqz v1, :cond_1

    .line 211
    iget v1, p0, Lcom/instabug/library/invoker/a$b;->f:F

    sub-float v1, v0, v1

    iget v3, p0, Lcom/instabug/library/invoker/a$b;->g:F

    sub-float v3, v2, v3

    iget-object v4, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    iget v4, v4, Lcom/instabug/library/invoker/a;->a:I

    int-to-float v4, v4

    add-float/2addr v1, v4

    float-to-int v1, v1

    iget-object v4, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    iget v4, v4, Lcom/instabug/library/invoker/a;->b:I

    int-to-float v4, v4

    add-float/2addr v3, v4

    float-to-int v3, v3

    invoke-virtual {p0, v1, v3}, Lcom/instabug/library/invoker/a$b;->a(II)V

    iget-boolean v1, p0, Lcom/instabug/library/invoker/a$b;->c:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/instabug/library/invoker/a$b;->h:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v1}, Lcom/instabug/library/invoker/a;->e(Lcom/instabug/library/invoker/a;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    const/16 v3, 0x32

    if-ge v1, v3, :cond_1

    iget-object v1, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v1}, Lcom/instabug/library/invoker/a;->e(Lcom/instabug/library/invoker/a;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    invoke-virtual {p0}, Lcom/instabug/library/invoker/a$b;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v1, v3

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    const/16 v3, 0xfa

    if-ge v1, v3, :cond_1

    invoke-direct {p0}, Lcom/instabug/library/invoker/a$b;->a()V

    goto :goto_2

    :cond_5
    move v0, v1

    goto/16 :goto_0
.end method

.method public final setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    .locals 2

    .prologue
    .line 183
    iget-object v1, p0, Lcom/instabug/library/invoker/a$b;->a:Lcom/instabug/library/invoker/a;

    move-object v0, p1

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v1, v0}, Lcom/instabug/library/invoker/a;->a(Lcom/instabug/library/invoker/a;Landroid/widget/FrameLayout$LayoutParams;)Landroid/widget/FrameLayout$LayoutParams;

    .line 184
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 185
    return-void
.end method
