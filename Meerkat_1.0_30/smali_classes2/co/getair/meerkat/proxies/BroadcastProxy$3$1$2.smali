.class Lco/getair/meerkat/proxies/BroadcastProxy$3$1$2;
.super Ljava/lang/Object;
.source "BroadcastProxy.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/BroadcastProxy$3$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lco/getair/meerkat/proxies/BroadcastProxy$3$1;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/BroadcastProxy$3$1;)V
    .locals 0
    .param p1, "this$2"    # Lco/getair/meerkat/proxies/BroadcastProxy$3$1;

    .prologue
    .line 230
    iput-object p1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3$1$2;->this$2:Lco/getair/meerkat/proxies/BroadcastProxy$3$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 1
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 233
    const-string v0, "FAILURE"

    invoke-static {v0}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;)V

    .line 234
    return-void
.end method
