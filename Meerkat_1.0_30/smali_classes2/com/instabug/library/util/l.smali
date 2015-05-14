.class final Lcom/instabug/library/util/l;
.super Ljava/lang/Object;
.source "ScreenshotProvider.java"

# interfaces
.implements Lcom/instabug/library/internal/storage/a$b;


# instance fields
.field private synthetic a:Lcom/instabug/library/util/j$a;


# direct methods
.method constructor <init>(Lcom/instabug/library/util/j;Lcom/instabug/library/util/j$a;)V
    .locals 0

    .prologue
    .line 39
    iput-object p2, p0, Lcom/instabug/library/util/l;->a:Lcom/instabug/library/util/j$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Bitmap;Ljava/io/File;)V
    .locals 1

    .prologue
    .line 42
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 43
    iget-object v0, p0, Lcom/instabug/library/util/l;->a:Lcom/instabug/library/util/j$a;

    invoke-interface {v0, p2}, Lcom/instabug/library/util/j$a;->a(Ljava/io/File;)V

    .line 44
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/instabug/library/util/l;->a:Lcom/instabug/library/util/j$a;

    invoke-interface {v0, p1}, Lcom/instabug/library/util/j$a;->a(Ljava/lang/String;)V

    .line 49
    return-void
.end method
