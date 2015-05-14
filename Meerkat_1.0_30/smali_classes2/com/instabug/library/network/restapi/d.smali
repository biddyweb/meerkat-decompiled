.class final Lcom/instabug/library/network/restapi/d;
.super Ljava/lang/Object;
.source "RestResponseFactory.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# instance fields
.field private synthetic a:Lcom/instabug/library/interactor/a$a;


# direct methods
.method constructor <init>(Lcom/instabug/library/network/restapi/c;Lcom/instabug/library/interactor/a$a;)V
    .locals 0

    .prologue
    .line 12
    iput-object p2, p0, Lcom/instabug/library/network/restapi/d;->a:Lcom/instabug/library/interactor/a$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic onResponse(Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 12
    check-cast p1, Lorg/json/JSONObject;

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "API: Device registered - "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/instabug/library/network/restapi/d;->a:Lcom/instabug/library/interactor/a$a;

    invoke-interface {v0}, Lcom/instabug/library/interactor/a$a;->a()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
