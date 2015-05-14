.class final Lcom/instabug/library/network/restapi/h;
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
    .line 64
    iput-object p2, p0, Lcom/instabug/library/network/restapi/h;->a:Lcom/instabug/library/interactor/a$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic onResponse(Ljava/lang/Object;)V
    .locals 1

    .prologue
    .line 64
    const-string v0, "API: saveIssueArtifact - Artifact uploaded successfully"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/instabug/library/network/restapi/h;->a:Lcom/instabug/library/interactor/a$a;

    invoke-interface {v0}, Lcom/instabug/library/interactor/a$a;->a()V

    return-void
.end method
