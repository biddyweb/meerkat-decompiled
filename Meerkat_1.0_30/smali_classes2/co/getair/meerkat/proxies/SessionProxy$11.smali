.class Lco/getair/meerkat/proxies/SessionProxy$11;
.super Ljava/lang/Object;
.source "SessionProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/SessionProxy;->logout()V
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
    .line 349
    iput-object p1, p0, Lco/getair/meerkat/proxies/SessionProxy$11;->this$0:Lco/getair/meerkat/proxies/SessionProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 349
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/SessionProxy$11;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 352
    return-void
.end method
