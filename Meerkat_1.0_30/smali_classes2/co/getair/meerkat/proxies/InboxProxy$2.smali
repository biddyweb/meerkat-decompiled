.class Lco/getair/meerkat/proxies/InboxProxy$2;
.super Ljava/lang/Object;
.source "InboxProxy.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/InboxProxy;->fetchInbox()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/InboxProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/InboxProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/InboxProxy;

    .prologue
    .line 79
    iput-object p1, p0, Lco/getair/meerkat/proxies/InboxProxy$2;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 82
    iget-object v0, p0, Lco/getair/meerkat/proxies/InboxProxy$2;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    # getter for: Lco/getair/meerkat/proxies/InboxProxy;->LOG_TAG:Ljava/lang/String;
    invoke-static {v0}, Lco/getair/meerkat/proxies/InboxProxy;->access$000(Lco/getair/meerkat/proxies/InboxProxy;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/volley/VolleyError;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    return-void
.end method
