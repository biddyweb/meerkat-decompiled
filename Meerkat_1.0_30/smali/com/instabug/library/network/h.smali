.class public abstract Lcom/instabug/library/network/h;
.super Ljava/lang/Object;
.source "WebServiceRequest.java"


# instance fields
.field private a:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/instabug/library/network/h;->a:Lorg/json/JSONObject;

    if-nez v0, :cond_0

    .line 77
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/network/h;->a:Lorg/json/JSONObject;

    .line 79
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/network/h;->a:Lorg/json/JSONObject;

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 80
    return-object p0
.end method

.method public abstract a()Ljava/lang/String;
.end method

.method public final a(I)Ljava/lang/String;
    .locals 2

    .prologue
    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://api.instabug.com/api/android/v1/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/instabug/library/network/h;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final a(Lorg/json/JSONObject;)V
    .locals 0

    .prologue
    .line 50
    iput-object p1, p0, Lcom/instabug/library/network/h;->a:Lorg/json/JSONObject;

    .line 51
    return-void
.end method

.method public final b()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/instabug/library/network/h;->a:Lorg/json/JSONObject;

    return-object v0
.end method
