.class Lco/getair/meerkat/proxies/StreamWatchersProxy$2;
.super Ljava/lang/Object;
.source "StreamWatchersProxy.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/StreamWatchersProxy;->getWatchers()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/StreamWatchersProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/StreamWatchersProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/StreamWatchersProxy;

    .prologue
    .line 86
    iput-object p1, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy$2;->this$0:Lco/getair/meerkat/proxies/StreamWatchersProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 89
    iget-object v0, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy$2;->this$0:Lco/getair/meerkat/proxies/StreamWatchersProxy;

    const/16 v1, 0xa

    # invokes: Lco/getair/meerkat/proxies/StreamWatchersProxy;->reactivateGetWatchers(I)V
    invoke-static {v0, v1}, Lco/getair/meerkat/proxies/StreamWatchersProxy;->access$100(Lco/getair/meerkat/proxies/StreamWatchersProxy;I)V

    .line 90
    return-void
.end method
