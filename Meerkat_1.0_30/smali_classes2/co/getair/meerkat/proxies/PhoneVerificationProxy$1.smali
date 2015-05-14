.class Lco/getair/meerkat/proxies/PhoneVerificationProxy$1;
.super Ljava/lang/Object;
.source "PhoneVerificationProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/PhoneVerificationProxy;->verifyPhoneNumber(Ljava/lang/String;)V
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
.field final synthetic this$0:Lco/getair/meerkat/proxies/PhoneVerificationProxy;

.field final synthetic val$phoneNumber:Ljava/lang/String;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/PhoneVerificationProxy;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/PhoneVerificationProxy;

    .prologue
    .line 58
    iput-object p1, p0, Lco/getair/meerkat/proxies/PhoneVerificationProxy$1;->this$0:Lco/getair/meerkat/proxies/PhoneVerificationProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/PhoneVerificationProxy$1;->val$phoneNumber:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 58
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/PhoneVerificationProxy$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 6
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    const/4 v5, 0x0

    .line 65
    :try_start_0
    iget-object v1, p0, Lco/getair/meerkat/proxies/PhoneVerificationProxy$1;->this$0:Lco/getair/meerkat/proxies/PhoneVerificationProxy;

    const-string v2, "eventPhoneNumberSentForVerification"

    iget-object v3, p0, Lco/getair/meerkat/proxies/PhoneVerificationProxy$1;->val$phoneNumber:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Lco/getair/meerkat/proxies/PhoneVerificationProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    :goto_0
    return-void

    .line 67
    :catch_0
    move-exception v0

    .line 69
    .local v0, "ex":Ljava/lang/Exception;
    iget-object v1, p0, Lco/getair/meerkat/proxies/PhoneVerificationProxy$1;->this$0:Lco/getair/meerkat/proxies/PhoneVerificationProxy;

    const-string v2, "eventSendPhoneNumberForVerificationFailed"

    invoke-virtual {v1, v2, v0, v5}, Lco/getair/meerkat/proxies/PhoneVerificationProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method
