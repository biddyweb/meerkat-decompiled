.class Lco/getair/meerkat/proxies/SessionProxy$1;
.super Ljava/lang/Object;
.source "SessionProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/SessionProxy;->startLoginFlow()V
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
.field final synthetic this$0:Lco/getair/meerkat/proxies/SessionProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/SessionProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/SessionProxy;

    .prologue
    .line 127
    iput-object p1, p0, Lco/getair/meerkat/proxies/SessionProxy$1;->this$0:Lco/getair/meerkat/proxies/SessionProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 127
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/SessionProxy$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 130
    const-string v0, "SessionProxy"

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    iget-object v0, p0, Lco/getair/meerkat/proxies/SessionProxy$1;->this$0:Lco/getair/meerkat/proxies/SessionProxy;

    # getter for: Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;
    invoke-static {v0}, Lco/getair/meerkat/proxies/SessionProxy;->access$000(Lco/getair/meerkat/proxies/SessionProxy;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v0

    invoke-virtual {v0, p1}, Lco/getair/meerkat/ApiProxy;->setFollowupActionsFromJson(Lorg/json/JSONObject;)V

    .line 134
    iget-object v0, p0, Lco/getair/meerkat/proxies/SessionProxy$1;->this$0:Lco/getair/meerkat/proxies/SessionProxy;

    # invokes: Lco/getair/meerkat/proxies/SessionProxy;->signInWithTwitter()V
    invoke-static {v0}, Lco/getair/meerkat/proxies/SessionProxy;->access$100(Lco/getair/meerkat/proxies/SessionProxy;)V

    .line 136
    return-void
.end method