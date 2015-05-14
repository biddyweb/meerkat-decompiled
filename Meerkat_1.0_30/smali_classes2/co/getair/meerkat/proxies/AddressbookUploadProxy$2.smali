.class Lco/getair/meerkat/proxies/AddressbookUploadProxy$2;
.super Ljava/lang/Object;
.source "AddressbookUploadProxy.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/AddressbookUploadProxy;->uploadAddressBook(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/AddressbookUploadProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/AddressbookUploadProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/AddressbookUploadProxy;

    .prologue
    .line 62
    iput-object p1, p0, Lco/getair/meerkat/proxies/AddressbookUploadProxy$2;->this$0:Lco/getair/meerkat/proxies/AddressbookUploadProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 65
    iget-object v0, p0, Lco/getair/meerkat/proxies/AddressbookUploadProxy$2;->this$0:Lco/getair/meerkat/proxies/AddressbookUploadProxy;

    const-string v1, "eventDidCompleteStep"

    invoke-virtual {v0, v1}, Lco/getair/meerkat/proxies/AddressbookUploadProxy;->sendNotification(Ljava/lang/String;)V

    .line 66
    return-void
.end method
