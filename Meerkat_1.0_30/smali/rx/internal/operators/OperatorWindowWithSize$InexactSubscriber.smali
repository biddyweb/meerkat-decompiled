.class final Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;
.super Lrx/Subscriber;
.source "OperatorWindowWithSize.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorWindowWithSize;
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
            "Lrx/internal/operators/OperatorWindowWithSize$CountedSubject",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field count:I

.field final parentSubscription:Lrx/Subscription;

.field final synthetic this$0:Lrx/internal/operators/OperatorWindowWithSize;


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorWindowWithSize;Lrx/Subscriber;)V
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
    .line 138
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;, "Lrx/internal/operators/OperatorWindowWithSize<TT;>.InexactSubscriber;"
    .local p2, "child":Lrx/Subscriber;, "Lrx/Subscriber<-Lrx/Observable<TT;>;>;"
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithSize;

    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    .line 135
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->chunks:Ljava/util/List;

    .line 136
    iput-object p0, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->parentSubscription:Lrx/Subscription;

    .line 144
    iput-object p2, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->child:Lrx/Subscriber;

    .line 148
    new-instance v0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber$1;

    invoke-direct {v0, p0, p1}, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber$1;-><init>(Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;Lrx/internal/operators/OperatorWindowWithSize;)V

    invoke-static {v0}, Lrx/subscriptions/Subscriptions;->create(Lrx/functions/Action0;)Lrx/Subscription;

    move-result-object v0

    invoke-virtual {p2, v0}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 159
    return-void
.end method


# virtual methods
.method createCountedSubject()Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/internal/operators/OperatorWindowWithSize$CountedSubject",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 213
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;, "Lrx/internal/operators/OperatorWindowWithSize<TT;>.InexactSubscriber;"
    invoke-static {}, Lrx/internal/operators/BufferUntilSubscriber;->create()Lrx/internal/operators/BufferUntilSubscriber;

    move-result-object v0

    .line 214
    .local v0, "bus":Lrx/internal/operators/BufferUntilSubscriber;, "Lrx/internal/operators/BufferUntilSubscriber<TT;>;"
    new-instance v1, Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;

    invoke-direct {v1, v0, v0}, Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;-><init>(Lrx/Observer;Lrx/Observable;)V

    return-object v1
.end method

.method public onCompleted()V
    .locals 4

    .prologue
    .line 204
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;, "Lrx/internal/operators/OperatorWindowWithSize<TT;>.InexactSubscriber;"
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->chunks:Ljava/util/List;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 205
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithSize$CountedSubject<TT;>;>;"
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->chunks:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 206
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;

    .line 207
    .local v0, "cs":Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;, "Lrx/internal/operators/OperatorWindowWithSize$CountedSubject<TT;>;"
    iget-object v3, v0, Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;->consumer:Lrx/Observer;

    invoke-interface {v3}, Lrx/Observer;->onCompleted()V

    goto :goto_0

    .line 209
    .end local v0    # "cs":Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;, "Lrx/internal/operators/OperatorWindowWithSize$CountedSubject<TT;>;"
    :cond_0
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v3}, Lrx/Subscriber;->onCompleted()V

    .line 210
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 194
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;, "Lrx/internal/operators/OperatorWindowWithSize<TT;>.InexactSubscriber;"
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->chunks:Ljava/util/List;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 195
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lrx/internal/operators/OperatorWindowWithSize$CountedSubject<TT;>;>;"
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->chunks:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 196
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;

    .line 197
    .local v0, "cs":Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;, "Lrx/internal/operators/OperatorWindowWithSize$CountedSubject<TT;>;"
    iget-object v3, v0, Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;->consumer:Lrx/Observer;

    invoke-interface {v3, p1}, Lrx/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 199
    .end local v0    # "cs":Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;, "Lrx/internal/operators/OperatorWindowWithSize$CountedSubject<TT;>;"
    :cond_0
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v3, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 200
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 169
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;, "Lrx/internal/operators/OperatorWindowWithSize<TT;>.InexactSubscriber;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget v2, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->count:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->count:I

    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithSize;

    iget v3, v3, Lrx/internal/operators/OperatorWindowWithSize;->skip:I

    rem-int/2addr v2, v3

    if-nez v2, :cond_0

    .line 170
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v2}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v2

    if-nez v2, :cond_0

    .line 171
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->createCountedSubject()Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;

    move-result-object v0

    .line 172
    .local v0, "cs":Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;, "Lrx/internal/operators/OperatorWindowWithSize$CountedSubject<TT;>;"
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->chunks:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->child:Lrx/Subscriber;

    iget-object v3, v0, Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;->producer:Lrx/Observable;

    invoke-virtual {v2, v3}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 177
    .end local v0    # "cs":Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;, "Lrx/internal/operators/OperatorWindowWithSize$CountedSubject<TT;>;"
    :cond_0
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->chunks:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 178
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lrx/internal/operators/OperatorWindowWithSize$CountedSubject<TT;>;>;"
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 179
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;

    .line 180
    .restart local v0    # "cs":Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;, "Lrx/internal/operators/OperatorWindowWithSize$CountedSubject<TT;>;"
    iget-object v2, v0, Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;->consumer:Lrx/Observer;

    invoke-interface {v2, p1}, Lrx/Observer;->onNext(Ljava/lang/Object;)V

    .line 181
    iget v2, v0, Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;->count:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v0, Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;->count:I

    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithSize;

    iget v3, v3, Lrx/internal/operators/OperatorWindowWithSize;->size:I

    if-ne v2, v3, :cond_1

    .line 182
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 183
    iget-object v2, v0, Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;->consumer:Lrx/Observer;

    invoke-interface {v2}, Lrx/Observer;->onCompleted()V

    goto :goto_0

    .line 186
    .end local v0    # "cs":Lrx/internal/operators/OperatorWindowWithSize$CountedSubject;, "Lrx/internal/operators/OperatorWindowWithSize$CountedSubject<TT;>;"
    :cond_2
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->chunks:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_3

    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v2}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 187
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->parentSubscription:Lrx/Subscription;

    invoke-interface {v2}, Lrx/Subscription;->unsubscribe()V

    .line 190
    :cond_3
    return-void
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 164
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;, "Lrx/internal/operators/OperatorWindowWithSize<TT;>.InexactSubscriber;"
    const-wide v0, 0x7fffffffffffffffL

    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->request(J)V

    .line 165
    return-void
.end method
