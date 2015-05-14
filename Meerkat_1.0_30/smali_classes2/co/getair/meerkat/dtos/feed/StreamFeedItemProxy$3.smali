.class Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$3;
.super Ljava/lang/Object;
.source "StreamFeedItemProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->unsubscribeToSchduledStream(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener",
        "<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

.field final synthetic val$success:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    .prologue
    .line 133
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$3;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$3;"
    iput-object p1, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$3;->this$0:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    iput-object p2, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$3;->val$success:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 133
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$3;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$3;"
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$3;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 136
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$3;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$3;"
    const-string v0, "Unsubscribed successfully"

    invoke-static {v0}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    .line 138
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$3;->val$success:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 139
    return-void
.end method
