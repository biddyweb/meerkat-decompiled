.class final Lcom/instabug/library/internal/storage/f;
.super Ljava/lang/Object;
.source "IssueCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:Lcom/instabug/library/model/a;

.field private synthetic b:Lcom/instabug/library/internal/storage/e$a;

.field private synthetic c:Lcom/instabug/library/internal/storage/e;


# direct methods
.method constructor <init>(Lcom/instabug/library/internal/storage/e;Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 0

    .prologue
    .line 21
    iput-object p1, p0, Lcom/instabug/library/internal/storage/f;->c:Lcom/instabug/library/internal/storage/e;

    iput-object p2, p0, Lcom/instabug/library/internal/storage/f;->a:Lcom/instabug/library/model/a;

    iput-object p3, p0, Lcom/instabug/library/internal/storage/f;->b:Lcom/instabug/library/internal/storage/e$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .prologue
    .line 24
    iget-object v0, p0, Lcom/instabug/library/internal/storage/f;->c:Lcom/instabug/library/internal/storage/e;

    invoke-static {v0}, Lcom/instabug/library/internal/storage/e;->a(Lcom/instabug/library/internal/storage/e;)Lcom/instabug/library/internal/storage/d;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/internal/storage/f;->a:Lcom/instabug/library/model/a;

    invoke-virtual {v0, v1}, Lcom/instabug/library/internal/storage/d;->a(Lcom/instabug/library/model/a;)V

    .line 25
    const-string v0, "Crash saved in local DB cache"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 26
    iget-object v0, p0, Lcom/instabug/library/internal/storage/f;->b:Lcom/instabug/library/internal/storage/e$a;

    iget-object v1, p0, Lcom/instabug/library/internal/storage/f;->a:Lcom/instabug/library/model/a;

    invoke-interface {v0, v1}, Lcom/instabug/library/internal/storage/e$a;->a(Lcom/instabug/library/model/a;)V

    .line 27
    return-void
.end method
