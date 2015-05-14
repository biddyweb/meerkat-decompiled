.class final Lcom/instabug/library/presenter/b;
.super Ljava/lang/Object;
.source "AnnotationPresenter.java"

# interfaces
.implements Lcom/instabug/library/internal/storage/a$a;


# instance fields
.field private synthetic a:Lcom/instabug/library/presenter/a;


# direct methods
.method constructor <init>(Lcom/instabug/library/presenter/a;)V
    .locals 0

    .prologue
    .line 53
    iput-object p1, p0, Lcom/instabug/library/presenter/b;->a:Lcom/instabug/library/presenter/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/instabug/library/presenter/b;->a:Lcom/instabug/library/presenter/a;

    invoke-static {v0}, Lcom/instabug/library/presenter/a;->a(Lcom/instabug/library/presenter/a;)Lcom/instabug/library/view/a;

    move-result-object v0

    invoke-interface {v0}, Lcom/instabug/library/view/a;->g()V

    .line 62
    return-void
.end method

.method public final a(Landroid/graphics/Bitmap;)V
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/instabug/library/presenter/b;->a:Lcom/instabug/library/presenter/a;

    invoke-static {v0}, Lcom/instabug/library/presenter/a;->a(Lcom/instabug/library/presenter/a;)Lcom/instabug/library/view/a;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/instabug/library/view/a;->a(Landroid/graphics/Bitmap;)V

    .line 57
    return-void
.end method
