.class public Lco/getair/meerkat/proxies/AddressbookUploadProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "AddressbookUploadProxy.java"


# static fields
.field private static final NAME:Ljava/lang/String; = "AddressbookUploadProxy"


# instance fields
.field private final UPLOAD_PHONE_NUMBERS_URL_KEY:Ljava/lang/String;

.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 39
    const-string v0, "AddressbookUploadProxy"

    invoke-direct {p0, v0}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;)V

    .line 32
    const-string v0, "socialLinks"

    iput-object v0, p0, Lco/getair/meerkat/proxies/AddressbookUploadProxy;->UPLOAD_PHONE_NUMBERS_URL_KEY:Ljava/lang/String;

    .line 40
    iput-object p1, p0, Lco/getair/meerkat/proxies/AddressbookUploadProxy;->context:Landroid/content/Context;

    .line 41
    return-void
.end method

.method public static getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    const-string v0, "AddressbookUploadProxy"

    return-object v0
.end method


# virtual methods
.method public uploadAddressBook(Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p1, "phoneNumbers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/AddressbookUploadProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v6

    .line 45
    .local v6, "apiProxy":Lco/getair/meerkat/ApiProxy;
    const-string v1, "socialLinks"

    invoke-virtual {v6, v1}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 47
    .local v2, "uploadPhoneNumbersUrl":Ljava/lang/String;
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 48
    .local v9, "params":Ljava/util/HashMap;
    const-string v1, "linkTo"

    invoke-virtual {v9, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    const-string v1, "platform"

    const-string v4, "contacts"

    invoke-virtual {v9, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    new-instance v8, Lcom/google/gson/Gson;

    invoke-direct {v8}, Lcom/google/gson/Gson;-><init>()V

    .line 52
    .local v8, "gson":Lcom/google/gson/Gson;
    invoke-virtual {v8, v9}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 54
    .local v3, "paramsString":Ljava/lang/String;
    new-instance v7, Lco/getair/meerkat/utilities/ApplicationPreferences;

    iget-object v1, p0, Lco/getair/meerkat/proxies/AddressbookUploadProxy;->context:Landroid/content/Context;

    invoke-direct {v7, v1}, Lco/getair/meerkat/utilities/ApplicationPreferences;-><init>(Landroid/content/Context;)V

    .line 55
    .local v7, "applicationPreferences":Lco/getair/meerkat/utilities/ApplicationPreferences;
    const/4 v1, 0x0

    invoke-virtual {v7, v1}, Lco/getair/meerkat/utilities/ApplicationPreferences;->saveShouldAskForAddressBook(Z)V

    .line 57
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x1

    new-instance v4, Lco/getair/meerkat/proxies/AddressbookUploadProxy$1;

    invoke-direct {v4, p0}, Lco/getair/meerkat/proxies/AddressbookUploadProxy$1;-><init>(Lco/getair/meerkat/proxies/AddressbookUploadProxy;)V

    new-instance v5, Lco/getair/meerkat/proxies/AddressbookUploadProxy$2;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/AddressbookUploadProxy$2;-><init>(Lco/getair/meerkat/proxies/AddressbookUploadProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 69
    .local v0, "uploadPhoneNumbersRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/AddressbookUploadProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 70
    return-void
.end method
