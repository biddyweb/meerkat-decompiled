.class public Lcom/digits/sdk/android/CountryListSpinner;
.super Landroid/widget/TextView;
.source "CountryListSpinner.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/digits/sdk/android/CountryListLoadTask$Listener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;
    }
.end annotation


# instance fields
.field private countryListAdapter:Lcom/digits/sdk/android/CountryListAdapter;

.field private dialogPopup:Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;

.field private listener:Landroid/view/View$OnClickListener;

.field private selectedCountryName:Ljava/lang/String;

.field private textFormat:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    const/4 v0, 0x0

    const v1, 0x1010081

    invoke-direct {p0, p1, v0, v1}, Lcom/digits/sdk/android/CountryListSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 30
    const v0, 0x1010081

    invoke-direct {p0, p1, p2, v0}, Lcom/digits/sdk/android/CountryListSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 34
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 36
    invoke-direct {p0}, Lcom/digits/sdk/android/CountryListSpinner;->init()V

    .line 37
    return-void
.end method

.method static synthetic access$002(Lcom/digits/sdk/android/CountryListSpinner;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/digits/sdk/android/CountryListSpinner;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 17
    iput-object p1, p0, Lcom/digits/sdk/android/CountryListSpinner;->selectedCountryName:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$100(Lcom/digits/sdk/android/CountryListSpinner;ILjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/digits/sdk/android/CountryListSpinner;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 17
    invoke-direct {p0, p1, p2}, Lcom/digits/sdk/android/CountryListSpinner;->setSpinnerText(ILjava/lang/String;)V

    return-void
.end method

.method private executeUserClickListener(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 105
    iget-object v0, p0, Lcom/digits/sdk/android/CountryListSpinner;->listener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Lcom/digits/sdk/android/CountryListSpinner;->listener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 108
    :cond_0
    return-void
.end method

.method private init()V
    .locals 4

    .prologue
    .line 47
    invoke-super {p0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    new-instance v2, Lcom/digits/sdk/android/CountryListAdapter;

    invoke-virtual {p0}, Lcom/digits/sdk/android/CountryListSpinner;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/digits/sdk/android/CountryListAdapter;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/digits/sdk/android/CountryListSpinner;->countryListAdapter:Lcom/digits/sdk/android/CountryListAdapter;

    .line 50
    new-instance v2, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;

    iget-object v3, p0, Lcom/digits/sdk/android/CountryListSpinner;->countryListAdapter:Lcom/digits/sdk/android/CountryListAdapter;

    invoke-direct {v2, p0, v3}, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;-><init>(Lcom/digits/sdk/android/CountryListSpinner;Lcom/digits/sdk/android/CountryListAdapter;)V

    iput-object v2, p0, Lcom/digits/sdk/android/CountryListSpinner;->dialogPopup:Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;

    .line 51
    invoke-virtual {p0}, Lcom/digits/sdk/android/CountryListSpinner;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/digits/sdk/android/R$string;->dgts__country_spinner_format:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/digits/sdk/android/CountryListSpinner;->textFormat:Ljava/lang/String;

    .line 52
    const-string v2, ""

    iput-object v2, p0, Lcom/digits/sdk/android/CountryListSpinner;->selectedCountryName:Ljava/lang/String;

    .line 54
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v0

    .line 55
    .local v0, "defaultCountry":Ljava/lang/String;
    const/4 v1, 0x1

    .line 57
    .local v1, "defaultCountryCode":I
    const/4 v2, 0x1

    invoke-direct {p0, v2, v0}, Lcom/digits/sdk/android/CountryListSpinner;->setSpinnerText(ILjava/lang/String;)V

    .line 58
    return-void
.end method

.method private loadCountryList()V
    .locals 3

    .prologue
    .line 100
    new-instance v0, Lcom/digits/sdk/android/CountryListLoadTask;

    invoke-direct {v0, p0}, Lcom/digits/sdk/android/CountryListLoadTask;-><init>(Lcom/digits/sdk/android/CountryListLoadTask$Listener;)V

    invoke-static {}, Lcom/digits/sdk/android/Digits;->getInstance()Lcom/digits/sdk/android/Digits;

    move-result-object v1

    invoke-virtual {v1}, Lcom/digits/sdk/android/Digits;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1, v2}, Lcom/digits/sdk/android/CountryListLoadTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Lio/fabric/sdk/android/services/concurrency/AsyncTask;

    .line 102
    return-void
.end method

.method private setSpinnerText(ILjava/lang/String;)V
    .locals 4
    .param p1, "countryCode"    # I
    .param p2, "country"    # Ljava/lang/String;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/digits/sdk/android/CountryListSpinner;->textFormat:Ljava/lang/String;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 v2, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/CountryListSpinner;->setText(Ljava/lang/CharSequence;)V

    .line 62
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/CountryListSpinner;->setTag(Ljava/lang/Object;)V

    .line 63
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/digits/sdk/android/CountryListSpinner;->countryListAdapter:Lcom/digits/sdk/android/CountryListAdapter;

    invoke-virtual {v0}, Lcom/digits/sdk/android/CountryListAdapter;->getCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 90
    invoke-direct {p0}, Lcom/digits/sdk/android/CountryListSpinner;->loadCountryList()V

    .line 94
    :goto_0
    invoke-virtual {p0}, Lcom/digits/sdk/android/CountryListSpinner;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lio/fabric/sdk/android/services/common/CommonUtils;->hideKeyboard(Landroid/content/Context;Landroid/view/View;)V

    .line 95
    invoke-direct {p0, p1}, Lcom/digits/sdk/android/CountryListSpinner;->executeUserClickListener(Landroid/view/View;)V

    .line 96
    return-void

    .line 92
    :cond_0
    iget-object v0, p0, Lcom/digits/sdk/android/CountryListSpinner;->dialogPopup:Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;

    iget-object v1, p0, Lcom/digits/sdk/android/CountryListSpinner;->countryListAdapter:Lcom/digits/sdk/android/CountryListAdapter;

    iget-object v2, p0, Lcom/digits/sdk/android/CountryListSpinner;->selectedCountryName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/digits/sdk/android/CountryListAdapter;->getPositionForCountry(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->show(I)V

    goto :goto_0
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 74
    invoke-super {p0}, Landroid/widget/TextView;->onDetachedFromWindow()V

    .line 76
    iget-object v0, p0, Lcom/digits/sdk/android/CountryListSpinner;->dialogPopup:Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;

    invoke-virtual {v0}, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 77
    iget-object v0, p0, Lcom/digits/sdk/android/CountryListSpinner;->dialogPopup:Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;

    invoke-virtual {v0}, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->dismiss()V

    .line 79
    :cond_0
    return-void
.end method

.method public onLoadComplete(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/digits/sdk/android/CountryInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 113
    .local p1, "result":Ljava/util/List;, "Ljava/util/List<Lcom/digits/sdk/android/CountryInfo;>;"
    iget-object v0, p0, Lcom/digits/sdk/android/CountryListSpinner;->countryListAdapter:Lcom/digits/sdk/android/CountryListAdapter;

    invoke-virtual {v0, p1}, Lcom/digits/sdk/android/CountryListAdapter;->setData(Ljava/util/List;)V

    .line 114
    iget-object v0, p0, Lcom/digits/sdk/android/CountryListSpinner;->dialogPopup:Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;

    iget-object v1, p0, Lcom/digits/sdk/android/CountryListSpinner;->countryListAdapter:Lcom/digits/sdk/android/CountryListAdapter;

    iget-object v2, p0, Lcom/digits/sdk/android/CountryListSpinner;->selectedCountryName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/digits/sdk/android/CountryListAdapter;->getPositionForCountry(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->show(I)V

    .line 115
    return-void
.end method

.method setDialogPopup(Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;)V
    .locals 0
    .param p1, "dialog"    # Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/digits/sdk/android/CountryListSpinner;->dialogPopup:Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;

    .line 44
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .param p1, "l"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/digits/sdk/android/CountryListSpinner;->listener:Landroid/view/View$OnClickListener;

    .line 84
    return-void
.end method

.method public setSelectedForCountry(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "countryName"    # Ljava/lang/String;
    .param p2, "countryCode"    # Ljava/lang/String;

    .prologue
    .line 66
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 67
    iput-object p1, p0, Lcom/digits/sdk/android/CountryListSpinner;->selectedCountryName:Ljava/lang/String;

    .line 68
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {p0, v0, p1}, Lcom/digits/sdk/android/CountryListSpinner;->setSpinnerText(ILjava/lang/String;)V

    .line 70
    :cond_0
    return-void
.end method
