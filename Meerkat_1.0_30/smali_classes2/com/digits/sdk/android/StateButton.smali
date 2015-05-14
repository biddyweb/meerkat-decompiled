.class public Lcom/digits/sdk/android/StateButton;
.super Landroid/widget/RelativeLayout;
.source "StateButton.java"


# instance fields
.field accentColor:I

.field buttonThemer:Lcom/digits/sdk/android/ButtonThemer;

.field finishText:Ljava/lang/CharSequence;

.field imageView:Landroid/widget/ImageView;

.field progressBar:Landroid/widget/ProgressBar;

.field progressText:Ljava/lang/CharSequence;

.field startText:Ljava/lang/CharSequence;

.field textView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/digits/sdk/android/StateButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 30
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/digits/sdk/android/StateButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 34
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 35
    sget-object v1, Lcom/digits/sdk/android/R$styleable;->StateButton:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 36
    .local v0, "array":Landroid/content/res/TypedArray;
    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/StateButton;->init(Landroid/content/res/TypedArray;)V

    .line 37
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 39
    invoke-virtual {p0}, Lcom/digits/sdk/android/StateButton;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/digits/sdk/android/ThemeUtils;->getAccentColor(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;)I

    move-result v1

    iput v1, p0, Lcom/digits/sdk/android/StateButton;->accentColor:I

    .line 40
    new-instance v1, Lcom/digits/sdk/android/ButtonThemer;

    invoke-virtual {p0}, Lcom/digits/sdk/android/StateButton;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/digits/sdk/android/ButtonThemer;-><init>(Landroid/content/res/Resources;)V

    iput-object v1, p0, Lcom/digits/sdk/android/StateButton;->buttonThemer:Lcom/digits/sdk/android/ButtonThemer;

    .line 42
    iget-object v1, p0, Lcom/digits/sdk/android/StateButton;->buttonThemer:Lcom/digits/sdk/android/ButtonThemer;

    iget v2, p0, Lcom/digits/sdk/android/StateButton;->accentColor:I

    invoke-virtual {v1, p0, v2}, Lcom/digits/sdk/android/ButtonThemer;->setBackgroundAccentColor(Landroid/view/View;I)V

    .line 43
    iget-object v1, p0, Lcom/digits/sdk/android/StateButton;->buttonThemer:Lcom/digits/sdk/android/ButtonThemer;

    iget-object v2, p0, Lcom/digits/sdk/android/StateButton;->textView:Landroid/widget/TextView;

    iget v3, p0, Lcom/digits/sdk/android/StateButton;->accentColor:I

    invoke-virtual {v1, v2, v3}, Lcom/digits/sdk/android/ButtonThemer;->setTextAccentColor(Landroid/widget/TextView;I)V

    .line 44
    invoke-virtual {p0}, Lcom/digits/sdk/android/StateButton;->setImageAccentColor()V

    .line 45
    invoke-virtual {p0}, Lcom/digits/sdk/android/StateButton;->setSpinnerAccentColor()V

    .line 46
    return-void
.end method

.method private initView()V
    .locals 2

    .prologue
    .line 80
    invoke-virtual {p0}, Lcom/digits/sdk/android/StateButton;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/digits/sdk/android/R$layout;->dgts__state_button:I

    invoke-static {v0, v1, p0}, Lcom/digits/sdk/android/StateButton;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 82
    sget v0, Lcom/digits/sdk/android/R$id;->dgts__state_button:I

    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/StateButton;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/digits/sdk/android/StateButton;->textView:Landroid/widget/TextView;

    .line 83
    sget v0, Lcom/digits/sdk/android/R$id;->dgts__state_progress:I

    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/StateButton;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/digits/sdk/android/StateButton;->progressBar:Landroid/widget/ProgressBar;

    .line 84
    sget v0, Lcom/digits/sdk/android/R$id;->dgts__state_success:I

    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/StateButton;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/digits/sdk/android/StateButton;->imageView:Landroid/widget/ImageView;

    .line 86
    invoke-virtual {p0}, Lcom/digits/sdk/android/StateButton;->showStart()V

    .line 87
    return-void
.end method


# virtual methods
.method getProgressDrawable()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 61
    iget v0, p0, Lcom/digits/sdk/android/StateButton;->accentColor:I

    invoke-static {v0}, Lcom/digits/sdk/android/ThemeUtils;->isLightColor(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/digits/sdk/android/StateButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/digits/sdk/android/R$drawable;->progress_dark:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/digits/sdk/android/StateButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/digits/sdk/android/R$drawable;->progress_light:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0
.end method

.method getTextColor()I
    .locals 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/digits/sdk/android/StateButton;->buttonThemer:Lcom/digits/sdk/android/ButtonThemer;

    iget v1, p0, Lcom/digits/sdk/android/StateButton;->accentColor:I

    invoke-virtual {v0, v1}, Lcom/digits/sdk/android/ButtonThemer;->getTextColor(I)I

    move-result v0

    return v0
.end method

.method init(Landroid/content/res/TypedArray;)V
    .locals 1
    .param p1, "array"    # Landroid/content/res/TypedArray;

    .prologue
    .line 73
    sget v0, Lcom/digits/sdk/android/R$styleable;->StateButton_startStateText:I

    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/digits/sdk/android/StateButton;->startText:Ljava/lang/CharSequence;

    .line 74
    sget v0, Lcom/digits/sdk/android/R$styleable;->StateButton_progressStateText:I

    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/digits/sdk/android/StateButton;->progressText:Ljava/lang/CharSequence;

    .line 75
    sget v0, Lcom/digits/sdk/android/R$styleable;->StateButton_finishStateText:I

    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/digits/sdk/android/StateButton;->finishText:Ljava/lang/CharSequence;

    .line 76
    invoke-direct {p0}, Lcom/digits/sdk/android/StateButton;->initView()V

    .line 77
    return-void
.end method

.method setImageAccentColor()V
    .locals 3

    .prologue
    .line 49
    iget-object v0, p0, Lcom/digits/sdk/android/StateButton;->imageView:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/digits/sdk/android/StateButton;->getTextColor()I

    move-result v1

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1, v2}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 50
    return-void
.end method

.method setSpinnerAccentColor()V
    .locals 2

    .prologue
    .line 53
    iget-object v0, p0, Lcom/digits/sdk/android/StateButton;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {p0}, Lcom/digits/sdk/android/StateButton;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 54
    return-void
.end method

.method public setStatesText(III)V
    .locals 2
    .param p1, "startResId"    # I
    .param p2, "progressResId"    # I
    .param p3, "finishResId"    # I

    .prologue
    .line 66
    invoke-virtual {p0}, Lcom/digits/sdk/android/StateButton;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 67
    .local v0, "context":Landroid/content/Context;
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/digits/sdk/android/StateButton;->startText:Ljava/lang/CharSequence;

    .line 68
    invoke-virtual {v0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/digits/sdk/android/StateButton;->progressText:Ljava/lang/CharSequence;

    .line 69
    invoke-virtual {v0, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/digits/sdk/android/StateButton;->finishText:Ljava/lang/CharSequence;

    .line 70
    return-void
.end method

.method public showError()V
    .locals 0

    .prologue
    .line 103
    invoke-virtual {p0}, Lcom/digits/sdk/android/StateButton;->showStart()V

    .line 104
    return-void
.end method

.method public showFinish()V
    .locals 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/digits/sdk/android/StateButton;->textView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/digits/sdk/android/StateButton;->finishText:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    iget-object v0, p0, Lcom/digits/sdk/android/StateButton;->progressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 98
    iget-object v0, p0, Lcom/digits/sdk/android/StateButton;->imageView:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 99
    return-void
.end method

.method public showProgress()V
    .locals 2

    .prologue
    .line 90
    iget-object v0, p0, Lcom/digits/sdk/android/StateButton;->textView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/digits/sdk/android/StateButton;->progressText:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    iget-object v0, p0, Lcom/digits/sdk/android/StateButton;->progressBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 92
    iget-object v0, p0, Lcom/digits/sdk/android/StateButton;->imageView:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 93
    return-void
.end method

.method public showStart()V
    .locals 3

    .prologue
    const/16 v2, 0x8

    .line 107
    iget-object v0, p0, Lcom/digits/sdk/android/StateButton;->textView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/digits/sdk/android/StateButton;->startText:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    iget-object v0, p0, Lcom/digits/sdk/android/StateButton;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 109
    iget-object v0, p0, Lcom/digits/sdk/android/StateButton;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 110
    return-void
.end method
