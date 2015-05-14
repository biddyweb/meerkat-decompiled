.class final Lcom/instabug/library/network/restapi/b;
.super Ljava/lang/Object;
.source "IbgRestApi.java"

# interfaces
.implements Lcom/instabug/library/network/toolbox/b$a;


# instance fields
.field private synthetic a:Landroid/content/Context;

.field private synthetic b:Lcom/instabug/library/network/restapi/a;


# direct methods
.method constructor <init>(Lcom/instabug/library/network/restapi/a;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 52
    iput-object p1, p0, Lcom/instabug/library/network/restapi/b;->b:Lcom/instabug/library/network/restapi/a;

    iput-object p2, p0, Lcom/instabug/library/network/restapi/b;->a:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/android/volley/toolbox/HttpStack;)V
    .locals 3

    .prologue
    .line 55
    iget-object v0, p0, Lcom/instabug/library/network/restapi/b;->b:Lcom/instabug/library/network/restapi/a;

    iget-object v1, p0, Lcom/instabug/library/network/restapi/b;->a:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;Lcom/android/volley/toolbox/HttpStack;)Lcom/android/volley/RequestQueue;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/instabug/library/network/restapi/a;->a(Lcom/instabug/library/network/restapi/a;Lcom/android/volley/RequestQueue;)Lcom/android/volley/RequestQueue;

    .line 56
    iget-object v0, p0, Lcom/instabug/library/network/restapi/b;->b:Lcom/instabug/library/network/restapi/a;

    invoke-static {v0}, Lcom/instabug/library/network/restapi/a;->a(Lcom/instabug/library/network/restapi/a;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/volley/Request;

    .line 57
    iget-object v2, p0, Lcom/instabug/library/network/restapi/b;->b:Lcom/instabug/library/network/restapi/a;

    invoke-static {v2}, Lcom/instabug/library/network/restapi/a;->b(Lcom/instabug/library/network/restapi/a;)Lcom/android/volley/RequestQueue;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    goto :goto_0

    .line 59
    :cond_0
    return-void
.end method
