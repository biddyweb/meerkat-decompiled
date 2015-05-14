.class Lcom/nanotasks/Task;
.super Lcom/nanotasks/AbstractTask;
.source "Task.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/nanotasks/AbstractTask",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private completion:Lcom/nanotasks/Completion;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nanotasks/Completion",
            "<TT;>;"
        }
    .end annotation
.end field

.field private weakContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/nanotasks/BackgroundWork;Lcom/nanotasks/Completion;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/nanotasks/BackgroundWork",
            "<TT;>;",
            "Lcom/nanotasks/Completion",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 17
    .local p0, "this":Lcom/nanotasks/Task;, "Lcom/nanotasks/Task<TT;>;"
    .local p2, "backgroundWork":Lcom/nanotasks/BackgroundWork;, "Lcom/nanotasks/BackgroundWork<TT;>;"
    .local p3, "completion":Lcom/nanotasks/Completion;, "Lcom/nanotasks/Completion<TT;>;"
    invoke-direct {p0, p2}, Lcom/nanotasks/AbstractTask;-><init>(Lcom/nanotasks/BackgroundWork;)V

    .line 18
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nanotasks/Task;->weakContext:Ljava/lang/ref/WeakReference;

    .line 19
    iput-object p3, p0, Lcom/nanotasks/Task;->completion:Lcom/nanotasks/Completion;

    .line 20
    return-void
.end method


# virtual methods
.method protected onError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 32
    .local p0, "this":Lcom/nanotasks/Task;, "Lcom/nanotasks/Task<TT;>;"
    iget-object v1, p0, Lcom/nanotasks/Task;->weakContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 33
    .local v0, "context":Landroid/content/Context;
    iget-object v1, p0, Lcom/nanotasks/Task;->completion:Lcom/nanotasks/Completion;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 34
    iget-object v1, p0, Lcom/nanotasks/Task;->completion:Lcom/nanotasks/Completion;

    invoke-interface {v1, v0, p1}, Lcom/nanotasks/Completion;->onError(Landroid/content/Context;Ljava/lang/Exception;)V

    .line 36
    :cond_0
    return-void
.end method

.method protected onSuccess(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p0, "this":Lcom/nanotasks/Task;, "Lcom/nanotasks/Task<TT;>;"
    .local p1, "result":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lcom/nanotasks/Task;->weakContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 25
    .local v0, "context":Landroid/content/Context;
    iget-object v1, p0, Lcom/nanotasks/Task;->completion:Lcom/nanotasks/Completion;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 26
    iget-object v1, p0, Lcom/nanotasks/Task;->completion:Lcom/nanotasks/Completion;

    invoke-interface {v1, v0, p1}, Lcom/nanotasks/Completion;->onSuccess(Landroid/content/Context;Ljava/lang/Object;)V

    .line 28
    :cond_0
    return-void
.end method
