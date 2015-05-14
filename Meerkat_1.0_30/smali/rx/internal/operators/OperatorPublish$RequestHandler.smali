.class Lrx/internal/operators/OperatorPublish$RequestHandler;
.super Ljava/lang/Object;
.source "OperatorPublish.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorPublish;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RequestHandler"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field static final WIP:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicLongFieldUpdater",
            "<",
            "Lrx/internal/operators/OperatorPublish$RequestHandler;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final notifier:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final state:Lrx/internal/operators/OperatorPublish$State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorPublish$State",
            "<TT;>;"
        }
    .end annotation
.end field

.field volatile wip:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 290
    const-class v0, Lrx/internal/operators/OperatorPublish$RequestHandler;

    const-string v1, "wip"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-result-object v0

    sput-object v0, Lrx/internal/operators/OperatorPublish$RequestHandler;->WIP:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    .line 283
    .local p0, "this":Lrx/internal/operators/OperatorPublish$RequestHandler;, "Lrx/internal/operators/OperatorPublish$RequestHandler<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 284
    invoke-static {}, Lrx/internal/operators/NotificationLite;->instance()Lrx/internal/operators/NotificationLite;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->notifier:Lrx/internal/operators/NotificationLite;

    .line 286
    new-instance v0, Lrx/internal/operators/OperatorPublish$State;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lrx/internal/operators/OperatorPublish$State;-><init>(Lrx/internal/operators/OperatorPublish$1;)V

    iput-object v0, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;

    return-void
.end method

.method synthetic constructor <init>(Lrx/internal/operators/OperatorPublish$1;)V
    .locals 0
    .param p1, "x0"    # Lrx/internal/operators/OperatorPublish$1;

    .prologue
    .line 283
    .local p0, "this":Lrx/internal/operators/OperatorPublish$RequestHandler;, "Lrx/internal/operators/OperatorPublish$RequestHandler<TT;>;"
    invoke-direct {p0}, Lrx/internal/operators/OperatorPublish$RequestHandler;-><init>()V

    return-void
.end method

.method static synthetic access$200(Lrx/internal/operators/OperatorPublish$RequestHandler;)Lrx/internal/operators/OperatorPublish$State;
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorPublish$RequestHandler;

    .prologue
    .line 283
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;

    return-object v0
.end method

.method static synthetic access$400(Lrx/internal/operators/OperatorPublish$RequestHandler;)Lrx/internal/operators/NotificationLite;
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorPublish$RequestHandler;

    .prologue
    .line 283
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->notifier:Lrx/internal/operators/NotificationLite;

    return-object v0
.end method

.method private requestMoreAfterEmission(I)V
    .locals 8
    .param p1, "emitted"    # I

    .prologue
    .line 315
    .local p0, "this":Lrx/internal/operators/OperatorPublish$RequestHandler;, "Lrx/internal/operators/OperatorPublish$RequestHandler<TT;>;"
    if-lez p1, :cond_0

    .line 316
    iget-object v1, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;

    invoke-virtual {v1}, Lrx/internal/operators/OperatorPublish$State;->getOrigin()Lrx/internal/operators/OperatorPublish$OriginSubscriber;

    move-result-object v0

    .line 317
    .local v0, "origin":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    if-eqz v0, :cond_0

    .line 318
    # getter for: Lrx/internal/operators/OperatorPublish$OriginSubscriber;->originOutstanding:Ljava/util/concurrent/atomic/AtomicLong;
    invoke-static {v0}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->access$700(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v1

    neg-int v4, p1

    int-to-long v4, v4

    invoke-virtual {v1, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    move-result-wide v2

    .line 319
    .local v2, "r":J
    # getter for: Lrx/internal/operators/OperatorPublish$OriginSubscriber;->THRESHOLD:J
    invoke-static {v0}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->access$800(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-gtz v1, :cond_0

    .line 320
    sget v1, Lrx/internal/util/RxRingBuffer;->SIZE:I

    int-to-long v4, v1

    # getter for: Lrx/internal/operators/OperatorPublish$OriginSubscriber;->THRESHOLD:J
    invoke-static {v0}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->access$800(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)J

    move-result-wide v6

    sub-long/2addr v4, v6

    # invokes: Lrx/internal/operators/OperatorPublish$OriginSubscriber;->requestMore(J)V
    invoke-static {v0, v4, v5}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->access$900(Lrx/internal/operators/OperatorPublish$OriginSubscriber;J)V

    .line 324
    .end local v0    # "origin":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    .end local v2    # "r":J
    :cond_0
    return-void
.end method


# virtual methods
.method public drainQueue(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)V
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorPublish$OriginSubscriber",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 327
    .local p0, "this":Lrx/internal/operators/OperatorPublish$RequestHandler;, "Lrx/internal/operators/OperatorPublish$RequestHandler<TT;>;"
    .local p1, "originSubscriber":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    sget-object v16, Lrx/internal/operators/OperatorPublish$RequestHandler;->WIP:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    move-result-wide v16

    const-wide/16 v18, 0x0

    cmp-long v16, v16, v18

    if-nez v16, :cond_3

    .line 328
    move-object/from16 v0, p0

    iget-object v10, v0, Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;

    .line 329
    .local v10, "localState":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    # getter for: Lrx/internal/operators/OperatorPublish$State;->ss:Ljava/util/Map;
    invoke-static {v10}, Lrx/internal/operators/OperatorPublish$State;->access$1000(Lrx/internal/operators/OperatorPublish$State;)Ljava/util/Map;

    move-result-object v9

    .line 330
    .local v9, "localMap":Ljava/util/Map;, "Ljava/util/Map<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    # getter for: Lrx/internal/operators/OperatorPublish$OriginSubscriber;->buffer:Lrx/internal/util/RxRingBuffer;
    invoke-static/range {p1 .. p1}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->access$600(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)Lrx/internal/util/RxRingBuffer;

    move-result-object v8

    .line 331
    .local v8, "localBuffer":Lrx/internal/util/RxRingBuffer;
    move-object/from16 v0, p0

    iget-object v11, v0, Lrx/internal/operators/OperatorPublish$RequestHandler;->notifier:Lrx/internal/operators/NotificationLite;

    .line 333
    .local v11, "nl":Lrx/internal/operators/NotificationLite;, "Lrx/internal/operators/NotificationLite<TT;>;"
    const/4 v5, 0x0

    .line 339
    .local v5, "emitted":I
    :cond_0
    sget-object v16, Lrx/internal/operators/OperatorPublish$RequestHandler;->WIP:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    const-wide/16 v18, 0x1

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    move-wide/from16 v2, v18

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->set(Ljava/lang/Object;J)V

    .line 346
    :cond_1
    :goto_0
    invoke-virtual {v10}, Lrx/internal/operators/OperatorPublish$State;->hasNoSubscriber()Z

    move-result v16

    if-eqz v16, :cond_4

    .line 348
    invoke-virtual {v8}, Lrx/internal/util/RxRingBuffer;->poll()Ljava/lang/Object;

    move-result-object v16

    if-nez v16, :cond_1

    .line 377
    :cond_2
    :goto_1
    sget-object v16, Lrx/internal/operators/OperatorPublish$RequestHandler;->WIP:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->decrementAndGet(Ljava/lang/Object;)J

    move-result-wide v16

    const-wide/16 v18, 0x0

    cmp-long v16, v16, v18

    if-gtz v16, :cond_0

    .line 378
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lrx/internal/operators/OperatorPublish$RequestHandler;->requestMoreAfterEmission(I)V

    .line 380
    .end local v5    # "emitted":I
    .end local v8    # "localBuffer":Lrx/internal/util/RxRingBuffer;
    .end local v9    # "localMap":Ljava/util/Map;, "Ljava/util/Map<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    .end local v10    # "localState":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    .end local v11    # "nl":Lrx/internal/operators/NotificationLite;, "Lrx/internal/operators/NotificationLite<TT;>;"
    :cond_3
    return-void

    .line 357
    .restart local v5    # "emitted":I
    .restart local v8    # "localBuffer":Lrx/internal/util/RxRingBuffer;
    .restart local v9    # "localMap":Ljava/util/Map;, "Ljava/util/Map<Lrx/Subscriber<-TT;>;Ljava/util/concurrent/atomic/AtomicLong;>;"
    .restart local v10    # "localState":Lrx/internal/operators/OperatorPublish$State;, "Lrx/internal/operators/OperatorPublish$State<TT;>;"
    .restart local v11    # "nl":Lrx/internal/operators/NotificationLite;, "Lrx/internal/operators/NotificationLite<TT;>;"
    :cond_4
    invoke-virtual {v10}, Lrx/internal/operators/OperatorPublish$State;->canEmitWithDecrement()Z

    move-result v15

    .line 358
    .local v15, "shouldEmit":Z
    if-eqz v15, :cond_2

    .line 361
    invoke-virtual {v8}, Lrx/internal/util/RxRingBuffer;->poll()Ljava/lang/Object;

    move-result-object v12

    .line 362
    .local v12, "o":Ljava/lang/Object;
    if-nez v12, :cond_5

    .line 364
    invoke-virtual {v10}, Lrx/internal/operators/OperatorPublish$State;->incrementOutstandingAfterFailedEmit()V

    goto :goto_1

    .line 368
    :cond_5
    invoke-virtual {v10}, Lrx/internal/operators/OperatorPublish$State;->getSubscribers()[Lrx/Subscriber;

    move-result-object v4

    .local v4, "arr$":[Lrx/Subscriber;
    array-length v7, v4

    .local v7, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_2
    if-ge v6, v7, :cond_7

    aget-object v14, v4, v6

    .line 369
    .local v14, "s":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    invoke-interface {v9, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/concurrent/atomic/AtomicLong;

    .line 370
    .local v13, "req":Ljava/util/concurrent/atomic/AtomicLong;
    if-eqz v13, :cond_6

    .line 371
    invoke-virtual {v11, v14, v12}, Lrx/internal/operators/NotificationLite;->accept(Lrx/Observer;Ljava/lang/Object;)Z

    .line 372
    invoke-virtual {v13}, Ljava/util/concurrent/atomic/AtomicLong;->decrementAndGet()J

    .line 368
    :cond_6
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 375
    .end local v13    # "req":Ljava/util/concurrent/atomic/AtomicLong;
    .end local v14    # "s":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    :cond_7
    add-int/lit8 v5, v5, 0x1

    .line 376
    goto :goto_0
.end method

.method public emit(Ljava/lang/Object;)V
    .locals 3
    .param p1, "t"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lrx/exceptions/MissingBackpressureException;
        }
    .end annotation

    .prologue
    .line 301
    .local p0, "this":Lrx/internal/operators/OperatorPublish$RequestHandler;, "Lrx/internal/operators/OperatorPublish$RequestHandler<TT;>;"
    iget-object v1, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;

    invoke-virtual {v1}, Lrx/internal/operators/OperatorPublish$State;->getOrigin()Lrx/internal/operators/OperatorPublish$OriginSubscriber;

    move-result-object v0

    .line 302
    .local v0, "originSubscriber":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    if-nez v0, :cond_0

    .line 312
    :goto_0
    return-void

    .line 306
    :cond_0
    iget-object v1, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->notifier:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v1, p1}, Lrx/internal/operators/NotificationLite;->isCompleted(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 307
    # getter for: Lrx/internal/operators/OperatorPublish$OriginSubscriber;->buffer:Lrx/internal/util/RxRingBuffer;
    invoke-static {v0}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->access$600(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)Lrx/internal/util/RxRingBuffer;

    move-result-object v1

    invoke-virtual {v1}, Lrx/internal/util/RxRingBuffer;->onCompleted()V

    .line 311
    :goto_1
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorPublish$RequestHandler;->drainQueue(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)V

    goto :goto_0

    .line 309
    :cond_1
    # getter for: Lrx/internal/operators/OperatorPublish$OriginSubscriber;->buffer:Lrx/internal/util/RxRingBuffer;
    invoke-static {v0}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->access$600(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)Lrx/internal/util/RxRingBuffer;

    move-result-object v1

    iget-object v2, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->notifier:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v2, p1}, Lrx/internal/operators/NotificationLite;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lrx/internal/util/RxRingBuffer;->onNext(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public requestFromChildSubscriber(Lrx/Subscriber;J)V
    .locals 2
    .param p2, "request"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;J)V"
        }
    .end annotation

    .prologue
    .line 293
    .local p0, "this":Lrx/internal/operators/OperatorPublish$RequestHandler;, "Lrx/internal/operators/OperatorPublish$RequestHandler<TT;>;"
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    iget-object v1, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;

    invoke-virtual {v1, p1, p2, p3}, Lrx/internal/operators/OperatorPublish$State;->requestFromSubscriber(Lrx/Subscriber;J)J

    .line 294
    iget-object v1, p0, Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;

    invoke-virtual {v1}, Lrx/internal/operators/OperatorPublish$State;->getOrigin()Lrx/internal/operators/OperatorPublish$OriginSubscriber;

    move-result-object v0

    .line 295
    .local v0, "originSubscriber":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    if-eqz v0, :cond_0

    .line 296
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorPublish$RequestHandler;->drainQueue(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)V

    .line 298
    :cond_0
    return-void
.end method
