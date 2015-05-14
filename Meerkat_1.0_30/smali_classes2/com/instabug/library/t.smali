.class final Lcom/instabug/library/t;
.super Ljava/lang/Object;
.source "InstabugDelegate.java"

# interfaces
.implements Lcom/instabug/library/util/j$a;


# instance fields
.field private synthetic a:Lcom/instabug/library/h$b;

.field private synthetic b:Lcom/instabug/library/h;


# direct methods
.method constructor <init>(Lcom/instabug/library/h;Lcom/instabug/library/h$b;)V
    .locals 0

    .prologue
    .line 526
    iput-object p1, p0, Lcom/instabug/library/t;->b:Lcom/instabug/library/h;

    iput-object p2, p0, Lcom/instabug/library/t;->a:Lcom/instabug/library/h$b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/io/File;)V
    .locals 2

    .prologue
    .line 529
    iget-object v0, p0, Lcom/instabug/library/t;->b:Lcom/instabug/library/h;

    invoke-static {v0}, Lcom/instabug/library/h;->g(Lcom/instabug/library/h;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/t;->b:Lcom/instabug/library/h;

    invoke-static {v0}, Lcom/instabug/library/h;->g(Lcom/instabug/library/h;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 530
    iget-object v0, p0, Lcom/instabug/library/t;->b:Lcom/instabug/library/h;

    invoke-static {v0}, Lcom/instabug/library/h;->g(Lcom/instabug/library/h;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 531
    iget-object v0, p0, Lcom/instabug/library/t;->b:Lcom/instabug/library/h;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/instabug/library/h;->a(Lcom/instabug/library/h;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;

    .line 533
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/t;->a:Lcom/instabug/library/h$b;

    invoke-interface {v0, p1}, Lcom/instabug/library/h$b;->a(Ljava/io/File;)V

    .line 534
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 538
    iget-object v0, p0, Lcom/instabug/library/t;->b:Lcom/instabug/library/h;

    invoke-static {v0}, Lcom/instabug/library/h;->g(Lcom/instabug/library/h;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/t;->b:Lcom/instabug/library/h;

    invoke-static {v0}, Lcom/instabug/library/h;->g(Lcom/instabug/library/h;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 539
    iget-object v0, p0, Lcom/instabug/library/t;->b:Lcom/instabug/library/h;

    invoke-static {v0}, Lcom/instabug/library/h;->g(Lcom/instabug/library/h;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 540
    iget-object v0, p0, Lcom/instabug/library/t;->b:Lcom/instabug/library/h;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/instabug/library/h;->a(Lcom/instabug/library/h;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;

    .line 542
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/t;->b:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->q()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Landroid/app/Activity;)V

    .line 543
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ScreenshotProcessor: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 544
    iget-object v0, p0, Lcom/instabug/library/t;->b:Lcom/instabug/library/h;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/instabug/library/h;->a(Lcom/instabug/library/h;Z)Z

    .line 545
    return-void
.end method
