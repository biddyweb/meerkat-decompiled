.class final Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;
.super Lrx/Subscriber;
.source "OperatorWindowWithObservable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorWindowWithObservable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SourceSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
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

.field consumer:Lrx/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Observer",
            "<TT;>;"
        }
    .end annotation
.end field

.field emitting:Z

.field final guard:Ljava/lang/Object;

.field producer:Lrx/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation
.end field

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


# direct methods
.method public constructor <init>(Lrx/Subscriber;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Lrx/Observable",
            "<TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 91
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber<TT;>;"
    .local p1, "child":Lrx/Subscriber;, "Lrx/Subscriber<-Lrx/Observable<TT;>;>;"
    invoke-direct {p0, p1}, Lrx/Subscriber;-><init>(Lrx/Subscriber;)V

    .line 92
    new-instance v0, Lrx/observers/SerializedSubscriber;

    invoke-direct {v0, p1}, Lrx/observers/SerializedSubscriber;-><init>(Lrx/Subscriber;)V

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->child:Lrx/Subscriber;

    .line 93
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    .line 94
    return-void
.end method


# virtual methods
.method complete()V
    .locals 2

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber<TT;>;"
    const/4 v1, 0x0

    .line 265
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->consumer:Lrx/Observer;

    .line 266
    .local v0, "s":Lrx/Observer;, "Lrx/Observer<TT;>;"
    iput-object v1, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->consumer:Lrx/Observer;

    .line 267
    iput-object v1, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->producer:Lrx/Observable;

    .line 269
    if-eqz v0, :cond_0

    .line 270
    invoke-interface {v0}, Lrx/Observer;->onCompleted()V

    .line 272
    :cond_0
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v1}, Lrx/Subscriber;->onCompleted()V

    .line 273
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->unsubscribe()V

    .line 274
    return-void
.end method

.method createNewWindow()V
    .locals 1

    .prologue
    .line 176
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber<TT;>;"
    invoke-static {}, Lrx/internal/operators/BufferUntilSubscriber;->create()Lrx/internal/operators/BufferUntilSubscriber;

    move-result-object v0

    .line 177
    .local v0, "bus":Lrx/internal/operators/BufferUntilSubscriber;, "Lrx/internal/operators/BufferUntilSubscriber<TT;>;"
    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->consumer:Lrx/Observer;

    .line 178
    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->producer:Lrx/Observable;

    .line 179
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
    .line 146
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber<TT;>;"
    .local p1, "queue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    if-nez p1, :cond_1

    .line 166
    :cond_0
    :goto_0
    return-void

    .line 149
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

    .line 150
    .local v1, "o":Ljava/lang/Object;
    sget-object v3, Lrx/internal/operators/OperatorWindowWithObservable;->NEXT_SUBJECT:Ljava/lang/Object;

    if-ne v1, v3, :cond_2

    .line 151
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->replaceSubject()V

    goto :goto_1

    .line 153
    :cond_2
    sget-object v3, Lrx/internal/operators/OperatorWindowWithObservable;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v3, v1}, Lrx/internal/operators/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 154
    sget-object v3, Lrx/internal/operators/OperatorWindowWithObservable;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v3, v1}, Lrx/internal/operators/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v3

    invoke-virtual {p0, v3}, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->error(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 157
    :cond_3
    sget-object v3, Lrx/internal/operators/OperatorWindowWithObservable;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v3, v1}, Lrx/internal/operators/NotificationLite;->isCompleted(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 158
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->complete()V

    goto :goto_0

    .line 162
    :cond_4
    move-object v2, v1

    .line 163
    .local v2, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v2}, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->emitValue(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method emitValue(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 181
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->consumer:Lrx/Observer;

    .line 182
    .local v0, "s":Lrx/Observer;, "Lrx/Observer<TT;>;"
    if-eqz v0, :cond_0

    .line 183
    invoke-interface {v0, p1}, Lrx/Observer;->onNext(Ljava/lang/Object;)V

    .line 185
    :cond_0
    return-void
.end method

.method error(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber<TT;>;"
    const/4 v1, 0x0

    .line 276
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->consumer:Lrx/Observer;

    .line 277
    .local v0, "s":Lrx/Observer;, "Lrx/Observer<TT;>;"
    iput-object v1, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->consumer:Lrx/Observer;

    .line 278
    iput-object v1, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->producer:Lrx/Observable;

    .line 280
    if-eqz v0, :cond_0

    .line 281
    invoke-interface {v0, p1}, Lrx/Observer;->onError(Ljava/lang/Throwable;)V

    .line 283
    :cond_0
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v1, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 284
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->unsubscribe()V

    .line 285
    return-void
.end method

.method public onCompleted()V
    .locals 5

    .prologue
    .line 203
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber<TT;>;"
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v3

    .line 204
    :try_start_0
    iget-boolean v2, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->emitting:Z

    if-eqz v2, :cond_1

    .line 205
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    if-nez v2, :cond_0

    .line 206
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    .line 208
    :cond_0
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    sget-object v4, Lrx/internal/operators/OperatorWindowWithObservable;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v4}, Lrx/internal/operators/NotificationLite;->completed()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 209
    monitor-exit v3

    .line 222
    :goto_0
    return-void

    .line 211
    :cond_1
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    .line 212
    .local v1, "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v2, 0x0

    iput-object v2, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    .line 213
    const/4 v2, 0x1

    iput-boolean v2, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->emitting:Z

    .line 214
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 216
    :try_start_1
    invoke-virtual {p0, v1}, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->drain(Ljava/util/List;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 221
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->complete()V

    goto :goto_0

    .line 214
    .end local v1    # "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v2

    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 217
    .restart local v1    # "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :catch_0
    move-exception v0

    .line 218
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->error(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 189
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber<TT;>;"
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v1

    .line 190
    :try_start_0
    iget-boolean v0, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->emitting:Z

    if-eqz v0, :cond_0

    .line 191
    sget-object v0, Lrx/internal/operators/OperatorWindowWithObservable;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v0, p1}, Lrx/internal/operators/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    .line 192
    monitor-exit v1

    .line 198
    :goto_0
    return-void

    .line 194
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    .line 195
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->emitting:Z

    .line 196
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 197
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->error(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 196
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
    .line 104
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 105
    :try_start_0
    iget-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->emitting:Z

    if-eqz v3, :cond_2

    .line 106
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    if-nez v3, :cond_0

    .line 107
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    .line 109
    :cond_0
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    monitor-exit v4

    .line 143
    :cond_1
    :goto_0
    return-void

    .line 112
    :cond_2
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    .line 113
    .local v0, "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v3, 0x0

    iput-object v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    .line 114
    const/4 v3, 0x1

    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->emitting:Z

    .line 115
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 116
    const/4 v1, 0x1

    .line 117
    .local v1, "once":Z
    const/4 v2, 0x0

    .line 120
    .local v2, "skipFinal":Z
    :cond_3
    :try_start_1
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->drain(Ljava/util/List;)V

    .line 121
    if-eqz v1, :cond_4

    .line 122
    const/4 v1, 0x1

    .line 123
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->emitValue(Ljava/lang/Object;)V

    .line 126
    :cond_4
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    .line 127
    :try_start_2
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    .line 128
    const/4 v3, 0x0

    iput-object v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    .line 129
    if-nez v0, :cond_5

    .line 130
    const/4 v3, 0x0

    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->emitting:Z

    .line 131
    const/4 v2, 0x1

    .line 132
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 137
    if-nez v2, :cond_1

    .line 138
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 139
    const/4 v3, 0x0

    :try_start_3
    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->emitting:Z

    .line 140
    monitor-exit v4

    goto :goto_0

    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3

    .line 115
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

    .line 134
    .restart local v0    # "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .restart local v1    # "once":Z
    .restart local v2    # "skipFinal":Z
    :cond_5
    :try_start_5
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 135
    :try_start_6
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v3}, Lrx/Subscriber;->isUnsubscribed()Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    move-result v3

    if-eqz v3, :cond_3

    .line 137
    if-nez v2, :cond_1

    .line 138
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 139
    const/4 v3, 0x0

    :try_start_7
    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->emitting:Z

    .line 140
    monitor-exit v4

    goto :goto_0

    :catchall_2
    move-exception v3

    monitor-exit v4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    throw v3

    .line 134
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

    .line 137
    :catchall_4
    move-exception v3

    if-nez v2, :cond_6

    .line 138
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 139
    const/4 v5, 0x0

    :try_start_a
    iput-boolean v5, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->emitting:Z

    .line 140
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
    .line 98
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber<TT;>;"
    const-wide v0, 0x7fffffffffffffffL

    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->request(J)V

    .line 99
    return-void
.end method

.method replaceSubject()V
    .locals 3

    .prologue
    .line 168
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber<TT;>;"
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->consumer:Lrx/Observer;

    .line 169
    .local v0, "s":Lrx/Observer;, "Lrx/Observer<TT;>;"
    if-eqz v0, :cond_0

    .line 170
    invoke-interface {v0}, Lrx/Observer;->onCompleted()V

    .line 172
    :cond_0
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->createNewWindow()V

    .line 173
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->child:Lrx/Subscriber;

    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->producer:Lrx/Observable;

    invoke-virtual {v1, v2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 174
    return-void
.end method

.method replaceWindow()V
    .locals 6

    .prologue
    .line 225
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber<TT;>;"
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 226
    :try_start_0
    iget-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->emitting:Z

    if-eqz v3, :cond_2

    .line 227
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    if-nez v3, :cond_0

    .line 228
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    .line 230
    :cond_0
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    sget-object v5, Lrx/internal/operators/OperatorWindowWithObservable;->NEXT_SUBJECT:Ljava/lang/Object;

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 231
    monitor-exit v4

    .line 263
    :cond_1
    :goto_0
    return-void

    .line 233
    :cond_2
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    .line 234
    .local v0, "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v3, 0x0

    iput-object v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    .line 235
    const/4 v3, 0x1

    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->emitting:Z

    .line 236
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 237
    const/4 v1, 0x1

    .line 238
    .local v1, "once":Z
    const/4 v2, 0x0

    .line 241
    .local v2, "skipFinal":Z
    :cond_3
    :try_start_1
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->drain(Ljava/util/List;)V

    .line 242
    if-eqz v1, :cond_4

    .line 243
    const/4 v1, 0x0

    .line 244
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->replaceSubject()V

    .line 246
    :cond_4
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    .line 247
    :try_start_2
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    .line 248
    const/4 v3, 0x0

    iput-object v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->queue:Ljava/util/List;

    .line 249
    if-nez v0, :cond_5

    .line 250
    const/4 v3, 0x0

    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->emitting:Z

    .line 251
    const/4 v2, 0x1

    .line 252
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 257
    if-nez v2, :cond_1

    .line 258
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 259
    const/4 v3, 0x0

    :try_start_3
    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->emitting:Z

    .line 260
    monitor-exit v4

    goto :goto_0

    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3

    .line 236
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

    .line 254
    .restart local v0    # "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .restart local v1    # "once":Z
    .restart local v2    # "skipFinal":Z
    :cond_5
    :try_start_5
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 255
    :try_start_6
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v3}, Lrx/Subscriber;->isUnsubscribed()Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    move-result v3

    if-eqz v3, :cond_3

    .line 257
    if-nez v2, :cond_1

    .line 258
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 259
    const/4 v3, 0x0

    :try_start_7
    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->emitting:Z

    .line 260
    monitor-exit v4

    goto :goto_0

    :catchall_2
    move-exception v3

    monitor-exit v4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    throw v3

    .line 254
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

    .line 257
    :catchall_4
    move-exception v3

    if-nez v2, :cond_6

    .line 258
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 259
    const/4 v5, 0x0

    :try_start_a
    iput-boolean v5, p0, Lrx/internal/operators/OperatorWindowWithObservable$SourceSubscriber;->emitting:Z

    .line 260
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
