.class public Lco/getair/meerkat/proxies/PhoneVerificationProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "PhoneVerificationProxy.java"


# instance fields
.field private context:Landroid/content/Context;

.field private followupActions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 0
    .param p1, "proxyName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;)V

    .line 36
    iput-object p2, p0, Lco/getair/meerkat/proxies/PhoneVerificationProxy;->context:Landroid/content/Context;

    .line 37
    return-void
.end method


# virtual methods
.method public verifyActivationCode(Lco/getair/meerkat/dtos/ActivationCodeParams;)V
    .locals 11
    .param p1, "activationCodeParams"    # Lco/getair/meerkat/dtos/ActivationCodeParams;

    .prologue
    .line 99
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/PhoneVerificationProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v6

    .line 100
    .local v6, "apiProxy":Lco/getair/meerkat/ApiProxy;
    const-string v1, "editProfile"

    invoke-virtual {v6, v1}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 102
    .local v2, "verifyPhoneUrl":Ljava/lang/String;
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/PhoneVerificationProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/dtos/Session;->loadSession(Landroid/content/Context;)Lco/getair/meerkat/dtos/Session;

    move-result-object v7

    .line 104
    .local v7, "currentSession":Lco/getair/meerkat/dtos/Session;
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 105
    .local v10, "phoneParams":Ljava/util/HashMap;
    const-string v1, "phoneNumber"

    invoke-virtual {p1}, Lco/getair/meerkat/dtos/ActivationCodeParams;->getPhoneNumber()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v10, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    const-string v1, "confirmationCode"

    invoke-virtual {p1}, Lco/getair/meerkat/dtos/ActivationCodeParams;->getActivationCode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v10, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 109
    .local v9, "params":Ljava/util/HashMap;
    const-string v1, "auth"

    invoke-virtual {v7}, Lco/getair/meerkat/dtos/Session;->getAuthToken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v9, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    const-string v1, "phoneNumberDetails"

    invoke-virtual {v9, v1, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    new-instance v8, Lcom/google/gson/Gson;

    invoke-direct {v8}, Lcom/google/gson/Gson;-><init>()V

    .line 114
    .local v8, "gson":Lcom/google/gson/Gson;
    invoke-virtual {v8, v9}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 116
    .local v3, "paramsString":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x2

    new-instance v4, Lco/getair/meerkat/proxies/PhoneVerificationProxy$3;

    invoke-direct {v4, p0}, Lco/getair/meerkat/proxies/PhoneVerificationProxy$3;-><init>(Lco/getair/meerkat/proxies/PhoneVerificationProxy;)V

    new-instance v5, Lco/getair/meerkat/proxies/PhoneVerificationProxy$4;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/PhoneVerificationProxy$4;-><init>(Lco/getair/meerkat/proxies/PhoneVerificationProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 128
    .local v0, "verifyPhoneRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/PhoneVerificationProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 129
    return-void
.end method

.method public verifyPhoneNumber(Ljava/lang/String;)V
    .locals 11
    .param p1, "phoneNumber"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/PhoneVerificationProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v6

    .line 43
    .local v6, "apiProxy":Lco/getair/meerkat/ApiProxy;
    const-string v1, "editProfile"

    invoke-virtual {v6, v1}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 45
    .local v2, "verifyPhoneUrl":Ljava/lang/String;
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/PhoneVerificationProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/dtos/Session;->loadSession(Landroid/content/Context;)Lco/getair/meerkat/dtos/Session;

    move-result-object v7

    .line 47
    .local v7, "currentSession":Lco/getair/meerkat/dtos/Session;
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 48
    .local v10, "phoneParams":Ljava/util/HashMap;
    const-string v1, "phoneNumber"

    invoke-virtual {v10, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 51
    .local v9, "params":Ljava/util/HashMap;
    const-string v1, "auth"

    invoke-virtual {v7}, Lco/getair/meerkat/dtos/Session;->getAuthToken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v9, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    const-string v1, "phoneNumberDetails"

    invoke-virtual {v9, v1, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    new-instance v8, Lcom/google/gson/Gson;

    invoke-direct {v8}, Lcom/google/gson/Gson;-><init>()V

    .line 56
    .local v8, "gson":Lcom/google/gson/Gson;
    invoke-virtual {v8, v9}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 58
    .local v3, "paramsString":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x2

    new-instance v4, Lco/getair/meerkat/proxies/PhoneVerificationProxy$1;

    invoke-direct {v4, p0, p1}, Lco/getair/meerkat/proxies/PhoneVerificationProxy$1;-><init>(Lco/getair/meerkat/proxies/PhoneVerificationProxy;Ljava/lang/String;)V

    new-instance v5, Lco/getair/meerkat/proxies/PhoneVerificationProxy$2;

    invoke-direct {v5, p0, p1}, Lco/getair/meerkat/proxies/PhoneVerificationProxy$2;-><init>(Lco/getair/meerkat/proxies/PhoneVerificationProxy;Ljava/lang/String;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 93
    .local v0, "verifyPhoneRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/PhoneVerificationProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 94
    return-void
.end method
