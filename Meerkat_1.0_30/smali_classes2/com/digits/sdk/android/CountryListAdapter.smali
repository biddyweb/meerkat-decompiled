.class Lcom/digits/sdk/android/CountryListAdapter;
.super Landroid/widget/ArrayAdapter;
.source "CountryListAdapter.java"

# interfaces
.implements Landroid/widget/SectionIndexer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/digits/sdk/android/CountryInfo;",
        ">;",
        "Landroid/widget/SectionIndexer;"
    }
.end annotation


# instance fields
.field private final alphaIndex:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final countryPosition:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private sections:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 21
    sget v0, Lcom/digits/sdk/android/R$layout;->dgts__country_row:I

    const v1, 0x1020014

    invoke-direct {p0, p1, v0, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;II)V

    .line 16
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/digits/sdk/android/CountryListAdapter;->alphaIndex:Ljava/util/HashMap;

    .line 17
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/digits/sdk/android/CountryListAdapter;->countryPosition:Ljava/util/HashMap;

    .line 22
    return-void
.end method


# virtual methods
.method public getPositionForCountry(Ljava/lang/String;)I
    .locals 2
    .param p1, "country"    # Ljava/lang/String;

    .prologue
    .line 75
    iget-object v1, p0, Lcom/digits/sdk/android/CountryListAdapter;->countryPosition:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 76
    .local v0, "position":Ljava/lang/Integer;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_0
.end method

.method public getPositionForSection(I)I
    .locals 2
    .param p1, "index"    # I

    .prologue
    const/4 v0, 0x0

    .line 53
    iget-object v1, p0, Lcom/digits/sdk/android/CountryListAdapter;->sections:[Ljava/lang/String;

    if-nez v1, :cond_1

    .line 66
    :cond_0
    :goto_0
    return v0

    .line 58
    :cond_1
    if-lez p1, :cond_0

    .line 61
    iget-object v0, p0, Lcom/digits/sdk/android/CountryListAdapter;->sections:[Ljava/lang/String;

    array-length v0, v0

    if-lt p1, v0, :cond_2

    .line 62
    iget-object v0, p0, Lcom/digits/sdk/android/CountryListAdapter;->sections:[Ljava/lang/String;

    array-length v0, v0

    add-int/lit8 p1, v0, -0x1

    .line 66
    :cond_2
    iget-object v0, p0, Lcom/digits/sdk/android/CountryListAdapter;->alphaIndex:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/digits/sdk/android/CountryListAdapter;->sections:[Ljava/lang/String;

    aget-object v1, v1, p1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0
.end method

.method public getSectionForPosition(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 71
    const/4 v0, 0x0

    return v0
.end method

.method public getSections()[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/digits/sdk/android/CountryListAdapter;->sections:[Ljava/lang/String;

    return-object v0
.end method

.method public setData(Ljava/util/List;)V
    .locals 7
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
    .line 27
    .local p1, "countries":Ljava/util/List;, "Ljava/util/List<Lcom/digits/sdk/android/CountryInfo;>;"
    const/4 v2, 0x0

    .line 28
    .local v2, "index":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/digits/sdk/android/CountryInfo;

    .line 29
    .local v0, "countryInfo":Lcom/digits/sdk/android/CountryInfo;
    iget-object v4, v0, Lcom/digits/sdk/android/CountryInfo;->country:Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    .line 31
    .local v3, "key":Ljava/lang/String;
    iget-object v4, p0, Lcom/digits/sdk/android/CountryListAdapter;->alphaIndex:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 32
    iget-object v4, p0, Lcom/digits/sdk/android/CountryListAdapter;->alphaIndex:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    :cond_0
    iget-object v4, p0, Lcom/digits/sdk/android/CountryListAdapter;->countryPosition:Ljava/util/HashMap;

    iget-object v5, v0, Lcom/digits/sdk/android/CountryInfo;->country:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    add-int/lit8 v2, v2, 0x1

    .line 37
    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/CountryListAdapter;->add(Ljava/lang/Object;)V

    goto :goto_0

    .line 40
    .end local v0    # "countryInfo":Lcom/digits/sdk/android/CountryInfo;
    .end local v3    # "key":Ljava/lang/String;
    :cond_1
    iget-object v4, p0, Lcom/digits/sdk/android/CountryListAdapter;->alphaIndex:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    iput-object v4, p0, Lcom/digits/sdk/android/CountryListAdapter;->sections:[Ljava/lang/String;

    .line 41
    iget-object v4, p0, Lcom/digits/sdk/android/CountryListAdapter;->alphaIndex:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    iget-object v5, p0, Lcom/digits/sdk/android/CountryListAdapter;->sections:[Ljava/lang/String;

    invoke-interface {v4, v5}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 43
    invoke-virtual {p0}, Lcom/digits/sdk/android/CountryListAdapter;->notifyDataSetChanged()V

    .line 44
    return-void
.end method
