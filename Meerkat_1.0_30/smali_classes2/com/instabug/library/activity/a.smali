.class public final Lcom/instabug/library/activity/a;
.super Landroid/app/Dialog;
.source "InstabugInvocationDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/activity/a$a;
    }
.end annotation


# instance fields
.field private final a:Landroid/app/Activity;

.field private final b:Lcom/instabug/library/activity/a$a;

.field private c:Lcom/instabug/library/network/toolbox/b;

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private h:I

.field private i:I


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/instabug/library/network/toolbox/b;Lcom/instabug/library/activity/a$a;)V
    .locals 4

    .prologue
    .line 22
    const v0, 0x1030010

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 23
    iput-object p1, p0, Lcom/instabug/library/activity/a;->a:Landroid/app/Activity;

    .line 24
    iput-object p3, p0, Lcom/instabug/library/activity/a;->b:Lcom/instabug/library/activity/a$a;

    .line 25
    invoke-virtual {p0}, Lcom/instabug/library/activity/a;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "instabug_lyt_invocation"

    const-string v2, "layout"

    invoke-virtual {p0}, Lcom/instabug/library/activity/a;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/instabug/library/activity/a;->i:I

    .line 26
    iget v0, p0, Lcom/instabug/library/activity/a;->i:I

    invoke-virtual {p0, v0}, Lcom/instabug/library/activity/a;->setContentView(I)V

    .line 27
    iput-object p2, p0, Lcom/instabug/library/activity/a;->c:Lcom/instabug/library/network/toolbox/b;

    .line 28
    return-void
.end method

.method static synthetic a(Lcom/instabug/library/activity/a;)V
    .locals 0

    .prologue
    .line 14
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method


# virtual methods
.method public final cancel()V
    .locals 1

    .prologue
    .line 64
    invoke-virtual {p0}, Lcom/instabug/library/activity/a;->dismiss()V

    .line 65
    iget-object v0, p0, Lcom/instabug/library/activity/a;->b:Lcom/instabug/library/activity/a$a;

    invoke-interface {v0}, Lcom/instabug/library/activity/a$a;->a()V

    .line 66
    return-void
.end method

.method public final dismiss()V
    .locals 5

    .prologue
    .line 70
    iget-object v0, p0, Lcom/instabug/library/activity/a;->a:Landroid/app/Activity;

    invoke-virtual {p0}, Lcom/instabug/library/activity/a;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "instabug_anim_options_sheet_dismiss"

    const-string v3, "anim"

    invoke-virtual {p0}, Lcom/instabug/library/activity/a;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v4

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 71
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 72
    new-instance v1, Lcom/instabug/library/activity/b;

    invoke-direct {v1, p0}, Lcom/instabug/library/activity/b;-><init>(Lcom/instabug/library/activity/a;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 95
    iget v1, p0, Lcom/instabug/library/activity/a;->e:I

    invoke-virtual {p0, v1}, Lcom/instabug/library/activity/a;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 96
    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .locals 2

    .prologue
    .line 100
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 101
    iget v1, p0, Lcom/instabug/library/activity/a;->d:I

    if-ne v0, v1, :cond_1

    .line 102
    invoke-virtual {p0}, Lcom/instabug/library/activity/a;->cancel()V

    .line 108
    :cond_0
    :goto_0
    return-void

    .line 103
    :cond_1
    iget v1, p0, Lcom/instabug/library/activity/a;->f:I

    if-ne v0, v1, :cond_2

    .line 104
    iget-object v0, p0, Lcom/instabug/library/activity/a;->b:Lcom/instabug/library/activity/a$a;

    invoke-interface {v0}, Lcom/instabug/library/activity/a$a;->b()V

    goto :goto_0

    .line 105
    :cond_2
    iget v1, p0, Lcom/instabug/library/activity/a;->g:I

    if-ne v0, v1, :cond_0

    .line 106
    iget-object v0, p0, Lcom/instabug/library/activity/a;->b:Lcom/instabug/library/activity/a$a;

    invoke-interface {v0}, Lcom/instabug/library/activity/a$a;->c()V

    goto :goto_0
.end method

.method public final show()V
    .locals 4

    .prologue
    const/4 v2, -0x1

    .line 32
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v0}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .line 33
    invoke-virtual {p0}, Lcom/instabug/library/activity/a;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/WindowManager$LayoutParams;->copyFrom(Landroid/view/WindowManager$LayoutParams;)I

    .line 34
    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 35
    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 36
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 37
    invoke-virtual {p0}, Lcom/instabug/library/activity/a;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 38
    invoke-virtual {p0}, Lcom/instabug/library/activity/a;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "instabug_main_invocation"

    const-string v2, "id"

    invoke-virtual {p0}, Lcom/instabug/library/activity/a;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/instabug/library/activity/a;->d:I

    .line 39
    invoke-virtual {p0}, Lcom/instabug/library/activity/a;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "instabug_options_invocation"

    const-string v2, "id"

    invoke-virtual {p0}, Lcom/instabug/library/activity/a;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/instabug/library/activity/a;->e:I

    .line 40
    invoke-virtual {p0}, Lcom/instabug/library/activity/a;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "instabug_option_report_bug"

    const-string v2, "id"

    invoke-virtual {p0}, Lcom/instabug/library/activity/a;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/instabug/library/activity/a;->f:I

    .line 41
    invoke-virtual {p0}, Lcom/instabug/library/activity/a;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "instabug_option_send_feedback"

    const-string v2, "id"

    invoke-virtual {p0}, Lcom/instabug/library/activity/a;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/instabug/library/activity/a;->g:I

    .line 42
    invoke-virtual {p0}, Lcom/instabug/library/activity/a;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "instabug_anim_options_sheet"

    const-string v2, "anim"

    invoke-virtual {p0}, Lcom/instabug/library/activity/a;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/instabug/library/activity/a;->h:I

    .line 44
    iget v0, p0, Lcom/instabug/library/activity/a;->d:I

    invoke-virtual {p0, v0}, Lcom/instabug/library/activity/a;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    iget v0, p0, Lcom/instabug/library/activity/a;->e:I

    invoke-virtual {p0, v0}, Lcom/instabug/library/activity/a;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    iget v0, p0, Lcom/instabug/library/activity/a;->f:I

    invoke-virtual {p0, v0}, Lcom/instabug/library/activity/a;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    iget v0, p0, Lcom/instabug/library/activity/a;->g:I

    invoke-virtual {p0, v0}, Lcom/instabug/library/activity/a;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    iget v0, p0, Lcom/instabug/library/activity/a;->e:I

    invoke-virtual {p0, v0}, Lcom/instabug/library/activity/a;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/activity/a;->a:Landroid/app/Activity;

    iget v2, p0, Lcom/instabug/library/activity/a;->h:I

    .line 49
    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 51
    iget-object v0, p0, Lcom/instabug/library/activity/a;->c:Lcom/instabug/library/network/toolbox/b;

    if-eqz v0, :cond_0

    .line 52
    iget v0, p0, Lcom/instabug/library/activity/a;->e:I

    invoke-virtual {p0, v0}, Lcom/instabug/library/activity/a;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/activity/a;->c:Lcom/instabug/library/network/toolbox/b;

    iget v1, v1, Lcom/instabug/library/network/toolbox/b;->a:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 53
    iget v0, p0, Lcom/instabug/library/activity/a;->f:I

    invoke-virtual {p0, v0}, Lcom/instabug/library/activity/a;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/instabug/library/activity/a;->c:Lcom/instabug/library/network/toolbox/b;

    iget v1, v1, Lcom/instabug/library/network/toolbox/b;->b:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 54
    iget v0, p0, Lcom/instabug/library/activity/a;->g:I

    invoke-virtual {p0, v0}, Lcom/instabug/library/activity/a;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/instabug/library/activity/a;->c:Lcom/instabug/library/network/toolbox/b;

    iget v1, v1, Lcom/instabug/library/network/toolbox/b;->b:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 57
    :cond_0
    iget v0, p0, Lcom/instabug/library/activity/a;->f:I

    invoke-virtual {p0, v0}, Lcom/instabug/library/activity/a;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v1

    invoke-virtual {v1}, Lcom/instabug/library/Instabug;->getSettingsBundle()Lcom/instabug/library/x;

    move-result-object v1

    invoke-virtual {v1}, Lcom/instabug/library/x;->n()[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    iget v0, p0, Lcom/instabug/library/activity/a;->g:I

    invoke-virtual {p0, v0}, Lcom/instabug/library/activity/a;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v1

    invoke-virtual {v1}, Lcom/instabug/library/Instabug;->getSettingsBundle()Lcom/instabug/library/x;

    move-result-object v1

    invoke-virtual {v1}, Lcom/instabug/library/x;->n()[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    return-void
.end method
