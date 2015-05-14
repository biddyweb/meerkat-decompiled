.class Lco/getair/meerkat/proxies/AuthorizeProxy$2;
.super Ljava/lang/Object;
.source "AuthorizeProxy.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/AuthorizeProxy;->authorizeWithNewToken(Ljava/lang/Boolean;Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/AuthorizeProxy;

.field final synthetic val$completion:Lco/getair/meerkat/utilities/RunnableWithResultObject;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/AuthorizeProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/AuthorizeProxy;

    .prologue
    .line 226
    iput-object p1, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$2;->this$0:Lco/getair/meerkat/proxies/AuthorizeProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$2;->val$completion:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 229
    invoke-virtual {p1}, Lcom/android/volley/VolleyError;->printStackTrace()V

    .line 230
    iget-object v0, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$2;->val$completion:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lco/getair/meerkat/utilities/RunnableWithResultObject;->success:Z

    .line 231
    iget-object v0, p0, Lco/getair/meerkat/proxies/AuthorizeProxy$2;->val$completion:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-virtual {v0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;->run()V

    .line 232
    return-void
.end method
