.class final Lcom/instabug/library/internal/storage/k;
.super Ljava/lang/Object;
.source "IssueCloudDataStore.java"

# interfaces
.implements Lcom/instabug/library/internal/storage/a$b;


# instance fields
.field private synthetic a:Lcom/instabug/library/model/a;

.field private synthetic b:Lcom/instabug/library/internal/storage/e$a;

.field private synthetic c:Lcom/instabug/library/internal/storage/g;


# direct methods
.method constructor <init>(Lcom/instabug/library/internal/storage/g;Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 0

    .prologue
    .line 118
    iput-object p1, p0, Lcom/instabug/library/internal/storage/k;->c:Lcom/instabug/library/internal/storage/g;

    iput-object p2, p0, Lcom/instabug/library/internal/storage/k;->a:Lcom/instabug/library/model/a;

    iput-object p3, p0, Lcom/instabug/library/internal/storage/k;->b:Lcom/instabug/library/internal/storage/e$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Bitmap;Ljava/io/File;)V
    .locals 3

    .prologue
    .line 121
    iget-object v0, p0, Lcom/instabug/library/internal/storage/k;->a:Lcom/instabug/library/model/a;

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/instabug/library/model/a;->b(Ljava/lang/String;)V

    .line 122
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 123
    iget-object v0, p0, Lcom/instabug/library/internal/storage/k;->c:Lcom/instabug/library/internal/storage/g;

    iget-object v1, p0, Lcom/instabug/library/internal/storage/k;->a:Lcom/instabug/library/model/a;

    iget-object v2, p0, Lcom/instabug/library/internal/storage/k;->b:Lcom/instabug/library/internal/storage/e$a;

    invoke-static {v0, v1, v2}, Lcom/instabug/library/internal/storage/g;->b(Lcom/instabug/library/internal/storage/g;Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    .line 124
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lcom/instabug/library/internal/storage/k;->b:Lcom/instabug/library/internal/storage/e$a;

    invoke-interface {v0, p1}, Lcom/instabug/library/internal/storage/e$a;->a(Ljava/lang/String;)V

    .line 129
    return-void
.end method
