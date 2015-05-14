.class Lco/getair/meerkat/proxies/StreamActivitiesProxy$2;
.super Ljava/lang/Object;
.source "StreamActivitiesProxy.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/StreamActivitiesProxy;->getActivities()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/StreamActivitiesProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/StreamActivitiesProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    .prologue
    .line 123
    iput-object p1, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy$2;->this$0:Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 126
    iget-object v0, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy$2;->this$0:Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    const/16 v1, 0xa

    # invokes: Lco/getair/meerkat/proxies/StreamActivitiesProxy;->reactivateGetActivities(I)V
    invoke-static {v0, v1}, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->access$200(Lco/getair/meerkat/proxies/StreamActivitiesProxy;I)V

    .line 127
    const-string v0, "StreamActivitiesProxy"

    invoke-virtual {p1}, Lcom/android/volley/VolleyError;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    return-void
.end method
