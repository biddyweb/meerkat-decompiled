.class final Lcom/instabug/library/internal/storage/b;
.super Lcom/instabug/library/internal/storage/t;
.source "BitmapFileManager.java"


# instance fields
.field private synthetic a:Lcom/instabug/library/internal/storage/a$b;

.field private synthetic b:Landroid/graphics/Bitmap;


# direct methods
.method constructor <init>(Lcom/instabug/library/internal/storage/a;Landroid/content/Context;Ljava/lang/String;Lcom/instabug/library/internal/storage/a$b;Landroid/graphics/Bitmap;)V
    .locals 0

    .prologue
    .line 20
    iput-object p4, p0, Lcom/instabug/library/internal/storage/b;->a:Lcom/instabug/library/internal/storage/a$b;

    iput-object p5, p0, Lcom/instabug/library/internal/storage/b;->b:Landroid/graphics/Bitmap;

    invoke-direct {p0, p2, p3}, Lcom/instabug/library/internal/storage/t;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected final synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 20
    check-cast p1, Ljava/io/File;

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/instabug/library/internal/storage/b;->a:Lcom/instabug/library/internal/storage/a$b;

    iget-object v1, p0, Lcom/instabug/library/internal/storage/b;->b:Landroid/graphics/Bitmap;

    invoke-interface {v0, v1, p1}, Lcom/instabug/library/internal/storage/a$b;->a(Landroid/graphics/Bitmap;Ljava/io/File;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/instabug/library/internal/storage/b;->a:Lcom/instabug/library/internal/storage/a$b;

    const-string v1, "Could not store screenshot to file. Please make sure you request the proper permissions"

    invoke-interface {v0, v1}, Lcom/instabug/library/internal/storage/a$b;->a(Ljava/lang/String;)V

    goto :goto_0
.end method
