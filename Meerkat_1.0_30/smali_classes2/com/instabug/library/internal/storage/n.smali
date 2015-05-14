.class final Lcom/instabug/library/internal/storage/n;
.super Ljava/lang/Object;
.source "IssueCloudDataStore.java"

# interfaces
.implements Lcom/instabug/library/internal/storage/e$a;


# instance fields
.field private synthetic a:Lcom/instabug/library/internal/storage/e$a;

.field private synthetic b:Lcom/instabug/library/internal/storage/g;


# direct methods
.method constructor <init>(Lcom/instabug/library/internal/storage/g;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 0

    .prologue
    .line 166
    iput-object p1, p0, Lcom/instabug/library/internal/storage/n;->b:Lcom/instabug/library/internal/storage/g;

    iput-object p2, p0, Lcom/instabug/library/internal/storage/n;->a:Lcom/instabug/library/internal/storage/e$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/instabug/library/model/a;)V
    .locals 2

    .prologue
    .line 169
    invoke-virtual {p1}, Lcom/instabug/library/model/a;->c()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 170
    iget-object v0, p0, Lcom/instabug/library/internal/storage/n;->a:Lcom/instabug/library/internal/storage/e$a;

    invoke-interface {v0, p1}, Lcom/instabug/library/internal/storage/e$a;->a(Lcom/instabug/library/model/a;)V

    .line 171
    iget-object v0, p0, Lcom/instabug/library/internal/storage/n;->b:Lcom/instabug/library/internal/storage/g;

    invoke-static {v0}, Lcom/instabug/library/internal/storage/g;->a(Lcom/instabug/library/internal/storage/g;)Lcom/instabug/library/internal/storage/e;

    move-result-object v0

    new-instance v1, Lcom/instabug/library/internal/storage/o;

    invoke-direct {v1, p0}, Lcom/instabug/library/internal/storage/o;-><init>(Lcom/instabug/library/internal/storage/n;)V

    invoke-virtual {v0, p1, v1}, Lcom/instabug/library/internal/storage/e;->c(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    .line 185
    :goto_0
    return-void

    .line 183
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/internal/storage/n;->b:Lcom/instabug/library/internal/storage/g;

    iget-object v1, p0, Lcom/instabug/library/internal/storage/n;->a:Lcom/instabug/library/internal/storage/e$a;

    invoke-virtual {v0, p1, v1}, Lcom/instabug/library/internal/storage/g;->a(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    goto :goto_0
.end method

.method public final a(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 189
    iget-object v0, p0, Lcom/instabug/library/internal/storage/n;->a:Lcom/instabug/library/internal/storage/e$a;

    invoke-interface {v0, p1}, Lcom/instabug/library/internal/storage/e$a;->a(Ljava/lang/String;)V

    .line 190
    return-void
.end method
