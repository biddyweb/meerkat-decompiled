.class Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$2;
.super Ljava/lang/Object;
.source "StreamFeedItemProxy.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->subscribeToSchduledStream(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

.field final synthetic val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;


# direct methods
.method constructor <init>(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    .prologue
    .line 117
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$2;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$2;"
    iput-object p1, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$2;->this$0:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    iput-object p2, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$2;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 121
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$2;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$2;"
    const-string v0, "FAILED subscribing"

    invoke-static {v0}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    .line 122
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$2;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lco/getair/meerkat/utilities/RunnableWithResultObject;->success:Z

    .line 123
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$2;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-virtual {v0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;->run()V

    .line 124
    return-void
.end method
