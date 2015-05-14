.class public Lcom/digits/sdk/android/LinkTextView;
.super Landroid/widget/TextView;
.source "LinkTextView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 11
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 12
    invoke-direct {p0, p1}, Lcom/digits/sdk/android/LinkTextView;->init(Landroid/content/Context;)V

    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 16
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 17
    invoke-direct {p0, p1}, Lcom/digits/sdk/android/LinkTextView;->init(Landroid/content/Context;)V

    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    invoke-direct {p0, p1}, Lcom/digits/sdk/android/LinkTextView;->init(Landroid/content/Context;)V

    .line 24
    return-void
.end method

.method private getLinkColor(Landroid/content/Context;)I
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x101009b

    invoke-static {v1, v2}, Lcom/digits/sdk/android/ThemeUtils;->getTypedValueColor(Landroid/content/res/Resources$Theme;I)Landroid/util/TypedValue;

    move-result-object v0

    .line 33
    .local v0, "value":Landroid/util/TypedValue;
    if-nez v0, :cond_0

    .line 34
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/digits/sdk/android/ThemeUtils;->getAccentColor(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;)I

    move-result v1

    .line 36
    :goto_0
    return v1

    :cond_0
    iget v1, v0, Landroid/util/TypedValue;->data:I

    goto :goto_0
.end method

.method private init(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/digits/sdk/android/LinkTextView;->getLinkColor(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/LinkTextView;->setTextColor(I)V

    .line 28
    return-void
.end method
