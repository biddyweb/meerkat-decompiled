.class final Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;
.super Lrx/Subscriber;
.source "OperatorWindowWithStartEndObservable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorWindowWithStartEndObservable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "SourceSubscriber"
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
            "Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final csub:Lrx/subscriptions/CompositeSubscription;

.field done:Z

.field final guard:Ljava/lang/Object;

.field final synthetic this$0:Lrx/internal/operators/OperatorWindowWithStartEndObservable;


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorWindowWithStartEndObservable;Lrx/Subscriber;)V
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
    .line 100
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable<TT;TU;TV;>.SourceSubscriber;"
    .local p2, "child":Lrx/Subscriber;, "Lrx/Subscriber<-Lrx/Observable<TT;>;>;"
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithStartEndObservable;

    .line 101
    invoke-direct {p0, p2}, Lrx/Subscriber;-><init>(Lrx/Subscriber;)V

    .line 102
    new-instance v0, Lrx/observers/SerializedSubscriber;

    invoke-direct {v0, p2}, Lrx/observers/SerializedSubscriber;-><init>(Lrx/Subscriber;)V

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->child:Lrx/Subscriber;

    .line 103
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    .line 104
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->chunks:Ljava/util/List;

    .line 105
    new-instance v0, Lrx/subscriptions/CompositeSubscription;

    invoke-direct {v0}, Lrx/subscriptions/CompositeSubscription;-><init>()V

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->csub:Lrx/subscriptions/CompositeSubscription;

    .line 106
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->csub:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {p2, v0}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 107
    return-void
.end method


# virtual methods
.method beginWindow(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TU;)V"
        }
    .end annotation

    .prologue
    .line 163
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable<TT;TU;TV;>.SourceSubscriber;"
    .local p1, "token":Ljava/lang/Object;, "TU;"
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->createSerializedSubject()Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;

    move-result-object v2

    .line 164
    .local v2, "s":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;"
    iget-object v5, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v5

    .line 165
    :try_start_0
    iget-boolean v4, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->done:Z

    if-eqz v4, :cond_0

    .line 166
    monitor-exit v5

    .line 205
    :goto_0
    return-void

    .line 168
    :cond_0
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->chunks:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->child:Lrx/Subscriber;

    iget-object v5, v2, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;->producer:Lrx/Observable;

    invoke-virtual {v4, v5}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 174
    :try_start_1
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithStartEndObservable;

    iget-object v4, v4, Lrx/internal/operators/OperatorWindowWithStartEndObservable;->windowClosingSelector:Lrx/functions/Func1;

    invoke-interface {v4, p1}, Lrx/functions/Func1;->call(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrx/Observable;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 180
    .local v1, "end":Lrx/Observable;, "Lrx/Observable<+TV;>;"
    new-instance v3, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber$1;

    invoke-direct {v3, p0, v2}, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber$1;-><init>(Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;)V

    .line 202
    .local v3, "v":Lrx/Subscriber;, "Lrx/Subscriber<TV;>;"
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->csub:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v4, v3}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 204
    invoke-virtual {v1, v3}, Lrx/Observable;->unsafeSubscribe(Lrx/Subscriber;)Lrx/Subscription;

    goto :goto_0

    .line 169
    .end local v1    # "end":Lrx/Observable;, "Lrx/Observable<+TV;>;"
    .end local v3    # "v":Lrx/Subscriber;, "Lrx/Subscriber<TV;>;"
    :catchall_0
    move-exception v4

    :try_start_2
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .line 175
    :catch_0
    move-exception v0

    .line 176
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method createSerializedSubject()Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 227
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable<TT;TU;TV;>.SourceSubscriber;"
    invoke-static {}, Lrx/internal/operators/BufferUntilSubscriber;->create()Lrx/internal/operators/BufferUntilSubscriber;

    move-result-object v0

    .line 228
    .local v0, "bus":Lrx/internal/operators/BufferUntilSubscriber;, "Lrx/internal/operators/BufferUntilSubscriber<TT;>;"
    new-instance v1, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;

    invoke-direct {v1, v0, v0}, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;-><init>(Lrx/Observer;Lrx/Observable;)V

    return-object v1
.end method

.method endWindow(Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 207
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable<TT;TU;TV;>.SourceSubscriber;"
    .local p1, "window":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;"
    const/4 v2, 0x0

    .line 208
    .local v2, "terminate":Z
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 209
    :try_start_0
    iget-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->done:Z

    if-eqz v3, :cond_1

    .line 210
    monitor-exit v4

    .line 225
    :cond_0
    :goto_0
    return-void

    .line 212
    :cond_1
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->chunks:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 213
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;>;"
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 214
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;

    .line 215
    .local v1, "s":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;"
    if-ne v1, p1, :cond_2

    .line 216
    const/4 v2, 0x1

    .line 217
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 221
    .end local v1    # "s":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;"
    :cond_3
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 222
    if-eqz v2, :cond_0

    .line 223
    iget-object v3, p1, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;->consumer:Lrx/Observer;

    invoke-interface {v3}, Lrx/Observer;->onCompleted()V

    goto :goto_0

    .line 221
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;>;"
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method

.method public onCompleted()V
    .locals 5

    .prologue
    .line 148
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable<TT;TU;TV;>.SourceSubscriber;"
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 149
    :try_start_0
    iget-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->done:Z

    if-eqz v3, :cond_0

    .line 150
    monitor-exit v4

    .line 160
    :goto_0
    return-void

    .line 152
    :cond_0
    const/4 v3, 0x1

    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->done:Z

    .line 153
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->chunks:Ljava/util/List;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 154
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;>;"
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->chunks:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 155
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 156
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;

    .line 157
    .local v0, "cs":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;"
    iget-object v3, v0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;->consumer:Lrx/Observer;

    invoke-interface {v3}, Lrx/Observer;->onCompleted()V

    goto :goto_1

    .line 155
    .end local v0    # "cs":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;>;"
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 159
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;>;"
    :cond_1
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v3}, Lrx/Subscriber;->onCompleted()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 5
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 131
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable<TT;TU;TV;>.SourceSubscriber;"
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 132
    :try_start_0
    iget-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->done:Z

    if-eqz v3, :cond_0

    .line 133
    monitor-exit v4

    .line 143
    :goto_0
    return-void

    .line 135
    :cond_0
    const/4 v3, 0x1

    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->done:Z

    .line 136
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->chunks:Ljava/util/List;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 137
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;>;"
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->chunks:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 138
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 139
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;

    .line 140
    .local v0, "cs":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;"
    iget-object v3, v0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;->consumer:Lrx/Observer;

    invoke-interface {v3, p1}, Lrx/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 138
    .end local v0    # "cs":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;>;"
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 142
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;>;"
    :cond_1
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v3, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 117
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable<TT;TU;TV;>.SourceSubscriber;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 118
    :try_start_0
    iget-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->done:Z

    if-eqz v3, :cond_1

    .line 119
    monitor-exit v4

    .line 126
    :cond_0
    return-void

    .line 121
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->chunks:Ljava/util/List;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 122
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;>;"
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 123
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;

    .line 124
    .local v0, "cs":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;"
    iget-object v3, v0, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;->consumer:Lrx/Observer;

    invoke-interface {v3, p1}, Lrx/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    .line 122
    .end local v0    # "cs":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject<TT;>;>;"
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 111
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;, "Lrx/internal/operators/OperatorWindowWithStartEndObservable<TT;TU;TV;>.SourceSubscriber;"
    const-wide v0, 0x7fffffffffffffffL

    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber;->request(J)V

    .line 112
    return-void
.end method
