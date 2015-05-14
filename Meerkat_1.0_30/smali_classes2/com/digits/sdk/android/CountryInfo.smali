.class Lcom/digits/sdk/android/CountryInfo;
.super Ljava/lang/Object;
.source "CountryInfo.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/digits/sdk/android/CountryInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private final collator:Ljava/text/Collator;

.field public final country:Ljava/lang/String;

.field public final countryCode:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 2
    .param p1, "country"    # Ljava/lang/String;
    .param p2, "countryCode"    # I

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Ljava/text/Collator;->getInstance(Ljava/util/Locale;)Ljava/text/Collator;

    move-result-object v0

    iput-object v0, p0, Lcom/digits/sdk/android/CountryInfo;->collator:Ljava/text/Collator;

    .line 13
    iget-object v0, p0, Lcom/digits/sdk/android/CountryInfo;->collator:Ljava/text/Collator;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/text/Collator;->setStrength(I)V

    .line 15
    iput-object p1, p0, Lcom/digits/sdk/android/CountryInfo;->country:Ljava/lang/String;

    .line 16
    iput p2, p0, Lcom/digits/sdk/android/CountryInfo;->countryCode:I

    .line 17
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/digits/sdk/android/CountryInfo;)I
    .locals 3
    .param p1, "info"    # Lcom/digits/sdk/android/CountryInfo;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/digits/sdk/android/CountryInfo;->collator:Ljava/text/Collator;

    iget-object v1, p0, Lcom/digits/sdk/android/CountryInfo;->country:Ljava/lang/String;

    iget-object v2, p1, Lcom/digits/sdk/android/CountryInfo;->country:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 6
    check-cast p1, Lcom/digits/sdk/android/CountryInfo;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/digits/sdk/android/CountryInfo;->compareTo(Lcom/digits/sdk/android/CountryInfo;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 21
    if-ne p0, p1, :cond_1

    .line 35
    :cond_0
    :goto_0
    return v1

    .line 22
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 23
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 26
    check-cast v0, Lcom/digits/sdk/android/CountryInfo;

    .line 28
    .local v0, "that":Lcom/digits/sdk/android/CountryInfo;
    iget v3, p0, Lcom/digits/sdk/android/CountryInfo;->countryCode:I

    iget v4, v0, Lcom/digits/sdk/android/CountryInfo;->countryCode:I

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 29
    goto :goto_0

    .line 31
    :cond_4
    iget-object v3, p0, Lcom/digits/sdk/android/CountryInfo;->country:Ljava/lang/String;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/digits/sdk/android/CountryInfo;->country:Ljava/lang/String;

    iget-object v4, v0, Lcom/digits/sdk/android/CountryInfo;->country:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 32
    goto :goto_0

    .line 31
    :cond_5
    iget-object v3, v0, Lcom/digits/sdk/android/CountryInfo;->country:Ljava/lang/String;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 40
    iget-object v1, p0, Lcom/digits/sdk/android/CountryInfo;->country:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/digits/sdk/android/CountryInfo;->country:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 41
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/digits/sdk/android/CountryInfo;->countryCode:I

    add-int v0, v1, v2

    .line 42
    return v0

    .line 40
    .end local v0    # "result":I
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/digits/sdk/android/CountryInfo;->country:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " +"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/digits/sdk/android/CountryInfo;->countryCode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
