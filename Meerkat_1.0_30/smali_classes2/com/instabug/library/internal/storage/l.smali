.class final Lcom/instabug/library/internal/storage/l;
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
    .line 134
    iput-object p1, p0, Lcom/instabug/library/internal/storage/l;->b:Lcom/instabug/library/internal/storage/g;

    iput-object p2, p0, Lcom/instabug/library/internal/storage/l;->a:Lcom/instabug/library/internal/storage/e$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/instabug/library/model/a;)V
    .locals 2

    .prologue
    .line 137
    iget-object v0, p0, Lcom/instabug/library/internal/storage/l;->b:Lcom/instabug/library/internal/storage/g;

    iget-object v1, p0, Lcom/instabug/library/internal/storage/l;->a:Lcom/instabug/library/internal/storage/e$a;

    invoke-static {v0, p1, v1}, Lcom/instabug/library/internal/storage/g;->c(Lcom/instabug/library/internal/storage/g;Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    .line 138
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lcom/instabug/library/internal/storage/l;->a:Lcom/instabug/library/internal/storage/e$a;

    invoke-interface {v0, p1}, Lcom/instabug/library/internal/storage/e$a;->a(Ljava/lang/String;)V

    .line 143
    return-void
.end method
