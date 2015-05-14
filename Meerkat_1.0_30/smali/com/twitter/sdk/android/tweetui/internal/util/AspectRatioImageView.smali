.class public Lcom/twitter/sdk/android/tweetui/internal/util/AspectRatioImageView;
.super Landroid/widget/ImageView;
.source "AspectRatioImageView.java"


# static fields
.field static final ADJUST_DIMENSION_HEIGHT:I = 0x0

.field static final ADJUST_DIMENSION_WIDTH:I = 0x1

.field private static final DEFAULT_ADJUST_DIMENSION:I = 0x0

.field private static final DEFAULT_ASPECT_RATIO:F = 1.0f


# instance fields
.field private aspectRatio:F

.field private dimensionToAdjust:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/twitter/sdk/android/tweetui/internal/util/AspectRatioImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    sget-object v1, Lcom/twitter/sdk/android/tweetui/R$styleable;->tw__AspectRatioImageView:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 34
    .local v0, "a":Landroid/content/res/TypedArray;
    :try_start_0
    sget v1, Lcom/twitter/sdk/android/tweetui/R$styleable;->tw__AspectRatioImageView_tw__image_aspect_ratio:I

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lcom/twitter/sdk/android/tweetui/internal/util/AspectRatioImageView;->aspectRatio:F

    .line 36
    sget v1, Lcom/twitter/sdk/android/tweetui/R$styleable;->tw__AspectRatioImageView_tw__image_dimension_to_adjust:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/twitter/sdk/android/tweetui/internal/util/AspectRatioImageView;->dimensionToAdjust:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 42
    return-void

    .line 40
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v1
.end method


# virtual methods
.method public getAspectRatio()F
    .locals 1

    .prologue
    .line 58
    iget v0, p0, Lcom/twitter/sdk/android/tweetui/internal/util/AspectRatioImageView;->aspectRatio:F

    return v0
.end method

.method public getDimensionToAdjust()I
    .locals 1

    .prologue
    .line 62
    iget v0, p0, Lcom/twitter/sdk/android/tweetui/internal/util/AspectRatioImageView;->dimensionToAdjust:I

    return v0
.end method

.method protected onMeasure(II)V
    .locals 4
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 46
    invoke-super {p0, p1, p2}, Landroid/widget/ImageView;->onMeasure(II)V

    .line 47
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/internal/util/AspectRatioImageView;->getMeasuredWidth()I

    move-result v1

    .line 48
    .local v1, "width":I
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/internal/util/AspectRatioImageView;->getMeasuredHeight()I

    move-result v0

    .line 49
    .local v0, "height":I
    iget v2, p0, Lcom/twitter/sdk/android/tweetui/internal/util/AspectRatioImageView;->dimensionToAdjust:I

    if-nez v2, :cond_0

    .line 50
    int-to-float v2, v1

    iget v3, p0, Lcom/twitter/sdk/android/tweetui/internal/util/AspectRatioImageView;->aspectRatio:F

    div-float/2addr v2, v3

    float-to-int v0, v2

    .line 54
    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/twitter/sdk/android/tweetui/internal/util/AspectRatioImageView;->setMeasuredDimension(II)V

    .line 55
    return-void

    .line 52
    :cond_0
    int-to-float v2, v0

    iget v3, p0, Lcom/twitter/sdk/android/tweetui/internal/util/AspectRatioImageView;->aspectRatio:F

    mul-float/2addr v2, v3

    float-to-int v1, v2

    goto :goto_0
.end method
