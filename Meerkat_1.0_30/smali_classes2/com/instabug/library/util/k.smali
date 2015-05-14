.class final Lcom/instabug/library/util/k;
.super Ljava/lang/Object;
.source "ScreenshotProvider.java"

# interfaces
.implements Lcom/instabug/library/util/h$a;


# instance fields
.field private synthetic a:Lcom/instabug/library/util/j$a;

.field private synthetic b:Lcom/instabug/library/util/j;


# direct methods
.method constructor <init>(Lcom/instabug/library/util/j;Lcom/instabug/library/util/j$a;)V
    .locals 0

    .prologue
    .line 18
    iput-object p1, p0, Lcom/instabug/library/util/k;->b:Lcom/instabug/library/util/j;

    iput-object p2, p0, Lcom/instabug/library/util/k;->a:Lcom/instabug/library/util/j$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Bitmap;)V
    .locals 2

    .prologue
    .line 21
    const-string v0, "ScreenshotProvider: Screenshot captured. Saving to file.."

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 22
    iget-object v0, p0, Lcom/instabug/library/util/k;->b:Lcom/instabug/library/util/j;

    iget-object v1, p0, Lcom/instabug/library/util/k;->a:Lcom/instabug/library/util/j$a;

    invoke-static {v0, p1, v1}, Lcom/instabug/library/util/j;->a(Lcom/instabug/library/util/j;Landroid/graphics/Bitmap;Lcom/instabug/library/util/j$a;)V

    .line 23
    return-void
.end method

.method public final a(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 2

    .prologue
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ScreenshotProvider: Screenshot capture failed: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 28
    if-eqz p2, :cond_0

    .line 29
    const-string v0, "com.instabug.library"

    invoke-static {v0, p2}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 32
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/util/k;->a:Lcom/instabug/library/util/j$a;

    invoke-interface {v0, p1}, Lcom/instabug/library/util/j$a;->a(Ljava/lang/String;)V

    .line 33
    return-void
.end method
