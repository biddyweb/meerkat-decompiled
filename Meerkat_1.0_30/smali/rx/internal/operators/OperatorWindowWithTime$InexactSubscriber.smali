.class final Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;
.super Lrx/Subscriber;
.source "OperatorWindowWithTime.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorWindowWithTime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "InexactSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lrx/Subscriber",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final child:Lrx/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Subscriber",
            "<-",
            "Lrx/Observable",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final chunks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field done:Z

.field final guard:Ljava/lang/Object;

.field final synthetic this$0:Lrx/internal/operators/OperatorWindowWithTime;

.field final worker:Lrx/Scheduler$Worker;


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorWindowWithTime;Lrx/Subscriber;Lrx/Scheduler$Worker;)V
    .locals 1
    .param p3, "worker"    # Lrx/Scheduler$Worker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Lrx/Observable",
            "<TT;>;>;",
            "Lrx/Scheduler$Worker;",
            ")V"
        }
    .end annotation

    .prologue
    .line 352
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.InexactSubscriber;"
    .local p2, "child":Lrx/Subscriber;, "Lrx/Subscriber<-Lrx/Observable<TT;>;>;"
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithTime;

    .line 353
    invoke-direct {p0, p2}, Lrx/Subscriber;-><init>(Lrx/Subscriber;)V

    .line 354
    iput-object p2, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->child:Lrx/Subscriber;

    .line 355
    iput-object p3, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->worker:Lrx/Scheduler$Worker;

    .line 356
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->guard:Ljava/lang/Object;

    .line 357
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->chunks:Ljava/util/List;

    .line 358
    return-void
.end method


# virtual methods
.method createCountedSerializedSubject()Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 477
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.InexactSubscriber;"
    invoke-static {}, Lrx/internal/operators/BufferUntilSubscriber;->create()Lrx/internal/operators/BufferUntilSubscriber;

    move-result-object v0

    .line 478
    .local v0, "bus":Lrx/internal/operators/BufferUntilSubscriber;, "Lrx/internal/operators/BufferUntilSubscriber<TT;>;"
    new-instance v1, Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;

    invoke-direct {v1, v0, v0}, Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;-><init>(Lrx/Observer;Lrx/Observable;)V

    return-object v1
.end method

.method public onCompleted()V
    .locals 5

    .prologue
    .line 409
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.InexactSubscriber;"
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 410
    :try_start_0
    iget-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->done:Z

    if-eqz v3, :cond_0

    .line 411
    monitor-exit v4

    .line 421
    :goto_0
    return-void

    .line 413
    :cond_0
    const/4 v3, 0x1

    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->done:Z

    .line 414
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->chunks:Ljava/util/List;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 415
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;>;"
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->chunks:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 416
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 417
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;

    .line 418
    .local v0, "cs":Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;, "Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;"
    iget-object v3, v0, Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;->consumer:Lrx/Observer;

    invoke-interface {v3}, Lrx/Observer;->onCompleted()V

    goto :goto_1

    .line 416
    .end local v0    # "cs":Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;, "Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;>;"
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 420
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;>;"
    :cond_1
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v3}, Lrx/Subscriber;->onCompleted()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 5
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 392
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.InexactSubscriber;"
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 393
    :try_start_0
    iget-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->done:Z

    if-eqz v3, :cond_0

    .line 394
    monitor-exit v4

    .line 404
    :goto_0
    return-void

    .line 396
    :cond_0
    const/4 v3, 0x1

    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->done:Z

    .line 397
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->chunks:Ljava/util/List;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 398
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;>;"
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->chunks:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 399
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 400
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;

    .line 401
    .local v0, "cs":Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;, "Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;"
    iget-object v3, v0, Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;->consumer:Lrx/Observer;

    invoke-interface {v3, p1}, Lrx/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 399
    .end local v0    # "cs":Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;, "Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;>;"
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 403
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;>;"
    :cond_1
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v3, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 368
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.InexactSubscriber;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v5, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v5

    .line 369
    :try_start_0
    iget-boolean v4, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->done:Z

    if-eqz v4, :cond_1

    .line 370
    monitor-exit v5

    .line 387
    :cond_0
    return-void

    .line 372
    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->chunks:Ljava/util/List;

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 373
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;>;"
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->chunks:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 374
    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;>;"
    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 375
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;

    .line 376
    .local v0, "cs":Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;, "Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;"
    iget v4, v0, Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;->count:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v0, Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;->count:I

    iget-object v6, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithTime;

    iget v6, v6, Lrx/internal/operators/OperatorWindowWithTime;->size:I

    if-ne v4, v6, :cond_2

    .line 377
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 380
    .end local v0    # "cs":Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;, "Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;"
    .end local v2    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;>;"
    .end local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;>;"
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .restart local v2    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;>;"
    .restart local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;>;"
    :cond_3
    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 381
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_4
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;

    .line 382
    .restart local v0    # "cs":Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;, "Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;"
    iget-object v4, v0, Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;->consumer:Lrx/Observer;

    invoke-interface {v4, p1}, Lrx/Observer;->onNext(Ljava/lang/Object;)V

    .line 383
    iget v4, v0, Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;->count:I

    iget-object v5, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithTime;

    iget v5, v5, Lrx/internal/operators/OperatorWindowWithTime;->size:I

    if-ne v4, v5, :cond_4

    .line 384
    iget-object v4, v0, Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;->consumer:Lrx/Observer;

    invoke-interface {v4}, Lrx/Observer;->onCompleted()V

    goto :goto_1
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 362
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.InexactSubscriber;"
    const-wide v0, 0x7fffffffffffffffL

    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->request(J)V

    .line 363
    return-void
.end method

.method scheduleChunk()V
    .locals 7

    .prologue
    .line 423
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.InexactSubscriber;"
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->worker:Lrx/Scheduler$Worker;

    new-instance v1, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber$1;

    invoke-direct {v1, p0}, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber$1;-><init>(Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;)V

    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithTime;

    iget-wide v2, v2, Lrx/internal/operators/OperatorWindowWithTime;->timeshift:J

    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithTime;

    iget-wide v4, v4, Lrx/internal/operators/OperatorWindowWithTime;->timeshift:J

    iget-object v6, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithTime;

    iget-object v6, v6, Lrx/internal/operators/OperatorWindowWithTime;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v0 .. v6}, Lrx/Scheduler$Worker;->schedulePeriodically(Lrx/functions/Action0;JJLjava/util/concurrent/TimeUnit;)Lrx/Subscription;

    .line 431
    return-void
.end method

.method startNewChunk()V
    .locals 7

    .prologue
    .line 433
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.InexactSubscriber;"
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->createCountedSerializedSubject()Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;

    move-result-object v0

    .line 434
    .local v0, "chunk":Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;, "Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;"
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v3

    .line 435
    :try_start_0
    iget-boolean v2, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->done:Z

    if-eqz v2, :cond_0

    .line 436
    monitor-exit v3

    .line 455
    :goto_0
    return-void

    .line 438
    :cond_0
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->chunks:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 439
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 441
    :try_start_1
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->child:Lrx/Subscriber;

    iget-object v3, v0, Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;->producer:Lrx/Observable;

    invoke-virtual {v2, v3}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 447
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->worker:Lrx/Scheduler$Worker;

    new-instance v3, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber$2;

    invoke-direct {v3, p0, v0}, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber$2;-><init>(Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;)V

    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithTime;

    iget-wide v4, v4, Lrx/internal/operators/OperatorWindowWithTime;->timespan:J

    iget-object v6, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithTime;

    iget-object v6, v6, Lrx/internal/operators/OperatorWindowWithTime;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v3, v4, v5, v6}, Lrx/Scheduler$Worker;->schedule(Lrx/functions/Action0;JLjava/util/concurrent/TimeUnit;)Lrx/Subscription;

    goto :goto_0

    .line 439
    :catchall_0
    move-exception v2

    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 442
    :catch_0
    move-exception v1

    .line 443
    .local v1, "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v1}, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method terminateChunk(Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 457
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.InexactSubscriber;"
    .local p1, "chunk":Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;, "Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;"
    const/4 v2, 0x0

    .line 458
    .local v2, "terminate":Z
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 459
    :try_start_0
    iget-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->done:Z

    if-eqz v3, :cond_1

    .line 460
    monitor-exit v4

    .line 475
    :cond_0
    :goto_0
    return-void

    .line 462
    :cond_1
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$InexactSubscriber;->chunks:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 463
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 464
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;

    .line 465
    .local v0, "cs":Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;, "Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;"
    if-ne v0, p1, :cond_2

    .line 466
    const/4 v2, 0x1

    .line 467
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 471
    .end local v0    # "cs":Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;, "Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;"
    :cond_3
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 472
    if-eqz v2, :cond_0

    .line 473
    iget-object v3, p1, Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject;->consumer:Lrx/Observer;

    invoke-interface {v3}, Lrx/Observer;->onCompleted()V

    goto :goto_0

    .line 471
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lrx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject<TT;>;>;"
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method
