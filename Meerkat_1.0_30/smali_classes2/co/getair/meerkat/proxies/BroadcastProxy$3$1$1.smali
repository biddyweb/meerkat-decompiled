.class Lco/getair/meerkat/proxies/BroadcastProxy$3$1$1;
.super Ljava/lang/Object;
.source "BroadcastProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/BroadcastProxy$3$1;->run()V
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
.field final synthetic this$2:Lco/getair/meerkat/proxies/BroadcastProxy$3$1;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/BroadcastProxy$3$1;)V
    .locals 0
    .param p1, "this$2"    # Lco/getair/meerkat/proxies/BroadcastProxy$3$1;

    .prologue
    .line 225
    iput-object p1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3$1$1;->this$2:Lco/getair/meerkat/proxies/BroadcastProxy$3$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 225
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/BroadcastProxy$3$1$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 228
    const-string v0, "SUCCESS"

    invoke-static {v0}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;)V

    .line 229
    return-void
.end method
