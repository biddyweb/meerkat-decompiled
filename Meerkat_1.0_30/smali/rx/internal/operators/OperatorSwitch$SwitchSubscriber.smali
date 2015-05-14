.class final Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;
.super Lrx/Subscriber;
.source "OperatorSwitch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorSwitch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SwitchSubscriber"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/Subscriber",
        "<",
        "Lrx/Observable",
        "<+TT;>;>;"
    }
.end annotation


# instance fields
.field active:Z

.field currentSubscriber:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorSwitch$SwitchSubscriber",
            "<TT;>.InnerSubscriber;"
        }
    .end annotation
.end field

.field emitting:Z

.field final guard:Ljava/lang/Object;

.field index:I

.field volatile infinite:Z

.field initialRequested:J

.field mainDone:Z

.field final nl:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite",
            "<*>;"
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

.field final s:Lrx/observers/SerializedSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/observers/SerializedSubscriber",
            "<TT;>;"
        }
    .end annotation
.end field

.field final ssub:Lrx/subscriptions/SerialSubscription;


# direct methods
.method public constructor <init>(Lrx/Subscriber;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 79
    .local p0, "this":Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;, "Lrx/internal/operators/OperatorSwitch$SwitchSubscriber<TT;>;"
    .local p1, "child":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    .line 60
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->guard:Ljava/lang/Object;

    .line 61
    invoke-static {}, Lrx/internal/operators/NotificationLite;->instance()Lrx/internal/operators/NotificationLite;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->nl:Lrx/internal/operators/NotificationLite;

    .line 77
    const/4 v0, 0x0

    iput-boolean v0, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->infinite:Z

    .line 80
    new-instance v0, Lrx/observers/SerializedSubscriber;

    invoke-direct {v0, p1}, Lrx/observers/SerializedSubscriber;-><init>(Lrx/Subscriber;)V

    iput-object v0, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->s:Lrx/observers/SerializedSubscriber;

    .line 81
    new-instance v0, Lrx/subscriptions/SerialSubscription;

    invoke-direct {v0}, Lrx/subscriptions/SerialSubscription;-><init>()V

    iput-object v0, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->ssub:Lrx/subscriptions/SerialSubscription;

    .line 82
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->ssub:Lrx/subscriptions/SerialSubscription;

    invoke-virtual {p1, v0}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 83
    new-instance v0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$1;

    invoke-direct {v0, p0}, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$1;-><init>(Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;)V

    invoke-virtual {p1, v0}, Lrx/Subscriber;->setProducer(Lrx/Producer;)V

    .line 109
    return-void
.end method


# virtual methods
.method complete(I)V
    .locals 4
    .param p1, "id"    # I

    .prologue
    .line 253
    .local p0, "this":Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;, "Lrx/internal/operators/OperatorSwitch$SwitchSubscriber<TT;>;"
    iget-object v2, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v2

    .line 254
    :try_start_0
    iget v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->index:I

    if-eq p1, v1, :cond_0

    .line 255
    monitor-exit v2

    .line 277
    :goto_0
    return-void

    .line 257
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->active:Z

    .line 258
    iget-boolean v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->mainDone:Z

    if-nez v1, :cond_1

    .line 259
    monitor-exit v2

    goto :goto_0

    .line 272
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 261
    :cond_1
    :try_start_1
    iget-boolean v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->emitting:Z

    if-eqz v1, :cond_3

    .line 262
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    if-nez v1, :cond_2

    .line 263
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    .line 265
    :cond_2
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    iget-object v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v3}, Lrx/internal/operators/NotificationLite;->completed()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 266
    monitor-exit v2

    goto :goto_0

    .line 269
    :cond_3
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    .line 270
    .local v0, "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v1, 0x0

    iput-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    .line 271
    const/4 v1, 0x1

    iput-boolean v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->emitting:Z

    .line 272
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 274
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->drain(Ljava/util/List;)V

    .line 275
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->s:Lrx/observers/SerializedSubscriber;

    invoke-virtual {v1}, Lrx/observers/SerializedSubscriber;->onCompleted()V

    .line 276
    invoke-virtual {p0}, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->unsubscribe()V

    goto :goto_0
.end method

.method drain(Ljava/util/List;)V
    .locals 5
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
    .line 209
    .local p0, "this":Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;, "Lrx/internal/operators/OperatorSwitch$SwitchSubscriber<TT;>;"
    .local p1, "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    if-nez p1, :cond_1

    .line 226
    :cond_0
    :goto_0
    return-void

    .line 212
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

    .line 213
    .local v1, "o":Ljava/lang/Object;
    iget-object v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v3, v1}, Lrx/internal/operators/NotificationLite;->isCompleted(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 214
    iget-object v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->s:Lrx/observers/SerializedSubscriber;

    invoke-virtual {v3}, Lrx/observers/SerializedSubscriber;->onCompleted()V

    goto :goto_0

    .line 217
    :cond_2
    iget-object v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v3, v1}, Lrx/internal/operators/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 218
    iget-object v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->s:Lrx/observers/SerializedSubscriber;

    iget-object v4, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v4, v1}, Lrx/internal/operators/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v4

    invoke-virtual {v3, v4}, Lrx/observers/SerializedSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 222
    :cond_3
    move-object v2, v1

    .line 223
    .local v2, "t":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->s:Lrx/observers/SerializedSubscriber;

    invoke-virtual {v3, v2}, Lrx/observers/SerializedSubscriber;->onNext(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method emit(Ljava/lang/Object;ILrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;)V
    .locals 6
    .param p2, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I",
            "Lrx/internal/operators/OperatorSwitch$SwitchSubscriber",
            "<TT;>.InnerSubscriber;)V"
        }
    .end annotation

    .prologue
    .line 162
    .local p0, "this":Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;, "Lrx/internal/operators/OperatorSwitch$SwitchSubscriber<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    .local p3, "innerSubscriber":Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;, "Lrx/internal/operators/OperatorSwitch$SwitchSubscriber<TT;>.InnerSubscriber;"
    iget-object v4, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 163
    :try_start_0
    iget v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->index:I

    if-eq p2, v3, :cond_1

    .line 164
    monitor-exit v4

    .line 207
    :cond_0
    :goto_0
    return-void

    .line 166
    :cond_1
    iget-boolean v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->emitting:Z

    if-eqz v3, :cond_3

    .line 167
    iget-object v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    if-nez v3, :cond_2

    .line 168
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    .line 170
    :cond_2
    # operator-- for: Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;->requested:J
    invoke-static {p3}, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;->access$110(Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;)J

    .line 171
    iget-object v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    monitor-exit v4

    goto :goto_0

    .line 177
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 174
    :cond_3
    :try_start_1
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    .line 175
    .local v0, "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v3, 0x0

    iput-object v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    .line 176
    const/4 v3, 0x1

    iput-boolean v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->emitting:Z

    .line 177
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 178
    const/4 v1, 0x1

    .line 179
    .local v1, "once":Z
    const/4 v2, 0x0

    .line 182
    .local v2, "skipFinal":Z
    :cond_4
    :try_start_2
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->drain(Ljava/util/List;)V

    .line 183
    if-eqz v1, :cond_5

    .line 184
    const/4 v1, 0x0

    .line 185
    iget-object v4, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 186
    :try_start_3
    # operator-- for: Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;->requested:J
    invoke-static {p3}, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;->access$110(Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;)J

    .line 187
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 188
    :try_start_4
    iget-object v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->s:Lrx/observers/SerializedSubscriber;

    invoke-virtual {v3, p1}, Lrx/observers/SerializedSubscriber;->onNext(Ljava/lang/Object;)V

    .line 190
    :cond_5
    iget-object v4, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 191
    :try_start_5
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    .line 192
    const/4 v3, 0x0

    iput-object v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    .line 193
    if-nez v0, :cond_7

    .line 194
    const/4 v3, 0x0

    iput-boolean v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->emitting:Z

    .line 195
    const/4 v2, 0x1

    .line 196
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 201
    :goto_1
    if-nez v2, :cond_0

    .line 202
    iget-object v4, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 203
    const/4 v3, 0x0

    :try_start_6
    iput-boolean v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->emitting:Z

    .line 204
    monitor-exit v4

    goto :goto_0

    :catchall_1
    move-exception v3

    monitor-exit v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v3

    .line 187
    :catchall_2
    move-exception v3

    :try_start_7
    monitor-exit v4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :try_start_8
    throw v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 201
    :catchall_3
    move-exception v3

    if-nez v2, :cond_6

    .line 202
    iget-object v4, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 203
    const/4 v5, 0x0

    :try_start_9
    iput-boolean v5, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->emitting:Z

    .line 204
    monitor-exit v4
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    :cond_6
    throw v3

    .line 198
    :cond_7
    :try_start_a
    monitor-exit v4
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 199
    :try_start_b
    iget-object v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->s:Lrx/observers/SerializedSubscriber;

    invoke-virtual {v3}, Lrx/observers/SerializedSubscriber;->isUnsubscribed()Z
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    move-result v3

    if-eqz v3, :cond_4

    goto :goto_1

    .line 198
    :catchall_4
    move-exception v3

    :try_start_c
    monitor-exit v4
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    :try_start_d
    throw v3
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    .line 204
    :catchall_5
    move-exception v3

    :try_start_e
    monitor-exit v4
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    throw v3
.end method

.method error(Ljava/lang/Throwable;I)V
    .locals 4
    .param p1, "e"    # Ljava/lang/Throwable;
    .param p2, "id"    # I

    .prologue
    .line 230
    .local p0, "this":Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;, "Lrx/internal/operators/OperatorSwitch$SwitchSubscriber<TT;>;"
    iget-object v2, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v2

    .line 231
    :try_start_0
    iget v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->index:I

    if-eq p2, v1, :cond_0

    .line 232
    monitor-exit v2

    .line 250
    :goto_0
    return-void

    .line 234
    :cond_0
    iget-boolean v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->emitting:Z

    if-eqz v1, :cond_2

    .line 235
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    if-nez v1, :cond_1

    .line 236
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    .line 238
    :cond_1
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    iget-object v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v3, p1}, Lrx/internal/operators/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    monitor-exit v2

    goto :goto_0

    .line 245
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 242
    :cond_2
    :try_start_1
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    .line 243
    .local v0, "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v1, 0x0

    iput-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    .line 244
    const/4 v1, 0x1

    iput-boolean v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->emitting:Z

    .line 245
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 247
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->drain(Ljava/util/List;)V

    .line 248
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->s:Lrx/observers/SerializedSubscriber;

    invoke-virtual {v1, p1}, Lrx/observers/SerializedSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 249
    invoke-virtual {p0}, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->unsubscribe()V

    goto :goto_0
.end method

.method public onCompleted()V
    .locals 4

    .prologue
    .line 140
    .local p0, "this":Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;, "Lrx/internal/operators/OperatorSwitch$SwitchSubscriber<TT;>;"
    iget-object v2, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v2

    .line 141
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->mainDone:Z

    .line 142
    iget-boolean v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->active:Z

    if-eqz v1, :cond_0

    .line 143
    monitor-exit v2

    .line 159
    :goto_0
    return-void

    .line 145
    :cond_0
    iget-boolean v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->emitting:Z

    if-eqz v1, :cond_2

    .line 146
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    if-nez v1, :cond_1

    .line 147
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    .line 149
    :cond_1
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    iget-object v3, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v3}, Lrx/internal/operators/NotificationLite;->completed()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    monitor-exit v2

    goto :goto_0

    .line 155
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 152
    :cond_2
    :try_start_1
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    .line 153
    .local v0, "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v1, 0x0

    iput-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->queue:Ljava/util/List;

    .line 154
    const/4 v1, 0x1

    iput-boolean v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->emitting:Z

    .line 155
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 156
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->drain(Ljava/util/List;)V

    .line 157
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->s:Lrx/observers/SerializedSubscriber;

    invoke-virtual {v1}, Lrx/observers/SerializedSubscriber;->onCompleted()V

    .line 158
    invoke-virtual {p0}, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->unsubscribe()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 133
    .local p0, "this":Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;, "Lrx/internal/operators/OperatorSwitch$SwitchSubscriber<TT;>;"
    iget-object v0, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->s:Lrx/observers/SerializedSubscriber;

    invoke-virtual {v0, p1}, Lrx/observers/SerializedSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 134
    invoke-virtual {p0}, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->unsubscribe()V

    .line 135
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 57
    .local p0, "this":Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;, "Lrx/internal/operators/OperatorSwitch$SwitchSubscriber<TT;>;"
    check-cast p1, Lrx/Observable;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->onNext(Lrx/Observable;)V

    return-void
.end method

.method public onNext(Lrx/Observable;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "this":Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;, "Lrx/internal/operators/OperatorSwitch$SwitchSubscriber<TT;>;"
    .local p1, "t":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    iget-object v4, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 116
    :try_start_0
    iget v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->index:I

    add-int/lit8 v0, v1, 0x1

    iput v0, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->index:I

    .line 117
    .local v0, "id":I
    const/4 v1, 0x1

    iput-boolean v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->active:Z

    .line 118
    iget-boolean v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->infinite:Z

    if-eqz v1, :cond_0

    .line 119
    const-wide v2, 0x7fffffffffffffffL

    .line 123
    .local v2, "remainingRequest":J
    :goto_0
    new-instance v1, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;

    invoke-direct {v1, p0, v0, v2, v3}, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;-><init>(Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;IJ)V

    iput-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->currentSubscriber:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;

    .line 124
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->currentSubscriber:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;

    # setter for: Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;->requested:J
    invoke-static {v1, v2, v3}, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;->access$102(Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;J)J

    .line 125
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 126
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->ssub:Lrx/subscriptions/SerialSubscription;

    iget-object v4, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->currentSubscriber:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;

    invoke-virtual {v1, v4}, Lrx/subscriptions/SerialSubscription;->set(Lrx/Subscription;)V

    .line 128
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->currentSubscriber:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;

    invoke-virtual {p1, v1}, Lrx/Observable;->unsafeSubscribe(Lrx/Subscriber;)Lrx/Subscription;

    .line 129
    return-void

    .line 121
    .end local v2    # "remainingRequest":J
    :cond_0
    :try_start_1
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->currentSubscriber:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;

    if-nez v1, :cond_1

    iget-wide v2, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->initialRequested:J

    .restart local v2    # "remainingRequest":J
    :goto_1
    goto :goto_0

    .end local v2    # "remainingRequest":J
    :cond_1
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->currentSubscriber:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;

    # getter for: Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;->requested:J
    invoke-static {v1}, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;->access$100(Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;)J

    move-result-wide v2

    goto :goto_1

    .line 125
    .end local v0    # "id":I
    :catchall_0
    move-exception v1

    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
