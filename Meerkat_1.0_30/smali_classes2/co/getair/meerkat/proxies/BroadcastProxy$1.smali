.class Lco/getair/meerkat/proxies/BroadcastProxy$1;
.super Landroid/content/BroadcastReceiver;
.source "BroadcastProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/proxies/BroadcastProxy;
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
    .line 77
    iput-object p1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$1;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 81
    const-string v1, "receiver"

    const-string v2, "Got it"

    invoke-static {v1, v2}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    iget-object v1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$1;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    # invokes: Lco/getair/meerkat/proxies/BroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v1}, Lco/getair/meerkat/proxies/BroadcastProxy;->access$000(Lco/getair/meerkat/proxies/BroadcastProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    const-string v2, "gpsProxy"

    invoke-virtual {v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/utilities/GPSHandlerProxy;

    .line 83
    .local v0, "gpsHandlerProxy":Lco/getair/meerkat/utilities/GPSHandlerProxy;
    invoke-virtual {v0}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->stop()V

    .line 84
    iget-object v1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$1;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    # invokes: Lco/getair/meerkat/proxies/BroadcastProxy;->goLive()V
    invoke-static {v1}, Lco/getair/meerkat/proxies/BroadcastProxy;->access$100(Lco/getair/meerkat/proxies/BroadcastProxy;)V

    .line 85
    return-void
.end method
