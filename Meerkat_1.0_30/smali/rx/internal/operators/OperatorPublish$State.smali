.class Lrx/internal/operators/OperatorPublish$State;
.super Ljava/lang/Object;
.source "OperatorPublish.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorPublish;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private origin:Lrx/internal/operators/OperatorPublish$OriginSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorPublish$OriginSubscriber",
            "<TT;>;"
        }
    .end annotation
.end field

.field private outstandingRequests:J

.field private final ss:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lrx/Subscriber",
            "<-TT;>;",
            "Ljava/util/concurrent/atomic/AtomicLong;",
            ">;"
        }
    .end annotation
.end field

.field private subscribers:[Lrx/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lrx/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 191
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 192
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lrx/internal/operators/OperatorPublish$State;->outstandingRequests:J

    .line 196
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lrx/internal/operators/OperatorPublish$State;->ss:Ljava/util/Map;

    .line 197
    const/4 v0, 0x0

    new-array v0, v0, [Lrx/Subscriber;

    iput-object v0, p0, Lrx/internal/operators/OperatorPublish$State;->subscribers:[Lrx/Subscriber;

    return-void
.end method

.method synthetic constructor <init>(Lrx/internal/operators/OperatorPublish$1;)V
    .locals 0
    .param p1, "x0"    # Lrx/internal/operators/OperatorPublish$1;

    .prologue
    .line 191
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    invoke-direct {p0}, Lrx/internal/operators/OperatorPublish$State;-><init>()V

    return-void
.end method

.method static synthetic access$1000(Lrx/internal/operators/OperatorPublish$State;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorPublish$State;

    .prologue
    .line 191
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$State;->ss:Ljava/util/Map;

    return-object v0
.end method

.method private resetAfterSubscriberUpdate(Ljava/util/Map;)J
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lrx/Subscriber",
            "<-TT;>;",
            "Ljava/util/concurrent/atomic/AtomicLong;",
            ">;)J"
        }
    .end annotation

    .prologue
    .line 263
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    .local p1, "subs":Ljava/util/Map;, "Ljava/util/Map<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v10

    new-array v7, v10, [Lrx/Subscriber;

    .line 264
    .local v7, "subscriberArray":[Lrx/Subscriber;, "[Lrx/Subscriber<-TT;>;"
    const/4 v3, 0x0

    .line 265
    .local v3, "i":I
    const-wide/16 v8, -0x1

    .line 266
    .local v8, "lowest":J
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 267
    .local v2, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "i":I
    .local v4, "i":I
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lrx/Subscriber;

    aput-object v10, v7, v3

    .line 268
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/concurrent/atomic/AtomicLong;

    .line 269
    .local v6, "l":Ljava/util/concurrent/atomic/AtomicLong;
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 270
    .local v0, "c":J
    const-wide/16 v10, -0x1

    cmp-long v10, v8, v10

    if-eqz v10, :cond_0

    cmp-long v10, v0, v8

    if-gez v10, :cond_1

    .line 271
    :cond_0
    move-wide v8, v0

    :cond_1
    move v3, v4

    .line 273
    .end local v4    # "i":I
    .restart local v3    # "i":I
    goto :goto_0

    .line 274
    .end local v0    # "c":J
    .end local v2    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    .end local v6    # "l":Ljava/util/concurrent/atomic/AtomicLong;
    :cond_2
    iput-object v7, p0, Lrx/internal/operators/OperatorPublish$State;->subscribers:[Lrx/Subscriber;

    .line 278
    iput-wide v8, p0, Lrx/internal/operators/OperatorPublish$State;->outstandingRequests:J

    .line 279
    return-wide v8
.end method


# virtual methods
.method public declared-synchronized canEmitWithDecrement()Z
    .locals 4

    .prologue
    .line 209
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lrx/internal/operators/OperatorPublish$State;->outstandingRequests:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 210
    iget-wide v0, p0, Lrx/internal/operators/OperatorPublish$State;->outstandingRequests:J

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lrx/internal/operators/OperatorPublish$State;->outstandingRequests:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 211
    const/4 v0, 0x1

    .line 213
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 209
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getOrigin()Lrx/internal/operators/OperatorPublish$OriginSubscriber;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/internal/operators/OperatorPublish$OriginSubscriber",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 201
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$State;->origin:Lrx/internal/operators/OperatorPublish$OriginSubscriber;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getSubscribers()[Lrx/Subscriber;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Lrx/Subscriber",
            "<-TT;>;"
        }
    .end annotation

    .prologue
    .line 225
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$State;->subscribers:[Lrx/Subscriber;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized hasNoSubscriber()Z
    .locals 1

    .prologue
    .line 217
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$State;->subscribers:[Lrx/Subscriber;

    array-length v0, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized incrementOutstandingAfterFailedEmit()V
    .locals 4

    .prologue
    .line 221
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lrx/internal/operators/OperatorPublish$State;->outstandingRequests:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lrx/internal/operators/OperatorPublish$State;->outstandingRequests:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 222
    monitor-exit p0

    return-void

    .line 221
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeSubscriber(Lrx/Subscriber;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 256
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$State;->ss:Ljava/util/Map;

    .line 257
    .local v0, "subs":Ljava/util/Map;, "Ljava/util/Map<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    invoke-direct {p0, v0}, Lrx/internal/operators/OperatorPublish$State;->resetAfterSubscriberUpdate(Ljava/util/Map;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 259
    monitor-exit p0

    return-void

    .line 256
    .end local v0    # "subs":Ljava/util/Map;, "Ljava/util/Map<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized requestFromSubscriber(Lrx/Subscriber;J)J
    .locals 8
    .param p2, "request"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;J)J"
        }
    .end annotation

    .prologue
    .line 232
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lrx/internal/operators/OperatorPublish$State;->ss:Ljava/util/Map;

    .line 233
    .local v3, "subs":Ljava/util/Map;, "Ljava/util/Map<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/atomic/AtomicLong;

    .line 234
    .local v2, "r":Ljava/util/concurrent/atomic/AtomicLong;
    if-nez v2, :cond_1

    .line 235
    new-instance v6, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v6, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    invoke-interface {v3, p1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    :cond_0
    :goto_0
    invoke-direct {p0, v3}, Lrx/internal/operators/OperatorPublish$State;->resetAfterSubscriberUpdate(Ljava/util/Map;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v6

    monitor-exit p0

    return-wide v6

    .line 238
    :cond_1
    :try_start_1
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 239
    .local v0, "current":J
    const-wide v6, 0x7fffffffffffffffL

    cmp-long v6, v0, v6

    if-eqz v6, :cond_0

    .line 242
    add-long v4, v0, p2

    .line 243
    .local v4, "u":J
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-gez v6, :cond_2

    .line 244
    const-wide v4, 0x7fffffffffffffffL

    .line 246
    :cond_2
    invoke-virtual {v2, v0, v1, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v6

    if-eqz v6, :cond_1

    goto :goto_0

    .line 232
    .end local v0    # "current":J
    .end local v2    # "r":Ljava/util/concurrent/atomic/AtomicLong;
    .end local v3    # "subs":Ljava/util/Map;, "Ljava/util/Map<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    .end local v4    # "u":J
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6
.end method

.method public declared-synchronized setOrigin(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorPublish$OriginSubscriber",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 205
    .local p0, "this":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    .local p1, "o":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lrx/internal/operators/OperatorPublish$State;->origin:Lrx/internal/operators/OperatorPublish$OriginSubscriber;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 206
    monitor-exit p0

    return-void

    .line 205
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
