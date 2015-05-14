.class final Lrx/schedulers/ExecutorScheduler$ExecutorAction;
.super Ljava/lang/Object;
.source "ExecutorScheduler.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lrx/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/schedulers/ExecutorScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ExecutorAction"
.end annotation


# static fields
.field static final UNSUBSCRIBED_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater",
            "<",
            "Lrx/schedulers/ExecutorScheduler$ExecutorAction;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final actual:Lrx/functions/Action0;

.field final parent:Lrx/subscriptions/CompositeSubscription;

.field volatile unsubscribed:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 159
    const-class v0, Lrx/schedulers/ExecutorScheduler$ExecutorAction;

    const-string v1, "unsubscribed"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lrx/schedulers/ExecutorScheduler$ExecutorAction;->UNSUBSCRIBED_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-void
.end method

.method public constructor <init>(Lrx/functions/Action0;Lrx/subscriptions/CompositeSubscription;)V
    .locals 0
    .param p1, "actual"    # Lrx/functions/Action0;
    .param p2, "parent"    # Lrx/subscriptions/CompositeSubscription;

    .prologue
    .line 162
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 163
    iput-object p1, p0, Lrx/schedulers/ExecutorScheduler$ExecutorAction;->actual:Lrx/functions/Action0;

    .line 164
    iput-object p2, p0, Lrx/schedulers/ExecutorScheduler$ExecutorAction;->parent:Lrx/subscriptions/CompositeSubscription;

    .line 165
    return-void
.end method


# virtual methods
.method public isUnsubscribed()Z
    .locals 1

    .prologue
    .line 184
    iget v0, p0, Lrx/schedulers/ExecutorScheduler$ExecutorAction;->unsubscribed:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public run()V
    .locals 3

    .prologue
    .line 169
    invoke-virtual {p0}, Lrx/schedulers/ExecutorScheduler$ExecutorAction;->isUnsubscribed()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 181
    :goto_0
    return-void

    .line 173
    :cond_0
    :try_start_0
    iget-object v2, p0, Lrx/schedulers/ExecutorScheduler$ExecutorAction;->actual:Lrx/functions/Action0;

    invoke-interface {v2}, Lrx/functions/Action0;->call()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 179
    invoke-virtual {p0}, Lrx/schedulers/ExecutorScheduler$ExecutorAction;->unsubscribe()V

    goto :goto_0

    .line 174
    :catch_0
    move-exception v0

    .line 175
    .local v0, "t":Ljava/lang/Throwable;
    :try_start_1
    invoke-static {}, Lrx/plugins/RxJavaPlugins;->getInstance()Lrx/plugins/RxJavaPlugins;

    move-result-object v2

    invoke-virtual {v2}, Lrx/plugins/RxJavaPlugins;->getErrorHandler()Lrx/plugins/RxJavaErrorHandler;

    move-result-object v2

    invoke-virtual {v2, v0}, Lrx/plugins/RxJavaErrorHandler;->handleError(Ljava/lang/Throwable;)V

    .line 176
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    .line 177
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->getUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v2

    invoke-interface {v2, v1, v0}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 179
    invoke-virtual {p0}, Lrx/schedulers/ExecutorScheduler$ExecutorAction;->unsubscribe()V

    goto :goto_0

    .end local v0    # "t":Ljava/lang/Throwable;
    .end local v1    # "thread":Ljava/lang/Thread;
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lrx/schedulers/ExecutorScheduler$ExecutorAction;->unsubscribe()V

    throw v2
.end method

.method public unsubscribe()V
    .locals 3

    .prologue
    .line 189
    sget-object v0, Lrx/schedulers/ExecutorScheduler$ExecutorAction;->UNSUBSCRIBED_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 190
    iget-object v0, p0, Lrx/schedulers/ExecutorScheduler$ExecutorAction;->parent:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0, p0}, Lrx/subscriptions/CompositeSubscription;->remove(Lrx/Subscription;)V

    .line 192
    :cond_0
    return-void
.end method
