.class Lco/getair/meerkat/proxies/SessionProxy$6;
.super Ljava/lang/Object;
.source "SessionProxy.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/SessionProxy;->signInWithTwitter()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/SessionProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/SessionProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/SessionProxy;

    .prologue
    .line 198
    iput-object p1, p0, Lco/getair/meerkat/proxies/SessionProxy$6;->this$0:Lco/getair/meerkat/proxies/SessionProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 3
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    const/4 v2, 0x0

    .line 203
    iget-object v0, p1, Lcom/android/volley/VolleyError;->networkResponse:Lcom/android/volley/NetworkResponse;

    iget v0, v0, Lcom/android/volley/NetworkResponse;->statusCode:I

    const/16 v1, 0x1a6

    if-ne v0, v1, :cond_0

    .line 204
    iget-object v0, p0, Lco/getair/meerkat/proxies/SessionProxy$6;->this$0:Lco/getair/meerkat/proxies/SessionProxy;

    # invokes: Lco/getair/meerkat/proxies/SessionProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/proxies/SessionProxy;->access$400(Lco/getair/meerkat/proxies/SessionProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "userDoesNotExist"

    invoke-virtual {v0, v1, v2, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 207
    :cond_0
    return-void
.end method
