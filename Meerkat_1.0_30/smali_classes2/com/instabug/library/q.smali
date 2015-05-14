.class final Lcom/instabug/library/q;
.super Ljava/lang/Object;
.source "InstabugDelegate.java"

# interfaces
.implements Lcom/instabug/library/activity/a$a;


# instance fields
.field private synthetic a:Ljava/io/File;

.field private synthetic b:Lcom/instabug/library/h;


# direct methods
.method constructor <init>(Lcom/instabug/library/h;Ljava/io/File;)V
    .locals 0

    .prologue
    .line 475
    iput-object p1, p0, Lcom/instabug/library/q;->b:Lcom/instabug/library/h;

    iput-object p2, p0, Lcom/instabug/library/q;->a:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 478
    iget-object v0, p0, Lcom/instabug/library/q;->b:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->q()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Landroid/app/Activity;)V

    .line 479
    iget-object v0, p0, Lcom/instabug/library/q;->b:Lcom/instabug/library/h;

    invoke-static {v0, v3}, Lcom/instabug/library/h;->a(Lcom/instabug/library/h;Z)Z

    .line 480
    new-instance v0, Lcom/instabug/library/r;

    invoke-direct {v0, p0}, Lcom/instabug/library/r;-><init>(Lcom/instabug/library/q;)V

    .line 490
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/io/File;

    iget-object v2, p0, Lcom/instabug/library/q;->a:Ljava/io/File;

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 491
    return-void
.end method

.method public final b()V
    .locals 5

    .prologue
    .line 495
    iget-object v0, p0, Lcom/instabug/library/q;->b:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->q()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Landroid/app/Activity;)V

    .line 496
    iget-object v0, p0, Lcom/instabug/library/q;->b:Lcom/instabug/library/h;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/instabug/library/h;->a(Lcom/instabug/library/h;Z)Z

    .line 497
    iget-object v0, p0, Lcom/instabug/library/q;->b:Lcom/instabug/library/h;

    invoke-static {v0}, Lcom/instabug/library/h;->c(Lcom/instabug/library/h;)Landroid/app/Activity;

    move-result-object v0

    invoke-static {}, Lcom/instabug/library/h;->x()Ljava/lang/Class;

    move-result-object v1

    iget-object v2, p0, Lcom/instabug/library/q;->b:Lcom/instabug/library/h;

    invoke-static {v2}, Lcom/instabug/library/h;->d(Lcom/instabug/library/h;)Lcom/instabug/library/internal/theming/a;

    move-result-object v2

    iget-object v3, p0, Lcom/instabug/library/q;->b:Lcom/instabug/library/h;

    invoke-static {v3}, Lcom/instabug/library/h;->e(Lcom/instabug/library/h;)Lcom/instabug/library/Instabug$SdkThemingMode;

    move-result-object v3

    iget-object v4, p0, Lcom/instabug/library/q;->a:Ljava/io/File;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/instabug/library/h;->a(Landroid/app/Activity;Ljava/lang/Class;Lcom/instabug/library/internal/theming/a;Lcom/instabug/library/Instabug$SdkThemingMode;Ljava/io/File;)V

    .line 498
    return-void
.end method

.method public final c()V
    .locals 4

    .prologue
    .line 502
    iget-object v0, p0, Lcom/instabug/library/q;->b:Lcom/instabug/library/h;

    invoke-static {v0}, Lcom/instabug/library/h;->f(Lcom/instabug/library/h;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 503
    iget-object v0, p0, Lcom/instabug/library/q;->b:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->i()V

    .line 504
    new-instance v0, Lcom/instabug/library/s;

    invoke-direct {v0, p0}, Lcom/instabug/library/s;-><init>(Lcom/instabug/library/q;)V

    .line 514
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/io/File;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/instabug/library/q;->a:Ljava/io/File;

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 515
    return-void
.end method
