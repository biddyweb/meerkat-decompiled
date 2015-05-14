.class Lco/getair/meerkat/proxies/PhoneVerificationProxy$4;
.super Ljava/lang/Object;
.source "PhoneVerificationProxy.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/PhoneVerificationProxy;->verifyActivationCode(Lco/getair/meerkat/dtos/ActivationCodeParams;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/PhoneVerificationProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/PhoneVerificationProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/PhoneVerificationProxy;

    .prologue
    .line 121
    iput-object p1, p0, Lco/getair/meerkat/proxies/PhoneVerificationProxy$4;->this$0:Lco/getair/meerkat/proxies/PhoneVerificationProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 3
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 124
    iget-object v0, p0, Lco/getair/meerkat/proxies/PhoneVerificationProxy$4;->this$0:Lco/getair/meerkat/proxies/PhoneVerificationProxy;

    const-string v1, "eventSendActivationCodeFail"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lco/getair/meerkat/proxies/PhoneVerificationProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 125
    return-void
.end method
