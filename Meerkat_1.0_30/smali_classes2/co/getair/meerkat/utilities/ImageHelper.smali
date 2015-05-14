.class public Lco/getair/meerkat/utilities/ImageHelper;
.super Ljava/lang/Object;
.source "ImageHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static circleImage(Landroid/content/Context;Landroid/util/DisplayMetrics;Landroid/graphics/Bitmap;I)Lcom/makeramen/roundedimageview/RoundedImageView;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "metrics"    # Landroid/util/DisplayMetrics;
    .param p2, "bitmapToCircle"    # Landroid/graphics/Bitmap;
    .param p3, "diameter"    # I

    .prologue
    .line 24
    new-instance v0, Lcom/makeramen/roundedimageview/RoundedImageView;

    invoke-direct {v0, p0}, Lcom/makeramen/roundedimageview/RoundedImageView;-><init>(Landroid/content/Context;)V

    .line 25
    .local v0, "roundedImageView":Lcom/makeramen/roundedimageview/RoundedImageView;
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Lcom/makeramen/roundedimageview/RoundedImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 26
    invoke-static {p1, p2, p3, p3}, Lco/getair/meerkat/utilities/ImageHelper;->resizeBitmap(Landroid/util/DisplayMetrics;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/makeramen/roundedimageview/RoundedImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 27
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/makeramen/roundedimageview/RoundedImageView;->setOval(Z)V

    .line 28
    sget-object v1, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    invoke-virtual {v0, v1}, Lcom/makeramen/roundedimageview/RoundedImageView;->setTileModeX(Landroid/graphics/Shader$TileMode;)V

    .line 29
    sget-object v1, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    invoke-virtual {v0, v1}, Lcom/makeramen/roundedimageview/RoundedImageView;->setTileModeY(Landroid/graphics/Shader$TileMode;)V

    .line 31
    return-object v0
.end method

.method public static resizeBitmap(Landroid/util/DisplayMetrics;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 5
    .param p0, "metrics"    # Landroid/util/DisplayMetrics;
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "dpWidth"    # I
    .param p3, "dpHeight"    # I

    .prologue
    .line 17
    int-to-float v3, p2

    iget v4, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v3, v4

    float-to-int v2, v3

    .line 18
    .local v2, "width":I
    int-to-float v3, p3

    iget v4, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v3, v4

    float-to-int v0, v3

    .line 19
    .local v0, "height":I
    const/4 v3, 0x1

    invoke-static {p1, v2, v0, v3}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 20
    .local v1, "resizedBitmap":Landroid/graphics/Bitmap;
    return-object v1
.end method
