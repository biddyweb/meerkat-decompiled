.class final Lcom/instabug/library/presenter/d;
.super Ljava/lang/Object;
.source "AnnotationPresenter.java"

# interfaces
.implements Lcom/instabug/library/interactor/c$a;


# instance fields
.field private synthetic a:Lcom/instabug/library/presenter/a;


# direct methods
.method constructor <init>(Lcom/instabug/library/presenter/a;)V
    .locals 0

    .prologue
    .line 153
    iput-object p1, p0, Lcom/instabug/library/presenter/d;->a:Lcom/instabug/library/presenter/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .prologue
    .line 156
    iget-object v0, p0, Lcom/instabug/library/presenter/d;->a:Lcom/instabug/library/presenter/a;

    invoke-static {v0}, Lcom/instabug/library/presenter/a;->b(Lcom/instabug/library/presenter/a;)Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->D()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 157
    iget-object v0, p0, Lcom/instabug/library/presenter/d;->a:Lcom/instabug/library/presenter/a;

    invoke-static {v0}, Lcom/instabug/library/presenter/a;->a(Lcom/instabug/library/presenter/a;)Lcom/instabug/library/view/a;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/presenter/d;->a:Lcom/instabug/library/presenter/a;

    invoke-static {v1}, Lcom/instabug/library/presenter/a;->b(Lcom/instabug/library/presenter/a;)Lcom/instabug/library/x;

    move-result-object v1

    invoke-virtual {v1}, Lcom/instabug/library/x;->r()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/instabug/library/view/a;->h(Ljava/lang/String;)V

    .line 161
    :goto_0
    return-void

    .line 159
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/presenter/d;->a:Lcom/instabug/library/presenter/a;

    invoke-static {v0}, Lcom/instabug/library/presenter/a;->a(Lcom/instabug/library/presenter/a;)Lcom/instabug/library/view/a;

    move-result-object v0

    invoke-interface {v0}, Lcom/instabug/library/view/a;->g()V

    goto :goto_0
.end method
