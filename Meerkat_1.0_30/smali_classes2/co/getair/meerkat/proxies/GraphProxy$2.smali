.class Lco/getair/meerkat/proxies/GraphProxy$2;
.super Ljava/lang/Object;
.source "GraphProxy.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/GraphProxy;->getListForUser(Ljava/lang/String;Lco/getair/meerkat/dtos/User;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/GraphProxy;

.field final synthetic val$completionRunnable:Lco/getair/meerkat/utilities/RunnableWithResultObject;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/GraphProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/GraphProxy;

    .prologue
    .line 102
    iput-object p1, p0, Lco/getair/meerkat/proxies/GraphProxy$2;->this$0:Lco/getair/meerkat/proxies/GraphProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/GraphProxy$2;->val$completionRunnable:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 105
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lco/getair/meerkat/proxies/GraphProxy$2;->val$completionRunnable:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 106
    return-void
.end method
