.class final Lcom/instabug/library/internal/storage/c;
.super Lcom/instabug/library/internal/storage/db/AsyncTasks/d;
.source "BitmapFileManager.java"


# instance fields
.field private synthetic a:Lcom/instabug/library/internal/storage/a$a;


# direct methods
.method constructor <init>(Lcom/instabug/library/internal/storage/a;Lcom/instabug/library/internal/storage/a$a;)V
    .locals 0

    .prologue
    .line 39
    iput-object p2, p0, Lcom/instabug/library/internal/storage/c;->a:Lcom/instabug/library/internal/storage/a$a;

    invoke-direct {p0}, Lcom/instabug/library/internal/storage/db/AsyncTasks/d;-><init>()V

    return-void
.end method


# virtual methods
.method protected final synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 1

    .prologue
    .line 39
    check-cast p1, Landroid/graphics/Bitmap;

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/instabug/library/internal/storage/c;->a:Lcom/instabug/library/internal/storage/a$a;

    invoke-interface {v0, p1}, Lcom/instabug/library/internal/storage/a$a;->a(Landroid/graphics/Bitmap;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/instabug/library/internal/storage/c;->a:Lcom/instabug/library/internal/storage/a$a;

    invoke-interface {v0}, Lcom/instabug/library/internal/storage/a$a;->a()V

    goto :goto_0
.end method
