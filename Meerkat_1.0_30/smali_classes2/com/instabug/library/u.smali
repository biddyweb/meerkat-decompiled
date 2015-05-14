.class final Lcom/instabug/library/u;
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
    .line 553
    iput-object p1, p0, Lcom/instabug/library/u;->a:Lcom/instabug/library/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .prologue
    .line 556
    iget-object v0, p0, Lcom/instabug/library/u;->a:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->q()Landroid/app/Activity;

    move-result-object v0

    .line 557
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    .line 558
    iget-object v1, p0, Lcom/instabug/library/u;->a:Lcom/instabug/library/h;

    invoke-static {v1}, Lcom/instabug/library/h;->b(Lcom/instabug/library/h;)Landroid/app/Application;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 559
    const-string v2, "twofingerswipestartalerttext"

    const-string v3, "string"

    iget-object v4, p0, Lcom/instabug/library/u;->a:Lcom/instabug/library/h;

    invoke-static {v4}, Lcom/instabug/library/h;->b(Lcom/instabug/library/h;)Landroid/app/Application;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 560
    new-instance v2, Lcom/instabug/library/dialog/i;

    invoke-direct {v2, v0, v1}, Lcom/instabug/library/dialog/i;-><init>(Landroid/content/Context;I)V

    .line 561
    const/4 v0, 0x1

    invoke-virtual {v2, v0}, Lcom/instabug/library/dialog/h;->setCanceledOnTouchOutside(Z)V

    .line 562
    invoke-virtual {v2}, Lcom/instabug/library/dialog/h;->show()V

    .line 564
    :cond_0
    return-void
.end method
