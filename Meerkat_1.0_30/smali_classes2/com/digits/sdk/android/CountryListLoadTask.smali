.class Lcom/digits/sdk/android/CountryListLoadTask;
.super Lio/fabric/sdk/android/services/concurrency/AsyncTask;
.source "CountryListLoadTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/digits/sdk/android/CountryListLoadTask$Listener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/fabric/sdk/android/services/concurrency/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/util/List",
        "<",
        "Lcom/digits/sdk/android/CountryInfo;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final MAX_COUNTRIES:I = 0x123


# instance fields
.field private final listener:Lcom/digits/sdk/android/CountryListLoadTask$Listener;


# direct methods
.method public constructor <init>(Lcom/digits/sdk/android/CountryListLoadTask$Listener;)V
    .locals 0
    .param p1, "listener"    # Lcom/digits/sdk/android/CountryListLoadTask$Listener;

    .prologue
    .line 15
    invoke-direct {p0}, Lio/fabric/sdk/android/services/concurrency/AsyncTask;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/digits/sdk/android/CountryListLoadTask;->listener:Lcom/digits/sdk/android/CountryListLoadTask$Listener;

    .line 17
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 10
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/digits/sdk/android/CountryListLoadTask;->doInBackground([Ljava/lang/Void;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/util/List;
    .locals 10
    .param p1, "params"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/digits/sdk/android/CountryInfo;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v9, 0x7

    const/16 v8, 0x24e

    const/16 v7, 0x3d

    const/16 v6, 0x2c

    const/4 v5, 0x1

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x123

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 22
    .local v0, "countryInfoList":Ljava/util/List;, "Ljava/util/List<Lcom/digits/sdk/android/CountryInfo;>;"
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "AF"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x5d

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "AX"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x166

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "AL"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x163

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "DZ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xd5

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "AS"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "AD"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x178

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "AO"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xf4

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "AI"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "AG"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "AR"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x36

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "AM"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x176

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "AW"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x129

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "AC"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xf7

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "AU"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v7}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "AT"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2b

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "AZ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3e2

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BS"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BH"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3cd

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BD"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x370

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BB"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BY"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x177

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BE"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x20

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BZ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1f5

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BJ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xe5

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BM"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BT"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3cf

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BO"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x24f

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BA"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x183

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BW"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x10b

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BR"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x37

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "IO"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xf6

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "VG"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BN"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2a1

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BG"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x167

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BF"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xe2

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BI"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x101

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "KH"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x357

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CM"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xed

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CA"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CV"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xee

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BQ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x257

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "KY"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CF"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xec

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "TD"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xeb

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CL"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x38

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CN"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x56

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CX"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v7}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CC"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v7}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CO"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x39

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "KM"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x10d

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CD"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xf3

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CG"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xf2

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CK"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2aa

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CR"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1fa

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CI"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xe1

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "HR"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x181

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CU"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x35

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CW"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x257

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CY"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x165

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CZ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1a4

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "DK"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2d

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "DJ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xfd

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "DM"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "DO"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "TL"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x29e

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "EC"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x251

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "EG"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x14

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SV"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1f7

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GQ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xf0

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "ER"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x123

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "EE"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x174

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "ET"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xfb

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "FK"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1f4

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "FO"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x12a

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "FJ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2a7

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "FI"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x166

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "FR"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x21

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GF"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x252

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "PF"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2b1

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GA"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xf1

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GM"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xdc

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GE"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3e3

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "DE"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x31

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GH"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xe9

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GI"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x15e

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GR"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1e

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GL"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x12b

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GD"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GP"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v8}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GU"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GT"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1f6

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GG"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v6}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GN"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xe0

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GW"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xf5

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GY"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x250

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "HT"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1fd

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "HM"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2a0

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "HN"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1f8

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "HK"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x354

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "HU"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x24

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "IS"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x162

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "IN"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x5b

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "ID"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3e

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "IR"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x62

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "IQ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3c4

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "IE"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x161

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "IM"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v6}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "IL"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3cc

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "IT"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x27

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "JM"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "JP"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x51

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "JE"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v6}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "JO"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3c2

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "KZ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v9}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "KE"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xfe

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "KI"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2ae

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "XK"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x17d

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "KW"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3c5

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "KG"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3e4

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "LA"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x358

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "LV"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x173

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "LB"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3c1

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "LS"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x10a

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "LR"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xe7

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 146
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "LY"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xda

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "LI"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1a7

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 148
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "LT"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x172

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "LU"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x160

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MO"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x355

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MK"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x185

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MG"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x105

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MW"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x109

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MY"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3c

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MV"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3c0

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "ML"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xdf

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MT"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x164

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MH"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2b4

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MQ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x254

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MR"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xde

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MU"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xe6

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "YT"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x106

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MX"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x34

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 164
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "FM"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2b3

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MD"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x175

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MC"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x179

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MN"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3d0

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "ME"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x17e

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MS"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MA"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xd4

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MZ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x102

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MM"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x5f

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "NA"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x108

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "NR"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2a2

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "NP"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3d1

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 176
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "NL"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1f

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 177
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "NC"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2af

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 178
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "NZ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x40

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "NI"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1f9

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "NE"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xe3

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "NG"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xea

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 182
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "NU"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2ab

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 183
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "NF"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2a0

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "KP"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x352

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MP"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "NO"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2f

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 187
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "OM"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3c8

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 188
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "PK"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x5c

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 189
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "PW"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2a8

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 190
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "PS"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3ca

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "PA"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1fb

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "PG"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2a3

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "PY"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x253

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 194
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "PE"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x33

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "PH"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3f

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "PL"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x30

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 197
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "PT"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x15f

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 198
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "PR"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 199
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "QA"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3ce

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "RE"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x106

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 201
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "RO"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x28

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 202
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "RU"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v9}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 203
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "RW"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xfa

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "BL"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v8}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 205
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SH"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x122

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "KN"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 207
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "LC"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 208
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "MF"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v8}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 209
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "PM"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1fc

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 210
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "VC"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 211
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "WS"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2ad

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 212
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SM"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x17a

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 213
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "ST"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xef

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 214
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SA"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3c6

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 215
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SN"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xdd

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 216
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "RS"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x17d

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SC"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xf8

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 218
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SL"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xe8

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 219
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SG"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x41

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 220
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SX"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 221
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SK"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1a5

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 222
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SI"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x182

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 223
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SB"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2a5

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 224
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SO"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xfc

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 225
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "ZA"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1b

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 226
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GS"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1f4

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 227
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "KR"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x52

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 228
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SS"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xd3

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "ES"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x22

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 230
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "LK"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x5e

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 231
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SD"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xf9

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 232
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SR"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x255

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 233
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SJ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2f

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 234
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SZ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x10c

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 235
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SE"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2e

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 236
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "CH"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x29

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 237
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "SY"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3c3

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 238
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "TW"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x376

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "TJ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3e0

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 240
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "TZ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xff

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 241
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "TH"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x42

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "TG"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xe4

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 243
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "TK"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2b2

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 244
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "TO"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2a4

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 245
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "TT"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 246
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "TN"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xd8

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 247
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "TR"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x5a

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 248
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "TM"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3e1

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 249
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "TC"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 250
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "TV"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2b0

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "VI"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 252
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "UG"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x100

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 253
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "UA"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x17c

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 254
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "AE"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3cb

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 255
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "GB"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v6}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "US"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v5}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 257
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "UY"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x256

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 258
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "UZ"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3e6

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 259
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "VU"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2a6

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 260
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "VA"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x17b

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 261
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "VE"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3a

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 262
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "VN"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x54

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 263
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "WF"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2a9

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 264
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "EH"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xd4

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 265
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "YE"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3c7

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 266
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "ZM"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x104

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 267
    new-instance v1, Lcom/digits/sdk/android/CountryInfo;

    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    const-string v4, "ZW"

    invoke-direct {v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x107

    invoke-direct {v1, v2, v3}, Lcom/digits/sdk/android/CountryInfo;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 268
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 269
    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 10
    check-cast p1, Ljava/util/List;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/digits/sdk/android/CountryListLoadTask;->onPostExecute(Ljava/util/List;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/List;)V
    .locals 1
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
    .line 274
    .local p1, "result":Ljava/util/List;, "Ljava/util/List<Lcom/digits/sdk/android/CountryInfo;>;"
    iget-object v0, p0, Lcom/digits/sdk/android/CountryListLoadTask;->listener:Lcom/digits/sdk/android/CountryListLoadTask$Listener;

    if-eqz v0, :cond_0

    .line 275
    iget-object v0, p0, Lcom/digits/sdk/android/CountryListLoadTask;->listener:Lcom/digits/sdk/android/CountryListLoadTask$Listener;

    invoke-interface {v0, p1}, Lcom/digits/sdk/android/CountryListLoadTask$Listener;->onLoadComplete(Ljava/util/List;)V

    .line 277
    :cond_0
    return-void
.end method
