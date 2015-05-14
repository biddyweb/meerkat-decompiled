.class public Lcom/sithagi/countrycodepicker/CountryListAdapter;
.super Landroid/widget/BaseAdapter;
.source "CountryListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sithagi/countrycodepicker/CountryListAdapter$Cell;
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field countries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/sithagi/countrycodepicker/Country;",
            ">;"
        }
    .end annotation
.end field

.field inflater:Landroid/view/LayoutInflater;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/sithagi/countrycodepicker/Country;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p2, "countries":Ljava/util/List;, "Ljava/util/List<Lcom/sithagi/countrycodepicker/Country;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/sithagi/countrycodepicker/CountryListAdapter;->context:Landroid/content/Context;

    .line 41
    iput-object p2, p0, Lcom/sithagi/countrycodepicker/CountryListAdapter;->countries:Ljava/util/List;

    .line 42
    iget-object v0, p0, Lcom/sithagi/countrycodepicker/CountryListAdapter;->context:Landroid/content/Context;

    const-string v1, "layout_inflater"

    .line 43
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/sithagi/countrycodepicker/CountryListAdapter;->inflater:Landroid/view/LayoutInflater;

    .line 44
    return-void
.end method

.method private getResId(Ljava/lang/String;)I
    .locals 6
    .param p1, "drawableName"    # Ljava/lang/String;

    .prologue
    .line 28
    :try_start_0
    const-class v3, Lcom/sithagi/countrycodepicker/R$drawable;

    .line 29
    .local v3, "res":Ljava/lang/Class;, "Ljava/lang/Class<Lcom/sithagi/countrycodepicker/R$drawable;>;"
    invoke-virtual {v3, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 30
    .local v2, "field":Ljava/lang/reflect/Field;
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 35
    .end local v2    # "field":Ljava/lang/reflect/Field;
    .end local v3    # "res":Ljava/lang/Class;, "Ljava/lang/Class<Lcom/sithagi/countrycodepicker/R$drawable;>;"
    :goto_0
    return v0

    .line 32
    :catch_0
    move-exception v1

    .line 33
    .local v1, "e":Ljava/lang/Exception;
    const-string v4, "CountryCodePicker"

    const-string v5, "Failure to get drawable id."

    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 35
    const/4 v0, -0x1

    goto :goto_0
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/sithagi/countrycodepicker/CountryListAdapter;->countries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "arg0"    # I

    .prologue
    .line 53
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "arg0"    # I

    .prologue
    .line 58
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 63
    move-object v1, p2

    .line 65
    .local v1, "cellView":Landroid/view/View;
    iget-object v4, p0, Lcom/sithagi/countrycodepicker/CountryListAdapter;->countries:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/sithagi/countrycodepicker/Country;

    .line 67
    .local v2, "country":Lcom/sithagi/countrycodepicker/Country;
    if-nez p2, :cond_0

    .line 68
    new-instance v0, Lcom/sithagi/countrycodepicker/CountryListAdapter$Cell;

    invoke-direct {v0}, Lcom/sithagi/countrycodepicker/CountryListAdapter$Cell;-><init>()V

    .line 69
    .local v0, "cell":Lcom/sithagi/countrycodepicker/CountryListAdapter$Cell;
    iget-object v4, p0, Lcom/sithagi/countrycodepicker/CountryListAdapter;->inflater:Landroid/view/LayoutInflater;

    sget v5, Lcom/sithagi/countrycodepicker/R$layout;->row:I

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 70
    sget v4, Lcom/sithagi/countrycodepicker/R$id;->row_title:I

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/sithagi/countrycodepicker/CountryListAdapter$Cell;->textView:Landroid/widget/TextView;

    .line 71
    sget v4, Lcom/sithagi/countrycodepicker/R$id;->row_icon:I

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, v0, Lcom/sithagi/countrycodepicker/CountryListAdapter$Cell;->imageView:Landroid/widget/ImageView;

    .line 72
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 77
    :goto_0
    iget-object v4, v0, Lcom/sithagi/countrycodepicker/CountryListAdapter$Cell;->textView:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/sithagi/countrycodepicker/Country;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "flag_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 80
    invoke-virtual {v2}, Lcom/sithagi/countrycodepicker/Country;->getCode()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 81
    .local v3, "drawableName":Ljava/lang/String;
    iget-object v4, v0, Lcom/sithagi/countrycodepicker/CountryListAdapter$Cell;->imageView:Landroid/widget/ImageView;

    invoke-direct {p0, v3}, Lcom/sithagi/countrycodepicker/CountryListAdapter;->getResId(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 82
    return-object v1

    .line 74
    .end local v0    # "cell":Lcom/sithagi/countrycodepicker/CountryListAdapter$Cell;
    .end local v3    # "drawableName":Ljava/lang/String;
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sithagi/countrycodepicker/CountryListAdapter$Cell;

    .restart local v0    # "cell":Lcom/sithagi/countrycodepicker/CountryListAdapter$Cell;
    goto :goto_0
.end method
