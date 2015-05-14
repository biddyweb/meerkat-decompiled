.class public Lcom/makeramen/roundedimageview/RoundedImageView;
.super Landroid/widget/ImageView;
.source "RoundedImageView.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final DEFAULT_BORDER_WIDTH:F = 0.0f

.field public static final DEFAULT_RADIUS:F = 0.0f

.field public static final DEFAULT_TILE_MODE:Landroid/graphics/Shader$TileMode;

.field private static final SCALE_TYPES:[Landroid/widget/ImageView$ScaleType;

.field public static final TAG:Ljava/lang/String; = "RoundedImageView"

.field private static final TILE_MODE_CLAMP:I = 0x0

.field private static final TILE_MODE_MIRROR:I = 0x2

.field private static final TILE_MODE_REPEAT:I = 0x1

.field private static final TILE_MODE_UNDEFINED:I = -0x2


# instance fields
.field private borderColor:Landroid/content/res/ColorStateList;

.field private borderWidth:F

.field private cornerRadius:F

.field private isOval:Z

.field private mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

.field private mColorFilter:Landroid/graphics/ColorFilter;

.field private mColorMod:Z

.field private mDrawable:Landroid/graphics/drawable/Drawable;

.field private mHasColorFilter:Z

.field private mResource:I

.field private mScaleType:Landroid/widget/ImageView$ScaleType;

.field private mutateBackground:Z

.field private tileModeX:Landroid/graphics/Shader$TileMode;

.field private tileModeY:Landroid/graphics/Shader$TileMode;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 33
    const-class v0, Lcom/makeramen/roundedimageview/RoundedImageView;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    sput-boolean v0, Lcom/makeramen/roundedimageview/RoundedImageView;->$assertionsDisabled:Z

    .line 45
    sget-object v0, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sput-object v0, Lcom/makeramen/roundedimageview/RoundedImageView;->DEFAULT_TILE_MODE:Landroid/graphics/Shader$TileMode;

    .line 46
    const/16 v0, 0x8

    new-array v0, v0, [Landroid/widget/ImageView$ScaleType;

    sget-object v3, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    aput-object v3, v0, v2

    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_END:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/makeramen/roundedimageview/RoundedImageView;->SCALE_TYPES:[Landroid/widget/ImageView$ScaleType;

    return-void

    :cond_0
    move v0, v2

    .line 33
    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 77
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 57
    iput v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->cornerRadius:F

    .line 58
    iput v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderWidth:F

    .line 59
    const/high16 v0, -0x1000000

    .line 60
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    .line 61
    iput-boolean v1, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->isOval:Z

    .line 62
    iput-boolean v1, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mutateBackground:Z

    .line 63
    sget-object v0, Lcom/makeramen/roundedimageview/RoundedImageView;->DEFAULT_TILE_MODE:Landroid/graphics/Shader$TileMode;

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->tileModeX:Landroid/graphics/Shader$TileMode;

    .line 64
    sget-object v0, Lcom/makeramen/roundedimageview/RoundedImageView;->DEFAULT_TILE_MODE:Landroid/graphics/Shader$TileMode;

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->tileModeY:Landroid/graphics/Shader$TileMode;

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mColorFilter:Landroid/graphics/ColorFilter;

    .line 67
    iput-boolean v1, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mHasColorFilter:Z

    .line 68
    iput-boolean v1, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mColorMod:Z

    .line 78
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 81
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/makeramen/roundedimageview/RoundedImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 82
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/high16 v10, -0x1000000

    const/4 v9, -0x1

    const/4 v8, -0x2

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 85
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 57
    iput v7, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->cornerRadius:F

    .line 58
    iput v7, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderWidth:F

    .line 60
    invoke-static {v10}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    iput-object v5, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    .line 61
    iput-boolean v6, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->isOval:Z

    .line 62
    iput-boolean v6, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mutateBackground:Z

    .line 63
    sget-object v5, Lcom/makeramen/roundedimageview/RoundedImageView;->DEFAULT_TILE_MODE:Landroid/graphics/Shader$TileMode;

    iput-object v5, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->tileModeX:Landroid/graphics/Shader$TileMode;

    .line 64
    sget-object v5, Lcom/makeramen/roundedimageview/RoundedImageView;->DEFAULT_TILE_MODE:Landroid/graphics/Shader$TileMode;

    iput-object v5, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->tileModeY:Landroid/graphics/Shader$TileMode;

    .line 66
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mColorFilter:Landroid/graphics/ColorFilter;

    .line 67
    iput-boolean v6, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mHasColorFilter:Z

    .line 68
    iput-boolean v6, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mColorMod:Z

    .line 87
    sget-object v5, Lcom/makeramen/roundedimageview/R$styleable;->RoundedImageView:[I

    invoke-virtual {p1, p2, v5, p3, v6}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 89
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v5, Lcom/makeramen/roundedimageview/R$styleable;->RoundedImageView_android_scaleType:I

    invoke-virtual {v0, v5, v9}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    .line 90
    .local v1, "index":I
    if-ltz v1, :cond_6

    .line 91
    sget-object v5, Lcom/makeramen/roundedimageview/RoundedImageView;->SCALE_TYPES:[Landroid/widget/ImageView$ScaleType;

    aget-object v5, v5, v1

    invoke-virtual {p0, v5}, Lcom/makeramen/roundedimageview/RoundedImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 97
    :goto_0
    sget v5, Lcom/makeramen/roundedimageview/R$styleable;->RoundedImageView_riv_corner_radius:I

    invoke-virtual {v0, v5, v9}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    int-to-float v5, v5

    iput v5, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->cornerRadius:F

    .line 98
    sget v5, Lcom/makeramen/roundedimageview/R$styleable;->RoundedImageView_riv_border_width:I

    invoke-virtual {v0, v5, v9}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    int-to-float v5, v5

    iput v5, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderWidth:F

    .line 101
    iget v5, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->cornerRadius:F

    cmpg-float v5, v5, v7

    if-gez v5, :cond_0

    .line 102
    iput v7, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->cornerRadius:F

    .line 104
    :cond_0
    iget v5, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderWidth:F

    cmpg-float v5, v5, v7

    if-gez v5, :cond_1

    .line 105
    iput v7, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderWidth:F

    .line 108
    :cond_1
    sget v5, Lcom/makeramen/roundedimageview/R$styleable;->RoundedImageView_riv_border_color:I

    invoke-virtual {v0, v5}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    iput-object v5, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    .line 109
    iget-object v5, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    if-nez v5, :cond_2

    .line 110
    invoke-static {v10}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    iput-object v5, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    .line 113
    :cond_2
    sget v5, Lcom/makeramen/roundedimageview/R$styleable;->RoundedImageView_riv_mutate_background:I

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    iput-boolean v5, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mutateBackground:Z

    .line 114
    sget v5, Lcom/makeramen/roundedimageview/R$styleable;->RoundedImageView_riv_oval:I

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    iput-boolean v5, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->isOval:Z

    .line 116
    sget v5, Lcom/makeramen/roundedimageview/R$styleable;->RoundedImageView_riv_tile_mode:I

    invoke-virtual {v0, v5, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    .line 117
    .local v2, "tileMode":I
    if-eq v2, v8, :cond_3

    .line 118
    invoke-static {v2}, Lcom/makeramen/roundedimageview/RoundedImageView;->parseTileMode(I)Landroid/graphics/Shader$TileMode;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/makeramen/roundedimageview/RoundedImageView;->setTileModeX(Landroid/graphics/Shader$TileMode;)V

    .line 119
    invoke-static {v2}, Lcom/makeramen/roundedimageview/RoundedImageView;->parseTileMode(I)Landroid/graphics/Shader$TileMode;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/makeramen/roundedimageview/RoundedImageView;->setTileModeY(Landroid/graphics/Shader$TileMode;)V

    .line 122
    :cond_3
    sget v5, Lcom/makeramen/roundedimageview/R$styleable;->RoundedImageView_riv_tile_mode_x:I

    invoke-virtual {v0, v5, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    .line 123
    .local v3, "tileModeX":I
    if-eq v3, v8, :cond_4

    .line 124
    invoke-static {v3}, Lcom/makeramen/roundedimageview/RoundedImageView;->parseTileMode(I)Landroid/graphics/Shader$TileMode;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/makeramen/roundedimageview/RoundedImageView;->setTileModeX(Landroid/graphics/Shader$TileMode;)V

    .line 127
    :cond_4
    sget v5, Lcom/makeramen/roundedimageview/R$styleable;->RoundedImageView_riv_tile_mode_y:I

    invoke-virtual {v0, v5, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    .line 128
    .local v4, "tileModeY":I
    if-eq v4, v8, :cond_5

    .line 129
    invoke-static {v4}, Lcom/makeramen/roundedimageview/RoundedImageView;->parseTileMode(I)Landroid/graphics/Shader$TileMode;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/makeramen/roundedimageview/RoundedImageView;->setTileModeY(Landroid/graphics/Shader$TileMode;)V

    .line 132
    :cond_5
    invoke-direct {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateDrawableAttrs()V

    .line 133
    const/4 v5, 0x1

    invoke-direct {p0, v5}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 135
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 136
    return-void

    .line 94
    .end local v2    # "tileMode":I
    .end local v3    # "tileModeX":I
    .end local v4    # "tileModeY":I
    :cond_6
    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v5}, Lcom/makeramen/roundedimageview/RoundedImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto/16 :goto_0
.end method

.method private applyColorMod()V
    .locals 2

    .prologue
    .line 284
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mColorMod:Z

    if-eqz v0, :cond_0

    .line 285
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 286
    iget-boolean v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mHasColorFilter:Z

    if-eqz v0, :cond_0

    .line 287
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mColorFilter:Landroid/graphics/ColorFilter;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 293
    :cond_0
    return-void
.end method

.method private static parseTileMode(I)Landroid/graphics/Shader$TileMode;
    .locals 1
    .param p0, "tileMode"    # I

    .prologue
    .line 139
    packed-switch p0, :pswitch_data_0

    .line 147
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 141
    :pswitch_0
    sget-object v0, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    goto :goto_0

    .line 143
    :pswitch_1
    sget-object v0, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    goto :goto_0

    .line 145
    :pswitch_2
    sget-object v0, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    goto :goto_0

    .line 139
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private resolveResource()Landroid/graphics/drawable/Drawable;
    .locals 6

    .prologue
    .line 235
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 236
    .local v2, "rsrc":Landroid/content/res/Resources;
    if-nez v2, :cond_0

    const/4 v3, 0x0

    .line 249
    :goto_0
    return-object v3

    .line 238
    :cond_0
    const/4 v0, 0x0

    .line 240
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    iget v3, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mResource:I

    if-eqz v3, :cond_1

    .line 242
    :try_start_0
    iget v3, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mResource:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 249
    :cond_1
    :goto_1
    invoke-static {v0}, Lcom/makeramen/roundedimageview/RoundedDrawable;->fromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    goto :goto_0

    .line 243
    :catch_0
    move-exception v1

    .line 244
    .local v1, "e":Ljava/lang/Exception;
    const-string v3, "RoundedImageView"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to find resource: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mResource:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 246
    const/4 v3, 0x0

    iput v3, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mResource:I

    goto :goto_1
.end method

.method private updateAttrs(Landroid/graphics/drawable/Drawable;)V
    .locals 5
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 296
    if-nez p1, :cond_1

    .line 315
    .end local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_0
    :goto_0
    return-void

    .line 298
    .restart local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_1
    instance-of v3, p1, Lcom/makeramen/roundedimageview/RoundedDrawable;

    if-eqz v3, :cond_2

    .line 299
    check-cast p1, Lcom/makeramen/roundedimageview/RoundedDrawable;

    .end local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    iget-object v3, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 300
    invoke-virtual {p1, v3}, Lcom/makeramen/roundedimageview/RoundedDrawable;->setScaleType(Landroid/widget/ImageView$ScaleType;)Lcom/makeramen/roundedimageview/RoundedDrawable;

    move-result-object v3

    iget v4, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->cornerRadius:F

    .line 301
    invoke-virtual {v3, v4}, Lcom/makeramen/roundedimageview/RoundedDrawable;->setCornerRadius(F)Lcom/makeramen/roundedimageview/RoundedDrawable;

    move-result-object v3

    iget v4, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderWidth:F

    .line 302
    invoke-virtual {v3, v4}, Lcom/makeramen/roundedimageview/RoundedDrawable;->setBorderWidth(F)Lcom/makeramen/roundedimageview/RoundedDrawable;

    move-result-object v3

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    .line 303
    invoke-virtual {v3, v4}, Lcom/makeramen/roundedimageview/RoundedDrawable;->setBorderColor(Landroid/content/res/ColorStateList;)Lcom/makeramen/roundedimageview/RoundedDrawable;

    move-result-object v3

    iget-boolean v4, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->isOval:Z

    .line 304
    invoke-virtual {v3, v4}, Lcom/makeramen/roundedimageview/RoundedDrawable;->setOval(Z)Lcom/makeramen/roundedimageview/RoundedDrawable;

    move-result-object v3

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->tileModeX:Landroid/graphics/Shader$TileMode;

    .line 305
    invoke-virtual {v3, v4}, Lcom/makeramen/roundedimageview/RoundedDrawable;->setTileModeX(Landroid/graphics/Shader$TileMode;)Lcom/makeramen/roundedimageview/RoundedDrawable;

    move-result-object v3

    iget-object v4, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->tileModeY:Landroid/graphics/Shader$TileMode;

    .line 306
    invoke-virtual {v3, v4}, Lcom/makeramen/roundedimageview/RoundedDrawable;->setTileModeY(Landroid/graphics/Shader$TileMode;)Lcom/makeramen/roundedimageview/RoundedDrawable;

    .line 307
    invoke-direct {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->applyColorMod()V

    goto :goto_0

    .line 308
    .restart local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_2
    instance-of v3, p1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v3, :cond_0

    move-object v2, p1

    .line 310
    check-cast v2, Landroid/graphics/drawable/LayerDrawable;

    .line 311
    .local v2, "ld":Landroid/graphics/drawable/LayerDrawable;
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-virtual {v2}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v1

    .local v1, "layers":I
    :goto_1
    if-ge v0, v1, :cond_0

    .line 312
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateAttrs(Landroid/graphics/drawable/Drawable;)V

    .line 311
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private updateBackgroundDrawableAttrs(Z)V
    .locals 1
    .param p1, "convert"    # Z

    .prologue
    .line 262
    iget-boolean v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mutateBackground:Z

    if-eqz v0, :cond_1

    .line 263
    if-eqz p1, :cond_0

    .line 264
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-static {v0}, Lcom/makeramen/roundedimageview/RoundedDrawable;->fromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 266
    :cond_0
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateAttrs(Landroid/graphics/drawable/Drawable;)V

    .line 268
    :cond_1
    return-void
.end method

.method private updateDrawableAttrs()V
    .locals 1

    .prologue
    .line 258
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateAttrs(Landroid/graphics/drawable/Drawable;)V

    .line 259
    return-void
.end method


# virtual methods
.method protected drawableStateChanged()V
    .locals 0

    .prologue
    .line 153
    invoke-super {p0}, Landroid/widget/ImageView;->drawableStateChanged()V

    .line 154
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->invalidate()V

    .line 155
    return-void
.end method

.method public getBorderColor()I
    .locals 1

    .prologue
    .line 360
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    return v0
.end method

.method public getBorderColors()Landroid/content/res/ColorStateList;
    .locals 1

    .prologue
    .line 368
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getBorderWidth()F
    .locals 1

    .prologue
    .line 343
    iget v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderWidth:F

    return v0
.end method

.method public getCornerRadius()F
    .locals 1

    .prologue
    .line 326
    iget v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->cornerRadius:F

    return v0
.end method

.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method

.method public getTileModeX()Landroid/graphics/Shader$TileMode;
    .locals 1

    .prologue
    .line 395
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->tileModeX:Landroid/graphics/Shader$TileMode;

    return-object v0
.end method

.method public getTileModeY()Landroid/graphics/Shader$TileMode;
    .locals 1

    .prologue
    .line 408
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->tileModeY:Landroid/graphics/Shader$TileMode;

    return-object v0
.end method

.method public isOval()Z
    .locals 1

    .prologue
    .line 384
    iget-boolean v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->isOval:Z

    return v0
.end method

.method public mutateBackground(Z)V
    .locals 1
    .param p1, "mutate"    # Z

    .prologue
    .line 425
    iget-boolean v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mutateBackground:Z

    if-ne v0, p1, :cond_0

    .line 430
    :goto_0
    return-void

    .line 427
    :cond_0
    iput-boolean p1, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mutateBackground:Z

    .line 428
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 429
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->invalidate()V

    goto :goto_0
.end method

.method public mutatesBackground()Z
    .locals 1

    .prologue
    .line 421
    iget-boolean v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mutateBackground:Z

    return v0
.end method

.method public setBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "background"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 254
    invoke-virtual {p0, p1}, Lcom/makeramen/roundedimageview/RoundedImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 255
    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "background"    # Landroid/graphics/drawable/Drawable;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 320
    iput-object p1, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 321
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 322
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-super {p0, v0}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 323
    return-void
.end method

.method public setBorderColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 364
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/makeramen/roundedimageview/RoundedImageView;->setBorderColor(Landroid/content/res/ColorStateList;)V

    .line 365
    return-void
.end method

.method public setBorderColor(Landroid/content/res/ColorStateList;)V
    .locals 2
    .param p1, "colors"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 372
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 381
    .end local p1    # "colors":Landroid/content/res/ColorStateList;
    :cond_0
    :goto_0
    return-void

    .line 374
    .restart local p1    # "colors":Landroid/content/res/ColorStateList;
    :cond_1
    if-eqz p1, :cond_2

    .line 375
    .end local p1    # "colors":Landroid/content/res/ColorStateList;
    :goto_1
    iput-object p1, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    .line 376
    invoke-direct {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateDrawableAttrs()V

    .line 377
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 378
    iget v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderWidth:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 379
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->invalidate()V

    goto :goto_0

    .line 374
    .restart local p1    # "colors":Landroid/content/res/ColorStateList;
    :cond_2
    const/high16 v0, -0x1000000

    .line 375
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    goto :goto_1
.end method

.method public setBorderWidth(F)V
    .locals 1
    .param p1, "width"    # F

    .prologue
    .line 351
    iget v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderWidth:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_0

    .line 357
    :goto_0
    return-void

    .line 353
    :cond_0
    iput p1, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->borderWidth:F

    .line 354
    invoke-direct {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateDrawableAttrs()V

    .line 355
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 356
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->invalidate()V

    goto :goto_0
.end method

.method public setBorderWidth(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 347
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/makeramen/roundedimageview/RoundedImageView;->setBorderWidth(F)V

    .line 348
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 2
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    const/4 v1, 0x1

    .line 271
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mColorFilter:Landroid/graphics/ColorFilter;

    if-eq v0, p1, :cond_0

    .line 272
    iput-object p1, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mColorFilter:Landroid/graphics/ColorFilter;

    .line 273
    iput-boolean v1, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mHasColorFilter:Z

    .line 274
    iput-boolean v1, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mColorMod:Z

    .line 275
    invoke-direct {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->applyColorMod()V

    .line 276
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->invalidate()V

    .line 278
    :cond_0
    return-void
.end method

.method public setCornerRadius(F)V
    .locals 1
    .param p1, "radius"    # F

    .prologue
    .line 334
    iget v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->cornerRadius:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_0

    .line 340
    :goto_0
    return-void

    .line 336
    :cond_0
    iput p1, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->cornerRadius:F

    .line 337
    invoke-direct {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateDrawableAttrs()V

    .line 338
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 339
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->invalidate()V

    goto :goto_0
.end method

.method public setCornerRadiusDimen(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 330
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/makeramen/roundedimageview/RoundedImageView;->setCornerRadius(F)V

    .line 331
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "bm"    # Landroid/graphics/Bitmap;

    .prologue
    .line 213
    const/4 v0, 0x0

    iput v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mResource:I

    .line 214
    invoke-static {p1}, Lcom/makeramen/roundedimageview/RoundedDrawable;->fromBitmap(Landroid/graphics/Bitmap;)Lcom/makeramen/roundedimageview/RoundedDrawable;

    move-result-object v0

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 215
    invoke-direct {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateDrawableAttrs()V

    .line 216
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-super {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 217
    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 205
    const/4 v0, 0x0

    iput v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mResource:I

    .line 206
    invoke-static {p1}, Lcom/makeramen/roundedimageview/RoundedDrawable;->fromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 207
    invoke-direct {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateDrawableAttrs()V

    .line 208
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-super {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 209
    return-void
.end method

.method public setImageResource(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 221
    iget v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mResource:I

    if-eq v0, p1, :cond_0

    .line 222
    iput p1, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mResource:I

    .line 223
    invoke-direct {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->resolveResource()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 224
    invoke-direct {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateDrawableAttrs()V

    .line 225
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-super {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 227
    :cond_0
    return-void
.end method

.method public setImageURI(Landroid/net/Uri;)V
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 230
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    .line 231
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/makeramen/roundedimageview/RoundedImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 232
    return-void
.end method

.method public setOval(Z)V
    .locals 1
    .param p1, "oval"    # Z

    .prologue
    .line 388
    iput-boolean p1, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->isOval:Z

    .line 389
    invoke-direct {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateDrawableAttrs()V

    .line 390
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 391
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->invalidate()V

    .line 392
    return-void
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .locals 2
    .param p1, "scaleType"    # Landroid/widget/ImageView$ScaleType;

    .prologue
    .line 177
    sget-boolean v0, Lcom/makeramen/roundedimageview/RoundedImageView;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 179
    :cond_0
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    if-eq v0, p1, :cond_1

    .line 180
    iput-object p1, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 182
    sget-object v0, Lcom/makeramen/roundedimageview/RoundedImageView$1;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    invoke-virtual {p1}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 193
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 197
    :goto_0
    invoke-direct {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateDrawableAttrs()V

    .line 198
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 199
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->invalidate()V

    .line 201
    :cond_1
    return-void

    .line 190
    :pswitch_0
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-super {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_0

    .line 182
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public setTileModeX(Landroid/graphics/Shader$TileMode;)V
    .locals 1
    .param p1, "tileModeX"    # Landroid/graphics/Shader$TileMode;

    .prologue
    .line 399
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->tileModeX:Landroid/graphics/Shader$TileMode;

    if-ne v0, p1, :cond_0

    .line 405
    :goto_0
    return-void

    .line 401
    :cond_0
    iput-object p1, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->tileModeX:Landroid/graphics/Shader$TileMode;

    .line 402
    invoke-direct {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateDrawableAttrs()V

    .line 403
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 404
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->invalidate()V

    goto :goto_0
.end method

.method public setTileModeY(Landroid/graphics/Shader$TileMode;)V
    .locals 1
    .param p1, "tileModeY"    # Landroid/graphics/Shader$TileMode;

    .prologue
    .line 412
    iget-object v0, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->tileModeY:Landroid/graphics/Shader$TileMode;

    if-ne v0, p1, :cond_0

    .line 418
    :goto_0
    return-void

    .line 414
    :cond_0
    iput-object p1, p0, Lcom/makeramen/roundedimageview/RoundedImageView;->tileModeY:Landroid/graphics/Shader$TileMode;

    .line 415
    invoke-direct {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateDrawableAttrs()V

    .line 416
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/makeramen/roundedimageview/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 417
    invoke-virtual {p0}, Lcom/makeramen/roundedimageview/RoundedImageView;->invalidate()V

    goto :goto_0
.end method
