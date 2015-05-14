.class public final Lcom/instabug/library/internal/theming/b;
.super Ljava/lang/Object;
.source "SdkStyleThiefAppCompatImpl.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Landroid/app/Activity;)Lcom/instabug/library/internal/theming/a;
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 30
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 32
    new-instance v4, Lcom/instabug/library/internal/theming/a;

    invoke-direct {v4}, Lcom/instabug/library/internal/theming/a;-><init>()V

    .line 33
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xe

    if-lt v1, v2, :cond_0

    .line 34
    const v2, 0x10100d4

    .line 35
    const v1, 0x101038b

    .line 36
    const v0, 0x10102f8

    .line 37
    const v3, 0x10102ce

    .line 45
    :goto_0
    const/4 v5, 0x3

    new-array v5, v5, [I

    aput v0, v5, v8

    aput v2, v5, v9

    const/4 v6, 0x2

    aput v1, v5, v6

    .line 46
    invoke-static {v5}, Ljava/util/Arrays;->sort([I)V

    .line 48
    new-instance v6, Landroid/util/TypedValue;

    invoke-direct {v6}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v7

    invoke-virtual {v7, v3, v6, v9}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v3, v6, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    invoke-virtual {v6, v3, v5}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 50
    invoke-static {v5, v0}, Ljava/util/Arrays;->binarySearch([II)I

    move-result v0

    invoke-virtual {v3, v0, v8}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    iput v0, v4, Lcom/instabug/library/internal/theming/a;->d:I

    .line 51
    invoke-static {v5, v2}, Ljava/util/Arrays;->binarySearch([II)I

    move-result v0

    invoke-virtual {v3, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, v4, Lcom/instabug/library/internal/theming/a;->a:Landroid/graphics/drawable/Drawable;

    .line 52
    invoke-static {v5, v1}, Ljava/util/Arrays;->binarySearch([II)I

    move-result v0

    invoke-virtual {v3, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, v4, Lcom/instabug/library/internal/theming/a;->b:Landroid/graphics/drawable/Drawable;

    .line 54
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 56
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 58
    return-object v4

    .line 39
    :cond_0
    const-string v1, "background"

    const-string v2, "attr"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 40
    const-string v1, "backgroundSplit"

    const-string v3, "attr"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v1, v3, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 41
    const-string v3, "actionBarStyle"

    const-string v5, "attr"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v3, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 42
    const-string v5, "titleTextStyle"

    const-string v6, "attr"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v5, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method
