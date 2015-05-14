.class final Lcom/instabug/library/internal/view/a;
.super Ljava/lang/Object;
.source "AnimatedImageView.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:Lcom/instabug/library/internal/view/AnimatedImageView;


# direct methods
.method constructor <init>(Lcom/instabug/library/internal/view/AnimatedImageView;)V
    .locals 0

    .prologue
    .line 17
    iput-object p1, p0, Lcom/instabug/library/internal/view/a;->a:Lcom/instabug/library/internal/view/AnimatedImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .prologue
    .line 20
    iget-object v0, p0, Lcom/instabug/library/internal/view/a;->a:Lcom/instabug/library/internal/view/AnimatedImageView;

    invoke-static {v0}, Lcom/instabug/library/internal/view/AnimatedImageView;->a(Lcom/instabug/library/internal/view/AnimatedImageView;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 21
    iget-object v0, p0, Lcom/instabug/library/internal/view/a;->a:Lcom/instabug/library/internal/view/AnimatedImageView;

    iget-object v1, p0, Lcom/instabug/library/internal/view/a;->a:Lcom/instabug/library/internal/view/AnimatedImageView;

    invoke-static {v1}, Lcom/instabug/library/internal/view/AnimatedImageView;->a(Lcom/instabug/library/internal/view/AnimatedImageView;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/instabug/library/internal/view/AnimatedImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 23
    :cond_0
    return-void
.end method
