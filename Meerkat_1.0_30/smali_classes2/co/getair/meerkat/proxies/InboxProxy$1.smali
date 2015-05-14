.class Lco/getair/meerkat/proxies/InboxProxy$1;
.super Ljava/lang/Object;
.source "InboxProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/InboxProxy;->fetchInbox()V
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
.field final synthetic this$0:Lco/getair/meerkat/proxies/InboxProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/InboxProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/InboxProxy;

    .prologue
    .line 66
    iput-object p1, p0, Lco/getair/meerkat/proxies/InboxProxy$1;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 66
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/InboxProxy$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 70
    :try_start_0
    iget-object v2, p0, Lco/getair/meerkat/proxies/InboxProxy$1;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    # getter for: Lco/getair/meerkat/proxies/InboxProxy;->LOG_TAG:Ljava/lang/String;
    invoke-static {v2}, Lco/getair/meerkat/proxies/InboxProxy;->access$000(Lco/getair/meerkat/proxies/InboxProxy;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lco/getair/meerkat/utilities/MLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    const-string v2, "result"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 73
    .local v1, "inboxItems":Ljava/lang/String;
    iget-object v2, p0, Lco/getair/meerkat/proxies/InboxProxy$1;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    invoke-virtual {v2, v1}, Lco/getair/meerkat/proxies/InboxProxy;->updateInbox(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    .end local v1    # "inboxItems":Ljava/lang/String;
    :goto_0
    return-void

    .line 75
    :catch_0
    move-exception v0

    .line 76
    .local v0, "exception":Lorg/json/JSONException;
    iget-object v2, p0, Lco/getair/meerkat/proxies/InboxProxy$1;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    # getter for: Lco/getair/meerkat/proxies/InboxProxy;->LOG_TAG:Ljava/lang/String;
    invoke-static {v2}, Lco/getair/meerkat/proxies/InboxProxy;->access$000(Lco/getair/meerkat/proxies/InboxProxy;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
