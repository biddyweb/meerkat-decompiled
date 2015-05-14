.class Lcom/digits/sdk/android/ThemeUtils;
.super Ljava/lang/Object;
.source "ThemeUtils.java"


# static fields
.field public static final DEFAULT_THEME:I = 0x0

.field public static final THEME_RESOURCE_ID:Ljava/lang/String; = "THEME_RESOURCE_ID"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    return-void
.end method

.method static calculateOpacityTransform(DII)I
    .locals 14
    .param p0, "opacity"    # D
    .param p2, "overlayColor"    # I
    .param p3, "primaryColor"    # I

    .prologue
    .line 94
    invoke-static/range {p3 .. p3}, Landroid/graphics/Color;->red(I)I

    move-result v8

    .line 95
    .local v8, "redPrimary":I
    invoke-static/range {p2 .. p2}, Landroid/graphics/Color;->red(I)I

    move-result v7

    .line 96
    .local v7, "redOverlay":I
    invoke-static/range {p3 .. p3}, Landroid/graphics/Color;->green(I)I

    move-result v5

    .line 97
    .local v5, "greenPrimary":I
    invoke-static/range {p2 .. p2}, Landroid/graphics/Color;->green(I)I

    move-result v4

    .line 98
    .local v4, "greenOverlay":I
    invoke-static/range {p3 .. p3}, Landroid/graphics/Color;->blue(I)I

    move-result v2

    .line 99
    .local v2, "bluePrimary":I
    invoke-static/range {p2 .. p2}, Landroid/graphics/Color;->blue(I)I

    move-result v1

    .line 101
    .local v1, "blueOverlay":I
    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v10, p0

    int-to-double v12, v8

    mul-double/2addr v10, v12

    int-to-double v12, v7

    mul-double/2addr v12, p0

    add-double/2addr v10, v12

    double-to-int v6, v10

    .line 102
    .local v6, "redCalculated":I
    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v10, p0

    int-to-double v12, v5

    mul-double/2addr v10, v12

    int-to-double v12, v4

    mul-double/2addr v12, p0

    add-double/2addr v10, v12

    double-to-int v3, v10

    .line 103
    .local v3, "greenCalculated":I
    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v10, p0

    int-to-double v12, v2

    mul-double/2addr v10, v12

    int-to-double v12, v1

    mul-double/2addr v12, p0

    add-double/2addr v10, v12

    double-to-int v0, v10

    .line 105
    .local v0, "blueCalculated":I
    invoke-static {v6, v3, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v9

    return v9
.end method

.method static getAccentColor(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;)I
    .locals 4
    .param p0, "res"    # Landroid/content/res/Resources;
    .param p1, "theme"    # Landroid/content/res/Resources$Theme;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 35
    sget v2, Lcom/digits/sdk/android/R$attr;->dgts__accentColor:I

    invoke-static {p1, v2}, Lcom/digits/sdk/android/ThemeUtils;->getTypedValueColor(Landroid/content/res/Resources$Theme;I)Landroid/util/TypedValue;

    move-result-object v1

    .line 36
    .local v1, "typedValue":Landroid/util/TypedValue;
    if-eqz v1, :cond_0

    .line 37
    iget v2, v1, Landroid/util/TypedValue;->data:I

    .line 61
    :goto_0
    return v2

    .line 42
    :cond_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_1

    .line 43
    const v2, 0x1010435

    invoke-static {p1, v2}, Lcom/digits/sdk/android/ThemeUtils;->getTypedValueColor(Landroid/content/res/Resources$Theme;I)Landroid/util/TypedValue;

    move-result-object v1

    .line 44
    if-eqz v1, :cond_1

    .line 45
    iget v2, v1, Landroid/util/TypedValue;->data:I

    goto :goto_0

    .line 51
    :cond_1
    :try_start_0
    const-class v2, Lcom/digits/sdk/android/R$attr;

    const-string v3, "colorAccent"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 52
    .local v0, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    invoke-static {p1, v2}, Lcom/digits/sdk/android/ThemeUtils;->getTypedValueColor(Landroid/content/res/Resources$Theme;I)Landroid/util/TypedValue;

    move-result-object v1

    .line 53
    if-eqz v1, :cond_2

    .line 54
    iget v2, v1, Landroid/util/TypedValue;->data:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 56
    .end local v0    # "field":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v2

    .line 61
    :cond_2
    sget v2, Lcom/digits/sdk/android/R$color;->dgts__default_accent:I

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    goto :goto_0
.end method

.method static getTypedValueColor(Landroid/content/res/Resources$Theme;I)Landroid/util/TypedValue;
    .locals 3
    .param p0, "theme"    # Landroid/content/res/Resources$Theme;
    .param p1, "colorResId"    # I

    .prologue
    .line 21
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 22
    .local v0, "typedValue":Landroid/util/TypedValue;
    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 24
    iget v1, v0, Landroid/util/TypedValue;->type:I

    const/16 v2, 0x1c

    if-lt v1, v2, :cond_0

    iget v1, v0, Landroid/util/TypedValue;->type:I

    const/16 v2, 0x1f

    if-gt v1, v2, :cond_0

    .line 29
    .end local v0    # "typedValue":Landroid/util/TypedValue;
    :goto_0
    return-object v0

    .restart local v0    # "typedValue":Landroid/util/TypedValue;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static isLightColor(I)Z
    .locals 12
    .param p0, "color"    # I

    .prologue
    .line 73
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v2

    .line 74
    .local v2, "r":I
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    .line 75
    .local v1, "g":I
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    .line 77
    .local v0, "b":I
    const-wide v6, 0x3fcae147ae147ae1L    # 0.21

    int-to-double v8, v2

    mul-double/2addr v6, v8

    const-wide v8, 0x3fe70a3d70a3d70aL    # 0.72

    int-to-double v10, v1

    mul-double/2addr v8, v10

    add-double/2addr v6, v8

    const-wide v8, 0x3fb1eb851eb851ecL    # 0.07

    int-to-double v10, v0

    mul-double/2addr v8, v10

    add-double v4, v6, v8

    .line 78
    .local v4, "threshold":D
    const-wide v6, 0x4065400000000000L    # 170.0

    cmpl-double v3, v4, v6

    if-lez v3, :cond_0

    const/4 v3, 0x1

    :goto_0
    return v3

    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method
