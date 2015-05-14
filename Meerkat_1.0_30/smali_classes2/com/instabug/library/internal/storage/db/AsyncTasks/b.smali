.class public final Lcom/instabug/library/internal/storage/db/AsyncTasks/b;
.super Landroid/os/AsyncTask;
.source "DeleteBugReportTask.java"


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
    iput-object p1, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/b;->a:Lcom/instabug/library/internal/storage/d;

    .line 18
    iput-object p2, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/b;->b:Lcom/instabug/library/internal/storage/e$a;

    .line 19
    return-void
.end method

.method private varargs a([Lcom/instabug/library/model/a;)Ljava/lang/Boolean;
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 23
    aget-object v0, p1, v2

    if-eqz v0, :cond_0

    .line 25
    :try_start_0
    iget-object v0, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/b;->a:Lcom/instabug/library/internal/storage/d;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Lcom/instabug/library/internal/storage/d;->b(Lcom/instabug/library/model/a;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 29
    iput-object v3, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/b;->a:Lcom/instabug/library/internal/storage/d;

    .line 32
    :goto_0
    return-object v0

    .line 26
    :catch_0
    move-exception v0

    .line 27
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    iput-object v3, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/b;->a:Lcom/instabug/library/internal/storage/d;

    .line 32
    :cond_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 29
    :catchall_0
    move-exception v0

    iput-object v3, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/b;->a:Lcom/instabug/library/internal/storage/d;

    throw v0
.end method


# virtual methods
.method protected final synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 12
    check-cast p1, [Lcom/instabug/library/model/a;

    invoke-direct {p0, p1}, Lcom/instabug/library/internal/storage/db/AsyncTasks/b;->a([Lcom/instabug/library/model/a;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected final synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 12
    check-cast p1, Ljava/lang/Boolean;

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/b;->b:Lcom/instabug/library/internal/storage/e$a;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/instabug/library/internal/storage/e$a;->a(Lcom/instabug/library/model/a;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/instabug/library/internal/storage/db/AsyncTasks/b;->b:Lcom/instabug/library/internal/storage/e$a;

    const-string v1, "Could not delete issue from local DB cache"

    invoke-interface {v0, v1}, Lcom/instabug/library/internal/storage/e$a;->a(Ljava/lang/String;)V

    goto :goto_0
.end method
