.class final Lcom/instabug/library/v;
.super Ljava/lang/Object;
.source "InstabugDelegate.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:Lcom/instabug/library/h;


# direct methods
.method constructor <init>(Lcom/instabug/library/h;)V
    .locals 0

    .prologue
    .line 568
    iput-object p1, p0, Lcom/instabug/library/v;->a:Lcom/instabug/library/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .prologue
    .line 571
    iget-object v0, p0, Lcom/instabug/library/v;->a:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->q()Landroid/app/Activity;

    move-result-object v0

    .line 572
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    .line 573
    iget-object v1, p0, Lcom/instabug/library/v;->a:Lcom/instabug/library/h;

    invoke-static {v1}, Lcom/instabug/library/h;->b(Lcom/instabug/library/h;)Landroid/app/Application;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 574
    new-instance v2, Lcom/instabug/library/dialog/a;

    const-string v3, "instabug_anim_shake"

    const-string v4, "anim"

    iget-object v5, p0, Lcom/instabug/library/v;->a:Lcom/instabug/library/h;

    invoke-static {v5}, Lcom/instabug/library/h;->b(Lcom/instabug/library/h;)Landroid/app/Application;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {v2, v0}, Lcom/instabug/library/dialog/a;-><init>(Landroid/content/Context;)V

    .line 575
    const/4 v0, 0x1

    invoke-virtual {v2, v0}, Lcom/instabug/library/dialog/a;->setCanceledOnTouchOutside(Z)V

    .line 576
    invoke-virtual {v2}, Lcom/instabug/library/dialog/a;->show()V

    .line 578
    :cond_0
    return-void
.end method
