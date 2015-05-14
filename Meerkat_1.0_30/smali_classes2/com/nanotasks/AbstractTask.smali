.class abstract Lcom/nanotasks/AbstractTask;
.super Landroid/os/AsyncTask;
.source "AbstractTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "TT;>;"
    }
.end annotation


# instance fields
.field private backgroundWork:Lcom/nanotasks/BackgroundWork;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nanotasks/BackgroundWork",
            "<TT;>;"
        }
    .end annotation
.end field

.field private exception:Ljava/lang/Exception;


# direct methods
.method constructor <init>(Lcom/nanotasks/BackgroundWork;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nanotasks/BackgroundWork",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 15
    .local p0, "this":Lcom/nanotasks/AbstractTask;, "Lcom/nanotasks/AbstractTask<TT;>;"
    .local p1, "backgroundWork":Lcom/nanotasks/BackgroundWork;, "Lcom/nanotasks/BackgroundWork<TT;>;"
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/nanotasks/AbstractTask;->backgroundWork:Lcom/nanotasks/BackgroundWork;

    .line 17
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 10
    .local p0, "this":Lcom/nanotasks/AbstractTask;, "Lcom/nanotasks/AbstractTask<TT;>;"
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/nanotasks/AbstractTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected final varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Object;
    .locals 2
    .param p1, "params"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 22
    .local p0, "this":Lcom/nanotasks/AbstractTask;, "Lcom/nanotasks/AbstractTask<TT;>;"
    :try_start_0
    iget-object v1, p0, Lcom/nanotasks/AbstractTask;->backgroundWork:Lcom/nanotasks/BackgroundWork;

    invoke-interface {v1}, Lcom/nanotasks/BackgroundWork;->doInBackground()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 25
    :goto_0
    return-object v1

    .line 23
    :catch_0
    move-exception v0

    .line 24
    .local v0, "e":Ljava/lang/Exception;
    iput-object v0, p0, Lcom/nanotasks/AbstractTask;->exception:Ljava/lang/Exception;

    .line 25
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected abstract onError(Ljava/lang/Exception;)V
.end method

.method protected final onPostExecute(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p0, "this":Lcom/nanotasks/AbstractTask;, "Lcom/nanotasks/AbstractTask<TT;>;"
    .local p1, "result":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Lcom/nanotasks/AbstractTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 32
    iget-object v0, p0, Lcom/nanotasks/AbstractTask;->exception:Ljava/lang/Exception;

    if-nez v0, :cond_1

    .line 33
    invoke-virtual {p0, p1}, Lcom/nanotasks/AbstractTask;->onSuccess(Ljava/lang/Object;)V

    .line 39
    :cond_0
    :goto_0
    return-void

    .line 35
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/nanotasks/AbstractTask;->exception:Ljava/lang/Exception;

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 36
    iget-object v0, p0, Lcom/nanotasks/AbstractTask;->exception:Ljava/lang/Exception;

    invoke-virtual {p0, v0}, Lcom/nanotasks/AbstractTask;->onError(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method protected abstract onSuccess(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method
