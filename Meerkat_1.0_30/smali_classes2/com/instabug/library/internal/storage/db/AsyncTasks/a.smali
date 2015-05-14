.class public final Lcom/instabug/library/internal/storage/db/AsyncTasks/a;
.super Landroid/os/AsyncTask;
.source "CacheBugReportTask.java"


# instance fields
.field private a:Lcom/instabug/library/internal/storage/d;

.field private b:Lcom/instabug/library/internal/storage/e$a;


# direct methods
.method public constructor <init>(Lcom/instabug/library/internal/storage/d;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/a;->a:Lcom/instabug/library/internal/storage/d;

    .line 19
    iput-object p2, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/a;->b:Lcom/instabug/library/internal/storage/e$a;

    .line 20
    return-void
.end method

.method private varargs a([Lcom/instabug/library/model/a;)Lcom/instabug/library/model/a;
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v0, 0x0

    .line 23
    aget-object v1, p1, v3

    if-eqz v1, :cond_0

    .line 25
    :try_start_0
    const-string v1, "CacheBugReportTask: Caching bug"

    invoke-static {v1}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 26
    iget-object v1, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/a;->a:Lcom/instabug/library/internal/storage/d;

    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-virtual {v1, v2}, Lcom/instabug/library/internal/storage/d;->a(Lcom/instabug/library/model/a;)V

    .line 27
    const-string v1, "CacheBugReportTask: Caching done"

    invoke-static {v1}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    iput-object v0, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/a;->a:Lcom/instabug/library/internal/storage/d;

    .line 34
    :cond_0
    aget-object v0, p1, v3

    :goto_0
    return-object v0

    .line 29
    :catch_0
    move-exception v1

    iput-object v0, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/a;->a:Lcom/instabug/library/internal/storage/d;

    goto :goto_0

    :catchall_0
    move-exception v1

    iput-object v0, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/a;->a:Lcom/instabug/library/internal/storage/d;

    throw v1
.end method


# virtual methods
.method protected final synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 13
    check-cast p1, [Lcom/instabug/library/model/a;

    invoke-direct {p0, p1}, Lcom/instabug/library/internal/storage/db/AsyncTasks/a;->a([Lcom/instabug/library/model/a;)Lcom/instabug/library/model/a;

    move-result-object v0

    return-object v0
.end method

.method protected final synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 13
    check-cast p1, Lcom/instabug/library/model/a;

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/a;->b:Lcom/instabug/library/internal/storage/e$a;

    invoke-interface {v0, p1}, Lcom/instabug/library/internal/storage/e$a;->a(Lcom/instabug/library/model/a;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/a;->b:Lcom/instabug/library/internal/storage/e$a;

    const-string v1, "Could not save issue to local DB cache"

    invoke-interface {v0, v1}, Lcom/instabug/library/internal/storage/e$a;->a(Ljava/lang/String;)V

    goto :goto_0
.end method
