.class public abstract Lcom/instabug/library/dialog/h;
.super Landroid/app/Dialog;
.source "InstabugFrameAnimationDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field private a:Lcom/instabug/library/internal/view/AnimatedImageView;

.field private b:Landroid/widget/TextView;

.field private c:I


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 6

    .prologue
    .line 23
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "InstabugBorderlessDialog"

    const-string v2, "style"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 25
    iput p2, p0, Lcom/instabug/library/dialog/h;->c:I

    .line 26
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/instabug/library/dialog/h;->requestWindowFeature(I)Z

    invoke-virtual {p0}, Lcom/instabug/library/dialog/h;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v0, "instabug_lyt_dialog_animation"

    const-string v2, "layout"

    invoke-virtual {p0}, Lcom/instabug/library/dialog/h;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/instabug/library/dialog/h;->setContentView(I)V

    invoke-virtual {p0, p0}, Lcom/instabug/library/dialog/h;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {p0}, Lcom/instabug/library/dialog/h;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p0}, Lcom/instabug/library/dialog/h;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v0, "animation_frame"

    const-string v4, "id"

    invoke-virtual {p0}, Lcom/instabug/library/dialog/h;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v0, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/instabug/library/dialog/h;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/instabug/library/internal/view/AnimatedImageView;

    iput-object v0, p0, Lcom/instabug/library/dialog/h;->a:Lcom/instabug/library/internal/view/AnimatedImageView;

    iget-object v0, p0, Lcom/instabug/library/dialog/h;->a:Lcom/instabug/library/internal/view/AnimatedImageView;

    invoke-virtual {p0, v2, v3}, Lcom/instabug/library/dialog/h;->a(Landroid/content/res/Resources;Ljava/lang/String;)[Lcom/instabug/library/internal/view/AnimatedImageView$a;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/instabug/library/internal/view/AnimatedImageView;->a([Lcom/instabug/library/internal/view/AnimatedImageView$a;)V

    const-string v0, "animation_description"

    const-string v2, "id"

    invoke-virtual {p0}, Lcom/instabug/library/dialog/h;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/instabug/library/dialog/h;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/instabug/library/dialog/h;->b:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/instabug/library/dialog/h;->b:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/instabug/library/dialog/h;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v2, p0, Lcom/instabug/library/dialog/h;->c:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    return-void
.end method


# virtual methods
.method public abstract a(Landroid/content/res/Resources;Ljava/lang/String;)[Lcom/instabug/library/internal/view/AnimatedImageView$a;
.end method

.method public dismiss()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 31
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 33
    :try_start_0
    iget-object v0, p0, Lcom/instabug/library/dialog/h;->a:Lcom/instabug/library/internal/view/AnimatedImageView;

    invoke-virtual {v0}, Lcom/instabug/library/internal/view/AnimatedImageView;->b()V

    .line 34
    iget-object v0, p0, Lcom/instabug/library/dialog/h;->a:Lcom/instabug/library/internal/view/AnimatedImageView;

    invoke-virtual {v0}, Lcom/instabug/library/internal/view/AnimatedImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/dialog/h;->a:Lcom/instabug/library/internal/view/AnimatedImageView;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    :goto_0
    return-void

    .line 37
    :catch_0
    move-exception v0

    iput-object v2, p0, Lcom/instabug/library/dialog/h;->a:Lcom/instabug/library/internal/view/AnimatedImageView;

    goto :goto_0
.end method

.method public onShow(Landroid/content/DialogInterface;)V
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/instabug/library/dialog/h;->a:Lcom/instabug/library/internal/view/AnimatedImageView;

    invoke-virtual {v0}, Lcom/instabug/library/internal/view/AnimatedImageView;->a()V

    .line 66
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .prologue
    .line 43
    invoke-super {p0, p1}, Landroid/app/Dialog;->onWindowFocusChanged(Z)V

    .line 44
    return-void
.end method
