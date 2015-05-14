.class final Lcom/instabug/library/network/restapi/i;
.super Ljava/lang/Object;
.source "RestResponseFactory.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# instance fields
.field private synthetic a:Lcom/instabug/library/interactor/a$a;

.field private synthetic b:Lcom/instabug/library/network/restapi/c;


# direct methods
.method constructor <init>(Lcom/instabug/library/network/restapi/c;Lcom/instabug/library/interactor/a$a;)V
    .locals 0

    .prologue
    .line 74
    iput-object p1, p0, Lcom/instabug/library/network/restapi/i;->b:Lcom/instabug/library/network/restapi/c;

    iput-object p2, p0, Lcom/instabug/library/network/restapi/i;->a:Lcom/instabug/library/interactor/a$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2

    .prologue
    .line 77
    iget-object v0, p0, Lcom/instabug/library/network/restapi/i;->a:Lcom/instabug/library/interactor/a$a;

    iget-object v1, p0, Lcom/instabug/library/network/restapi/i;->b:Lcom/instabug/library/network/restapi/c;

    invoke-static {v1, p1}, Lcom/instabug/library/network/restapi/c;->a(Lcom/instabug/library/network/restapi/c;Lcom/android/volley/VolleyError;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/instabug/library/interactor/a$a;->a(Ljava/lang/String;)V

    .line 78
    return-void
.end method
