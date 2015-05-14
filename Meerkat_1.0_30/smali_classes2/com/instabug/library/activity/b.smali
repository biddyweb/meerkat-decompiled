.class final Lcom/instabug/library/activity/b;
.super Ljava/lang/Object;
.source "InstabugInvocationDialog.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# instance fields
.field final synthetic a:Lcom/instabug/library/activity/a;


# direct methods
.method constructor <init>(Lcom/instabug/library/activity/a;)V
    .locals 0

    .prologue
    .line 72
    iput-object p1, p0, Lcom/instabug/library/activity/b;->a:Lcom/instabug/library/activity/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 2

    .prologue
    .line 80
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 81
    new-instance v1, Lcom/instabug/library/activity/c;

    invoke-direct {v1, p0}, Lcom/instabug/library/activity/c;-><init>(Lcom/instabug/library/activity/b;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 88
    return-void
.end method

.method public final onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    .prologue
    .line 93
    return-void
.end method

.method public final onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0

    .prologue
    .line 76
    return-void
.end method
