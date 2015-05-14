.class public Lcom/digits/sdk/android/PhoneNumber;
.super Ljava/lang/Object;
.source "PhoneNumber.java"


# static fields
.field private static final EMPTY_PHONE_NUMBER:Lcom/digits/sdk/android/PhoneNumber;


# instance fields
.field private final countryCode:Ljava/lang/String;

.field private final countryIso:Ljava/lang/String;

.field private final phoneNumber:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 9
    new-instance v0, Lcom/digits/sdk/android/PhoneNumber;

    const-string v1, ""

    const-string v2, ""

    const-string v3, ""

    invoke-direct {v0, v1, v2, v3}, Lcom/digits/sdk/android/PhoneNumber;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/digits/sdk/android/PhoneNumber;->EMPTY_PHONE_NUMBER:Lcom/digits/sdk/android/PhoneNumber;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "phoneNumber"    # Ljava/lang/String;
    .param p2, "countryIso"    # Ljava/lang/String;
    .param p3, "countryCode"    # Ljava/lang/String;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/digits/sdk/android/PhoneNumber;->phoneNumber:Ljava/lang/String;

    .line 17
    iput-object p2, p0, Lcom/digits/sdk/android/PhoneNumber;->countryIso:Ljava/lang/String;

    .line 18
    iput-object p3, p0, Lcom/digits/sdk/android/PhoneNumber;->countryCode:Ljava/lang/String;

    .line 19
    return-void
.end method

.method public static emptyPhone()Lcom/digits/sdk/android/PhoneNumber;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Lcom/digits/sdk/android/PhoneNumber;->EMPTY_PHONE_NUMBER:Lcom/digits/sdk/android/PhoneNumber;

    return-object v0
.end method

.method protected static isValid(Lcom/digits/sdk/android/PhoneNumber;)Z
    .locals 1
    .param p0, "phoneNumber"    # Lcom/digits/sdk/android/PhoneNumber;

    .prologue
    .line 50
    if-eqz p0, :cond_0

    sget-object v0, Lcom/digits/sdk/android/PhoneNumber;->EMPTY_PHONE_NUMBER:Lcom/digits/sdk/android/PhoneNumber;

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/digits/sdk/android/PhoneNumber;->getPhoneNumber()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/digits/sdk/android/PhoneNumber;->getCountryCode()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/digits/sdk/android/PhoneNumber;->getCountryIso()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getCountryCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumber;->countryCode:Ljava/lang/String;

    return-object v0
.end method

.method public getCountryIso()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumber;->countryIso:Ljava/lang/String;

    return-object v0
.end method

.method public getPhoneNumber()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumber;->phoneNumber:Ljava/lang/String;

    return-object v0
.end method
