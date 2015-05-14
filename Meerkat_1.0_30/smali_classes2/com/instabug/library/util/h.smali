.class public final Lcom/instabug/library/util/h;
.super Landroid/os/AsyncTask;
.source "ScreenshotProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/util/h$a;
    }
.end annotation


# instance fields
.field private a:Lcom/instabug/library/util/h$a;

.field private b:Landroid/app/Activity;

.field private c:Landroid/app/Dialog;

.field private d:I

.field private e:[I

.field private f:Landroid/view/View;

.field private g:Landroid/view/View;

.field private h:Landroid/graphics/Bitmap;

.field private i:Landroid/opengl/GLSurfaceView;

.field private j:Lcom/instabug/library/internal/device/a;

.field private k:Ljava/util/List;

.field private l:Ljava/lang/Exception;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Landroid/app/Dialog;Landroid/opengl/GLSurfaceView;Ljava/util/List;Lcom/instabug/library/internal/device/a;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/instabug/library/util/h;->b:Landroid/app/Activity;

    .line 59
    iput-object p2, p0, Lcom/instabug/library/util/h;->c:Landroid/app/Dialog;

    .line 60
    iput-object p3, p0, Lcom/instabug/library/util/h;->i:Landroid/opengl/GLSurfaceView;

    .line 61
    iput-object p4, p0, Lcom/instabug/library/util/h;->k:Ljava/util/List;

    .line 62
    iput-object p5, p0, Lcom/instabug/library/util/h;->j:Lcom/instabug/library/internal/device/a;

    .line 63
    return-void
.end method

.method private a()V
    .locals 15

    .prologue
    .line 89
    :try_start_0
    iget-object v0, p0, Lcom/instabug/library/util/h;->b:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/instabug/library/util/h;->f:Landroid/view/View;

    .line 92
    iget-object v0, p0, Lcom/instabug/library/util/h;->c:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/util/h;->c:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 93
    iget-object v0, p0, Lcom/instabug/library/util/h;->c:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/instabug/library/util/h;->g:Landroid/view/View;

    .line 94
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/instabug/library/util/h;->e:[I

    .line 95
    iget-object v0, p0, Lcom/instabug/library/util/h;->g:Landroid/view/View;

    iget-object v1, p0, Lcom/instabug/library/util/h;->e:[I

    invoke-virtual {v0, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 98
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/instabug/library/util/h;->d:I

    .line 99
    iget-object v0, p0, Lcom/instabug/library/util/h;->b:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v0, v0, 0x400

    if-eqz v0, :cond_5

    const/4 v0, 0x1

    move v1, v0

    .line 100
    :goto_0
    iget-object v0, p0, Lcom/instabug/library/util/h;->b:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v0, v0, 0x800

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    .line 103
    :goto_1
    if-eqz v1, :cond_1

    if-eqz v0, :cond_2

    .line 104
    :cond_1
    iget-object v0, p0, Lcom/instabug/library/util/h;->b:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "status_bar_height"

    const-string v2, "dimen"

    const-string v3, "android"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 105
    if-lez v0, :cond_2

    iget-object v1, p0, Lcom/instabug/library/util/h;->j:Lcom/instabug/library/internal/device/a;

    invoke-virtual {v1}, Lcom/instabug/library/internal/device/a;->b()Z

    move-result v1

    if-nez v1, :cond_2

    .line 106
    iget-object v1, p0, Lcom/instabug/library/util/h;->b:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/instabug/library/util/h;->d:I

    .line 110
    :cond_2
    iget-object v0, p0, Lcom/instabug/library/util/h;->f:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/instabug/library/util/h;->f:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/instabug/library/util/h;->h:Landroid/graphics/Bitmap;

    .line 111
    new-instance v6, Landroid/graphics/Canvas;

    invoke-direct {v6}, Landroid/graphics/Canvas;-><init>()V

    .line 112
    iget-object v0, p0, Lcom/instabug/library/util/h;->h:Landroid/graphics/Bitmap;

    invoke-virtual {v6, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 114
    new-instance v7, Ljava/util/ArrayList;

    const/4 v0, 0x3

    invoke-direct {v7, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 115
    iget-object v0, p0, Lcom/instabug/library/util/h;->b:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_3

    .line 116
    iget-object v0, p0, Lcom/instabug/library/util/h;->b:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 117
    invoke-direct {p0, v0, v7}, Lcom/instabug/library/util/h;->a(Landroid/view/ViewGroup;Ljava/util/List;)V

    .line 123
    :cond_3
    iget-object v0, p0, Lcom/instabug/library/util/h;->b:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 125
    if-eqz v8, :cond_4

    .line 126
    iget-object v0, p0, Lcom/instabug/library/util/h;->b:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 127
    invoke-virtual {v8, v6}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 130
    :cond_4
    iget-object v0, p0, Lcom/instabug/library/util/h;->k:Ljava/util/List;

    if-eqz v0, :cond_7

    .line 131
    iget-object v0, p0, Lcom/instabug/library/util/h;->k:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/instabug/library/internal/layer/c;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 133
    :try_start_1
    invoke-interface {v0, v6}, Lcom/instabug/library/internal/layer/c;->a(Landroid/graphics/Canvas;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 135
    :catch_0
    move-exception v0

    goto :goto_2

    .line 99
    :cond_5
    const/4 v0, 0x0

    move v1, v0

    goto/16 :goto_0

    .line 100
    :cond_6
    const/4 v0, 0x0

    goto/16 :goto_1

    .line 139
    :cond_7
    :try_start_2
    iget-object v0, p0, Lcom/instabug/library/util/h;->i:Landroid/opengl/GLSurfaceView;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/instabug/library/util/h;->i:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0}, Landroid/opengl/GLSurfaceView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_a

    .line 140
    const/4 v0, 0x2

    new-array v9, v0, [I

    .line 142
    iget-object v0, p0, Lcom/instabug/library/util/h;->i:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0, v9}, Landroid/opengl/GLSurfaceView;->getLocationOnScreen([I)V

    .line 143
    iget-object v0, p0, Lcom/instabug/library/util/h;->i:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0}, Landroid/opengl/GLSurfaceView;->getWidth()I

    move-result v2

    .line 144
    iget-object v0, p0, Lcom/instabug/library/util/h;->i:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0}, Landroid/opengl/GLSurfaceView;->getHeight()I

    move-result v3

    .line 146
    add-int/lit8 v0, v3, 0x0

    mul-int/2addr v0, v2

    new-array v10, v0, [I

    .line 150
    invoke-static {v10}, Ljava/nio/IntBuffer;->wrap([I)Ljava/nio/IntBuffer;

    move-result-object v4

    .line 151
    const/4 v0, 0x0

    invoke-virtual {v4, v0}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    .line 154
    new-instance v5, Ljava/util/concurrent/CountDownLatch;

    const/4 v0, 0x1

    invoke-direct {v5, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 155
    iget-object v11, p0, Lcom/instabug/library/util/h;->i:Landroid/opengl/GLSurfaceView;

    new-instance v0, Lcom/instabug/library/util/i;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/instabug/library/util/i;-><init>(Lcom/instabug/library/util/h;IILjava/nio/IntBuffer;Ljava/util/concurrent/CountDownLatch;)V

    invoke-virtual {v11, v0}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 176
    invoke-virtual {v5}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 178
    mul-int v0, v2, v3

    new-array v5, v0, [I

    .line 179
    const/4 v1, 0x0

    .line 180
    const/4 v0, 0x0

    move v4, v1

    move v1, v0

    :goto_3
    if-ge v4, v3, :cond_9

    .line 181
    const/4 v0, 0x0

    :goto_4
    if-ge v0, v2, :cond_8

    .line 182
    mul-int v11, v4, v2

    add-int/2addr v11, v0

    aget v11, v10, v11

    .line 183
    shr-int/lit8 v12, v11, 0x10

    and-int/lit16 v12, v12, 0xff

    .line 184
    shl-int/lit8 v13, v11, 0x10

    const/high16 v14, 0xff0000

    and-int/2addr v13, v14

    .line 185
    const v14, -0xff0100

    and-int/2addr v11, v14

    or-int/2addr v11, v13

    or-int/2addr v11, v12

    .line 186
    sub-int v12, v3, v1

    add-int/lit8 v12, v12, -0x1

    mul-int/2addr v12, v2

    add-int/2addr v12, v0

    aput v11, v5, v12

    .line 181
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 188
    :cond_8
    add-int/lit8 v4, v4, 0x1

    .line 180
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_3

    .line 191
    :cond_9
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v5, v2, v3, v0}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 192
    const/4 v1, 0x0

    aget v1, v9, v1

    int-to-float v1, v1

    const/4 v2, 0x1

    aget v2, v9, v2

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-virtual {v6, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 197
    :cond_a
    iget-object v0, p0, Lcom/instabug/library/util/h;->f:Landroid/view/View;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 200
    iget-object v0, p0, Lcom/instabug/library/util/h;->f:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setDrawingCacheBackgroundColor(I)V

    .line 201
    iget-object v0, p0, Lcom/instabug/library/util/h;->f:Landroid/view/View;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->buildDrawingCache(Z)V

    .line 202
    iget-object v0, p0, Lcom/instabug/library/util/h;->f:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 203
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v6, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 206
    iget-object v0, p0, Lcom/instabug/library/util/h;->b:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 209
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 210
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_5

    .line 224
    :catch_1
    move-exception v0

    .line 225
    iget-object v1, p0, Lcom/instabug/library/util/h;->a:Lcom/instabug/library/util/h$a;

    invoke-virtual {v0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/instabug/library/util/h;->l:Ljava/lang/Exception;

    invoke-interface {v1, v0, v2}, Lcom/instabug/library/util/h$a;->a(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 226
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/instabug/library/util/h;->cancel(Z)Z

    .line 228
    :cond_b
    :goto_6
    return-void

    .line 213
    :cond_c
    :try_start_3
    iget-object v0, p0, Lcom/instabug/library/util/h;->g:Landroid/view/View;

    if-eqz v0, :cond_b

    .line 214
    iget-object v0, p0, Lcom/instabug/library/util/h;->g:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/instabug/library/util/h;->g:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 215
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 216
    iget-object v2, p0, Lcom/instabug/library/util/h;->g:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 217
    iget-object v1, p0, Lcom/instabug/library/util/h;->e:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    int-to-float v1, v1

    iget-object v2, p0, Lcom/instabug/library/util/h;->e:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-virtual {v6, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 219
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/instabug/library/util/h;->g:Landroid/view/View;

    .line 220
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_6
.end method

.method private a(Landroid/view/ViewGroup;Ljava/util/List;)V
    .locals 5

    .prologue
    .line 232
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 233
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge v1, v0, :cond_2

    .line 234
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 235
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "com.instabug.library"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 236
    const/16 v3, 0x8

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 237
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 233
    :cond_0
    :goto_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 238
    :cond_1
    instance-of v3, v0, Landroid/view/ViewGroup;

    if-eqz v3, :cond_0

    .line 239
    check-cast v0, Landroid/view/ViewGroup;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 243
    :cond_2
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 244
    invoke-direct {p0, v0, p2}, Lcom/instabug/library/util/h;->a(Landroid/view/ViewGroup;Ljava/util/List;)V

    goto :goto_2

    .line 246
    :cond_3
    return-void
.end method

.method private varargs b()Landroid/graphics/Bitmap;
    .locals 6

    .prologue
    .line 251
    :try_start_0
    iget-object v0, p0, Lcom/instabug/library/util/h;->h:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    iget v2, p0, Lcom/instabug/library/util/h;->d:I

    iget-object v3, p0, Lcom/instabug/library/util/h;->h:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iget-object v4, p0, Lcom/instabug/library/util/h;->h:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    iget v5, p0, Lcom/instabug/library/util/h;->d:I

    sub-int/2addr v4, v5

    invoke-static {v0, v1, v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 255
    :goto_0
    return-object v0

    .line 252
    :catch_0
    move-exception v0

    .line 253
    iput-object v0, p0, Lcom/instabug/library/util/h;->l:Ljava/lang/Exception;

    .line 254
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 255
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public final a(Lcom/instabug/library/util/h$a;)V
    .locals 0

    .prologue
    .line 66
    iput-object p1, p0, Lcom/instabug/library/util/h;->a:Lcom/instabug/library/util/h$a;

    .line 67
    return-void
.end method

.method protected final synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/instabug/library/util/h;->b()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected final synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 29
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/instabug/library/util/h;->f:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/instabug/library/util/h;->b:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/util/h;->a:Lcom/instabug/library/util/h$a;

    invoke-interface {v0, p1}, Lcom/instabug/library/util/h$a;->a(Landroid/graphics/Bitmap;)V

    :goto_0
    iput-object v3, p0, Lcom/instabug/library/util/h;->b:Landroid/app/Activity;

    iput-object v3, p0, Lcom/instabug/library/util/h;->a:Lcom/instabug/library/util/h$a;

    iput-object v3, p0, Lcom/instabug/library/util/h;->c:Landroid/app/Dialog;

    iput-object v3, p0, Lcom/instabug/library/util/h;->f:Landroid/view/View;

    iput-object v3, p0, Lcom/instabug/library/util/h;->g:Landroid/view/View;

    iput-object v3, p0, Lcom/instabug/library/util/h;->j:Lcom/instabug/library/internal/device/a;

    return-void

    :cond_0
    iget-object v0, p0, Lcom/instabug/library/util/h;->a:Lcom/instabug/library/util/h$a;

    const-string v1, "Top most activity changed while capturing screenshot. Aborting feedback process."

    iget-object v2, p0, Lcom/instabug/library/util/h;->l:Ljava/lang/Exception;

    invoke-interface {v0, v1, v2}, Lcom/instabug/library/util/h$a;->a(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/instabug/library/util/h;->a:Lcom/instabug/library/util/h$a;

    const-string v1, "Could not capture screenshot"

    iget-object v2, p0, Lcom/instabug/library/util/h;->l:Ljava/lang/Exception;

    invoke-interface {v0, v1, v2}, Lcom/instabug/library/util/h$a;->a(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method protected final onPreExecute()V
    .locals 3

    .prologue
    .line 75
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 76
    iget-object v0, p0, Lcom/instabug/library/util/h;->a:Lcom/instabug/library/util/h$a;

    if-nez v0, :cond_0

    .line 77
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "OnScreenshotReady Listener cannot be null. Make sure you call setListener or pass a listener through the constructor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/util/h;->b:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 79
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/instabug/library/util/h;->cancel(Z)Z

    .line 80
    iget-object v0, p0, Lcom/instabug/library/util/h;->a:Lcom/instabug/library/util/h$a;

    const-string v1, "Top most activity changed before capturing screenshot"

    iget-object v2, p0, Lcom/instabug/library/util/h;->l:Ljava/lang/Exception;

    invoke-interface {v0, v1, v2}, Lcom/instabug/library/util/h$a;->a(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 85
    :goto_0
    return-void

    .line 82
    :cond_1
    invoke-direct {p0}, Lcom/instabug/library/util/h;->a()V

    goto :goto_0
.end method
