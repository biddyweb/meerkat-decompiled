.class public Lcom/sithagi/countrycodepicker/CountryPicker;
.super Landroid/support/v4/app/DialogFragment;
.source "CountryPicker.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/app/DialogFragment;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/sithagi/countrycodepicker/Country;",
        ">;"
    }
.end annotation


# instance fields
.field private adapter:Lcom/sithagi/countrycodepicker/CountryListAdapter;

.field private allCountriesList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/sithagi/countrycodepicker/Country;",
            ">;"
        }
    .end annotation
.end field

.field private countryListView:Landroid/widget/ListView;

.field private listener:Lcom/sithagi/countrycodepicker/CountryPickerListener;

.field private searchEditText:Landroid/widget/EditText;

.field private selectedCountriesList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/sithagi/countrycodepicker/Country;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/sithagi/countrycodepicker/CountryPicker;)Lcom/sithagi/countrycodepicker/CountryPickerListener;
    .locals 1
    .param p0, "x0"    # Lcom/sithagi/countrycodepicker/CountryPicker;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->listener:Lcom/sithagi/countrycodepicker/CountryPickerListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/sithagi/countrycodepicker/CountryPicker;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/sithagi/countrycodepicker/CountryPicker;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->selectedCountriesList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$200(Lcom/sithagi/countrycodepicker/CountryPicker;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/sithagi/countrycodepicker/CountryPicker;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/sithagi/countrycodepicker/CountryPicker;->search(Ljava/lang/String;)V

    return-void
.end method

.method private getAllCountries()Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/sithagi/countrycodepicker/Country;",
            ">;"
        }
    .end annotation

    .prologue
    .line 64
    iget-object v9, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->allCountriesList:Ljava/util/List;

    if-nez v9, :cond_1

    .line 66
    :try_start_0
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->allCountriesList:Ljava/util/List;

    .line 68
    invoke-virtual {p0}, Lcom/sithagi/countrycodepicker/CountryPicker;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v9

    invoke-static {v9}, Lcom/sithagi/countrycodepicker/CountryPicker;->readEncodedJsonString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 70
    .local v0, "allCountriesCode":Ljava/lang/String;
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 72
    .local v1, "countrArray":Lorg/json/JSONArray;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v7, v9, :cond_0

    .line 73
    invoke-virtual {v1, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 74
    .local v8, "jsonObject":Lorg/json/JSONObject;
    const-string v9, "name"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 75
    .local v5, "countryName":Ljava/lang/String;
    const-string v9, "dial_code"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 76
    .local v4, "countryDialCode":Ljava/lang/String;
    const-string v9, "code"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 78
    .local v3, "countryCode":Ljava/lang/String;
    new-instance v2, Lcom/sithagi/countrycodepicker/Country;

    invoke-direct {v2}, Lcom/sithagi/countrycodepicker/Country;-><init>()V

    .line 79
    .local v2, "country":Lcom/sithagi/countrycodepicker/Country;
    invoke-virtual {v2, v3}, Lcom/sithagi/countrycodepicker/Country;->setCode(Ljava/lang/String;)V

    .line 80
    invoke-virtual {v2, v5}, Lcom/sithagi/countrycodepicker/Country;->setName(Ljava/lang/String;)V

    .line 81
    invoke-virtual {v2, v4}, Lcom/sithagi/countrycodepicker/Country;->setDialCode(Ljava/lang/String;)V

    .line 82
    iget-object v9, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->allCountriesList:Ljava/util/List;

    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 85
    .end local v2    # "country":Lcom/sithagi/countrycodepicker/Country;
    .end local v3    # "countryCode":Ljava/lang/String;
    .end local v4    # "countryDialCode":Ljava/lang/String;
    .end local v5    # "countryName":Ljava/lang/String;
    .end local v8    # "jsonObject":Lorg/json/JSONObject;
    :cond_0
    iget-object v9, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->allCountriesList:Ljava/util/List;

    invoke-static {v9, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 87
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->selectedCountriesList:Ljava/util/List;

    .line 88
    iget-object v9, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->selectedCountriesList:Ljava/util/List;

    iget-object v10, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->allCountriesList:Ljava/util/List;

    invoke-interface {v9, v10}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 91
    iget-object v9, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->allCountriesList:Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    .end local v0    # "allCountriesCode":Ljava/lang/String;
    .end local v1    # "countrArray":Lorg/json/JSONArray;
    .end local v7    # "i":I
    :goto_1
    return-object v9

    .line 93
    :catch_0
    move-exception v6

    .line 94
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 97
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_1
    const/4 v9, 0x0

    goto :goto_1
.end method

.method public static getCurrencyCode(Ljava/lang/String;)Ljava/util/Currency;
    .locals 2
    .param p0, "countryCode"    # Ljava/lang/String;

    .prologue
    .line 56
    :try_start_0
    new-instance v0, Ljava/util/Locale;

    const-string v1, "en"

    invoke-direct {v0, v1, p0}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Ljava/util/Currency;->getInstance(Ljava/util/Locale;)Ljava/util/Currency;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 60
    :goto_0
    return-object v0

    .line 57
    :catch_0
    move-exception v0

    .line 60
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static newInstance(Ljava/lang/String;)Lcom/sithagi/countrycodepicker/CountryPicker;
    .locals 3
    .param p0, "dialogTitle"    # Ljava/lang/String;

    .prologue
    .line 114
    new-instance v1, Lcom/sithagi/countrycodepicker/CountryPicker;

    invoke-direct {v1}, Lcom/sithagi/countrycodepicker/CountryPicker;-><init>()V

    .line 115
    .local v1, "picker":Lcom/sithagi/countrycodepicker/CountryPicker;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 116
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "dialogTitle"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    invoke-virtual {v1, v0}, Lcom/sithagi/countrycodepicker/CountryPicker;->setArguments(Landroid/os/Bundle;)V

    .line 118
    return-object v1
.end method

.method private static readEncodedJsonString(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/sithagi/countrycodepicker/R$string;->countries_code:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 103
    .local v0, "base64":Ljava/lang/String;
    const/4 v2, 0x0

    invoke-static {v0, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v1

    .line 104
    .local v1, "data":[B
    new-instance v2, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v2, v1, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v2
.end method

.method private search(Ljava/lang/String;)V
    .locals 4
    .param p1, "text"    # Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    .line 184
    iget-object v1, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->selectedCountriesList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 186
    iget-object v1, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->allCountriesList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sithagi/countrycodepicker/Country;

    .line 187
    .local v0, "country":Lcom/sithagi/countrycodepicker/Country;
    invoke-virtual {v0}, Lcom/sithagi/countrycodepicker/Country;->getName()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    .line 188
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 189
    iget-object v2, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->selectedCountriesList:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 193
    .end local v0    # "country":Lcom/sithagi/countrycodepicker/Country;
    :cond_1
    iget-object v1, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->adapter:Lcom/sithagi/countrycodepicker/CountryListAdapter;

    invoke-virtual {v1}, Lcom/sithagi/countrycodepicker/CountryListAdapter;->notifyDataSetChanged()V

    .line 194
    return-void
.end method


# virtual methods
.method public compare(Lcom/sithagi/countrycodepicker/Country;Lcom/sithagi/countrycodepicker/Country;)I
    .locals 2
    .param p1, "lhs"    # Lcom/sithagi/countrycodepicker/Country;
    .param p2, "rhs"    # Lcom/sithagi/countrycodepicker/Country;

    .prologue
    .line 198
    invoke-virtual {p1}, Lcom/sithagi/countrycodepicker/Country;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/sithagi/countrycodepicker/Country;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 28
    check-cast p1, Lcom/sithagi/countrycodepicker/Country;

    check-cast p2, Lcom/sithagi/countrycodepicker/Country;

    invoke-virtual {p0, p1, p2}, Lcom/sithagi/countrycodepicker/CountryPicker;->compare(Lcom/sithagi/countrycodepicker/Country;Lcom/sithagi/countrycodepicker/Country;)I

    move-result v0

    return v0
.end method

.method public getCountryListView()Landroid/widget/ListView;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->countryListView:Landroid/widget/ListView;

    return-object v0
.end method

.method public getSearchEditText()Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->searchEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 8
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 124
    sget v5, Lcom/sithagi/countrycodepicker/R$layout;->country_picker:I

    const/4 v6, 0x0

    invoke-virtual {p1, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 126
    .local v3, "view":Landroid/view/View;
    invoke-direct {p0}, Lcom/sithagi/countrycodepicker/CountryPicker;->getAllCountries()Ljava/util/List;

    .line 128
    invoke-virtual {p0}, Lcom/sithagi/countrycodepicker/CountryPicker;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 129
    .local v0, "args":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 130
    const-string v5, "dialogTitle"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 131
    .local v1, "dialogTitle":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/sithagi/countrycodepicker/CountryPicker;->getDialog()Landroid/app/Dialog;

    move-result-object v5

    invoke-virtual {v5, v1}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 133
    invoke-virtual {p0}, Lcom/sithagi/countrycodepicker/CountryPicker;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/sithagi/countrycodepicker/R$dimen;->cp_dialog_width:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 135
    .local v4, "width":I
    invoke-virtual {p0}, Lcom/sithagi/countrycodepicker/CountryPicker;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/sithagi/countrycodepicker/R$dimen;->cp_dialog_height:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 137
    .local v2, "height":I
    invoke-virtual {p0}, Lcom/sithagi/countrycodepicker/CountryPicker;->getDialog()Landroid/app/Dialog;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5, v4, v2}, Landroid/view/Window;->setLayout(II)V

    .line 140
    .end local v1    # "dialogTitle":Ljava/lang/String;
    .end local v2    # "height":I
    .end local v4    # "width":I
    :cond_0
    sget v5, Lcom/sithagi/countrycodepicker/R$id;->country_code_picker_search:I

    .line 141
    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    iput-object v5, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->searchEditText:Landroid/widget/EditText;

    .line 142
    sget v5, Lcom/sithagi/countrycodepicker/R$id;->country_code_picker_listview:I

    .line 143
    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ListView;

    iput-object v5, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->countryListView:Landroid/widget/ListView;

    .line 145
    new-instance v5, Lcom/sithagi/countrycodepicker/CountryListAdapter;

    invoke-virtual {p0}, Lcom/sithagi/countrycodepicker/CountryPicker;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    iget-object v7, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->selectedCountriesList:Ljava/util/List;

    invoke-direct {v5, v6, v7}, Lcom/sithagi/countrycodepicker/CountryListAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object v5, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->adapter:Lcom/sithagi/countrycodepicker/CountryListAdapter;

    .line 146
    iget-object v5, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->countryListView:Landroid/widget/ListView;

    iget-object v6, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->adapter:Lcom/sithagi/countrycodepicker/CountryListAdapter;

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 148
    iget-object v5, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->countryListView:Landroid/widget/ListView;

    new-instance v6, Lcom/sithagi/countrycodepicker/CountryPicker$1;

    invoke-direct {v6, p0}, Lcom/sithagi/countrycodepicker/CountryPicker$1;-><init>(Lcom/sithagi/countrycodepicker/CountryPicker;)V

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 161
    iget-object v5, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->searchEditText:Landroid/widget/EditText;

    new-instance v6, Lcom/sithagi/countrycodepicker/CountryPicker$2;

    invoke-direct {v6, p0}, Lcom/sithagi/countrycodepicker/CountryPicker$2;-><init>(Lcom/sithagi/countrycodepicker/CountryPicker;)V

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 179
    return-object v3
.end method

.method public setListener(Lcom/sithagi/countrycodepicker/CountryPickerListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/sithagi/countrycodepicker/CountryPickerListener;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/sithagi/countrycodepicker/CountryPicker;->listener:Lcom/sithagi/countrycodepicker/CountryPickerListener;

    .line 44
    return-void
.end method
