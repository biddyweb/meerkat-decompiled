.class public Lcom/google/android/exoplayer/VideoSurfaceView;
.super Landroid/view/SurfaceView;
.source "VideoSurfaceView.java"


# static fields
.field private static final MAX_ASPECT_RATIO_DEFORMATION_PERCENT:F = 0.01f


# instance fields
.field private videoAspectRatio:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 45
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 46
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 6
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 62
    invoke-super {p0, p1, p2}, Landroid/view/SurfaceView;->onMeasure(II)V

    .line 63
    invoke-virtual {p0}, Lcom/google/android/exoplayer/VideoSurfaceView;->getMeasuredWidth()I

    move-result v3

    .line 64
    .local v3, "width":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/VideoSurfaceView;->getMeasuredHeight()I

    move-result v1

    .line 65
    .local v1, "height":I
    iget v4, p0, Lcom/google/android/exoplayer/VideoSurfaceView;->videoAspectRatio:F

    const/4 v5, 0x0

    cmpl-float v4, v4, v5

    if-eqz v4, :cond_0

    .line 66
    int-to-float v4, v3

    int-to-float v5, v1

    div-float v2, v4, v5

    .line 67
    .local v2, "viewAspectRatio":F
    iget v4, p0, Lcom/google/android/exoplayer/VideoSurfaceView;->videoAspectRatio:F

    div-float/2addr v4, v2

    const/high16 v5, 0x3f800000    # 1.0f

    sub-float v0, v4, v5

    .line 68
    .local v0, "aspectDeformation":F
    const v4, 0x3c23d70a    # 0.01f

    cmpl-float v4, v0, v4

    if-lez v4, :cond_1

    .line 69
    int-to-float v4, v3

    iget v5, p0, Lcom/google/android/exoplayer/VideoSurfaceView;->videoAspectRatio:F

    div-float/2addr v4, v5

    float-to-int v1, v4

    .line 74
    .end local v0    # "aspectDeformation":F
    .end local v2    # "viewAspectRatio":F
    :cond_0
    :goto_0
    invoke-virtual {p0, v3, v1}, Lcom/google/android/exoplayer/VideoSurfaceView;->setMeasuredDimension(II)V

    .line 75
    return-void

    .line 70
    .restart local v0    # "aspectDeformation":F
    .restart local v2    # "viewAspectRatio":F
    :cond_1
    const v4, -0x43dc28f6    # -0.01f

    cmpg-float v4, v0, v4

    if-gez v4, :cond_0

    .line 71
    int-to-float v4, v1

    iget v5, p0, Lcom/google/android/exoplayer/VideoSurfaceView;->videoAspectRatio:F

    mul-float/2addr v4, v5

    float-to-int v3, v4

    goto :goto_0
.end method

.method public setVideoWidthHeightRatio(F)V
    .locals 1
    .param p1, "widthHeightRatio"    # F

    .prologue
    .line 54
    iget v0, p0, Lcom/google/android/exoplayer/VideoSurfaceView;->videoAspectRatio:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 55
    iput p1, p0, Lcom/google/android/exoplayer/VideoSurfaceView;->videoAspectRatio:F

    .line 56
    invoke-virtual {p0}, Lcom/google/android/exoplayer/VideoSurfaceView;->requestLayout()V

    .line 58
    :cond_0
    return-void
.end method
