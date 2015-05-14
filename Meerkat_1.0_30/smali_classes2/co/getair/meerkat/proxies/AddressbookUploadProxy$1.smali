.class Lco/getair/meerkat/proxies/AddressbookUploadProxy$1;
.super Ljava/lang/Object;
.source "AddressbookUploadProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/AddressbookUploadProxy;->uploadAddressBook(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener",
        "<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/AddressbookUploadProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/AddressbookUploadProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/AddressbookUploadProxy;

    .prologue
    .line 57
    iput-object p1, p0, Lco/getair/meerkat/proxies/AddressbookUploadProxy$1;->this$0:Lco/getair/meerkat/proxies/AddressbookUploadProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 57
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/AddressbookUploadProxy$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 60
    iget-object v0, p0, Lco/getair/meerkat/proxies/AddressbookUploadProxy$1;->this$0:Lco/getair/meerkat/proxies/AddressbookUploadProxy;

    const-string v1, "eventDidCompleteStep"

    invoke-virtual {v0, v1}, Lco/getair/meerkat/proxies/AddressbookUploadProxy;->sendNotification(Ljava/lang/String;)V

    .line 61
    return-void
.end method
