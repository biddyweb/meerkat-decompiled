.class final Lcom/instabug/library/network/restapi/f;
.super Ljava/lang/Object;
.source "RestResponseFactory.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# instance fields
.field private synthetic a:Lcom/instabug/library/network/restapi/a$a;


# direct methods
.method constructor <init>(Lcom/instabug/library/network/restapi/c;Lcom/instabug/library/network/restapi/a$a;)V
    .locals 0

    .prologue
    .line 35
    iput-object p2, p0, Lcom/instabug/library/network/restapi/f;->a:Lcom/instabug/library/network/restapi/a$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic onResponse(Ljava/lang/Object;)V
    .locals 4

    .prologue
    .line 35
    check-cast p1, Lorg/json/JSONObject;

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "API: saveIssue - "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    const-string v0, "id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    :try_start_1
    iget-object v1, p0, Lcom/instabug/library/network/restapi/f;->a:Lcom/instabug/library/network/restapi/a$a;

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/instabug/library/network/restapi/a$a;->a(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_0
    return-void

    :catch_0
    move-exception v0

    :try_start_2
    iget-object v0, p0, Lcom/instabug/library/network/restapi/f;->a:Lcom/instabug/library/network/restapi/a$a;

    const-string v1, "Server response invalid. Please contact us for support"

    invoke-interface {v0, v1}, Lcom/instabug/library/network/restapi/a$a;->a(Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    iget-object v1, p0, Lcom/instabug/library/network/restapi/f;->a:Lcom/instabug/library/network/restapi/a$a;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/instabug/library/network/restapi/a$a;->a(Ljava/lang/String;)V

    goto :goto_0
.end method
