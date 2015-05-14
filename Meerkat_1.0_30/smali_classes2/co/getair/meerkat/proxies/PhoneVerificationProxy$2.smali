.class Lco/getair/meerkat/proxies/PhoneVerificationProxy$2;
.super Ljava/lang/Object;
.source "PhoneVerificationProxy.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/PhoneVerificationProxy;->verifyPhoneNumber(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/PhoneVerificationProxy;

.field final synthetic val$phoneNumber:Ljava/lang/String;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/PhoneVerificationProxy;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/PhoneVerificationProxy;

    .prologue
    .line 76
    iput-object p1, p0, Lco/getair/meerkat/proxies/PhoneVerificationProxy$2;->this$0:Lco/getair/meerkat/proxies/PhoneVerificationProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/PhoneVerificationProxy$2;->val$phoneNumber:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 4
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    const/4 v3, 0x0

    .line 80
    iget-object v0, p1, Lcom/android/volley/VolleyError;->networkResponse:Lcom/android/volley/NetworkResponse;

    iget v0, v0, Lcom/android/volley/NetworkResponse;->statusCode:I

    const/16 v1, 0x1c2

    if-ne v0, v1, :cond_0

    .line 84
    iget-object v0, p0, Lco/getair/meerkat/proxies/PhoneVerificationProxy$2;->this$0:Lco/getair/meerkat/proxies/PhoneVerificationProxy;

    const-string v1, "eventPhoneNumberSentForVerification"

    iget-object v2, p0, Lco/getair/meerkat/proxies/PhoneVerificationProxy$2;->val$phoneNumber:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lco/getair/meerkat/proxies/PhoneVerificationProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 90
    :goto_0
    return-void

    .line 86
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/proxies/PhoneVerificationProxy$2;->this$0:Lco/getair/meerkat/proxies/PhoneVerificationProxy;

    const-string v1, "eventSendPhoneNumberForVerificationFailed"

    invoke-virtual {v0, v1, p1, v3}, Lco/getair/meerkat/proxies/PhoneVerificationProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method
