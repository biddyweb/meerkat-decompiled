.class final Lcom/instabug/library/internal/storage/m;
.super Ljava/lang/Object;
.source "IssueCloudDataStore.java"

# interfaces
.implements Lcom/instabug/library/network/restapi/a$a;


# instance fields
.field private synthetic a:Lcom/instabug/library/model/a;

.field private synthetic b:Lcom/instabug/library/internal/storage/e$a;

.field private synthetic c:Lcom/instabug/library/internal/storage/g;


# direct methods
.method constructor <init>(Lcom/instabug/library/internal/storage/g;Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 0

    .prologue
    .line 148
    iput-object p1, p0, Lcom/instabug/library/internal/storage/m;->c:Lcom/instabug/library/internal/storage/g;

    iput-object p2, p0, Lcom/instabug/library/internal/storage/m;->a:Lcom/instabug/library/model/a;

    iput-object p3, p0, Lcom/instabug/library/internal/storage/m;->b:Lcom/instabug/library/internal/storage/e$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(J)V
    .locals 3

    .prologue
    .line 151
    iget-object v0, p0, Lcom/instabug/library/internal/storage/m;->a:Lcom/instabug/library/model/a;

    invoke-virtual {v0, p1, p2}, Lcom/instabug/library/model/a;->b(J)V

    .line 152
    iget-object v0, p0, Lcom/instabug/library/internal/storage/m;->a:Lcom/instabug/library/model/a;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/instabug/library/model/a;->b(I)V

    .line 153
    iget-object v0, p0, Lcom/instabug/library/internal/storage/m;->a:Lcom/instabug/library/model/a;

    invoke-virtual {v0}, Lcom/instabug/library/model/a;->d()V

    .line 154
    iget-object v0, p0, Lcom/instabug/library/internal/storage/m;->c:Lcom/instabug/library/internal/storage/g;

    iget-object v1, p0, Lcom/instabug/library/internal/storage/m;->a:Lcom/instabug/library/model/a;

    iget-object v2, p0, Lcom/instabug/library/internal/storage/m;->b:Lcom/instabug/library/internal/storage/e$a;

    invoke-static {v0, v1, v2}, Lcom/instabug/library/internal/storage/g;->a(Lcom/instabug/library/internal/storage/g;Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    .line 156
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lcom/instabug/library/internal/storage/m;->b:Lcom/instabug/library/internal/storage/e$a;

    invoke-interface {v0, p1}, Lcom/instabug/library/internal/storage/e$a;->a(Ljava/lang/String;)V

    .line 161
    return-void
.end method
