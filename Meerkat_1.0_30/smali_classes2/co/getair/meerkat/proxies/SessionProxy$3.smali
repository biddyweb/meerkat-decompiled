.class Lco/getair/meerkat/proxies/SessionProxy$3;
.super Ljava/lang/Object;
.source "SessionProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/SessionProxy;->startSignUpFlow(Lcom/twitter/sdk/android/core/models/User;)V
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
.field final synthetic this$0:Lco/getair/meerkat/proxies/SessionProxy;

.field final synthetic val$twitterUser:Lcom/twitter/sdk/android/core/models/User;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/SessionProxy;Lcom/twitter/sdk/android/core/models/User;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/SessionProxy;

    .prologue
    .line 149
    iput-object p1, p0, Lco/getair/meerkat/proxies/SessionProxy$3;->this$0:Lco/getair/meerkat/proxies/SessionProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/SessionProxy$3;->val$twitterUser:Lcom/twitter/sdk/android/core/models/User;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 149
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/SessionProxy$3;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 153
    const-string v0, "SessionProxy"

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    iget-object v0, p0, Lco/getair/meerkat/proxies/SessionProxy$3;->this$0:Lco/getair/meerkat/proxies/SessionProxy;

    iget-object v1, p0, Lco/getair/meerkat/proxies/SessionProxy$3;->val$twitterUser:Lcom/twitter/sdk/android/core/models/User;

    # invokes: Lco/getair/meerkat/proxies/SessionProxy;->signUpWithTwitter(Lcom/twitter/sdk/android/core/models/User;)V
    invoke-static {v0, v1}, Lco/getair/meerkat/proxies/SessionProxy;->access$200(Lco/getair/meerkat/proxies/SessionProxy;Lcom/twitter/sdk/android/core/models/User;)V

    .line 157
    return-void
.end method
