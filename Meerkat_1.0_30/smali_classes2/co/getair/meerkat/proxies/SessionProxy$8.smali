.class Lco/getair/meerkat/proxies/SessionProxy$8;
.super Ljava/lang/Object;
.source "SessionProxy.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/SessionProxy;->signUpWithTwitter(Lcom/twitter/sdk/android/core/models/User;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/SessionProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/SessionProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/SessionProxy;

    .prologue
    .line 276
    iput-object p1, p0, Lco/getair/meerkat/proxies/SessionProxy$8;->this$0:Lco/getair/meerkat/proxies/SessionProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 279
    const-string v0, "SessionProxy"

    invoke-virtual {p1}, Lcom/android/volley/VolleyError;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    return-void
.end method
