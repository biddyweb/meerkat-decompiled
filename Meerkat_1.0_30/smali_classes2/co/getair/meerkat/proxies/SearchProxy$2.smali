.class Lco/getair/meerkat/proxies/SearchProxy$2;
.super Ljava/lang/Object;
.source "SearchProxy.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/SearchProxy;->searchForUser(Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/SearchProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/SearchProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/SearchProxy;

    .prologue
    .line 66
    iput-object p1, p0, Lco/getair/meerkat/proxies/SearchProxy$2;->this$0:Lco/getair/meerkat/proxies/SearchProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 3
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    const/4 v2, 0x0

    .line 69
    iget-object v0, p1, Lcom/android/volley/VolleyError;->networkResponse:Lcom/android/volley/NetworkResponse;

    iget v0, v0, Lcom/android/volley/NetworkResponse;->statusCode:I

    const/16 v1, 0x19c

    if-ne v0, v1, :cond_0

    .line 70
    iget-object v0, p0, Lco/getair/meerkat/proxies/SearchProxy$2;->this$0:Lco/getair/meerkat/proxies/SearchProxy;

    # invokes: Lco/getair/meerkat/proxies/SearchProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/proxies/SearchProxy;->access$000(Lco/getair/meerkat/proxies/SearchProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "eventUserNotFound"

    invoke-virtual {v0, v1, v2, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    :goto_0
    return-void

    .line 72
    :cond_0
    const-string v0, "SearchProxy"

    invoke-virtual {p1}, Lcom/android/volley/VolleyError;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
