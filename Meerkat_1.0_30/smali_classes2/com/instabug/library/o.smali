.class final Lcom/instabug/library/o;
.super Ljava/lang/Object;
.source "InstabugDelegate.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:Landroid/app/Activity;

.field private synthetic b:Lcom/instabug/library/h;


# direct methods
.method constructor <init>(Lcom/instabug/library/h;Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 240
    iput-object p1, p0, Lcom/instabug/library/o;->b:Lcom/instabug/library/h;

    iput-object p2, p0, Lcom/instabug/library/o;->a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .prologue
    .line 243
    iget-object v0, p0, Lcom/instabug/library/o;->a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 244
    iget-object v0, p0, Lcom/instabug/library/o;->b:Lcom/instabug/library/h;

    invoke-static {v0}, Lcom/instabug/library/h;->b(Lcom/instabug/library/h;)Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 245
    const-string v1, "tutorialalerttext"

    const-string v2, "string"

    iget-object v3, p0, Lcom/instabug/library/o;->b:Lcom/instabug/library/h;

    invoke-static {v3}, Lcom/instabug/library/h;->b(Lcom/instabug/library/h;)Landroid/app/Application;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 246
    new-instance v1, Lcom/instabug/library/dialog/c;

    iget-object v2, p0, Lcom/instabug/library/o;->a:Landroid/app/Activity;

    invoke-direct {v1, v2, v0}, Lcom/instabug/library/dialog/c;-><init>(Landroid/content/Context;I)V

    .line 247
    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Lcom/instabug/library/dialog/h;->setCanceledOnTouchOutside(Z)V

    .line 248
    invoke-virtual {v1}, Lcom/instabug/library/dialog/h;->show()V

    .line 250
    :cond_0
    return-void
.end method
