.class Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4$1;
.super Ljava/lang/Object;
.source "ScheduleBroadcastProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;->run()V
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
.field final synthetic this$1:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;

    .prologue
    .line 183
    iput-object p1, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4$1;->this$1:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 183
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    const/4 v2, 0x0

    .line 188
    iget-object v0, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4$1;->this$1:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;

    iget-object v0, v0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;->this$0:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    # invokes: Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->access$400(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "scheduleBroadcastScheduled"

    invoke-virtual {v0, v1, v2, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 190
    return-void
.end method
