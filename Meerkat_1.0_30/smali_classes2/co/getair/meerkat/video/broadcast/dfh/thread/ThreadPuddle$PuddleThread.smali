.class Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;
.super Ljava/lang/Thread;
.source "ThreadPuddle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PuddleThread"
.end annotation


# instance fields
.field r:Ljava/lang/Runnable;

.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;


# direct methods
.method private constructor <init>(Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;)V
    .locals 1

    .prologue
    .line 35
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;->this$0:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 37
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;->setDaemon(Z)V

    .line 38
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;->start()V

    .line 39
    return-void
.end method

.method synthetic constructor <init>(Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$1;)V
    .locals 0
    .param p1, "x0"    # Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;
    .param p2, "x1"    # Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$1;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;-><init>(Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 44
    :goto_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;->this$0:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    # getter for: Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->dead:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->access$000(Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-nez v2, :cond_0

    .line 45
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;->this$0:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    # getter for: Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->taskQueue:Ljava/util/Deque;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->access$100(Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;)Ljava/util/Deque;

    move-result-object v3

    monitor-enter v3

    .line 46
    :goto_1
    :try_start_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;->this$0:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    # getter for: Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->taskQueue:Ljava/util/Deque;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->access$100(Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;)Ljava/util/Deque;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Deque;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;->this$0:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    # getter for: Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->dead:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->access$000(Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-nez v2, :cond_2

    .line 48
    :try_start_1
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;->this$0:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    # getter for: Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->taskQueue:Ljava/util/Deque;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->access$100(Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;)Ljava/util/Deque;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 49
    :catch_0
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;->this$0:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    # getter for: Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->dead:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->access$000(Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 51
    monitor-exit v3

    .line 69
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_0
    return-void

    .line 52
    .restart local v0    # "e":Ljava/lang/InterruptedException;
    :cond_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    goto :goto_1

    .line 56
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 55
    :cond_2
    :try_start_3
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;->this$0:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    # getter for: Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->taskQueue:Ljava/util/Deque;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->access$100(Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;)Ljava/util/Deque;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Deque;->remove()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Runnable;

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;->r:Ljava/lang/Runnable;

    .line 56
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 58
    :try_start_4
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;->r:Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1

    .line 64
    :goto_2
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;->this$0:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    # getter for: Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->inProcess:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->access$200(Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    monitor-enter v3

    .line 65
    :try_start_5
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;->this$0:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    # getter for: Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->inProcess:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->access$200(Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 66
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;->this$0:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    # getter for: Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->inProcess:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->access$200(Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 67
    monitor-exit v3

    goto :goto_0

    :catchall_1
    move-exception v2

    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v2

    .line 59
    :catch_1
    move-exception v1

    .line 60
    .local v1, "t":Ljava/lang/Throwable;
    instance-of v2, v1, Ljava/lang/InterruptedException;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;->this$0:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    # getter for: Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->dead:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->access$000(Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-nez v2, :cond_0

    .line 62
    :cond_3
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_2
.end method
