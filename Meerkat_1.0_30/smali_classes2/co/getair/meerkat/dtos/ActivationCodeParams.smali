.class public Lco/getair/meerkat/dtos/ActivationCodeParams;
.super Ljava/lang/Object;
.source "ActivationCodeParams.java"


# instance fields
.field activationCode:Ljava/lang/String;

.field phoneNumber:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "phoneNumber"    # Ljava/lang/String;
    .param p2, "activationCode"    # Ljava/lang/String;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lco/getair/meerkat/dtos/ActivationCodeParams;->phoneNumber:Ljava/lang/String;

    .line 17
    iput-object p2, p0, Lco/getair/meerkat/dtos/ActivationCodeParams;->activationCode:Ljava/lang/String;

    .line 18
    return-void
.end method


# virtual methods
.method public getActivationCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lco/getair/meerkat/dtos/ActivationCodeParams;->activationCode:Ljava/lang/String;

    return-object v0
.end method

.method public getPhoneNumber()Ljava/lang/String;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lco/getair/meerkat/dtos/ActivationCodeParams;->phoneNumber:Ljava/lang/String;

    return-object v0
.end method
