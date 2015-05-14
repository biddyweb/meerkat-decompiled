.class public final Lcom/instabug/library/presenter/a;
.super Ljava/lang/Object;
.source "AnnotationPresenter.java"


# instance fields
.field private a:Lcom/instabug/library/view/a;

.field private b:Lcom/instabug/library/interactor/c;

.field private c:Lcom/instabug/library/x;

.field private d:Lcom/instabug/library/model/b;

.field private e:Lcom/instabug/library/internal/storage/a;

.field private f:Lcom/instabug/library/interactor/c$a;


# direct methods
.method public constructor <init>(Lcom/instabug/library/view/a;Lcom/instabug/library/interactor/c;Lcom/instabug/library/x;Lcom/instabug/library/model/b;Lcom/instabug/library/internal/storage/a;)V
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 153
    new-instance v0, Lcom/instabug/library/presenter/d;

    invoke-direct {v0, p0}, Lcom/instabug/library/presenter/d;-><init>(Lcom/instabug/library/presenter/a;)V

    iput-object v0, p0, Lcom/instabug/library/presenter/a;->f:Lcom/instabug/library/interactor/c$a;

    .line 29
    iput-object p1, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    .line 30
    iput-object p2, p0, Lcom/instabug/library/presenter/a;->b:Lcom/instabug/library/interactor/c;

    .line 31
    iput-object p3, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    .line 32
    iput-object p4, p0, Lcom/instabug/library/presenter/a;->d:Lcom/instabug/library/model/b;

    .line 33
    iput-object p5, p0, Lcom/instabug/library/presenter/a;->e:Lcom/instabug/library/internal/storage/a;

    .line 34
    return-void
.end method

.method static synthetic a(Lcom/instabug/library/presenter/a;)Lcom/instabug/library/view/a;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    return-object v0
.end method

.method static synthetic b(Lcom/instabug/library/presenter/a;)Lcom/instabug/library/x;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    return-object v0
.end method


# virtual methods
.method public final a()V
    .locals 3

    .prologue
    .line 37
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    iget-object v1, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->A()Z

    move-result v1

    invoke-interface {v0, v1}, Lcom/instabug/library/view/a;->a(Z)V

    .line 39
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->A()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 40
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    iget-object v1, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->w()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/instabug/library/view/a;->c(Ljava/lang/String;)V

    .line 41
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->x()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 42
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->x()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 43
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    iget-object v1, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->x()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/instabug/library/view/a;->b(Ljava/lang/String;)V

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    iget-object v1, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->B()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/instabug/library/view/a;->a(Ljava/lang/String;)V

    .line 49
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    iget-object v1, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->v()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/instabug/library/view/a;->d(Ljava/lang/String;)V

    .line 51
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    invoke-interface {v0}, Lcom/instabug/library/view/a;->c()Ljava/lang/String;

    move-result-object v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    iget-object v1, p0, Lcom/instabug/library/presenter/a;->e:Lcom/instabug/library/internal/storage/a;

    new-instance v2, Lcom/instabug/library/presenter/b;

    invoke-direct {v2, p0}, Lcom/instabug/library/presenter/b;-><init>(Lcom/instabug/library/presenter/a;)V

    invoke-virtual {v1, v0, v2}, Lcom/instabug/library/internal/storage/a;->a(Ljava/lang/String;Lcom/instabug/library/internal/storage/a$a;)V

    .line 66
    :goto_0
    return-void

    .line 65
    :cond_1
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    invoke-interface {v0}, Lcom/instabug/library/view/a;->g()V

    goto :goto_0
.end method

.method public final a(I)V
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    invoke-interface {v0, p1}, Lcom/instabug/library/view/a;->a(I)V

    .line 82
    return-void
.end method

.method public final b()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 73
    iput-object v0, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    .line 74
    iput-object v0, p0, Lcom/instabug/library/presenter/a;->b:Lcom/instabug/library/interactor/c;

    .line 75
    iput-object v0, p0, Lcom/instabug/library/presenter/a;->d:Lcom/instabug/library/model/b;

    .line 76
    iput-object v0, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    .line 77
    iput-object v0, p0, Lcom/instabug/library/presenter/a;->e:Lcom/instabug/library/internal/storage/a;

    .line 78
    return-void
.end method

.method public final c()V
    .locals 8

    .prologue
    const/4 v0, 0x0

    .line 85
    iget-object v1, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    invoke-interface {v1}, Lcom/instabug/library/view/a;->f()Ljava/lang/String;

    move-result-object v2

    .line 86
    iget-object v1, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    invoke-interface {v1}, Lcom/instabug/library/view/a;->e()Ljava/lang/String;

    move-result-object v1

    .line 88
    if-eqz v1, :cond_6

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_6

    .line 92
    :goto_0
    iget-object v1, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->y()Z

    move-result v1

    if-eqz v1, :cond_1

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 93
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    iget-object v1, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->u()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/instabug/library/view/a;->f(Ljava/lang/String;)V

    .line 142
    :goto_1
    return-void

    .line 97
    :cond_1
    iget-object v1, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->z()Z

    move-result v1

    if-eqz v1, :cond_2

    if-nez v0, :cond_2

    .line 98
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    iget-object v1, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->t()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/instabug/library/view/a;->e(Ljava/lang/String;)V

    goto :goto_1

    .line 103
    :cond_2
    if-eqz v0, :cond_4

    .line 104
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v3, 0xbe

    if-gt v1, v3, :cond_3

    sget-object v1, Landroid/util/Patterns;->EMAIL_ADDRESS:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-nez v1, :cond_4

    .line 105
    :cond_3
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    iget-object v1, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->t()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/instabug/library/view/a;->e(Ljava/lang/String;)V

    goto :goto_1

    .line 111
    :cond_4
    iget-object v1, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    invoke-interface {v1}, Lcom/instabug/library/view/a;->d()Landroid/graphics/Bitmap;

    move-result-object v3

    .line 113
    iget-object v1, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    iget-object v4, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    invoke-virtual {v4}, Lcom/instabug/library/x;->q()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Lcom/instabug/library/view/a;->g(Ljava/lang/String;)V

    .line 114
    iget-object v1, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    invoke-virtual {v1, v0}, Lcom/instabug/library/x;->d(Ljava/lang/String;)V

    .line 115
    iget-object v1, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->d()Ljava/lang/Runnable;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 117
    :try_start_0
    iget-object v1, p0, Lcom/instabug/library/presenter/a;->c:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->d()Ljava/lang/Runnable;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    :cond_5
    :goto_2
    iget-object v1, p0, Lcom/instabug/library/presenter/a;->d:Lcom/instabug/library/model/b;

    const/4 v4, 0x1

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/instabug/library/model/b;->a(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;I)Lcom/instabug/library/model/a;

    move-result-object v0

    .line 140
    iget-object v1, p0, Lcom/instabug/library/presenter/a;->b:Lcom/instabug/library/interactor/c;

    iget-object v2, p0, Lcom/instabug/library/presenter/a;->f:Lcom/instabug/library/interactor/c$a;

    invoke-virtual {v1, v0, v2}, Lcom/instabug/library/interactor/c;->a(Lcom/instabug/library/model/a;Lcom/instabug/library/interactor/c$a;)V

    .line 141
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    invoke-interface {v0}, Lcom/instabug/library/view/a;->c()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/internal/storage/a;->a(Ljava/lang/String;)V

    goto :goto_1

    .line 118
    :catch_0
    move-exception v1

    .line 119
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 121
    :try_start_1
    const-string v5, "error"

    invoke-static {v1}, Lcom/instabug/library/Instabug$a;->b(Ljava/lang/Throwable;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 122
    iget-object v5, p0, Lcom/instabug/library/presenter/a;->d:Lcom/instabug/library/model/b;

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v7, 0x3

    invoke-virtual {v5, v0, v4, v6, v7}, Lcom/instabug/library/model/b;->a(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;I)Lcom/instabug/library/model/a;

    move-result-object v4

    .line 123
    iget-object v5, p0, Lcom/instabug/library/presenter/a;->b:Lcom/instabug/library/interactor/c;

    new-instance v6, Lcom/instabug/library/presenter/c;

    invoke-direct {v6, p0}, Lcom/instabug/library/presenter/c;-><init>(Lcom/instabug/library/presenter/a;)V

    invoke-virtual {v5, v4, v6}, Lcom/instabug/library/interactor/c;->a(Lcom/instabug/library/model/a;Lcom/instabug/library/interactor/c$a;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 135
    :catch_1
    move-exception v4

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    :cond_6
    move-object v0, v1

    goto/16 :goto_0
.end method

.method public final d()V
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    invoke-interface {v0}, Lcom/instabug/library/view/a;->g()V

    .line 146
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    invoke-interface {v0}, Lcom/instabug/library/view/a;->c()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/internal/storage/a;->a(Ljava/lang/String;)V

    .line 147
    return-void
.end method

.method public final e()V
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lcom/instabug/library/presenter/a;->a:Lcom/instabug/library/view/a;

    invoke-interface {v0}, Lcom/instabug/library/view/a;->h()V

    .line 151
    return-void
.end method
