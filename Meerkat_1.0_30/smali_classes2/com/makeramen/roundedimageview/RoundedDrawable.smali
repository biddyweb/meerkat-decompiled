.class public Lcom/makeramen/roundedimageview/RoundedDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "RoundedDrawable.java"


# static fields
.field public static final DEFAULT_BORDER_COLOR:I = -0x1000000

.field public static final TAG:Ljava/lang/String; = "RoundedDrawable"


# instance fields
.field private final mBitmap:Landroid/graphics/Bitmap;

.field private final mBitmapHeight:I

.field private final mBitmapPaint:Landroid/graphics/Paint;

.field private final mBitmapRect:Landroid/graphics/RectF;

.field private mBitmapShader:Landroid/graphics/BitmapShader;

.field private final mBitmapWidth:I

.field private mBorderColor:Landroid/content/res/ColorStateList;

.field private final mBorderPaint:Landroid/graphics/Paint;

.field private final mBorderRect:Landroid/graphics/RectF;

.field private mBorderWidth:F

.field private final mBounds:Landroid/graphics/RectF;

.field private mCornerRadius:F

.field private final mDrawableRect:Landroid/graphics/RectF;

.field private mOval:Z

.field private mRebuildShader:Z

.field private mScaleType:Landroid/widget/ImageView$ScaleType;

.field private final mShaderMatrix:Landroid/graphics/Matrix;

.field private mTileModeX:Landroid/graphics/Shader$TileMode;

.field private mTileModeY:Landroid/graphics/Shader$TileMode;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .locals 6
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/high16 v5, -0x1000000

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 66
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 44
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    .line 45
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    .line 46
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    .line 51
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 53
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 56
    sget-object v0, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mTileModeX:Landroid/graphics/Shader$TileMode;

    .line 57
    sget-object v0, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mTileModeY:Landroid/graphics/Shader$TileMode;

    .line 58
    iput-boolean v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mRebuildShader:Z

    .line 60
    iput v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mCornerRadius:F

    .line 61
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mOval:Z

    .line 62
    iput v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    .line 63
    invoke-static {v5}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 64
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 67
    iput-object p1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmap:Landroid/graphics/Bitmap;

    .line 69
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapWidth:I

    .line 70
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapHeight:I

    .line 71
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapWidth:I

    int-to-float v1, v1

    iget v2, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapHeight:I

    int-to-float v2, v2

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 73
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 74
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 75
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 77
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 78
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 79
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 80
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedDrawable;->getState()[I

    move-result-object v2

    invoke-virtual {v1, v2, v5}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 81
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 82
    return-void
.end method

.method public static drawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;
    .locals 9
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v6, 0x2

    .line 119
    instance-of v5, p0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v5, :cond_0

    .line 120
    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;

    .end local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 137
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    .local v3, "height":I
    .local v4, "width":I
    .restart local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    :goto_0
    return-object v0

    .line 124
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v3    # "height":I
    .end local v4    # "width":I
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 125
    .restart local v4    # "width":I
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 127
    .restart local v3    # "height":I
    :try_start_0
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v3, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 128
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 129
    .local v1, "canvas":Landroid/graphics/Canvas;
    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v7

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v8

    invoke-virtual {p0, v5, v6, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 130
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 131
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "canvas":Landroid/graphics/Canvas;
    :catch_0
    move-exception v2

    .line 132
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 133
    const-string v5, "RoundedDrawable"

    const-string v6, "Failed to create bitmap from drawable!"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    const/4 v0, 0x0

    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    goto :goto_0
.end method

.method public static fromBitmap(Landroid/graphics/Bitmap;)Lcom/makeramen/roundedimageview/RoundedDrawable;
    .locals 1
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 85
    if-eqz p0, :cond_0

    .line 86
    new-instance v0, Lcom/makeramen/roundedimageview/RoundedDrawable;

    invoke-direct {v0, p0}, Lcom/makeramen/roundedimageview/RoundedDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 88
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static fromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 7
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 93
    if-eqz p0, :cond_0

    .line 94
    instance-of v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;

    if-eqz v5, :cond_1

    .line 115
    .end local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    .local v0, "bm":Landroid/graphics/Bitmap;
    :cond_0
    :goto_0
    return-object p0

    .line 97
    .end local v0    # "bm":Landroid/graphics/Bitmap;
    .restart local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_1
    instance-of v5, p0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v5, :cond_3

    move-object v3, p0

    .line 98
    check-cast v3, Landroid/graphics/drawable/LayerDrawable;

    .line 99
    .local v3, "ld":Landroid/graphics/drawable/LayerDrawable;
    invoke-virtual {v3}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v4

    .line 102
    .local v4, "num":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_2

    .line 103
    invoke-virtual {v3, v2}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 104
    .local v1, "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v3, v2}, Landroid/graphics/drawable/LayerDrawable;->getId(I)I

    move-result v5

    invoke-static {v1}, Lcom/makeramen/roundedimageview/RoundedDrawable;->fromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/graphics/drawable/LayerDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    .line 102
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .end local v1    # "d":Landroid/graphics/drawable/Drawable;
    :cond_2
    move-object p0, v3

    .line 106
    goto :goto_0

    .line 110
    .end local v2    # "i":I
    .end local v3    # "ld":Landroid/graphics/drawable/LayerDrawable;
    .end local v4    # "num":I
    :cond_3
    invoke-static {p0}, Lcom/makeramen/roundedimageview/RoundedDrawable;->drawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 111
    .restart local v0    # "bm":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_0

    .line 112
    new-instance p0, Lcom/makeramen/roundedimageview/RoundedDrawable;

    .end local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-direct {p0, v0}, Lcom/makeramen/roundedimageview/RoundedDrawable;-><init>(Landroid/graphics/Bitmap;)V

    goto :goto_0
.end method

.method private updateShaderMatrix()V
    .locals 9

    .prologue
    const/high16 v8, 0x3f000000    # 0.5f

    const/high16 v7, 0x40000000    # 2.0f

    .line 161
    sget-object v3, Lcom/makeramen/roundedimageview/RoundedDrawable$1;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v4}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 217
    :pswitch_0
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 218
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 219
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 220
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v4, v7

    iget v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 221
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 248
    :goto_0
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 249
    return-void

    .line 163
    :pswitch_1
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 164
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v4, v7

    iget v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 166
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3}, Landroid/graphics/Matrix;->reset()V

    .line 167
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    iget v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapWidth:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    mul-float/2addr v4, v8

    add-float/2addr v4, v8

    float-to-int v4, v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 168
    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v5

    iget v6, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapHeight:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    mul-float/2addr v5, v8

    add-float/2addr v5, v8

    float-to-int v5, v5

    int-to-float v5, v5

    .line 167
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->setTranslate(FF)V

    goto :goto_0

    .line 172
    :pswitch_2
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 173
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v4, v7

    iget v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 175
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3}, Landroid/graphics/Matrix;->reset()V

    .line 177
    const/4 v0, 0x0

    .line 178
    .local v0, "dx":F
    const/4 v1, 0x0

    .line 180
    .local v1, "dy":F
    iget v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapWidth:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    mul-float/2addr v3, v4

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    iget v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapHeight:I

    int-to-float v5, v5

    mul-float/2addr v4, v5

    cmpl-float v3, v3, v4

    if-lez v3, :cond_0

    .line 181
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    iget v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapHeight:I

    int-to-float v4, v4

    div-float v2, v3, v4

    .line 182
    .local v2, "scale":F
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapWidth:I

    int-to-float v4, v4

    mul-float/2addr v4, v2

    sub-float/2addr v3, v4

    mul-float v0, v3, v8

    .line 188
    :goto_1
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v2, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 189
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    add-float v4, v0, v8

    float-to-int v4, v4

    int-to-float v4, v4

    iget v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    add-float/2addr v4, v5

    add-float v5, v1, v8

    float-to-int v5, v5

    int-to-float v5, v5

    iget v6, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    add-float/2addr v5, v6

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto/16 :goto_0

    .line 184
    .end local v2    # "scale":F
    :cond_0
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapWidth:I

    int-to-float v4, v4

    div-float v2, v3, v4

    .line 185
    .restart local v2    # "scale":F
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    iget v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapHeight:I

    int-to-float v4, v4

    mul-float/2addr v4, v2

    sub-float/2addr v3, v4

    mul-float v1, v3, v8

    goto :goto_1

    .line 194
    .end local v0    # "dx":F
    .end local v1    # "dy":F
    .end local v2    # "scale":F
    :pswitch_3
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3}, Landroid/graphics/Matrix;->reset()V

    .line 196
    iget v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapWidth:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_1

    iget v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapHeight:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_1

    .line 197
    const/high16 v2, 0x3f800000    # 1.0f

    .line 203
    .restart local v2    # "scale":F
    :goto_2
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapWidth:I

    int-to-float v4, v4

    mul-float/2addr v4, v2

    sub-float/2addr v3, v4

    mul-float/2addr v3, v8

    add-float/2addr v3, v8

    float-to-int v3, v3

    int-to-float v0, v3

    .line 204
    .restart local v0    # "dx":F
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    iget v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapHeight:I

    int-to-float v4, v4

    mul-float/2addr v4, v2

    sub-float/2addr v3, v4

    mul-float/2addr v3, v8

    add-float/2addr v3, v8

    float-to-int v3, v3

    int-to-float v1, v3

    .line 206
    .restart local v1    # "dy":F
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v2, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 207
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 209
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 210
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 211
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v4, v7

    iget v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 212
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto/16 :goto_0

    .line 199
    .end local v0    # "dx":F
    .end local v1    # "dy":F
    .end local v2    # "scale":F
    :cond_1
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapWidth:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    .line 200
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    iget v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapHeight:I

    int-to-float v5, v5

    div-float/2addr v4, v5

    .line 199
    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .restart local v2    # "scale":F
    goto :goto_2

    .line 225
    .end local v2    # "scale":F
    :pswitch_4
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 226
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->END:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 227
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 228
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v4, v7

    iget v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 229
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto/16 :goto_0

    .line 233
    :pswitch_5
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 234
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->START:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 235
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 236
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v4, v7

    iget v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 237
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto/16 :goto_0

    .line 241
    :pswitch_6
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 242
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v4, v7

    iget v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 243
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3}, Landroid/graphics/Matrix;->reset()V

    .line 244
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto/16 :goto_0

    .line 161
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v4, 0x0

    .line 262
    iget-boolean v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mRebuildShader:Z

    if-eqz v0, :cond_1

    .line 263
    new-instance v0, Landroid/graphics/BitmapShader;

    iget-object v1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mTileModeX:Landroid/graphics/Shader$TileMode;

    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mTileModeY:Landroid/graphics/Shader$TileMode;

    invoke-direct {v0, v1, v2, v3}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapShader:Landroid/graphics/BitmapShader;

    .line 264
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mTileModeX:Landroid/graphics/Shader$TileMode;

    sget-object v1, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mTileModeY:Landroid/graphics/Shader$TileMode;

    sget-object v1, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    if-ne v0, v1, :cond_0

    .line 265
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapShader:Landroid/graphics/BitmapShader;

    iget-object v1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/BitmapShader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 267
    :cond_0
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapShader:Landroid/graphics/BitmapShader;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 268
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mRebuildShader:Z

    .line 271
    :cond_1
    iget-boolean v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mOval:Z

    if-eqz v0, :cond_3

    .line 272
    iget v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    cmpl-float v0, v0, v4

    if-lez v0, :cond_2

    .line 273
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 274
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 287
    :goto_0
    return-void

    .line 276
    :cond_2
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    goto :goto_0

    .line 279
    :cond_3
    iget v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    cmpl-float v0, v0, v4

    if-lez v0, :cond_4

    .line 280
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mCornerRadius:F

    invoke-static {v1, v4}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iget v2, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mCornerRadius:F

    .line 281
    invoke-static {v2, v4}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 280
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 282
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mCornerRadius:F

    iget v2, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mCornerRadius:F

    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_0

    .line 284
    :cond_4
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mCornerRadius:F

    iget v2, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mCornerRadius:F

    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_0
.end method

.method public getAlpha()I
    .locals 1

    .prologue
    .line 295
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    return v0
.end method

.method public getBorderColor()I
    .locals 1

    .prologue
    .line 354
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    return v0
.end method

.method public getBorderColors()Landroid/content/res/ColorStateList;
    .locals 1

    .prologue
    .line 362
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getBorderWidth()F
    .locals 1

    .prologue
    .line 344
    iget v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    return v0
.end method

.method public getColorFilter()Landroid/graphics/ColorFilter;
    .locals 1

    .prologue
    .line 305
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getColorFilter()Landroid/graphics/ColorFilter;

    move-result-object v0

    return-object v0
.end method

.method public getCornerRadius()F
    .locals 1

    .prologue
    .line 335
    iget v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mCornerRadius:F

    return v0
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .prologue
    .line 331
    iget v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapHeight:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .prologue
    .line 326
    iget v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapWidth:I

    return v0
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 291
    const/4 v0, -0x3

    return v0
.end method

.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 1

    .prologue
    .line 381
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mScaleType:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method

.method public getTileModeX()Landroid/graphics/Shader$TileMode;
    .locals 1

    .prologue
    .line 396
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mTileModeX:Landroid/graphics/Shader$TileMode;

    return-object v0
.end method

.method public getTileModeY()Landroid/graphics/Shader$TileMode;
    .locals 1

    .prologue
    .line 409
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mTileModeY:Landroid/graphics/Shader$TileMode;

    return-object v0
.end method

.method public isOval()Z
    .locals 1

    .prologue
    .line 372
    iget-boolean v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mOval:Z

    return v0
.end method

.method public isStateful()Z
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 1
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 253
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 255
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 257
    invoke-direct {p0}, Lcom/makeramen/roundedimageview/RoundedDrawable;->updateShaderMatrix()V

    .line 258
    return-void
.end method

.method protected onStateChange([I)Z
    .locals 3
    .param p1, "state"    # [I

    .prologue
    .line 147
    iget-object v1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    .line 148
    .local v0, "newColor":I
    iget-object v1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getColor()I

    move-result v1

    if-eq v1, v0, :cond_0

    .line 149
    iget-object v1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 150
    const/4 v1, 0x1

    .line 152
    :goto_0
    return v1

    :cond_0
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onStateChange([I)Z

    move-result v1

    goto :goto_0
.end method

.method public setAlpha(I)V
    .locals 1
    .param p1, "alpha"    # I

    .prologue
    .line 300
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 301
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedDrawable;->invalidateSelf()V

    .line 302
    return-void
.end method

.method public setBorderColor(I)Lcom/makeramen/roundedimageview/RoundedDrawable;
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 358
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/makeramen/roundedimageview/RoundedDrawable;->setBorderColor(Landroid/content/res/ColorStateList;)Lcom/makeramen/roundedimageview/RoundedDrawable;

    move-result-object v0

    return-object v0
.end method

.method public setBorderColor(Landroid/content/res/ColorStateList;)Lcom/makeramen/roundedimageview/RoundedDrawable;
    .locals 4
    .param p1, "colors"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 366
    if-eqz p1, :cond_0

    .end local p1    # "colors":Landroid/content/res/ColorStateList;
    :goto_0
    iput-object p1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 367
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedDrawable;->getState()[I

    move-result-object v2

    const/high16 v3, -0x1000000

    invoke-virtual {v1, v2, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 368
    return-object p0

    .line 366
    .restart local p1    # "colors":Landroid/content/res/ColorStateList;
    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    goto :goto_0
.end method

.method public setBorderWidth(F)Lcom/makeramen/roundedimageview/RoundedDrawable;
    .locals 2
    .param p1, "width"    # F

    .prologue
    .line 348
    iput p1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    .line 349
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBorderWidth:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 350
    return-object p0
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 310
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 311
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedDrawable;->invalidateSelf()V

    .line 312
    return-void
.end method

.method public setCornerRadius(F)Lcom/makeramen/roundedimageview/RoundedDrawable;
    .locals 0
    .param p1, "radius"    # F

    .prologue
    .line 339
    iput p1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mCornerRadius:F

    .line 340
    return-object p0
.end method

.method public setDither(Z)V
    .locals 1
    .param p1, "dither"    # Z

    .prologue
    .line 315
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 316
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedDrawable;->invalidateSelf()V

    .line 317
    return-void
.end method

.method public setFilterBitmap(Z)V
    .locals 1
    .param p1, "filter"    # Z

    .prologue
    .line 320
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 321
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedDrawable;->invalidateSelf()V

    .line 322
    return-void
.end method

.method public setOval(Z)Lcom/makeramen/roundedimageview/RoundedDrawable;
    .locals 0
    .param p1, "oval"    # Z

    .prologue
    .line 376
    iput-boolean p1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mOval:Z

    .line 377
    return-object p0
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)Lcom/makeramen/roundedimageview/RoundedDrawable;
    .locals 1
    .param p1, "scaleType"    # Landroid/widget/ImageView$ScaleType;

    .prologue
    .line 385
    if-nez p1, :cond_0

    .line 386
    sget-object p1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 388
    :cond_0
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mScaleType:Landroid/widget/ImageView$ScaleType;

    if-eq v0, p1, :cond_1

    .line 389
    iput-object p1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 390
    invoke-direct {p0}, Lcom/makeramen/roundedimageview/RoundedDrawable;->updateShaderMatrix()V

    .line 392
    :cond_1
    return-object p0
.end method

.method public setTileModeX(Landroid/graphics/Shader$TileMode;)Lcom/makeramen/roundedimageview/RoundedDrawable;
    .locals 1
    .param p1, "tileModeX"    # Landroid/graphics/Shader$TileMode;

    .prologue
    .line 400
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mTileModeX:Landroid/graphics/Shader$TileMode;

    if-eq v0, p1, :cond_0

    .line 401
    iput-object p1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mTileModeX:Landroid/graphics/Shader$TileMode;

    .line 402
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mRebuildShader:Z

    .line 403
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedDrawable;->invalidateSelf()V

    .line 405
    :cond_0
    return-object p0
.end method

.method public setTileModeY(Landroid/graphics/Shader$TileMode;)Lcom/makeramen/roundedimageview/RoundedDrawable;
    .locals 1
    .param p1, "tileModeY"    # Landroid/graphics/Shader$TileMode;

    .prologue
    .line 413
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mTileModeY:Landroid/graphics/Shader$TileMode;

    if-eq v0, p1, :cond_0

    .line 414
    iput-object p1, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mTileModeY:Landroid/graphics/Shader$TileMode;

    .line 415
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/makeramen/roundedimageview/RoundedDrawable;->mRebuildShader:Z

    .line 416
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedDrawable;->invalidateSelf()V

    .line 418
    :cond_0
    return-object p0
.end method

.method public toBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 422
    invoke-static {p0}, Lcom/makeramen/roundedimageview/RoundedDrawable;->drawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method
