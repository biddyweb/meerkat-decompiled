.class Lco/getair/meerkat/proxies/BroadcastProxy$4;
.super Ljava/lang/Object;
.source "BroadcastProxy.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/BroadcastProxy;->goLive()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/BroadcastProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/BroadcastProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/BroadcastProxy;

    .prologue
    .line 251
    iput-object p1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$4;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 254
    const-string v0, "BroadcastProxy"

    invoke-virtual {p1}, Lcom/android/volley/VolleyError;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    return-void
.end method
