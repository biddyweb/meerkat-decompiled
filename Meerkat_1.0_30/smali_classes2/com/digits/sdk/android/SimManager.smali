.class Lcom/digits/sdk/android/SimManager;
.super Ljava/lang/Object;
.source "SimManager.java"


# instance fields
.field private final canReadPhoneState:Z

.field private final telephonyManager:Landroid/telephony/TelephonyManager;


# direct methods
.method protected constructor <init>(Landroid/telephony/TelephonyManager;Z)V
    .locals 0
    .param p1, "telephonyManager"    # Landroid/telephony/TelephonyManager;
    .param p2, "canReadPhoneState"    # Z

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/digits/sdk/android/SimManager;->telephonyManager:Landroid/telephony/TelephonyManager;

    .line 25
    iput-boolean p2, p0, Lcom/digits/sdk/android/SimManager;->canReadPhoneState:Z

    .line 26
    return-void
.end method

.method public static createSimManager(Landroid/content/Context;)Lcom/digits/sdk/android/SimManager;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    const-string v1, "phone"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 19
    .local v0, "telephonyManager":Landroid/telephony/TelephonyManager;
    new-instance v1, Lcom/digits/sdk/android/SimManager;

    const-string v2, "android.permission.READ_PHONE_STATE"

    invoke-static {p0, v2}, Lio/fabric/sdk/android/services/common/CommonUtils;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    invoke-direct {v1, v0, v2}, Lcom/digits/sdk/android/SimManager;-><init>(Landroid/telephony/TelephonyManager;Z)V

    return-object v1
.end method

.method private isCdma()Z
    .locals 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/digits/sdk/android/SimManager;->telephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isIso2(Ljava/lang/String;)Z
    .locals 2
    .param p1, "simCountry"    # Ljava/lang/String;

    .prologue
    .line 77
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private normalizeNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "phoneNumber"    # Ljava/lang/String;

    .prologue
    .line 41
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 42
    const-string v5, ""

    .line 58
    :goto_0
    return-object v5

    .line 44
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .local v4, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 46
    .local v3, "len":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v3, :cond_6

    .line 47
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 48
    .local v0, "c":C
    const/16 v5, 0xa

    invoke-static {v0, v5}, Ljava/lang/Character;->digit(CI)I

    move-result v1

    .line 49
    .local v1, "digit":I
    const/4 v5, -0x1

    if-eq v1, v5, :cond_2

    .line 50
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    :cond_1
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 51
    :cond_2
    if-nez v2, :cond_3

    const/16 v5, 0x2b

    if-ne v0, v5, :cond_3

    .line 52
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 53
    :cond_3
    const/16 v5, 0x61

    if-lt v0, v5, :cond_4

    const/16 v5, 0x7a

    if-le v0, v5, :cond_5

    :cond_4
    const/16 v5, 0x41

    if-lt v0, v5, :cond_1

    const/16 v5, 0x5a

    if-gt v0, v5, :cond_1

    .line 54
    :cond_5
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->convertKeypadLettersToDigits(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/digits/sdk/android/SimManager;->normalizeNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 58
    .end local v0    # "c":C
    .end local v1    # "digit":I
    :cond_6
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0
.end method


# virtual methods
.method protected getCountryIso()Ljava/lang/String;
    .locals 3

    .prologue
    .line 62
    iget-object v2, p0, Lcom/digits/sdk/android/SimManager;->telephonyManager:Landroid/telephony/TelephonyManager;

    if-eqz v2, :cond_1

    .line 63
    iget-object v2, p0, Lcom/digits/sdk/android/SimManager;->telephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getSimCountryIso()Ljava/lang/String;

    move-result-object v1

    .line 64
    .local v1, "simCountry":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/digits/sdk/android/SimManager;->isIso2(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 65
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    .line 73
    .end local v1    # "simCountry":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 66
    .restart local v1    # "simCountry":Ljava/lang/String;
    :cond_0
    invoke-direct {p0}, Lcom/digits/sdk/android/SimManager;->isCdma()Z

    move-result v2

    if-nez v2, :cond_1

    .line 67
    iget-object v2, p0, Lcom/digits/sdk/android/SimManager;->telephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getNetworkCountryIso()Ljava/lang/String;

    move-result-object v0

    .line 68
    .local v0, "networkCountry":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/digits/sdk/android/SimManager;->isIso2(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 69
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 73
    .end local v0    # "networkCountry":Ljava/lang/String;
    .end local v1    # "simCountry":Ljava/lang/String;
    :cond_1
    const-string v2, ""

    goto :goto_0
.end method

.method protected getRawPhoneNumber()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/digits/sdk/android/SimManager;->telephonyManager:Landroid/telephony/TelephonyManager;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/digits/sdk/android/SimManager;->canReadPhoneState:Z

    if-nez v0, :cond_1

    .line 30
    :cond_0
    const-string v0, ""

    .line 32
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/digits/sdk/android/SimManager;->telephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/digits/sdk/android/SimManager;->normalizeNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
