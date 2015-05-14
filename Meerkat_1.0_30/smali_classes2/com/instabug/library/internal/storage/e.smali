.class public final Lcom/instabug/library/internal/storage/e;
.super Ljava/lang/Object;
.source "IssueCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/internal/storage/e$a;
    }
.end annotation


# instance fields
.field private a:Lcom/instabug/library/internal/storage/d;


# direct methods
.method public constructor <init>(Lcom/instabug/library/internal/storage/d;)V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/instabug/library/internal/storage/e;->a:Lcom/instabug/library/internal/storage/d;

    .line 18
    return-void
.end method

.method static synthetic a(Lcom/instabug/library/internal/storage/e;)Lcom/instabug/library/internal/storage/d;
    .locals 1

    .prologue
    .line 12
    iget-object v0, p0, Lcom/instabug/library/internal/storage/e;->a:Lcom/instabug/library/internal/storage/d;

    return-object v0
.end method


# virtual methods
.method public final a()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/instabug/library/internal/storage/e;->a:Lcom/instabug/library/internal/storage/d;

    invoke-virtual {v0}, Lcom/instabug/library/internal/storage/d;->a()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public final a(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 2

    .prologue
    .line 21
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/instabug/library/internal/storage/f;

    invoke-direct {v1, p0, p1, p2}, Lcom/instabug/library/internal/storage/f;-><init>(Lcom/instabug/library/internal/storage/e;Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 28
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 29
    return-void
.end method

.method public final b(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 3

    .prologue
    .line 32
    new-instance v0, Lcom/instabug/library/internal/storage/db/AsyncTasks/a;

    iget-object v1, p0, Lcom/instabug/library/internal/storage/e;->a:Lcom/instabug/library/internal/storage/d;

    invoke-direct {v0, v1, p2}, Lcom/instabug/library/internal/storage/db/AsyncTasks/a;-><init>(Lcom/instabug/library/internal/storage/d;Lcom/instabug/library/internal/storage/e$a;)V

    .line 33
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/instabug/library/model/a;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/instabug/library/internal/storage/db/AsyncTasks/a;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 34
    return-void
.end method

.method public final c(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 3

    .prologue
    .line 37
    new-instance v0, Lcom/instabug/library/internal/storage/db/AsyncTasks/b;

    iget-object v1, p0, Lcom/instabug/library/internal/storage/e;->a:Lcom/instabug/library/internal/storage/d;

    invoke-direct {v0, v1, p2}, Lcom/instabug/library/internal/storage/db/AsyncTasks/b;-><init>(Lcom/instabug/library/internal/storage/d;Lcom/instabug/library/internal/storage/e$a;)V

    .line 38
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/instabug/library/model/a;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/instabug/library/internal/storage/db/AsyncTasks/b;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 39
    return-void
.end method

.method public final d(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 3

    .prologue
    .line 43
    new-instance v0, Lcom/instabug/library/internal/storage/db/AsyncTasks/e;

    iget-object v1, p0, Lcom/instabug/library/internal/storage/e;->a:Lcom/instabug/library/internal/storage/d;

    invoke-direct {v0, v1, p2}, Lcom/instabug/library/internal/storage/db/AsyncTasks/e;-><init>(Lcom/instabug/library/internal/storage/d;Lcom/instabug/library/internal/storage/e$a;)V

    .line 44
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/instabug/library/model/a;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/instabug/library/internal/storage/db/AsyncTasks/e;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 45
    return-void
.end method
