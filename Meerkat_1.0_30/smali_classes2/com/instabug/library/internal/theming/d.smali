.class public final Lcom/instabug/library/internal/theming/d;
.super Ljava/lang/Object;
.source "SdkStyleThiefICSImpl.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Landroid/app/Activity;)Lcom/instabug/library/internal/theming/a;
    .locals 5

    .prologue
    .line 17
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 18
    invoke-static {v0}, Ljava/util/Arrays;->sort([I)V

    .line 19
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 20
    invoke-virtual {p0}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const v3, 0x10102ce

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v1, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 21
    invoke-virtual {p0}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    iget v1, v1, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v2, v1, v0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 23
    new-instance v2, Lcom/instabug/library/internal/theming/a;

    invoke-direct {v2}, Lcom/instabug/library/internal/theming/a;-><init>()V

    .line 24
    const v3, 0x10102f8

    invoke-static {v0, v3}, Ljava/util/Arrays;->binarySearch([II)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    iput v3, v2, Lcom/instabug/library/internal/theming/a;->d:I

    .line 25
    const v3, 0x10100d4

    invoke-static {v0, v3}, Ljava/util/Arrays;->binarySearch([II)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, v2, Lcom/instabug/library/internal/theming/a;->a:Landroid/graphics/drawable/Drawable;

    .line 26
    const v3, 0x101038b

    invoke-static {v0, v3}, Ljava/util/Arrays;->binarySearch([II)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, v2, Lcom/instabug/library/internal/theming/a;->b:Landroid/graphics/drawable/Drawable;

    .line 28
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 29
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 31
    return-object v2

    .line 17
    nop

    :array_0
    .array-data 4
        0x10100d4
        0x101038b
        0x10102f8
    .end array-data
.end method
