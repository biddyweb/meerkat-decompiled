.class final Lcom/instabug/library/network/restapi/e;
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
    .line 26
    iput-object p1, p0, Lcom/instabug/library/network/restapi/e;->b:Lcom/instabug/library/network/restapi/c;

    iput-object p2, p0, Lcom/instabug/library/network/restapi/e;->a:Lcom/instabug/library/interactor/a$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/instabug/library/network/restapi/e;->b:Lcom/instabug/library/network/restapi/c;

    invoke-static {v0, p1}, Lcom/instabug/library/network/restapi/c;->a(Lcom/instabug/library/network/restapi/c;Lcom/android/volley/VolleyError;)Ljava/lang/String;

    .line 30
    return-void
.end method
