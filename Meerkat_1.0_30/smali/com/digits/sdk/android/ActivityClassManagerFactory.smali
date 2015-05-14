.class Lcom/digits/sdk/android/ActivityClassManagerFactory;
.super Ljava/lang/Object;
.source "ActivityClassManagerFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method


# virtual methods
.method createActivityClassManager(Landroid/content/Context;I)Lcom/digits/sdk/android/ActivityClassManager;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "themeResId"    # I

    .prologue
    .line 12
    :try_start_0
    const-string v2, "android.support.v7.app.ActionBarActivity"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 14
    new-instance v0, Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;

    invoke-direct {v0}, Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;-><init>()V

    .line 15
    .local v0, "attributes":Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;
    invoke-virtual {p0, p1, p2, v0}, Lcom/digits/sdk/android/ActivityClassManagerFactory;->isAppCompatTheme(Landroid/content/Context;ILcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 16
    new-instance v2, Lcom/digits/sdk/android/AppCompatClassManagerImp;

    invoke-direct {v2}, Lcom/digits/sdk/android/AppCompatClassManagerImp;-><init>()V

    .line 21
    .end local v0    # "attributes":Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;
    :goto_0
    return-object v2

    .line 18
    .restart local v0    # "attributes":Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;
    :cond_0
    new-instance v2, Lcom/digits/sdk/android/ActivityClassManagerImp;

    invoke-direct {v2}, Lcom/digits/sdk/android/ActivityClassManagerImp;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 20
    .end local v0    # "attributes":Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;
    :catch_0
    move-exception v1

    .line 21
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Lcom/digits/sdk/android/ActivityClassManagerImp;

    invoke-direct {v2}, Lcom/digits/sdk/android/ActivityClassManagerImp;-><init>()V

    goto :goto_0
.end method

.method isAppCompatTheme(Landroid/content/Context;ILcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;)Z
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "themeResId"    # I
    .param p3, "attributes"    # Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;

    .prologue
    .line 27
    # getter for: Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;->styleableTheme:[I
    invoke-static {p3}, Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;->access$000(Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;)[I

    move-result-object v2

    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 28
    .local v0, "a":Landroid/content/res/TypedArray;
    # getter for: Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;->styleableThemeWindowActionBar:I
    invoke-static {p3}, Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;->access$100(Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    .line 29
    .local v1, "result":Z
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 31
    return v1
.end method
