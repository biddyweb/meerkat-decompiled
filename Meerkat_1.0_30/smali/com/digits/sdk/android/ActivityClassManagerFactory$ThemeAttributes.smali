.class Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;
.super Ljava/lang/Object;
.source "ActivityClassManagerFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/digits/sdk/android/ActivityClassManagerFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ThemeAttributes"
.end annotation


# static fields
.field private static final CLASS_NAME:Ljava/lang/String; = "android.support.v7.appcompat.R$styleable"


# instance fields
.field private final styleableTheme:[I

.field private final styleableThemeWindowActionBar:I


# direct methods
.method public constructor <init>()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const-string v2, "android.support.v7.appcompat.R$styleable"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 41
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "Theme"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 42
    .local v1, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I

    check-cast v2, [I

    iput-object v2, p0, Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;->styleableTheme:[I

    .line 44
    const-string v2, "Theme_windowActionBar"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 45
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, p0, Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;->styleableThemeWindowActionBar:I

    .line 46
    return-void
.end method

.method static synthetic access$000(Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;)[I
    .locals 1
    .param p0, "x0"    # Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;->styleableTheme:[I

    return-object v0
.end method

.method static synthetic access$100(Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;)I
    .locals 1
    .param p0, "x0"    # Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;

    .prologue
    .line 34
    iget v0, p0, Lcom/digits/sdk/android/ActivityClassManagerFactory$ThemeAttributes;->styleableThemeWindowActionBar:I

    return v0
.end method
