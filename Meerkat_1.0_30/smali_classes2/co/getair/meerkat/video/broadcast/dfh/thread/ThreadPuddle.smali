.class public Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;
.super Ljava/lang/Object;
.source "ThreadPuddle.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;
    }
.end annotation


# instance fields
.field private final dead:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final flushing:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final inProcess:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final limit:I

.field private final puddle:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque",
            "<",
            "Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;",
            ">;"
        }
    .end annotation
.end field

.field private final taskQueue:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 85
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;-><init>(I)V

    .line 86
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "threads"    # I

    .prologue
    .line 96
    mul-int/lit8 v0, p1, 0x64

    invoke-direct {p0, p1, v0}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;-><init>(II)V

    .line 97
    return-void
.end method

.method public constructor <init>(II)V
    .locals 4
    .param p1, "threads"    # I
    .param p2, "maxTasks"    # I

    .prologue
    const/4 v2, 0x0

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->taskQueue:Ljava/util/Deque;

    .line 74
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->dead:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 75
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->flushing:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 77
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->inProcess:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 110
    const/4 v1, 0x1

    if-ge p1, v1, :cond_0

    .line 111
    new-instance v1, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddleException;

    const-string v2, "thread count must be positive"

    invoke-direct {v1, v2}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddleException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 112
    :cond_0
    if-ge p2, p1, :cond_1

    .line 113
    new-instance v1, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddleException;

    const-string v2, "maxTasks must be greater than or equal to thread count"

    invoke-direct {v1, v2}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddleException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 115
    :cond_1
    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1, p1}, Ljava/util/ArrayDeque;-><init>(I)V

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->puddle:Ljava/util/Deque;

    .line 116
    iput p2, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->limit:I

    .line 117
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_2

    .line 118
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->puddle:Ljava/util/Deque;

    new-instance v2, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;-><init>(Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$1;)V

    invoke-interface {v1, v2}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 117
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 120
    :cond_2
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    .prologue
    .line 29
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->dead:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;)Ljava/util/Deque;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    .prologue
    .line 29
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->taskQueue:Ljava/util/Deque;

    return-object v0
.end method

.method static synthetic access$200(Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    .prologue
    .line 29
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->inProcess:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method


# virtual methods
.method public die()V
    .locals 3

    .prologue
    .line 191
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->dead:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 192
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->puddle:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;

    .line 193
    .local v0, "pt":Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;->interrupt()V

    goto :goto_0

    .line 194
    .end local v0    # "pt":Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;
    :cond_0
    return-void
.end method

.method public flush()V
    .locals 6

    .prologue
    .line 167
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->flushing:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 168
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->inProcess:Ljava/util/concurrent/atomic/AtomicInteger;

    monitor-enter v2

    .line 169
    :goto_0
    :try_start_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->inProcess:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-lez v1, :cond_1

    .line 172
    :try_start_1
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->inProcess:Ljava/util/concurrent/atomic/AtomicInteger;

    const-wide/16 v4, 0x3e8

    invoke-virtual {v1, v4, v5}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 173
    :catch_0
    move-exception v0

    .line 174
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->dead:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 175
    monitor-exit v2

    .line 184
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :goto_1
    return-void

    .line 176
    .restart local v0    # "e":Ljava/lang/InterruptedException;
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 179
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_1
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 180
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->flushing:Ljava/util/concurrent/atomic/AtomicBoolean;

    monitor-enter v2

    .line 181
    :try_start_4
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->flushing:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 182
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->flushing:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 183
    monitor-exit v2

    goto :goto_1

    :catchall_1
    move-exception v1

    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v1
.end method

.method public getPriority()I
    .locals 2

    .prologue
    .line 217
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->dead:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 218
    new-instance v0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddleException;

    const-string v1, "puddle is dead!"

    invoke-direct {v0, v1}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddleException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 219
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->puddle:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle$PuddleThread;->getPriority()I

    move-result v0

    return v0
.end method

.method public run(Ljava/lang/Runnable;)V
    .locals 4
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 129
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->dead:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 130
    new-instance v1, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddleException;

    const-string v2, "puddle is dead!"

    invoke-direct {v1, v2}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddleException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 131
    :cond_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->flushing:Ljava/util/concurrent/atomic/AtomicBoolean;

    monitor-enter v2

    .line 132
    :goto_0
    :try_start_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->flushing:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_2

    .line 134
    :try_start_1
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->flushing:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 135
    :catch_0
    move-exception v0

    .line 136
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->dead:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 137
    monitor-exit v2

    .line 159
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :goto_1
    return-void

    .line 138
    .restart local v0    # "e":Ljava/lang/InterruptedException;
    :cond_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 141
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_2
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 142
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->inProcess:Ljava/util/concurrent/atomic/AtomicInteger;

    monitor-enter v2

    .line 143
    :goto_2
    :try_start_4
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->inProcess:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    iget v3, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->limit:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-ne v1, v3, :cond_4

    .line 145
    :try_start_5
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->inProcess:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_2

    .line 146
    :catch_1
    move-exception v0

    .line 147
    .restart local v0    # "e":Ljava/lang/InterruptedException;
    :try_start_6
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->dead:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 148
    monitor-exit v2

    goto :goto_1

    .line 158
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_1
    move-exception v1

    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v1

    .line 149
    .restart local v0    # "e":Ljava/lang/InterruptedException;
    :cond_3
    :try_start_7
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_2

    .line 152
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_4
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->inProcess:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 153
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->taskQueue:Ljava/util/Deque;

    monitor-enter v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 154
    :try_start_8
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->taskQueue:Ljava/util/Deque;

    invoke-interface {v1, p1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 155
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->taskQueue:Ljava/util/Deque;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 156
    monitor-exit v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 157
    :try_start_9
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->inProcess:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 158
    monitor-exit v2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    goto :goto_1

    .line 156
    :catchall_2
    move-exception v1

    :try_start_a
    monitor-exit v3
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    :try_start_b
    throw v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1
.end method

.method public setPriority(I)V
    .locals 3
    .param p1, "priority"    # I

    .prologue
    .line 204
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->dead:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 205
    new-instance v1, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddleException;

    const-string v2, "puddle is dead!"

    invoke-direct {v1, v2}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddleException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 206
    :cond_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->puddle:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Thread;

    .line 207
    .local v0, "t":Ljava/lang/Thread;
    invoke-virtual {v0, p1}, Ljava/lang/Thread;->setPriority(I)V

    goto :goto_0

    .line 208
    .end local v0    # "t":Ljava/lang/Thread;
    :cond_1
    return-void
.end method
