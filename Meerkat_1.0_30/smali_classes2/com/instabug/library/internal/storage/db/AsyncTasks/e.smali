.class public final Lcom/instabug/library/internal/storage/db/AsyncTasks/e;
.super Landroid/os/AsyncTask;
.source "UpdateBugReportTask.java"


# instance fields
.field private a:Lcom/instabug/library/internal/storage/d;

.field private b:Lcom/instabug/library/internal/storage/e$a;


# direct methods
.method public constructor <init>(Lcom/instabug/library/internal/storage/d;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/e;->a:Lcom/instabug/library/internal/storage/d;

    .line 18
    iput-object p2, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/e;->b:Lcom/instabug/library/internal/storage/e$a;

    .line 19
    return-void
.end method

.method private varargs a([Lcom/instabug/library/model/a;)Lcom/instabug/library/model/a;
    .locals 3

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 23
    aget-object v0, p1, v0

    if-eqz v0, :cond_1

    .line 25
    :try_start_0
    iget-object v0, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/e;->a:Lcom/instabug/library/internal/storage/d;

    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-virtual {v0, v2}, Lcom/instabug/library/internal/storage/d;->c(Lcom/instabug/library/model/a;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 26
    const/4 v0, 0x0

    aget-object v0, p1, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    iput-object v1, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/e;->a:Lcom/instabug/library/internal/storage/d;

    .line 33
    :goto_0
    return-object v0

    .line 30
    :cond_0
    iput-object v1, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/e;->a:Lcom/instabug/library/internal/storage/d;

    :cond_1
    :goto_1
    move-object v0, v1

    .line 33
    goto :goto_0

    .line 27
    :catch_0
    move-exception v0

    .line 28
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    iput-object v1, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/e;->a:Lcom/instabug/library/internal/storage/d;

    goto :goto_1

    :catchall_0
    move-exception v0

    iput-object v1, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/e;->a:Lcom/instabug/library/internal/storage/d;

    throw v0
.end method


# virtual methods
.method protected final synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 12
    check-cast p1, [Lcom/instabug/library/model/a;

    invoke-direct {p0, p1}, Lcom/instabug/library/internal/storage/db/AsyncTasks/e;->a([Lcom/instabug/library/model/a;)Lcom/instabug/library/model/a;

    move-result-object v0

    return-object v0
.end method

.method protected final synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 12
    check-cast p1, Lcom/instabug/library/model/a;

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/e;->b:Lcom/instabug/library/internal/storage/e$a;

    invoke-interface {v0, p1}, Lcom/instabug/library/internal/storage/e$a;->a(Lcom/instabug/library/model/a;)V

    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/e;->a:Lcom/instabug/library/internal/storage/d;

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/e;->b:Lcom/instabug/library/internal/storage/e$a;

    const-string v1, "Could not update issue in local DB cache"

    invoke-interface {v0, v1}, Lcom/instabug/library/internal/storage/e$a;->a(Ljava/lang/String;)V

    goto :goto_0
.end method
