.class public Lcom/sithagi/countrycodepicker/Country;
.super Ljava/lang/Object;
.source "Country.java"


# instance fields
.field private code:Ljava/lang/String;

.field private dialCode:Ljava/lang/String;

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/sithagi/countrycodepicker/Country;->code:Ljava/lang/String;

    return-object v0
.end method

.method public getDialCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 9
    iget-object v0, p0, Lcom/sithagi/countrycodepicker/Country;->dialCode:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/sithagi/countrycodepicker/Country;->name:Ljava/lang/String;

    return-object v0
.end method

.method public setCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/sithagi/countrycodepicker/Country;->code:Ljava/lang/String;

    .line 22
    return-void
.end method

.method public setDialCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "dialCode"    # Ljava/lang/String;

    .prologue
    .line 13
    iput-object p1, p0, Lcom/sithagi/countrycodepicker/Country;->dialCode:Ljava/lang/String;

    .line 14
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/sithagi/countrycodepicker/Country;->name:Ljava/lang/String;

    .line 30
    return-void
.end method
