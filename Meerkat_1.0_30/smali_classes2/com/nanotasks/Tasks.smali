.class public final Lcom/nanotasks/Tasks;
.super Ljava/lang/Object;
.source "Tasks.java"


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public static executeInBackground(Landroid/content/Context;Lcom/nanotasks/BackgroundWork;Lcom/nanotasks/Completion;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/content/Context;",
            "Lcom/nanotasks/BackgroundWork",
            "<TT;>;",
            "Lcom/nanotasks/Completion",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 21
    .local p1, "backgroundWork":Lcom/nanotasks/BackgroundWork;, "Lcom/nanotasks/BackgroundWork<TT;>;"
    .local p2, "completion":Lcom/nanotasks/Completion;, "Lcom/nanotasks/Completion<TT;>;"
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 22
    sget-object v0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-static {p0, p1, p2, v0}, Lcom/nanotasks/Tasks;->executeInBackground(Landroid/content/Context;Lcom/nanotasks/BackgroundWork;Lcom/nanotasks/Completion;Ljava/util/concurrent/Executor;)V

    .line 26
    :goto_0
    return-void

    .line 24
    :cond_0
    new-instance v0, Lcom/nanotasks/Task;

    invoke-direct {v0, p0, p1, p2}, Lcom/nanotasks/Task;-><init>(Landroid/content/Context;Lcom/nanotasks/BackgroundWork;Lcom/nanotasks/Completion;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/nanotasks/Task;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method

.method public static executeInBackground(Landroid/content/Context;Lcom/nanotasks/BackgroundWork;Lcom/nanotasks/Completion;Ljava/util/concurrent/Executor;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/content/Context;",
            "Lcom/nanotasks/BackgroundWork",
            "<TT;>;",
            "Lcom/nanotasks/Completion",
            "<TT;>;",
            "Ljava/util/concurrent/Executor;",
            ")V"
        }
    .end annotation

    .prologue
    .line 30
    .local p1, "backgroundWork":Lcom/nanotasks/BackgroundWork;, "Lcom/nanotasks/BackgroundWork<TT;>;"
    .local p2, "completion":Lcom/nanotasks/Completion;, "Lcom/nanotasks/Completion<TT;>;"
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 31
    new-instance v0, Lcom/nanotasks/Task;

    invoke-direct {v0, p0, p1, p2}, Lcom/nanotasks/Task;-><init>(Landroid/content/Context;Lcom/nanotasks/BackgroundWork;Lcom/nanotasks/Completion;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, p3, v1}, Lcom/nanotasks/Task;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 35
    return-void

    .line 33
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "you cannot use a custom executor on pre honeycomb devices"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
