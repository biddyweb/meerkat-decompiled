.class final Lcom/instabug/library/internal/storage/r;
.super Ljava/lang/Object;
.source "IssuesDataRepository.java"

# interfaces
.implements Lcom/instabug/library/internal/storage/e$a;


# instance fields
.field private synthetic a:Lcom/instabug/library/internal/storage/e$a;


# direct methods
.method constructor <init>(Lcom/instabug/library/internal/storage/q;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 0

    .prologue
    .line 25
    iput-object p2, p0, Lcom/instabug/library/internal/storage/r;->a:Lcom/instabug/library/internal/storage/e$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/instabug/library/model/a;)V
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/instabug/library/internal/storage/r;->a:Lcom/instabug/library/internal/storage/e$a;

    invoke-interface {v0, p1}, Lcom/instabug/library/internal/storage/e$a;->a(Lcom/instabug/library/model/a;)V

    .line 29
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/instabug/library/internal/storage/r;->a:Lcom/instabug/library/internal/storage/e$a;

    invoke-interface {v0, p1}, Lcom/instabug/library/internal/storage/e$a;->a(Ljava/lang/String;)V

    .line 34
    return-void
.end method
