.class Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$3;
.super Ljava/lang/Object;
.source "ScheduleBroadcastProxy.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->scheduleBroadcast(Lco/getair/meerkat/dtos/ScheduleBroadcastParams;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    .prologue
    .line 151
    iput-object p1, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 0
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 155
    return-void
.end method
