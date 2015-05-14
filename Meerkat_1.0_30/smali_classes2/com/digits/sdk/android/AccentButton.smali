.class public Lcom/digits/sdk/android/AccentButton;
.super Landroid/widget/Button;
.source "AccentButton.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 9
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/digits/sdk/android/AccentButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 13
    const v0, 0x1010048

    invoke-direct {p0, p1, p2, v0}, Lcom/digits/sdk/android/AccentButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 17
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    invoke-virtual {p0}, Lcom/digits/sdk/android/AccentButton;->init()V

    .line 20
    return-void
.end method


# virtual methods
.method init()V
    .locals 4

    .prologue
    .line 23
    invoke-virtual {p0}, Lcom/digits/sdk/android/AccentButton;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p0}, Lcom/digits/sdk/android/AccentButton;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/digits/sdk/android/ThemeUtils;->getAccentColor(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;)I

    move-result v0

    .line 24
    .local v0, "accentColor":I
    new-instance v1, Lcom/digits/sdk/android/ButtonThemer;

    invoke-virtual {p0}, Lcom/digits/sdk/android/AccentButton;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/digits/sdk/android/ButtonThemer;-><init>(Landroid/content/res/Resources;)V

    .line 26
    .local v1, "buttonThemer":Lcom/digits/sdk/android/ButtonThemer;
    invoke-virtual {v1, p0}, Lcom/digits/sdk/android/ButtonThemer;->disableDropShadow(Landroid/view/View;)V

    .line 27
    invoke-virtual {v1, p0, v0}, Lcom/digits/sdk/android/ButtonThemer;->setBackgroundAccentColor(Landroid/view/View;I)V

    .line 28
    invoke-virtual {v1, p0, v0}, Lcom/digits/sdk/android/ButtonThemer;->setTextAccentColor(Landroid/widget/TextView;I)V

    .line 29
    return-void
.end method
