.class public final Lcom/instabug/library/presenter/e;
.super Ljava/lang/Object;
.source "FeedbackPresenter.java"


# instance fields
.field private a:Lcom/instabug/library/view/b;

.field private b:Lcom/instabug/library/interactor/c;

.field private c:Lcom/instabug/library/x;

.field private d:Lcom/instabug/library/model/b;

.field private e:Lcom/instabug/library/interactor/c$a;


# direct methods
.method public constructor <init>(Lcom/instabug/library/view/b;Lcom/instabug/library/interactor/c;Lcom/instabug/library/x;Lcom/instabug/library/model/b;)V
    .locals 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    new-instance v0, Lcom/instabug/library/presenter/g;

    invoke-direct {v0, p0}, Lcom/instabug/library/presenter/g;-><init>(Lcom/instabug/library/presenter/e;)V

    iput-object v0, p0, Lcom/instabug/library/presenter/e;->e:Lcom/instabug/library/interactor/c$a;

    .line 25
    iput-object p1, p0, Lcom/instabug/library/presenter/e;->a:Lcom/instabug/library/view/b;

    .line 26
    iput-object p2, p0, Lcom/instabug/library/presenter/e;->b:Lcom/instabug/library/interactor/c;

    .line 27
    iput-object p3, p0, Lcom/instabug/library/presenter/e;->c:Lcom/instabug/library/x;

    .line 28
    iput-object p4, p0, Lcom/instabug/library/presenter/e;->d:Lcom/instabug/library/model/b;

    .line 29
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 32
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->a:Lcom/instabug/library/view/b;

    invoke-interface {v0}, Lcom/instabug/library/view/b;->b()Ljava/lang/String;

    move-result-object v1

    .line 33
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->a:Lcom/instabug/library/view/b;

    invoke-interface {v0}, Lcom/instabug/library/view/b;->a()Ljava/lang/String;

    move-result-object v2

    .line 35
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->c:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->y()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 36
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->a:Lcom/instabug/library/view/b;

    iget-object v1, p0, Lcom/instabug/library/presenter/e;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->u()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/instabug/library/view/b;->e(Ljava/lang/String;)V

    .line 77
    :goto_0
    return-void

    .line 40
    :cond_1
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->c:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->z()Z

    move-result v0

    if-eqz v0, :cond_3

    if-eqz v2, :cond_2

    sget-object v0, Landroid/util/Patterns;->EMAIL_ADDRESS:Ljava/util/regex/Pattern;

    invoke-virtual {v0, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-nez v0, :cond_3

    .line 41
    :cond_2
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->a:Lcom/instabug/library/view/b;

    iget-object v1, p0, Lcom/instabug/library/presenter/e;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->t()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/instabug/library/view/b;->d(Ljava/lang/String;)V

    goto :goto_0

    .line 45
    :cond_3
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->c:Lcom/instabug/library/x;

    invoke-virtual {v0, v2}, Lcom/instabug/library/x;->d(Ljava/lang/String;)V

    .line 46
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->c:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->d()Ljava/lang/Runnable;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 48
    :try_start_0
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->c:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->d()Ljava/lang/Runnable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->d:Lcom/instabug/library/model/b;

    const/4 v3, 0x2

    invoke-virtual {v0, v2, v1, v7, v3}, Lcom/instabug/library/model/b;->a(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;I)Lcom/instabug/library/model/a;

    move-result-object v0

    .line 71
    iget-object v1, p0, Lcom/instabug/library/presenter/e;->b:Lcom/instabug/library/interactor/c;

    iget-object v2, p0, Lcom/instabug/library/presenter/e;->e:Lcom/instabug/library/interactor/c$a;

    invoke-virtual {v1, v0, v2}, Lcom/instabug/library/interactor/c;->a(Lcom/instabug/library/model/a;Lcom/instabug/library/interactor/c$a;)V

    .line 72
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->c:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->D()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 73
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->a:Lcom/instabug/library/view/b;

    iget-object v1, p0, Lcom/instabug/library/presenter/e;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->s()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/instabug/library/view/b;->f(Ljava/lang/String;)V

    goto :goto_0

    .line 49
    :catch_0
    move-exception v0

    .line 50
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 52
    :try_start_1
    const-string v4, "error"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->b(Ljava/lang/Throwable;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 53
    iget-object v4, p0, Lcom/instabug/library/presenter/e;->d:Lcom/instabug/library/model/b;

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    const/4 v6, 0x3

    invoke-virtual {v4, v2, v3, v5, v6}, Lcom/instabug/library/model/b;->a(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;I)Lcom/instabug/library/model/a;

    move-result-object v3

    .line 54
    iget-object v4, p0, Lcom/instabug/library/presenter/e;->b:Lcom/instabug/library/interactor/c;

    new-instance v5, Lcom/instabug/library/presenter/f;

    invoke-direct {v5, p0}, Lcom/instabug/library/presenter/f;-><init>(Lcom/instabug/library/presenter/e;)V

    invoke-virtual {v4, v3, v5}, Lcom/instabug/library/interactor/c;->a(Lcom/instabug/library/model/a;Lcom/instabug/library/interactor/c$a;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 66
    :catch_1
    move-exception v3

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 75
    :cond_5
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->a:Lcom/instabug/library/view/b;

    invoke-interface {v0}, Lcom/instabug/library/view/b;->c()V

    goto/16 :goto_0
.end method

.method public final b()V
    .locals 2

    .prologue
    .line 87
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->a:Lcom/instabug/library/view/b;

    iget-object v1, p0, Lcom/instabug/library/presenter/e;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->A()Z

    move-result v1

    invoke-interface {v0, v1}, Lcom/instabug/library/view/b;->a(Z)V

    .line 88
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->c:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->A()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->a:Lcom/instabug/library/view/b;

    iget-object v1, p0, Lcom/instabug/library/presenter/e;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->w()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/instabug/library/view/b;->b(Ljava/lang/String;)V

    .line 90
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->c:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->x()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->c:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->x()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 92
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->a:Lcom/instabug/library/view/b;

    iget-object v1, p0, Lcom/instabug/library/presenter/e;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->x()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/instabug/library/view/b;->a(Ljava/lang/String;)V

    .line 97
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/presenter/e;->a:Lcom/instabug/library/view/b;

    iget-object v1, p0, Lcom/instabug/library/presenter/e;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->v()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/instabug/library/view/b;->c(Ljava/lang/String;)V

    .line 98
    return-void
.end method
