.class Lco/getair/meerkat/proxies/FeedProxy$3;
.super Ljava/lang/Object;
.source "FeedProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/FeedProxy;->requestScheduledStreams(Z)V
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
.field final synthetic this$0:Lco/getair/meerkat/proxies/FeedProxy;

.field final synthetic val$shouldFilter:Z


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/FeedProxy;Z)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/FeedProxy;

    .prologue
    .line 114
    iput-object p1, p0, Lco/getair/meerkat/proxies/FeedProxy$3;->this$0:Lco/getair/meerkat/proxies/FeedProxy;

    iput-boolean p2, p0, Lco/getair/meerkat/proxies/FeedProxy$3;->val$shouldFilter:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 114
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/FeedProxy$3;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    const/4 v3, 0x0

    .line 118
    new-instance v0, Lco/getair/meerkat/proxies/FeedProxy$3$1;

    invoke-direct {v0, p0, p1}, Lco/getair/meerkat/proxies/FeedProxy$3$1;-><init>(Lco/getair/meerkat/proxies/FeedProxy$3;Lorg/json/JSONObject;)V

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Void;

    const/4 v2, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object v3, v1, v2

    .line 146
    invoke-virtual {v0, v1}, Lco/getair/meerkat/proxies/FeedProxy$3$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 148
    iget-object v0, p0, Lco/getair/meerkat/proxies/FeedProxy$3;->this$0:Lco/getair/meerkat/proxies/FeedProxy;

    const-string v1, "feedScheduledArrived"

    invoke-virtual {v0, v1, v3, v3}, Lco/getair/meerkat/proxies/FeedProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 149
    return-void
.end method
