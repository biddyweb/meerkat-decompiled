.class public Lcom/digits/sdk/android/DigitsAuthButton;
.super Landroid/widget/Button;
.source "DigitsAuthButton.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private callback:Lcom/digits/sdk/android/AuthCallback;

.field volatile digitsClient:Lcom/digits/sdk/android/DigitsClient;

.field private onClickListener:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/digits/sdk/android/DigitsAuthButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 29
    const v0, 0x1010048

    invoke-direct {p0, p1, p2, v0}, Lcom/digits/sdk/android/DigitsAuthButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    invoke-direct {p0}, Lcom/digits/sdk/android/DigitsAuthButton;->setUpButton()V

    .line 35
    invoke-super {p0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 36
    return-void
.end method

.method private setUpButton()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 39
    invoke-virtual {p0}, Lcom/digits/sdk/android/DigitsAuthButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 40
    .local v0, "res":Landroid/content/res/Resources;
    sget v1, Lcom/digits/sdk/android/R$dimen;->tw__login_btn_drawable_padding:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/digits/sdk/android/DigitsAuthButton;->setCompoundDrawablePadding(I)V

    .line 42
    sget v1, Lcom/digits/sdk/android/R$string;->dgts__login_digits_text:I

    invoke-virtual {p0, v1}, Lcom/digits/sdk/android/DigitsAuthButton;->setText(I)V

    .line 43
    sget v1, Lcom/digits/sdk/android/R$color;->tw__solid_white:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/digits/sdk/android/DigitsAuthButton;->setTextColor(I)V

    .line 44
    sget v1, Lcom/digits/sdk/android/R$dimen;->tw__login_btn_text_size:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0, v3, v1}, Lcom/digits/sdk/android/DigitsAuthButton;->setTextSize(IF)V

    .line 46
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {p0, v1}, Lcom/digits/sdk/android/DigitsAuthButton;->setTypeface(Landroid/graphics/Typeface;)V

    .line 47
    sget v1, Lcom/digits/sdk/android/R$dimen;->tw__login_btn_right_padding:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    sget v2, Lcom/digits/sdk/android/R$dimen;->tw__login_btn_right_padding:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    invoke-virtual {p0, v1, v3, v2, v3}, Lcom/digits/sdk/android/DigitsAuthButton;->setPadding(IIII)V

    .line 49
    sget v1, Lcom/digits/sdk/android/R$drawable;->dgts__digits_btn:I

    invoke-virtual {p0, v1}, Lcom/digits/sdk/android/DigitsAuthButton;->setBackgroundResource(I)V

    .line 50
    return-void
.end method


# virtual methods
.method protected getDigits()Lcom/digits/sdk/android/Digits;
    .locals 1

    .prologue
    .line 96
    invoke-static {}, Lcom/digits/sdk/android/Digits;->getInstance()Lcom/digits/sdk/android/Digits;

    move-result-object v0

    return-object v0
.end method

.method protected getDigitsClient()Lcom/digits/sdk/android/DigitsClient;
    .locals 2

    .prologue
    .line 85
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsAuthButton;->digitsClient:Lcom/digits/sdk/android/DigitsClient;

    if-nez v0, :cond_1

    .line 86
    const-class v1, Lcom/digits/sdk/android/DigitsClient;

    monitor-enter v1

    .line 87
    :try_start_0
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsAuthButton;->digitsClient:Lcom/digits/sdk/android/DigitsClient;

    if-nez v0, :cond_0

    .line 88
    invoke-virtual {p0}, Lcom/digits/sdk/android/DigitsAuthButton;->getDigits()Lcom/digits/sdk/android/Digits;

    move-result-object v0

    invoke-virtual {v0}, Lcom/digits/sdk/android/Digits;->getDigitsClient()Lcom/digits/sdk/android/DigitsClient;

    move-result-object v0

    iput-object v0, p0, Lcom/digits/sdk/android/DigitsAuthButton;->digitsClient:Lcom/digits/sdk/android/DigitsClient;

    .line 90
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    :cond_1
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsAuthButton;->digitsClient:Lcom/digits/sdk/android/DigitsClient;

    return-object v0

    .line 90
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsAuthButton;->callback:Lcom/digits/sdk/android/AuthCallback;

    if-nez v0, :cond_0

    .line 55
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "AuthCallback must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_0
    invoke-virtual {p0}, Lcom/digits/sdk/android/DigitsAuthButton;->getDigitsClient()Lcom/digits/sdk/android/DigitsClient;

    move-result-object v0

    iget-object v1, p0, Lcom/digits/sdk/android/DigitsAuthButton;->callback:Lcom/digits/sdk/android/AuthCallback;

    invoke-virtual {v0, v1}, Lcom/digits/sdk/android/DigitsClient;->startSignUp(Lcom/digits/sdk/android/AuthCallback;)V

    .line 59
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsAuthButton;->onClickListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_1

    .line 60
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsAuthButton;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 62
    :cond_1
    return-void
.end method

.method public setAuthTheme(I)V
    .locals 1
    .param p1, "themeResId"    # I

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/digits/sdk/android/DigitsAuthButton;->getDigits()Lcom/digits/sdk/android/Digits;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/digits/sdk/android/Digits;->setTheme(I)V

    .line 77
    return-void
.end method

.method public setCallback(Lcom/digits/sdk/android/AuthCallback;)V
    .locals 0
    .param p1, "callback"    # Lcom/digits/sdk/android/AuthCallback;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/digits/sdk/android/DigitsAuthButton;->callback:Lcom/digits/sdk/android/AuthCallback;

    .line 69
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .param p1, "l"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/digits/sdk/android/DigitsAuthButton;->onClickListener:Landroid/view/View$OnClickListener;

    .line 82
    return-void
.end method
