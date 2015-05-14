.class Lco/getair/meerkat/proxies/GraphProxy$4;
.super Ljava/lang/Object;
.source "GraphProxy.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/GraphProxy;->followUser(Lco/getair/meerkat/dtos/IUserToFollow;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/GraphProxy;

.field final synthetic val$inboxProxy:Lco/getair/meerkat/proxies/InboxProxy;

.field final synthetic val$userJson:Ljava/util/HashMap;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/GraphProxy;Lco/getair/meerkat/proxies/InboxProxy;Ljava/util/HashMap;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/GraphProxy;

    .prologue
    .line 135
    iput-object p1, p0, Lco/getair/meerkat/proxies/GraphProxy$4;->this$0:Lco/getair/meerkat/proxies/GraphProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/GraphProxy$4;->val$inboxProxy:Lco/getair/meerkat/proxies/InboxProxy;

    iput-object p3, p0, Lco/getair/meerkat/proxies/GraphProxy$4;->val$userJson:Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 3
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 138
    iget-object v0, p0, Lco/getair/meerkat/proxies/GraphProxy$4;->val$inboxProxy:Lco/getair/meerkat/proxies/InboxProxy;

    const-string v1, "following"

    iget-object v2, p0, Lco/getair/meerkat/proxies/GraphProxy$4;->val$userJson:Ljava/util/HashMap;

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/proxies/InboxProxy;->removeItem(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 139
    return-void
.end method
