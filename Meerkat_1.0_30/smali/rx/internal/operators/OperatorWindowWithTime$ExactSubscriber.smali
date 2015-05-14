.class final Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;
.super Lrx/Subscriber;
.source "OperatorWindowWithTime.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorWindowWithTime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ExactSubscriber"
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

.field emitting:Z

.field final guard:Ljava/lang/Object;

.field queue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field volatile state:Lrx/internal/operators/OperatorWindowWithTime$State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorWindowWithTime$State",
            "<TT;>;"
        }
    .end annotation
.end field

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
    .line 120
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    .local p2, "child":Lrx/Subscriber;, "Lrx/Subscriber<-Lrx/Observable<TT;>;>;"
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithTime;

    .line 121
    invoke-direct {p0, p2}, Lrx/Subscriber;-><init>(Lrx/Subscriber;)V

    .line 122
    new-instance v0, Lrx/observers/SerializedSubscriber;

    invoke-direct {v0, p2}, Lrx/observers/SerializedSubscriber;-><init>(Lrx/Subscriber;)V

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->child:Lrx/Subscriber;

    .line 123
    iput-object p3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->worker:Lrx/Scheduler$Worker;

    .line 124
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    .line 125
    invoke-static {}, Lrx/internal/operators/OperatorWindowWithTime$State;->empty()Lrx/internal/operators/OperatorWindowWithTime$State;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    .line 126
    return-void
.end method


# virtual methods
.method complete()V
    .locals 2

    .prologue
    .line 245
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    iget-object v0, v1, Lrx/internal/operators/OperatorWindowWithTime$State;->consumer:Lrx/Observer;

    .line 246
    .local v0, "s":Lrx/Observer;, "Lrx/Observer<TT;>;"
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    invoke-virtual {v1}, Lrx/internal/operators/OperatorWindowWithTime$State;->clear()Lrx/internal/operators/OperatorWindowWithTime$State;

    move-result-object v1

    iput-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    .line 247
    if-eqz v0, :cond_0

    .line 248
    invoke-interface {v0}, Lrx/Observer;->onCompleted()V

    .line 250
    :cond_0
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v1}, Lrx/Subscriber;->onCompleted()V

    .line 251
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->unsubscribe()V

    .line 252
    return-void
.end method

.method drain(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 176
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    .local p1, "queue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    if-nez p1, :cond_1

    .line 196
    :cond_0
    :goto_0
    return-void

    .line 179
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 180
    .local v1, "o":Ljava/lang/Object;
    sget-object v3, Lrx/internal/operators/OperatorWindowWithTime;->NEXT_SUBJECT:Ljava/lang/Object;

    if-ne v1, v3, :cond_2

    .line 181
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->replaceSubject()V

    goto :goto_1

    .line 183
    :cond_2
    sget-object v3, Lrx/internal/operators/OperatorWindowWithTime;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v3, v1}, Lrx/internal/operators/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 184
    sget-object v3, Lrx/internal/operators/OperatorWindowWithTime;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v3, v1}, Lrx/internal/operators/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v3

    invoke-virtual {p0, v3}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->error(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 187
    :cond_3
    sget-object v3, Lrx/internal/operators/OperatorWindowWithTime;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v3, v1}, Lrx/internal/operators/NotificationLite;->isCompleted(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 188
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->complete()V

    goto :goto_0

    .line 192
    :cond_4
    move-object v2, v1

    .line 193
    .local v2, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v2}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitValue(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method emitValue(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 207
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    .line 208
    .local v0, "s":Lrx/internal/operators/OperatorWindowWithTime$State;, "Lrx/internal/operators/OperatorWindowWithTime$State<TT;>;"
    iget-object v1, v0, Lrx/internal/operators/OperatorWindowWithTime$State;->consumer:Lrx/Observer;

    if-nez v1, :cond_0

    .line 209
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->replaceSubject()V

    .line 210
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    .line 212
    :cond_0
    iget-object v1, v0, Lrx/internal/operators/OperatorWindowWithTime$State;->consumer:Lrx/Observer;

    invoke-interface {v1, p1}, Lrx/Observer;->onNext(Ljava/lang/Object;)V

    .line 213
    iget v1, v0, Lrx/internal/operators/OperatorWindowWithTime$State;->count:I

    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithTime;

    iget v2, v2, Lrx/internal/operators/OperatorWindowWithTime;->size:I

    add-int/lit8 v2, v2, -0x1

    if-ne v1, v2, :cond_1

    .line 214
    iget-object v1, v0, Lrx/internal/operators/OperatorWindowWithTime$State;->consumer:Lrx/Observer;

    invoke-interface {v1}, Lrx/Observer;->onCompleted()V

    .line 215
    invoke-virtual {v0}, Lrx/internal/operators/OperatorWindowWithTime$State;->clear()Lrx/internal/operators/OperatorWindowWithTime$State;

    move-result-object v0

    .line 219
    :goto_0
    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    .line 220
    return-void

    .line 217
    :cond_1
    invoke-virtual {v0}, Lrx/internal/operators/OperatorWindowWithTime$State;->next()Lrx/internal/operators/OperatorWindowWithTime$State;

    move-result-object v0

    goto :goto_0
.end method

.method error(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 236
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    iget-object v0, v1, Lrx/internal/operators/OperatorWindowWithTime$State;->consumer:Lrx/Observer;

    .line 237
    .local v0, "s":Lrx/Observer;, "Lrx/Observer<TT;>;"
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    invoke-virtual {v1}, Lrx/internal/operators/OperatorWindowWithTime$State;->clear()Lrx/internal/operators/OperatorWindowWithTime$State;

    move-result-object v1

    iput-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    .line 238
    if-eqz v0, :cond_0

    .line 239
    invoke-interface {v0, p1}, Lrx/Observer;->onError(Ljava/lang/Throwable;)V

    .line 241
    :cond_0
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v1, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 242
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->unsubscribe()V

    .line 243
    return-void
.end method

.method nextWindow()V
    .locals 6

    .prologue
    .line 289
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 290
    :try_start_0
    iget-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    if-eqz v3, :cond_2

    .line 291
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    if-nez v3, :cond_0

    .line 292
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 294
    :cond_0
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    sget-object v5, Lrx/internal/operators/OperatorWindowWithTime;->NEXT_SUBJECT:Ljava/lang/Object;

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 295
    monitor-exit v4

    .line 327
    :cond_1
    :goto_0
    return-void

    .line 297
    :cond_2
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 298
    .local v0, "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v3, 0x0

    iput-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 299
    const/4 v3, 0x1

    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 300
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 301
    const/4 v1, 0x1

    .line 302
    .local v1, "once":Z
    const/4 v2, 0x0

    .line 305
    .local v2, "skipFinal":Z
    :cond_3
    :try_start_1
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->drain(Ljava/util/List;)V

    .line 306
    if-eqz v1, :cond_4

    .line 307
    const/4 v1, 0x0

    .line 308
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->replaceSubject()V

    .line 310
    :cond_4
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    .line 311
    :try_start_2
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 312
    const/4 v3, 0x0

    iput-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 313
    if-nez v0, :cond_5

    .line 314
    const/4 v3, 0x0

    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 315
    const/4 v2, 0x1

    .line 316
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 321
    if-nez v2, :cond_1

    .line 322
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 323
    const/4 v3, 0x0

    :try_start_3
    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 324
    monitor-exit v4

    goto :goto_0

    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3

    .line 300
    .end local v0    # "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v1    # "once":Z
    .end local v2    # "skipFinal":Z
    :catchall_1
    move-exception v3

    :try_start_4
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v3

    .line 318
    .restart local v0    # "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .restart local v1    # "once":Z
    .restart local v2    # "skipFinal":Z
    :cond_5
    :try_start_5
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 319
    :try_start_6
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v3}, Lrx/Subscriber;->isUnsubscribed()Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    move-result v3

    if-eqz v3, :cond_3

    .line 321
    if-nez v2, :cond_1

    .line 322
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 323
    const/4 v3, 0x0

    :try_start_7
    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 324
    monitor-exit v4

    goto :goto_0

    :catchall_2
    move-exception v3

    monitor-exit v4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    throw v3

    .line 318
    :catchall_3
    move-exception v3

    :try_start_8
    monitor-exit v4
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    :try_start_9
    throw v3
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 321
    :catchall_4
    move-exception v3

    if-nez v2, :cond_6

    .line 322
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 323
    const/4 v5, 0x0

    :try_start_a
    iput-boolean v5, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 324
    monitor-exit v4
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    :cond_6
    throw v3

    :catchall_5
    move-exception v3

    :try_start_b
    monitor-exit v4
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    throw v3
.end method

.method public onCompleted()V
    .locals 5

    .prologue
    .line 256
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v3

    .line 257
    :try_start_0
    iget-boolean v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    if-eqz v2, :cond_1

    .line 258
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    if-nez v2, :cond_0

    .line 259
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 261
    :cond_0
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    sget-object v4, Lrx/internal/operators/OperatorWindowWithTime;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v4}, Lrx/internal/operators/NotificationLite;->completed()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 262
    monitor-exit v3

    .line 275
    :goto_0
    return-void

    .line 264
    :cond_1
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 265
    .local v1, "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v2, 0x0

    iput-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 266
    const/4 v2, 0x1

    iput-boolean v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 267
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 269
    :try_start_1
    invoke-virtual {p0, v1}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->drain(Ljava/util/List;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 274
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->complete()V

    goto :goto_0

    .line 267
    .end local v1    # "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v2

    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 270
    .restart local v1    # "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :catch_0
    move-exception v0

    .line 271
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->error(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 224
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v1

    .line 225
    :try_start_0
    iget-boolean v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    if-eqz v0, :cond_0

    .line 227
    sget-object v0, Lrx/internal/operators/OperatorWindowWithTime;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v0, p1}, Lrx/internal/operators/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 228
    monitor-exit v1

    .line 234
    :goto_0
    return-void

    .line 230
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 231
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 232
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 233
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->error(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 232
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 136
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 137
    :try_start_0
    iget-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    if-eqz v3, :cond_2

    .line 138
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    if-nez v3, :cond_0

    .line 139
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 141
    :cond_0
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    monitor-exit v4

    .line 174
    :cond_1
    :goto_0
    return-void

    .line 144
    :cond_2
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 145
    .local v0, "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v3, 0x0

    iput-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 146
    const/4 v3, 0x1

    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 147
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 148
    const/4 v1, 0x1

    .line 149
    .local v1, "once":Z
    const/4 v2, 0x0

    .line 152
    .local v2, "skipFinal":Z
    :cond_3
    :try_start_1
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->drain(Ljava/util/List;)V

    .line 153
    if-eqz v1, :cond_4

    .line 154
    const/4 v1, 0x0

    .line 155
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitValue(Ljava/lang/Object;)V

    .line 157
    :cond_4
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    .line 158
    :try_start_2
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 159
    const/4 v3, 0x0

    iput-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 160
    if-nez v0, :cond_5

    .line 161
    const/4 v3, 0x0

    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 162
    const/4 v2, 0x1

    .line 163
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 168
    if-nez v2, :cond_1

    .line 169
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 170
    const/4 v3, 0x0

    :try_start_3
    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 171
    monitor-exit v4

    goto :goto_0

    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3

    .line 147
    .end local v0    # "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v1    # "once":Z
    .end local v2    # "skipFinal":Z
    :catchall_1
    move-exception v3

    :try_start_4
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v3

    .line 165
    .restart local v0    # "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .restart local v1    # "once":Z
    .restart local v2    # "skipFinal":Z
    :cond_5
    :try_start_5
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 166
    :try_start_6
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v3}, Lrx/Subscriber;->isUnsubscribed()Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    move-result v3

    if-eqz v3, :cond_3

    .line 168
    if-nez v2, :cond_1

    .line 169
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 170
    const/4 v3, 0x0

    :try_start_7
    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 171
    monitor-exit v4

    goto :goto_0

    :catchall_2
    move-exception v3

    monitor-exit v4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    throw v3

    .line 165
    :catchall_3
    move-exception v3

    :try_start_8
    monitor-exit v4
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    :try_start_9
    throw v3
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 168
    :catchall_4
    move-exception v3

    if-nez v2, :cond_6

    .line 169
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 170
    const/4 v5, 0x0

    :try_start_a
    iput-boolean v5, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 171
    monitor-exit v4
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    :cond_6
    throw v3

    :catchall_5
    move-exception v3

    :try_start_b
    monitor-exit v4
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    throw v3
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 130
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    const-wide v0, 0x7fffffffffffffffL

    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->request(J)V

    .line 131
    return-void
.end method

.method replaceSubject()V
    .locals 3

    .prologue
    .line 198
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    iget-object v1, v2, Lrx/internal/operators/OperatorWindowWithTime$State;->consumer:Lrx/Observer;

    .line 199
    .local v1, "s":Lrx/Observer;, "Lrx/Observer<TT;>;"
    if-eqz v1, :cond_0

    .line 200
    invoke-interface {v1}, Lrx/Observer;->onCompleted()V

    .line 202
    :cond_0
    invoke-static {}, Lrx/internal/operators/BufferUntilSubscriber;->create()Lrx/internal/operators/BufferUntilSubscriber;

    move-result-object v0

    .line 203
    .local v0, "bus":Lrx/internal/operators/BufferUntilSubscriber;, "Lrx/internal/operators/BufferUntilSubscriber<TT;>;"
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    invoke-virtual {v2, v0, v0}, Lrx/internal/operators/OperatorWindowWithTime$State;->create(Lrx/Observer;Lrx/Observable;)Lrx/internal/operators/OperatorWindowWithTime$State;

    move-result-object v2

    iput-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    .line 204
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v2, v0}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 205
    return-void
.end method

.method scheduleExact()V
    .locals 7

    .prologue
    .line 278
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->worker:Lrx/Scheduler$Worker;

    new-instance v1, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber$1;

    invoke-direct {v1, p0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber$1;-><init>(Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;)V

    const-wide/16 v2, 0x0

    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithTime;

    iget-wide v4, v4, Lrx/internal/operators/OperatorWindowWithTime;->timespan:J

    iget-object v6, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithTime;

    iget-object v6, v6, Lrx/internal/operators/OperatorWindowWithTime;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v0 .. v6}, Lrx/Scheduler$Worker;->schedulePeriodically(Lrx/functions/Action0;JJLjava/util/concurrent/TimeUnit;)Lrx/Subscription;

    .line 286
    return-void
.end method
