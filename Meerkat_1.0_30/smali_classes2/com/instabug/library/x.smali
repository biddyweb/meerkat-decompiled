.class public final Lcom/instabug/library/x;
.super Ljava/lang/Object;
.source "Settings.java"


# instance fields
.field private A:Ljava/lang/StringBuilder;

.field private B:Landroid/content/SharedPreferences;

.field private C:Ljava/lang/String;

.field a:Ljava/lang/String;

.field b:Ljava/lang/String;

.field c:Ljava/lang/String;

.field d:J

.field private e:Landroid/content/res/Resources;

.field private f:Ljava/lang/String;

.field private g:Ljava/lang/String;

.field private h:Ljava/lang/String;

.field private i:Z

.field private j:Ljava/lang/Runnable;

.field private k:Z

.field private l:Lcom/instabug/library/Instabug$IBGInvocationEvent;

.field private m:Z

.field private n:Z

.field private o:Z

.field private p:Z

.field private q:Z

.field private r:Ljava/lang/String;

.field private s:Ljava/lang/String;

.field private t:Ljava/lang/String;

.field private u:Ljava/lang/String;

.field private v:Z

.field private w:Z

.field private x:Z

.field private y:Z

.field private z:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/x;->a:Ljava/lang/String;

    .line 17
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/instabug/library/x;->i:Z

    .line 19
    iput-boolean v1, p0, Lcom/instabug/library/x;->k:Z

    .line 20
    sget-object v0, Lcom/instabug/library/Instabug$IBGInvocationEvent;->IBGInvocationEventShake:Lcom/instabug/library/Instabug$IBGInvocationEvent;

    iput-object v0, p0, Lcom/instabug/library/x;->l:Lcom/instabug/library/Instabug$IBGInvocationEvent;

    .line 21
    iput-boolean v1, p0, Lcom/instabug/library/x;->m:Z

    .line 22
    iput-boolean v1, p0, Lcom/instabug/library/x;->n:Z

    .line 36
    iput-boolean v1, p0, Lcom/instabug/library/x;->v:Z

    .line 37
    iput-boolean v1, p0, Lcom/instabug/library/x;->w:Z

    .line 38
    iput-boolean v1, p0, Lcom/instabug/library/x;->x:Z

    .line 39
    iput-boolean v1, p0, Lcom/instabug/library/x;->y:Z

    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/x;->A:Ljava/lang/StringBuilder;

    return-void
.end method


# virtual methods
.method public final A()Z
    .locals 1

    .prologue
    .line 414
    iget-boolean v0, p0, Lcom/instabug/library/x;->n:Z

    return v0
.end method

.method public final B()Ljava/lang/String;
    .locals 2

    .prologue
    .line 422
    invoke-virtual {p0}, Lcom/instabug/library/x;->n()[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    return-object v0
.end method

.method public final C()Z
    .locals 1

    .prologue
    .line 435
    iget-boolean v0, p0, Lcom/instabug/library/x;->v:Z

    return v0
.end method

.method public final D()Z
    .locals 1

    .prologue
    .line 456
    iget-boolean v0, p0, Lcom/instabug/library/x;->x:Z

    return v0
.end method

.method public final E()Z
    .locals 1

    .prologue
    .line 469
    iget-boolean v0, p0, Lcom/instabug/library/x;->y:Z

    return v0
.end method

.method public final F()Ljava/lang/StringBuilder;
    .locals 1

    .prologue
    .line 473
    iget-object v0, p0, Lcom/instabug/library/x;->A:Ljava/lang/StringBuilder;

    return-object v0
.end method

.method public final G()Z
    .locals 3

    .prologue
    .line 477
    iget-object v0, p0, Lcom/instabug/library/x;->B:Landroid/content/SharedPreferences;

    const-string v1, "ib_device_registered"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public final H()Z
    .locals 3

    .prologue
    .line 485
    iget-object v0, p0, Lcom/instabug/library/x;->B:Landroid/content/SharedPreferences;

    const-string v1, "ib_first_run"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public final a()J
    .locals 2

    .prologue
    .line 48
    iget-wide v0, p0, Lcom/instabug/library/x;->d:J

    return-wide v0
.end method

.method public final a(Landroid/content/res/Resources;Ljava/lang/String;Landroid/content/SharedPreferences;)V
    .locals 0

    .prologue
    .line 264
    iput-object p2, p0, Lcom/instabug/library/x;->f:Ljava/lang/String;

    .line 265
    iput-object p1, p0, Lcom/instabug/library/x;->e:Landroid/content/res/Resources;

    .line 266
    iput-object p3, p0, Lcom/instabug/library/x;->B:Landroid/content/SharedPreferences;

    .line 267
    return-void
.end method

.method public final a(Lcom/instabug/library/Instabug$IBGInvocationEvent;)V
    .locals 0

    .prologue
    .line 98
    iput-object p1, p0, Lcom/instabug/library/x;->l:Lcom/instabug/library/Instabug$IBGInvocationEvent;

    .line 100
    return-void
.end method

.method public final a(Ljava/lang/Runnable;)V
    .locals 0

    .prologue
    .line 315
    iput-object p1, p0, Lcom/instabug/library/x;->j:Ljava/lang/Runnable;

    .line 316
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 85
    iput-object p1, p0, Lcom/instabug/library/x;->g:Ljava/lang/String;

    .line 86
    return-void
.end method

.method public final a(Z)V
    .locals 0

    .prologue
    .line 117
    iput-boolean p1, p0, Lcom/instabug/library/x;->k:Z

    .line 118
    return-void
.end method

.method public final a(ZLjava/lang/Class;)V
    .locals 0

    .prologue
    .line 128
    iput-object p2, p0, Lcom/instabug/library/x;->z:Ljava/lang/Class;

    .line 129
    iput-boolean p1, p0, Lcom/instabug/library/x;->k:Z

    .line 130
    return-void
.end method

.method public final a(ZZ)V
    .locals 0

    .prologue
    .line 181
    if-eqz p1, :cond_0

    .line 182
    iput-boolean p1, p0, Lcom/instabug/library/x;->n:Z

    .line 183
    iput-boolean p2, p0, Lcom/instabug/library/x;->o:Z

    .line 188
    :goto_0
    return-void

    .line 185
    :cond_0
    iput-boolean p1, p0, Lcom/instabug/library/x;->n:Z

    .line 186
    iput-boolean p1, p0, Lcom/instabug/library/x;->o:Z

    goto :goto_0
.end method

.method public final b()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/instabug/library/x;->a:Ljava/lang/String;

    return-object v0
.end method

.method public final b(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 141
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/instabug/library/x;->i:Z

    .line 142
    iput-object p1, p0, Lcom/instabug/library/x;->h:Ljava/lang/String;

    .line 143
    return-void
.end method

.method public final b(Z)V
    .locals 0

    .prologue
    .line 163
    iput-boolean p1, p0, Lcom/instabug/library/x;->m:Z

    .line 164
    return-void
.end method

.method public final c()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/instabug/library/x;->C:Ljava/lang/String;

    return-object v0
.end method

.method public final c(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 199
    iput-object p1, p0, Lcom/instabug/library/x;->t:Ljava/lang/String;

    .line 200
    return-void
.end method

.method public final c(Z)V
    .locals 0

    .prologue
    .line 195
    iput-boolean p1, p0, Lcom/instabug/library/x;->p:Z

    .line 196
    return-void
.end method

.method public final d()Ljava/lang/Runnable;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/instabug/library/x;->j:Ljava/lang/Runnable;

    return-object v0
.end method

.method public final d(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 207
    iget-object v0, p0, Lcom/instabug/library/x;->B:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "ib_default_email"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 208
    return-void
.end method

.method public final d(Z)V
    .locals 0

    .prologue
    .line 255
    iput-boolean p1, p0, Lcom/instabug/library/x;->w:Z

    .line 256
    return-void
.end method

.method public final e()Lcom/instabug/library/Instabug$IBGInvocationEvent;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/instabug/library/x;->l:Lcom/instabug/library/Instabug$IBGInvocationEvent;

    return-object v0
.end method

.method public final e(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 215
    iput-object p1, p0, Lcom/instabug/library/x;->r:Ljava/lang/String;

    .line 216
    return-void
.end method

.method public final e(Z)V
    .locals 0

    .prologue
    .line 298
    iput-boolean p1, p0, Lcom/instabug/library/x;->q:Z

    .line 299
    return-void
.end method

.method public final f()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/instabug/library/x;->g:Ljava/lang/String;

    return-object v0
.end method

.method public final f(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 223
    iput-object p1, p0, Lcom/instabug/library/x;->s:Ljava/lang/String;

    .line 224
    return-void
.end method

.method public final f(Z)V
    .locals 0

    .prologue
    .line 443
    iput-boolean p1, p0, Lcom/instabug/library/x;->v:Z

    .line 444
    return-void
.end method

.method public final g(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 247
    iput-object p1, p0, Lcom/instabug/library/x;->u:Ljava/lang/String;

    .line 248
    return-void
.end method

.method public final g(Z)V
    .locals 0

    .prologue
    .line 452
    iput-boolean p1, p0, Lcom/instabug/library/x;->x:Z

    .line 453
    return-void
.end method

.method public final g()Z
    .locals 1

    .prologue
    .line 108
    iget-boolean v0, p0, Lcom/instabug/library/x;->k:Z

    return v0
.end method

.method public final h()Ljava/lang/Class;
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/instabug/library/x;->z:Ljava/lang/Class;

    return-object v0
.end method

.method public final h(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 493
    iput-object p1, p0, Lcom/instabug/library/x;->C:Ljava/lang/String;

    .line 494
    return-void
.end method

.method public final h(Z)V
    .locals 3

    .prologue
    .line 481
    iget-object v0, p0, Lcom/instabug/library/x;->B:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "ib_device_registered"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 482
    return-void
.end method

.method public final i()V
    .locals 1

    .prologue
    .line 146
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/instabug/library/x;->i:Z

    .line 147
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/x;->h:Ljava/lang/String;

    .line 148
    return-void
.end method

.method public final i(Z)V
    .locals 3

    .prologue
    .line 489
    iget-object v0, p0, Lcom/instabug/library/x;->B:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "ib_first_run"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 490
    return-void
.end method

.method public final j(Z)V
    .locals 0

    .prologue
    .line 497
    iput-boolean p1, p0, Lcom/instabug/library/x;->n:Z

    .line 498
    return-void
.end method

.method public final j()Z
    .locals 1

    .prologue
    .line 151
    iget-boolean v0, p0, Lcom/instabug/library/x;->i:Z

    return v0
.end method

.method public final k()Ljava/lang/String;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/instabug/library/x;->h:Ljava/lang/String;

    return-object v0
.end method

.method public final k(Z)V
    .locals 0

    .prologue
    .line 501
    iput-boolean p1, p0, Lcom/instabug/library/x;->o:Z

    .line 502
    return-void
.end method

.method public final l()Z
    .locals 1

    .prologue
    .line 172
    iget-boolean v0, p0, Lcom/instabug/library/x;->m:Z

    return v0
.end method

.method public final m()Z
    .locals 1

    .prologue
    .line 259
    iget-boolean v0, p0, Lcom/instabug/library/x;->w:Z

    return v0
.end method

.method public final n()[Ljava/lang/String;
    .locals 5

    .prologue
    .line 274
    iget-object v0, p0, Lcom/instabug/library/x;->e:Landroid/content/res/Resources;

    iget-object v1, p0, Lcom/instabug/library/x;->e:Landroid/content/res/Resources;

    const-string v2, "report_options"

    const-string v3, "array"

    iget-object v4, p0, Lcom/instabug/library/x;->f:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 278
    return-object v0
.end method

.method public final o()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 302
    iget-boolean v1, p0, Lcom/instabug/library/x;->q:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/instabug/library/x;->B:Landroid/content/SharedPreferences;

    const-string v2, "ib_show_tutorial"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final p()V
    .locals 3

    .prologue
    .line 306
    iget-object v0, p0, Lcom/instabug/library/x;->B:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "ib_show_tutorial"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 307
    return-void
.end method

.method public final q()Ljava/lang/String;
    .locals 5

    .prologue
    .line 324
    iget-object v0, p0, Lcom/instabug/library/x;->e:Landroid/content/res/Resources;

    iget-object v1, p0, Lcom/instabug/library/x;->e:Landroid/content/res/Resources;

    const-string v2, "pleasewait"

    const-string v3, "string"

    iget-object v4, p0, Lcom/instabug/library/x;->f:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final r()Ljava/lang/String;
    .locals 5

    .prologue
    .line 333
    iget-object v0, p0, Lcom/instabug/library/x;->c:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/x;->c:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/instabug/library/x;->e:Landroid/content/res/Resources;

    iget-object v1, p0, Lcom/instabug/library/x;->e:Landroid/content/res/Resources;

    const-string v2, "feedbacksentalerttitle"

    const-string v3, "string"

    iget-object v4, p0, Lcom/instabug/library/x;->f:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public final s()Ljava/lang/String;
    .locals 5

    .prologue
    .line 342
    iget-object v0, p0, Lcom/instabug/library/x;->b:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/x;->b:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/instabug/library/x;->e:Landroid/content/res/Resources;

    iget-object v1, p0, Lcom/instabug/library/x;->e:Landroid/content/res/Resources;

    const-string v2, "feedbacksentalerttitle"

    const-string v3, "string"

    iget-object v4, p0, Lcom/instabug/library/x;->f:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public final t()Ljava/lang/String;
    .locals 5

    .prologue
    .line 351
    iget-object v0, p0, Lcom/instabug/library/x;->u:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/x;->u:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/instabug/library/x;->e:Landroid/content/res/Resources;

    iget-object v1, p0, Lcom/instabug/library/x;->e:Landroid/content/res/Resources;

    const-string v2, "invalidemailalerttitle"

    const-string v3, "string"

    iget-object v4, p0, Lcom/instabug/library/x;->f:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public final u()Ljava/lang/String;
    .locals 5

    .prologue
    .line 360
    iget-object v0, p0, Lcom/instabug/library/x;->t:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/x;->t:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/instabug/library/x;->e:Landroid/content/res/Resources;

    iget-object v1, p0, Lcom/instabug/library/x;->e:Landroid/content/res/Resources;

    const-string v2, "invalidcommentalerttext"

    const-string v3, "string"

    iget-object v4, p0, Lcom/instabug/library/x;->f:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public final v()Ljava/lang/String;
    .locals 5

    .prologue
    .line 369
    iget-object v0, p0, Lcom/instabug/library/x;->s:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/x;->s:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/instabug/library/x;->e:Landroid/content/res/Resources;

    iget-object v1, p0, Lcom/instabug/library/x;->e:Landroid/content/res/Resources;

    const-string v2, "commentplaceholder"

    const-string v3, "string"

    iget-object v4, p0, Lcom/instabug/library/x;->f:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public final w()Ljava/lang/String;
    .locals 5

    .prologue
    .line 378
    iget-object v0, p0, Lcom/instabug/library/x;->r:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/x;->r:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/instabug/library/x;->e:Landroid/content/res/Resources;

    iget-object v1, p0, Lcom/instabug/library/x;->e:Landroid/content/res/Resources;

    const-string v2, "emailplaceholder"

    const-string v3, "string"

    iget-object v4, p0, Lcom/instabug/library/x;->f:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public final x()Ljava/lang/String;
    .locals 3

    .prologue
    .line 387
    iget-object v0, p0, Lcom/instabug/library/x;->B:Landroid/content/SharedPreferences;

    const-string v1, "ib_default_email"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final y()Z
    .locals 1

    .prologue
    .line 396
    iget-boolean v0, p0, Lcom/instabug/library/x;->p:Z

    return v0
.end method

.method public final z()Z
    .locals 1

    .prologue
    .line 405
    iget-boolean v0, p0, Lcom/instabug/library/x;->o:Z

    return v0
.end method
