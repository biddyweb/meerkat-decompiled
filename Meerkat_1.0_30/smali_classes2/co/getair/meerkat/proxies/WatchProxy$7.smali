.class Lco/getair/meerkat/proxies/WatchProxy$7;
.super Ljava/lang/Object;
.source "WatchProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/WatchProxy;->reportStream(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
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
.field final synthetic this$0:Lco/getair/meerkat/proxies/WatchProxy;

.field final synthetic val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/WatchProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/WatchProxy;

    .prologue
    .line 232
    iput-object p1, p0, Lco/getair/meerkat/proxies/WatchProxy$7;->this$0:Lco/getair/meerkat/proxies/WatchProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/WatchProxy$7;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 232
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/WatchProxy$7;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 235
    iget-object v0, p0, Lco/getair/meerkat/proxies/WatchProxy$7;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lco/getair/meerkat/utilities/RunnableWithResultObject;->success:Z

    .line 236
    iget-object v0, p0, Lco/getair/meerkat/proxies/WatchProxy$7;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-virtual {v0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;->run()V

    .line 237
    return-void
.end method
