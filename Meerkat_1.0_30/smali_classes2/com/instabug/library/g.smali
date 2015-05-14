.class final Lcom/instabug/library/g;
.super Ljava/lang/Object;
.source "InstabugAnnotationScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:Lcom/instabug/library/b;


# direct methods
.method constructor <init>(Lcom/instabug/library/b;)V
    .locals 0

    .prologue
    .line 588
    iput-object p1, p0, Lcom/instabug/library/g;->a:Lcom/instabug/library/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .prologue
    .line 591
    iget-object v0, p0, Lcom/instabug/library/g;->a:Lcom/instabug/library/b;

    invoke-static {v0}, Lcom/instabug/library/b;->e(Lcom/instabug/library/b;)Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 592
    iget-object v1, p0, Lcom/instabug/library/g;->a:Lcom/instabug/library/b;

    invoke-static {v1}, Lcom/instabug/library/b;->f(Lcom/instabug/library/b;)Lcom/instabug/library/view/AnnotationView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/instabug/library/view/AnnotationView;->getMeasuredWidth()I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 593
    iget-object v1, p0, Lcom/instabug/library/g;->a:Lcom/instabug/library/b;

    invoke-static {v1}, Lcom/instabug/library/b;->e(Lcom/instabug/library/b;)Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 594
    return-void
.end method
