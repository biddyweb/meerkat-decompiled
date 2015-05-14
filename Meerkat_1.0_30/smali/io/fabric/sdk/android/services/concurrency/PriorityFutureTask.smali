.class public Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;
.super Ljava/util/concurrent/FutureTask;
.source "PriorityFutureTask.java"

# interfaces
.implements Lio/fabric/sdk/android/services/concurrency/DelegateProvider;
.implements Lio/fabric/sdk/android/services/concurrency/Dependency;
.implements Lio/fabric/sdk/android/services/concurrency/PriorityProvider;
.implements Lio/fabric/sdk/android/services/concurrency/Task;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/FutureTask",
        "<TV;>;",
        "Lio/fabric/sdk/android/services/concurrency/Dependency",
        "<",
        "Lio/fabric/sdk/android/services/concurrency/Task;",
        ">;",
        "Lio/fabric/sdk/android/services/concurrency/PriorityProvider;",
        "Lio/fabric/sdk/android/services/concurrency/Task;",
        "Lio/fabric/sdk/android/services/concurrency/DelegateProvider;"
    }
.end annotation


# instance fields
.field final delegate:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;Ljava/lang/Object;)V
    .locals 1
    .param p1, "runnable"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            "TV;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "this":Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;, "Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask<TV;>;"
    .local p2, "result":Ljava/lang/Object;, "TV;"
    invoke-direct {p0, p1, p2}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/lang/Runnable;Ljava/lang/Object;)V

    .line 28
    invoke-virtual {p0, p1}, Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;->checkAndInitDelegate(Ljava/lang/Object;)Lio/fabric/sdk/android/services/concurrency/Dependency;

    move-result-object v0

    iput-object v0, p0, Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;->delegate:Ljava/lang/Object;

    .line 29
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Callable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<TV;>;)V"
        }
    .end annotation

    .prologue
    .line 22
    .local p0, "this":Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;, "Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask<TV;>;"
    .local p1, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TV;>;"
    invoke-direct {p0, p1}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 23
    invoke-virtual {p0, p1}, Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;->checkAndInitDelegate(Ljava/lang/Object;)Lio/fabric/sdk/android/services/concurrency/Dependency;

    move-result-object v0

    iput-object v0, p0, Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;->delegate:Ljava/lang/Object;

    .line 24
    return-void
.end method


# virtual methods
.method public addDependency(Lio/fabric/sdk/android/services/concurrency/Task;)V
    .locals 1
    .param p1, "task"    # Lio/fabric/sdk/android/services/concurrency/Task;

    .prologue
    .line 38
    .local p0, "this":Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;, "Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask<TV;>;"
    invoke-virtual {p0}, Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;->getDelegate()Lio/fabric/sdk/android/services/concurrency/Dependency;

    move-result-object v0

    check-cast v0, Lio/fabric/sdk/android/services/concurrency/PriorityProvider;

    check-cast v0, Lio/fabric/sdk/android/services/concurrency/Dependency;

    invoke-interface {v0, p1}, Lio/fabric/sdk/android/services/concurrency/Dependency;->addDependency(Ljava/lang/Object;)V

    .line 39
    return-void
.end method

.method public bridge synthetic addDependency(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 16
    .local p0, "this":Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;, "Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask<TV;>;"
    check-cast p1, Lio/fabric/sdk/android/services/concurrency/Task;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;->addDependency(Lio/fabric/sdk/android/services/concurrency/Task;)V

    return-void
.end method

.method public areDependenciesMet()Z
    .locals 1

    .prologue
    .line 48
    .local p0, "this":Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;, "Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask<TV;>;"
    invoke-virtual {p0}, Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;->getDelegate()Lio/fabric/sdk/android/services/concurrency/Dependency;

    move-result-object v0

    check-cast v0, Lio/fabric/sdk/android/services/concurrency/PriorityProvider;

    check-cast v0, Lio/fabric/sdk/android/services/concurrency/Dependency;

    invoke-interface {v0}, Lio/fabric/sdk/android/services/concurrency/Dependency;->areDependenciesMet()Z

    move-result v0

    return v0
.end method

.method protected checkAndInitDelegate(Ljava/lang/Object;)Lio/fabric/sdk/android/services/concurrency/Dependency;
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lio/fabric/sdk/android/services/concurrency/Dependency",
            "<",
            "Lio/fabric/sdk/android/services/concurrency/Task;",
            ">;:",
            "Lio/fabric/sdk/android/services/concurrency/PriorityProvider;",
            ":",
            "Lio/fabric/sdk/android/services/concurrency/Task;",
            ">(",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 85
    .local p0, "this":Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;, "Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask<TV;>;"
    invoke-static {p1}, Lio/fabric/sdk/android/services/concurrency/PriorityTask;->isProperDelegate(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    check-cast p1, Lio/fabric/sdk/android/services/concurrency/Dependency;

    .line 88
    .end local p1    # "object":Ljava/lang/Object;
    :goto_0
    return-object p1

    .restart local p1    # "object":Ljava/lang/Object;
    :cond_0
    new-instance p1, Lio/fabric/sdk/android/services/concurrency/PriorityTask;

    .end local p1    # "object":Ljava/lang/Object;
    invoke-direct {p1}, Lio/fabric/sdk/android/services/concurrency/PriorityTask;-><init>()V

    goto :goto_0
.end method

.method public compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "another"    # Ljava/lang/Object;

    .prologue
    .line 33
    .local p0, "this":Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;, "Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask<TV;>;"
    invoke-virtual {p0}, Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;->getDelegate()Lio/fabric/sdk/android/services/concurrency/Dependency;

    move-result-object v0

    check-cast v0, Lio/fabric/sdk/android/services/concurrency/PriorityProvider;

    invoke-interface {v0, p1}, Lio/fabric/sdk/android/services/concurrency/PriorityProvider;->compareTo(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getDelegate()Lio/fabric/sdk/android/services/concurrency/Dependency;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lio/fabric/sdk/android/services/concurrency/Dependency",
            "<",
            "Lio/fabric/sdk/android/services/concurrency/Task;",
            ">;:",
            "Lio/fabric/sdk/android/services/concurrency/PriorityProvider;",
            ":",
            "Lio/fabric/sdk/android/services/concurrency/Task;",
            ">()TT;"
        }
    .end annotation

    .prologue
    .line 79
    .local p0, "this":Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;, "Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask<TV;>;"
    iget-object v0, p0, Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;->delegate:Ljava/lang/Object;

    check-cast v0, Lio/fabric/sdk/android/services/concurrency/Dependency;

    return-object v0
.end method

.method public getDependencies()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lio/fabric/sdk/android/services/concurrency/Task;",
            ">;"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;, "Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask<TV;>;"
    invoke-virtual {p0}, Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;->getDelegate()Lio/fabric/sdk/android/services/concurrency/Dependency;

    move-result-object v0

    check-cast v0, Lio/fabric/sdk/android/services/concurrency/PriorityProvider;

    check-cast v0, Lio/fabric/sdk/android/services/concurrency/Dependency;

    invoke-interface {v0}, Lio/fabric/sdk/android/services/concurrency/Dependency;->getDependencies()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getError()Ljava/lang/Throwable;
    .locals 1

    .prologue
    .line 73
    .local p0, "this":Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;, "Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask<TV;>;"
    invoke-virtual {p0}, Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;->getDelegate()Lio/fabric/sdk/android/services/concurrency/Dependency;

    move-result-object v0

    check-cast v0, Lio/fabric/sdk/android/services/concurrency/PriorityProvider;

    check-cast v0, Lio/fabric/sdk/android/services/concurrency/Task;

    invoke-interface {v0}, Lio/fabric/sdk/android/services/concurrency/Task;->getError()Ljava/lang/Throwable;

    move-result-object v0

    return-object v0
.end method

.method public getPriority()Lio/fabric/sdk/android/services/concurrency/Priority;
    .locals 1

    .prologue
    .line 53
    .local p0, "this":Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;, "Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask<TV;>;"
    invoke-virtual {p0}, Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;->getDelegate()Lio/fabric/sdk/android/services/concurrency/Dependency;

    move-result-object v0

    check-cast v0, Lio/fabric/sdk/android/services/concurrency/PriorityProvider;

    invoke-interface {v0}, Lio/fabric/sdk/android/services/concurrency/PriorityProvider;->getPriority()Lio/fabric/sdk/android/services/concurrency/Priority;

    move-result-object v0

    return-object v0
.end method

.method public isFinished()Z
    .locals 1

    .prologue
    .line 63
    .local p0, "this":Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;, "Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask<TV;>;"
    invoke-virtual {p0}, Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;->getDelegate()Lio/fabric/sdk/android/services/concurrency/Dependency;

    move-result-object v0

    check-cast v0, Lio/fabric/sdk/android/services/concurrency/PriorityProvider;

    check-cast v0, Lio/fabric/sdk/android/services/concurrency/Task;

    invoke-interface {v0}, Lio/fabric/sdk/android/services/concurrency/Task;->isFinished()Z

    move-result v0

    return v0
.end method

.method public setError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 68
    .local p0, "this":Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;, "Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask<TV;>;"
    invoke-virtual {p0}, Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;->getDelegate()Lio/fabric/sdk/android/services/concurrency/Dependency;

    move-result-object v0

    check-cast v0, Lio/fabric/sdk/android/services/concurrency/PriorityProvider;

    check-cast v0, Lio/fabric/sdk/android/services/concurrency/Task;

    invoke-interface {v0, p1}, Lio/fabric/sdk/android/services/concurrency/Task;->setError(Ljava/lang/Throwable;)V

    .line 69
    return-void
.end method

.method public setFinished(Z)V
    .locals 1
    .param p1, "finished"    # Z

    .prologue
    .line 58
    .local p0, "this":Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;, "Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask<TV;>;"
    invoke-virtual {p0}, Lio/fabric/sdk/android/services/concurrency/PriorityFutureTask;->getDelegate()Lio/fabric/sdk/android/services/concurrency/Dependency;

    move-result-object v0

    check-cast v0, Lio/fabric/sdk/android/services/concurrency/PriorityProvider;

    check-cast v0, Lio/fabric/sdk/android/services/concurrency/Task;

    invoke-interface {v0, p1}, Lio/fabric/sdk/android/services/concurrency/Task;->setFinished(Z)V

    .line 59
    return-void
.end method
