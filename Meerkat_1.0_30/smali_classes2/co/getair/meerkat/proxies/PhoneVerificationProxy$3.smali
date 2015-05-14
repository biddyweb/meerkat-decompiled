.class Lco/getair/meerkat/proxies/PhoneVerificationProxy$3;
.super Ljava/lang/Object;
.source "PhoneVerificationProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/PhoneVerificationProxy;->verifyActivationCode(Lco/getair/meerkat/dtos/ActivationCodeParams;)V
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


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/PhoneVerificationProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/PhoneVerificationProxy;

    .prologue
    .line 116
    iput-object p1, p0, Lco/getair/meerkat/proxies/PhoneVerificationProxy$3;->this$0:Lco/getair/meerkat/proxies/PhoneVerificationProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 116
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/PhoneVerificationProxy$3;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    const/4 v2, 0x0

    .line 119
    iget-object v0, p0, Lco/getair/meerkat/proxies/PhoneVerificationProxy$3;->this$0:Lco/getair/meerkat/proxies/PhoneVerificationProxy;

    const-string v1, "eventSendActivationCodeAccepted"

    invoke-virtual {v0, v1, v2, v2}, Lco/getair/meerkat/proxies/PhoneVerificationProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 120
    return-void
.end method
