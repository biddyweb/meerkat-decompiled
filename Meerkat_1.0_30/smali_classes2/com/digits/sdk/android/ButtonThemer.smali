.class Lcom/digits/sdk/android/ButtonThemer;
.super Ljava/lang/Object;
.source "ButtonThemer.java"


# instance fields
.field final resources:Landroid/content/res/Resources;


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;)V
    .locals 0
    .param p1, "resources"    # Landroid/content/res/Resources;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/digits/sdk/android/ButtonThemer;->resources:Landroid/content/res/Resources;

    .line 20
    return-void
.end method


# virtual methods
.method disableDropShadow(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 115
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 116
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 117
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setElevation(F)V

    .line 119
    :cond_0
    return-void
.end method

.method getPressedColor(I)I
    .locals 4
    .param p1, "accentColor"    # I

    .prologue
    const-wide v2, 0x3fc999999999999aL    # 0.2

    .line 83
    invoke-static {p1}, Lcom/digits/sdk/android/ThemeUtils;->isLightColor(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 84
    const/high16 v0, -0x1000000

    invoke-static {v2, v3, v0, p1}, Lcom/digits/sdk/android/ThemeUtils;->calculateOpacityTransform(DII)I

    move-result v0

    .line 86
    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    invoke-static {v2, v3, v0, p1}, Lcom/digits/sdk/android/ThemeUtils;->calculateOpacityTransform(DII)I

    move-result v0

    goto :goto_0
.end method

.method getTextColor(I)I
    .locals 2
    .param p1, "accentColor"    # I

    .prologue
    .line 109
    invoke-static {p1}, Lcom/digits/sdk/android/ThemeUtils;->isLightColor(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/digits/sdk/android/ButtonThemer;->resources:Landroid/content/res/Resources;

    sget v1, Lcom/digits/sdk/android/R$color;->dgts__text_dark:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/digits/sdk/android/ButtonThemer;->resources:Landroid/content/res/Resources;

    sget v1, Lcom/digits/sdk/android/R$color;->dgts__text_light:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    goto :goto_0
.end method

.method setBackgroundAccentColor(Landroid/view/View;I)V
    .locals 7
    .param p1, "view"    # Landroid/view/View;
    .param p2, "accentColor"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 24
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 25
    .local v0, "background":Landroid/graphics/drawable/StateListDrawable;
    const/high16 v3, 0x40a00000    # 5.0f

    iget-object v4, p0, Lcom/digits/sdk/android/ButtonThemer;->resources:Landroid/content/res/Resources;

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    invoke-static {v5, v3, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    .line 29
    .local v1, "radius":F
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 30
    .local v2, "tmp":Landroid/graphics/drawable/GradientDrawable;
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 31
    invoke-virtual {p0, p2}, Lcom/digits/sdk/android/ButtonThemer;->getPressedColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 32
    new-array v3, v6, [I

    fill-array-data v3, :array_0

    invoke-virtual {v0, v3, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 34
    new-array v3, v6, [I

    fill-array-data v3, :array_1

    invoke-virtual {v0, v3, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 36
    new-array v3, v5, [I

    const/4 v4, 0x0

    const v5, 0x101009c

    aput v5, v3, v4

    invoke-virtual {v0, v3, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 39
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    .end local v2    # "tmp":Landroid/graphics/drawable/GradientDrawable;
    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 40
    .restart local v2    # "tmp":Landroid/graphics/drawable/GradientDrawable;
    invoke-virtual {v2, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 41
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 42
    sget-object v3, Landroid/util/StateSet;->WILD_CARD:[I

    invoke-virtual {v0, v3, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 44
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x10

    if-lt v3, v4, :cond_0

    .line 45
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 49
    :goto_0
    return-void

    .line 47
    :cond_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 32
    nop

    :array_0
    .array-data 4
        0x101009c
        0x10100a7
    .end array-data

    .line 34
    :array_1
    .array-data 4
        -0x101009c
        0x10100a7
    .end array-data
.end method

.method setBackgroundAccentColorInverse(Landroid/view/View;I)V
    .locals 8
    .param p1, "view"    # Landroid/view/View;
    .param p2, "accentColor"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 53
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 54
    .local v0, "background":Landroid/graphics/drawable/StateListDrawable;
    const/high16 v4, 0x40a00000    # 5.0f

    iget-object v5, p0, Lcom/digits/sdk/android/ButtonThemer;->resources:Landroid/content/res/Resources;

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    invoke-static {v6, v4, v5}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    .line 56
    .local v1, "radius":F
    const/high16 v4, 0x40000000    # 2.0f

    iget-object v5, p0, Lcom/digits/sdk/android/ButtonThemer;->resources:Landroid/content/res/Resources;

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    invoke-static {v6, v4, v5}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    .line 60
    .local v2, "strokeWidth":F
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 61
    .local v3, "tmp":Landroid/graphics/drawable/GradientDrawable;
    invoke-virtual {v3, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 62
    float-to-int v4, v2

    invoke-virtual {p0, p2}, Lcom/digits/sdk/android/ButtonThemer;->getPressedColor(I)I

    move-result v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 63
    new-array v4, v7, [I

    fill-array-data v4, :array_0

    invoke-virtual {v0, v4, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 65
    new-array v4, v7, [I

    fill-array-data v4, :array_1

    invoke-virtual {v0, v4, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 67
    new-array v4, v6, [I

    const/4 v5, 0x0

    const v6, 0x101009c

    aput v6, v4, v5

    invoke-virtual {v0, v4, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 70
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    .end local v3    # "tmp":Landroid/graphics/drawable/GradientDrawable;
    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 71
    .restart local v3    # "tmp":Landroid/graphics/drawable/GradientDrawable;
    invoke-virtual {v3, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 72
    float-to-int v4, v2

    invoke-virtual {v3, v4, p2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 73
    sget-object v4, Landroid/util/StateSet;->WILD_CARD:[I

    invoke-virtual {v0, v4, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 75
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x10

    if-lt v4, v5, :cond_0

    .line 76
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 80
    :goto_0
    return-void

    .line 78
    :cond_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 63
    nop

    :array_0
    .array-data 4
        0x101009c
        0x10100a7
    .end array-data

    .line 65
    :array_1
    .array-data 4
        -0x101009c
        0x10100a7
    .end array-data
.end method

.method setTextAccentColor(Landroid/widget/TextView;I)V
    .locals 1
    .param p1, "view"    # Landroid/widget/TextView;
    .param p2, "accentColor"    # I

    .prologue
    .line 91
    invoke-virtual {p0, p2}, Lcom/digits/sdk/android/ButtonThemer;->getTextColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 92
    return-void
.end method

.method setTextAccentColorInverse(Landroid/widget/TextView;I)V
    .locals 10
    .param p1, "view"    # Landroid/widget/TextView;
    .param p2, "accentColor"    # I

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v5, 0x2

    .line 95
    invoke-virtual {p0, p2}, Lcom/digits/sdk/android/ButtonThemer;->getPressedColor(I)I

    move-result v1

    .line 96
    .local v1, "pressedColor":I
    new-array v3, v9, [[I

    new-array v4, v5, [I

    fill-array-data v4, :array_0

    aput-object v4, v3, v6

    new-array v4, v5, [I

    fill-array-data v4, :array_1

    aput-object v4, v3, v7

    new-array v4, v5, [I

    fill-array-data v4, :array_2

    aput-object v4, v3, v5

    sget-object v4, Landroid/util/StateSet;->WILD_CARD:[I

    aput-object v4, v3, v8

    .line 102
    .local v3, "states":[[I
    new-array v0, v9, [I

    aput p2, v0, v6

    aput v1, v0, v7

    aput v1, v0, v5

    aput p2, v0, v8

    .line 104
    .local v0, "colors":[I
    new-instance v2, Landroid/content/res/ColorStateList;

    invoke-direct {v2, v3, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 105
    .local v2, "stateList":Landroid/content/res/ColorStateList;
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 106
    return-void

    .line 96
    nop

    :array_0
    .array-data 4
        0x101009c
        -0x10100a7
    .end array-data

    :array_1
    .array-data 4
        0x101009c
        0x10100a7
    .end array-data

    :array_2
    .array-data 4
        -0x101009c
        0x10100a7
    .end array-data
.end method
