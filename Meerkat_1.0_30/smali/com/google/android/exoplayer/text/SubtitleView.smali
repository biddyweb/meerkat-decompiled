.class public Lcom/google/android/exoplayer/text/SubtitleView;
.super Landroid/view/View;
.source "SubtitleView.java"


# static fields
.field private static final INNER_PADDING_RATIO:F = 0.125f


# instance fields
.field private backgroundColor:I

.field private final cornerRadius:F

.field private edgeColor:I

.field private edgeType:I

.field private foregroundColor:I

.field private hasMeasurements:Z

.field private innerPaddingX:I

.field private lastMeasuredWidth:I

.field private layout:Landroid/text/StaticLayout;

.field private final lineBounds:Landroid/graphics/RectF;

.field private final outlineWidth:F

.field private paint:Landroid/graphics/Paint;

.field private final shadowOffset:F

.field private final shadowRadius:F

.field private spacingAdd:F

.field private spacingMult:F

.field private final textBuilder:Ljava/lang/StringBuilder;

.field private textPaint:Landroid/text/TextPaint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 120
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/exoplayer/text/SubtitleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 121
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 83
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/exoplayer/text/SubtitleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 84
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 87
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 53
    new-instance v7, Landroid/graphics/RectF;

    invoke-direct {v7}, Landroid/graphics/RectF;-><init>()V

    iput-object v7, p0, Lcom/google/android/exoplayer/text/SubtitleView;->lineBounds:Landroid/graphics/RectF;

    .line 58
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v7, p0, Lcom/google/android/exoplayer/text/SubtitleView;->textBuilder:Ljava/lang/StringBuilder;

    .line 89
    const/4 v7, 0x4

    new-array v6, v7, [I

    fill-array-data v6, :array_0

    .line 91
    .local v6, "viewAttr":[I
    invoke-virtual {p1, p2, v6, p3, v9}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 92
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v9}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    .line 93
    .local v3, "text":Ljava/lang/CharSequence;
    const/16 v7, 0xf

    invoke-virtual {v0, v10, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    .line 94
    .local v4, "textSize":I
    const/4 v7, 0x2

    invoke-virtual {v0, v7, v9}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    int-to-float v7, v7

    iput v7, p0, Lcom/google/android/exoplayer/text/SubtitleView;->spacingAdd:F

    .line 95
    const/4 v7, 0x3

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v7

    iput v7, p0, Lcom/google/android/exoplayer/text/SubtitleView;->spacingMult:F

    .line 96
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 98
    invoke-virtual {p0}, Lcom/google/android/exoplayer/text/SubtitleView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 99
    .local v2, "resources":Landroid/content/res/Resources;
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 100
    .local v1, "displayMetrics":Landroid/util/DisplayMetrics;
    const/high16 v7, 0x40000000    # 2.0f

    iget v8, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float v8, v8

    mul-float/2addr v7, v8

    const/high16 v8, 0x43200000    # 160.0f

    div-float/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v5

    .line 101
    .local v5, "twoDpInPx":I
    int-to-float v7, v5

    iput v7, p0, Lcom/google/android/exoplayer/text/SubtitleView;->cornerRadius:F

    .line 102
    int-to-float v7, v5

    iput v7, p0, Lcom/google/android/exoplayer/text/SubtitleView;->outlineWidth:F

    .line 103
    int-to-float v7, v5

    iput v7, p0, Lcom/google/android/exoplayer/text/SubtitleView;->shadowRadius:F

    .line 104
    int-to-float v7, v5

    iput v7, p0, Lcom/google/android/exoplayer/text/SubtitleView;->shadowOffset:F

    .line 106
    new-instance v7, Landroid/text/TextPaint;

    invoke-direct {v7}, Landroid/text/TextPaint;-><init>()V

    iput-object v7, p0, Lcom/google/android/exoplayer/text/SubtitleView;->textPaint:Landroid/text/TextPaint;

    .line 107
    iget-object v7, p0, Lcom/google/android/exoplayer/text/SubtitleView;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {v7, v10}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    .line 108
    iget-object v7, p0, Lcom/google/android/exoplayer/text/SubtitleView;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {v7, v10}, Landroid/text/TextPaint;->setSubpixelText(Z)V

    .line 110
    new-instance v7, Landroid/graphics/Paint;

    invoke-direct {v7}, Landroid/graphics/Paint;-><init>()V

    iput-object v7, p0, Lcom/google/android/exoplayer/text/SubtitleView;->paint:Landroid/graphics/Paint;

    .line 111
    iget-object v7, p0, Lcom/google/android/exoplayer/text/SubtitleView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v10}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 113
    iput v9, p0, Lcom/google/android/exoplayer/text/SubtitleView;->innerPaddingX:I

    .line 114
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer/text/SubtitleView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    int-to-float v7, v4

    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/text/SubtitleView;->setTextSize(F)V

    .line 116
    sget-object v7, Lcom/google/android/exoplayer/text/CaptionStyleCompat;->DEFAULT:Lcom/google/android/exoplayer/text/CaptionStyleCompat;

    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/text/SubtitleView;->setStyle(Lcom/google/android/exoplayer/text/CaptionStyleCompat;)V

    .line 117
    return-void

    .line 89
    :array_0
    .array-data 4
        0x101014f
        0x1010095
        0x1010217
        0x1010218
    .end array-data
.end method

.method private computeMeasurements(I)Z
    .locals 9
    .param p1, "maxWidth"    # I

    .prologue
    const/4 v7, 0x1

    .line 217
    iget-boolean v0, p0, Lcom/google/android/exoplayer/text/SubtitleView;->hasMeasurements:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer/text/SubtitleView;->lastMeasuredWidth:I

    if-ne p1, v0, :cond_0

    .line 232
    :goto_0
    return v7

    .line 222
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer/text/SubtitleView;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/exoplayer/text/SubtitleView;->getPaddingRight()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/google/android/exoplayer/text/SubtitleView;->innerPaddingX:I

    mul-int/lit8 v1, v1, 0x2

    add-int v8, v0, v1

    .line 223
    .local v8, "paddingX":I
    sub-int/2addr p1, v8

    .line 224
    if-gtz p1, :cond_1

    .line 225
    const/4 v7, 0x0

    goto :goto_0

    .line 228
    :cond_1
    iput-boolean v7, p0, Lcom/google/android/exoplayer/text/SubtitleView;->hasMeasurements:Z

    .line 229
    iput p1, p0, Lcom/google/android/exoplayer/text/SubtitleView;->lastMeasuredWidth:I

    .line 230
    new-instance v0, Landroid/text/StaticLayout;

    iget-object v1, p0, Lcom/google/android/exoplayer/text/SubtitleView;->textBuilder:Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/google/android/exoplayer/text/SubtitleView;->textPaint:Landroid/text/TextPaint;

    const/4 v4, 0x0

    iget v5, p0, Lcom/google/android/exoplayer/text/SubtitleView;->spacingMult:F

    iget v6, p0, Lcom/google/android/exoplayer/text/SubtitleView;->spacingAdd:F

    move v3, p1

    invoke-direct/range {v0 .. v7}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/SubtitleView;->layout:Landroid/text/StaticLayout;

    goto :goto_0
.end method

.method private forceUpdate(Z)V
    .locals 1
    .param p1, "needsLayout"    # Z

    .prologue
    .line 176
    if-eqz p1, :cond_0

    .line 177
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/text/SubtitleView;->hasMeasurements:Z

    .line 178
    invoke-virtual {p0}, Lcom/google/android/exoplayer/text/SubtitleView;->requestLayout()V

    .line 180
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer/text/SubtitleView;->invalidate()V

    .line 181
    return-void
.end method

.method private setTooSmallMeasureDimensionV11()V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/high16 v0, 0x1000000

    .line 207
    invoke-virtual {p0, v0, v0}, Lcom/google/android/exoplayer/text/SubtitleView;->setMeasuredDimension(II)V

    .line 208
    return-void
.end method

.method private setTypeface(Landroid/graphics/Typeface;)V
    .locals 1
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 169
    iget-object v0, p0, Lcom/google/android/exoplayer/text/SubtitleView;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    if-eq v0, p1, :cond_0

    .line 170
    iget-object v0, p0, Lcom/google/android/exoplayer/text/SubtitleView;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 171
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/SubtitleView;->forceUpdate(Z)V

    .line 173
    :cond_0
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 22
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 237
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/google/android/exoplayer/text/SubtitleView;->layout:Landroid/text/StaticLayout;

    .line 238
    .local v10, "layout":Landroid/text/StaticLayout;
    if-nez v10, :cond_0

    .line 295
    :goto_0
    return-void

    .line 242
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v16

    .line 243
    .local v16, "saveCount":I
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer/text/SubtitleView;->innerPaddingX:I

    .line 244
    .local v9, "innerPaddingX":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/text/SubtitleView;->getPaddingLeft()I

    move-result v18

    add-int v18, v18, v9

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/text/SubtitleView;->getPaddingTop()I

    move-result v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p1

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 246
    invoke-virtual {v10}, Landroid/text/StaticLayout;->getLineCount()I

    move-result v11

    .line 247
    .local v11, "lineCount":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->textPaint:Landroid/text/TextPaint;

    move-object/from16 v17, v0

    .line 248
    .local v17, "textPaint":Landroid/graphics/Paint;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer/text/SubtitleView;->paint:Landroid/graphics/Paint;

    .line 249
    .local v13, "paint":Landroid/graphics/Paint;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/text/SubtitleView;->lineBounds:Landroid/graphics/RectF;

    .line 251
    .local v4, "bounds":Landroid/graphics/RectF;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->backgroundColor:I

    move/from16 v18, v0

    invoke-static/range {v18 .. v18}, Landroid/graphics/Color;->alpha(I)I

    move-result v18

    if-lez v18, :cond_1

    .line 252
    move-object/from16 v0, p0

    iget v7, v0, Lcom/google/android/exoplayer/text/SubtitleView;->cornerRadius:F

    .line 253
    .local v7, "cornerRadius":F
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v10, v0}, Landroid/text/StaticLayout;->getLineTop(I)I

    move-result v18

    move/from16 v0, v18

    int-to-float v14, v0

    .line 255
    .local v14, "previousBottom":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->backgroundColor:I

    move/from16 v18, v0

    move/from16 v0, v18

    invoke-virtual {v13, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 256
    sget-object v18, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 258
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    if-ge v8, v11, :cond_1

    .line 259
    invoke-virtual {v10, v8}, Landroid/text/StaticLayout;->getLineLeft(I)F

    move-result v18

    int-to-float v0, v9

    move/from16 v19, v0

    sub-float v18, v18, v19

    move/from16 v0, v18

    iput v0, v4, Landroid/graphics/RectF;->left:F

    .line 260
    invoke-virtual {v10, v8}, Landroid/text/StaticLayout;->getLineRight(I)F

    move-result v18

    int-to-float v0, v9

    move/from16 v19, v0

    add-float v18, v18, v19

    move/from16 v0, v18

    iput v0, v4, Landroid/graphics/RectF;->right:F

    .line 261
    iput v14, v4, Landroid/graphics/RectF;->top:F

    .line 262
    invoke-virtual {v10, v8}, Landroid/text/StaticLayout;->getLineBottom(I)I

    move-result v18

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    iput v0, v4, Landroid/graphics/RectF;->bottom:F

    .line 263
    iget v14, v4, Landroid/graphics/RectF;->bottom:F

    .line 265
    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v7, v7, v13}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 258
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 269
    .end local v7    # "cornerRadius":F
    .end local v8    # "i":I
    .end local v14    # "previousBottom":F
    :cond_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->edgeType:I

    move/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_3

    .line 270
    sget-object v18, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual/range {v17 .. v18}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 271
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->outlineWidth:F

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 272
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->edgeColor:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/graphics/Paint;->setColor(I)V

    .line 273
    sget-object v18, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v17 .. v18}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 274
    move-object/from16 v0, p1

    invoke-virtual {v10, v0}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 290
    :cond_2
    :goto_2
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->foregroundColor:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/graphics/Paint;->setColor(I)V

    .line 291
    sget-object v18, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v17 .. v18}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 292
    move-object/from16 v0, p1

    invoke-virtual {v10, v0}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 293
    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-virtual/range {v17 .. v21}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 294
    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto/16 :goto_0

    .line 275
    :cond_3
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->edgeType:I

    move/from16 v18, v0

    const/16 v19, 0x2

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_4

    .line 276
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->shadowRadius:F

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->shadowOffset:F

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->shadowOffset:F

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->edgeColor:I

    move/from16 v21, v0

    invoke-virtual/range {v17 .. v21}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    goto :goto_2

    .line 277
    :cond_4
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->edgeType:I

    move/from16 v18, v0

    const/16 v19, 0x3

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_5

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->edgeType:I

    move/from16 v18, v0

    const/16 v19, 0x4

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_2

    .line 279
    :cond_5
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->edgeType:I

    move/from16 v18, v0

    const/16 v19, 0x3

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_6

    const/4 v15, 0x1

    .line 280
    .local v15, "raised":Z
    :goto_3
    if-eqz v15, :cond_7

    const/4 v6, -0x1

    .line 281
    .local v6, "colorUp":I
    :goto_4
    if-eqz v15, :cond_8

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/text/SubtitleView;->edgeColor:I

    .line 282
    .local v5, "colorDown":I
    :goto_5
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->shadowRadius:F

    move/from16 v18, v0

    const/high16 v19, 0x40000000    # 2.0f

    div-float v12, v18, v19

    .line 283
    .local v12, "offset":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->foregroundColor:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/graphics/Paint;->setColor(I)V

    .line 284
    sget-object v18, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v17 .. v18}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 285
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->shadowRadius:F

    move/from16 v18, v0

    neg-float v0, v12

    move/from16 v19, v0

    neg-float v0, v12

    move/from16 v20, v0

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3, v6}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 286
    move-object/from16 v0, p1

    invoke-virtual {v10, v0}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 287
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/text/SubtitleView;->shadowRadius:F

    move/from16 v18, v0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v0, v1, v12, v12, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    goto/16 :goto_2

    .line 279
    .end local v5    # "colorDown":I
    .end local v6    # "colorUp":I
    .end local v12    # "offset":F
    .end local v15    # "raised":Z
    :cond_6
    const/4 v15, 0x0

    goto :goto_3

    .line 280
    .restart local v15    # "raised":Z
    :cond_7
    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/text/SubtitleView;->edgeColor:I

    goto :goto_4

    .line 281
    .restart local v6    # "colorUp":I
    :cond_8
    const/4 v5, -0x1

    goto :goto_5
.end method

.method public onLayout(ZIIII)V
    .locals 1
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 212
    sub-int v0, p4, p2

    .line 213
    .local v0, "width":I
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/SubtitleView;->computeMeasurements(I)Z

    .line 214
    return-void
.end method

.method protected onMeasure(II)V
    .locals 10
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/4 v9, 0x0

    .line 185
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v6

    .line 187
    .local v6, "widthSpec":I
    invoke-direct {p0, v6}, Lcom/google/android/exoplayer/text/SubtitleView;->computeMeasurements(I)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 188
    iget-object v2, p0, Lcom/google/android/exoplayer/text/SubtitleView;->layout:Landroid/text/StaticLayout;

    .line 189
    .local v2, "layout":Landroid/text/StaticLayout;
    invoke-virtual {p0}, Lcom/google/android/exoplayer/text/SubtitleView;->getPaddingLeft()I

    move-result v7

    invoke-virtual {p0}, Lcom/google/android/exoplayer/text/SubtitleView;->getPaddingRight()I

    move-result v8

    add-int/2addr v7, v8

    iget v8, p0, Lcom/google/android/exoplayer/text/SubtitleView;->innerPaddingX:I

    mul-int/lit8 v8, v8, 0x2

    add-int v4, v7, v8

    .line 190
    .local v4, "paddingX":I
    invoke-virtual {v2}, Landroid/text/StaticLayout;->getHeight()I

    move-result v7

    invoke-virtual {p0}, Lcom/google/android/exoplayer/text/SubtitleView;->getPaddingTop()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {p0}, Lcom/google/android/exoplayer/text/SubtitleView;->getPaddingBottom()I

    move-result v8

    add-int v0, v7, v8

    .line 191
    .local v0, "height":I
    const/4 v5, 0x0

    .line 192
    .local v5, "width":I
    invoke-virtual {v2}, Landroid/text/StaticLayout;->getLineCount()I

    move-result v3

    .line 193
    .local v3, "lineCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 194
    invoke-virtual {v2, v1}, Landroid/text/StaticLayout;->getLineWidth(I)F

    move-result v7

    float-to-double v8, v7

    invoke-static {v8, v9}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v8

    double-to-int v7, v8

    invoke-static {v7, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 193
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 196
    :cond_0
    add-int/2addr v5, v4

    .line 197
    invoke-virtual {p0, v5, v0}, Lcom/google/android/exoplayer/text/SubtitleView;->setMeasuredDimension(II)V

    .line 203
    .end local v0    # "height":I
    .end local v1    # "i":I
    .end local v2    # "layout":Landroid/text/StaticLayout;
    .end local v3    # "lineCount":I
    .end local v4    # "paddingX":I
    .end local v5    # "width":I
    :goto_1
    return-void

    .line 198
    :cond_1
    sget v7, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v8, 0xb

    if-lt v7, v8, :cond_2

    .line 199
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/SubtitleView;->setTooSmallMeasureDimensionV11()V

    goto :goto_1

    .line 201
    :cond_2
    invoke-virtual {p0, v9, v9}, Lcom/google/android/exoplayer/text/SubtitleView;->setMeasuredDimension(II)V

    goto :goto_1
.end method

.method public setBackgroundColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 125
    iput p1, p0, Lcom/google/android/exoplayer/text/SubtitleView;->backgroundColor:I

    .line 126
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/SubtitleView;->forceUpdate(Z)V

    .line 127
    return-void
.end method

.method public setStyle(Lcom/google/android/exoplayer/text/CaptionStyleCompat;)V
    .locals 1
    .param p1, "style"    # Lcom/google/android/exoplayer/text/CaptionStyleCompat;

    .prologue
    .line 159
    iget v0, p1, Lcom/google/android/exoplayer/text/CaptionStyleCompat;->foregroundColor:I

    iput v0, p0, Lcom/google/android/exoplayer/text/SubtitleView;->foregroundColor:I

    .line 160
    iget v0, p1, Lcom/google/android/exoplayer/text/CaptionStyleCompat;->backgroundColor:I

    iput v0, p0, Lcom/google/android/exoplayer/text/SubtitleView;->backgroundColor:I

    .line 161
    iget v0, p1, Lcom/google/android/exoplayer/text/CaptionStyleCompat;->edgeType:I

    iput v0, p0, Lcom/google/android/exoplayer/text/SubtitleView;->edgeType:I

    .line 162
    iget v0, p1, Lcom/google/android/exoplayer/text/CaptionStyleCompat;->edgeColor:I

    iput v0, p0, Lcom/google/android/exoplayer/text/SubtitleView;->edgeColor:I

    .line 163
    iget-object v0, p1, Lcom/google/android/exoplayer/text/CaptionStyleCompat;->typeface:Landroid/graphics/Typeface;

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/SubtitleView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 164
    iget v0, p1, Lcom/google/android/exoplayer/text/CaptionStyleCompat;->windowColor:I

    invoke-super {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 165
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/SubtitleView;->forceUpdate(Z)V

    .line 166
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 135
    iget-object v0, p0, Lcom/google/android/exoplayer/text/SubtitleView;->textBuilder:Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 136
    iget-object v0, p0, Lcom/google/android/exoplayer/text/SubtitleView;->textBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 137
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/SubtitleView;->forceUpdate(Z)V

    .line 138
    return-void
.end method

.method public setTextSize(F)V
    .locals 2
    .param p1, "size"    # F

    .prologue
    .line 146
    iget-object v0, p0, Lcom/google/android/exoplayer/text/SubtitleView;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getTextSize()F

    move-result v0

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 147
    iget-object v0, p0, Lcom/google/android/exoplayer/text/SubtitleView;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 148
    const/high16 v0, 0x3e000000    # 0.125f

    mul-float/2addr v0, p1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/google/android/exoplayer/text/SubtitleView;->innerPaddingX:I

    .line 149
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/SubtitleView;->forceUpdate(Z)V

    .line 151
    :cond_0
    return-void
.end method
