.class Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$6;
.super Ljava/lang/Object;
.source "StreamFeedItemProxy.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->restreamSchduledStream(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
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
    .line 161
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$6;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$6;"
    iput-object p1, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$6;->this$0:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    iput-object p2, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$6;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 165
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$6;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$6;"
    const-string v0, "FAILED restream"

    invoke-static {v0}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    .line 166
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$6;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lco/getair/meerkat/utilities/RunnableWithResultObject;->success:Z

    .line 167
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$6;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-virtual {v0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;->run()V

    .line 168
    return-void
.end method
