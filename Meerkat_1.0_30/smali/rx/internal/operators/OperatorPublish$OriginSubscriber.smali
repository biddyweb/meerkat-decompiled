.class Lrx/internal/operators/OperatorPublish$OriginSubscriber;
.super Lrx/Subscriber;
.source "OperatorPublish.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorPublish;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OriginSubscriber"
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
.field private final THRESHOLD:J

.field private final buffer:Lrx/internal/util/RxRingBuffer;

.field private final originOutstanding:Ljava/util/concurrent/atomic/AtomicLong;

.field private final requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorPublish$RequestHandler",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorPublish$RequestHandler;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorPublish$RequestHandler",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 129
    .local p0, "this":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    .local p1, "requestHandler":Lrx/internal/operators/OperatorPublish$RequestHandler;, "Lrx/internal/operators/OperatorPublish$RequestHandler<TT;>;"
    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    .line 125
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->originOutstanding:Ljava/util/concurrent/atomic/AtomicLong;

    .line 126
    sget v0, Lrx/internal/util/RxRingBuffer;->SIZE:I

    div-int/lit8 v0, v0, 0x4

    int-to-long v0, v0

    iput-wide v0, p0, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->THRESHOLD:J

    .line 127
    invoke-static {}, Lrx/internal/util/RxRingBuffer;->getSpmcInstance()Lrx/internal/util/RxRingBuffer;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->buffer:Lrx/internal/util/RxRingBuffer;

    .line 130
    iput-object p1, p0, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;

    .line 131
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->buffer:Lrx/internal/util/RxRingBuffer;

    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->add(Lrx/Subscription;)V

    .line 132
    return-void
.end method

.method static synthetic access$600(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)Lrx/internal/util/RxRingBuffer;
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorPublish$OriginSubscriber;

    .prologue
    .line 122
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->buffer:Lrx/internal/util/RxRingBuffer;

    return-object v0
.end method

.method static synthetic access$700(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)Ljava/util/concurrent/atomic/AtomicLong;
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorPublish$OriginSubscriber;

    .prologue
    .line 122
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->originOutstanding:Ljava/util/concurrent/atomic/AtomicLong;

    return-object v0
.end method

.method static synthetic access$800(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)J
    .locals 2
    .param p0, "x0"    # Lrx/internal/operators/OperatorPublish$OriginSubscriber;

    .prologue
    .line 122
    iget-wide v0, p0, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->THRESHOLD:J

    return-wide v0
.end method

.method static synthetic access$900(Lrx/internal/operators/OperatorPublish$OriginSubscriber;J)V
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorPublish$OriginSubscriber;
    .param p1, "x1"    # J

    .prologue
    .line 122
    invoke-direct {p0, p1, p2}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->requestMore(J)V

    return-void
.end method

.method private requestMore(J)V
    .locals 1
    .param p1, "r"    # J

    .prologue
    .line 140
    .local p0, "this":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->originOutstanding:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 141
    invoke-virtual {p0, p1, p2}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->request(J)V

    .line 142
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 3

    .prologue
    .line 147
    .local p0, "this":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    :try_start_0
    iget-object v1, p0, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;

    iget-object v2, p0, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;

    # getter for: Lrx/internal/operators/OperatorPublish$RequestHandler;->notifier:Lrx/internal/operators/NotificationLite;
    invoke-static {v2}, Lrx/internal/operators/OperatorPublish$RequestHandler;->access$400(Lrx/internal/operators/OperatorPublish$RequestHandler;)Lrx/internal/operators/NotificationLite;

    move-result-object v2

    invoke-virtual {v2}, Lrx/internal/operators/NotificationLite;->completed()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lrx/internal/operators/OperatorPublish$RequestHandler;->emit(Ljava/lang/Object;)V
    :try_end_0
    .catch Lrx/exceptions/MissingBackpressureException; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    :goto_0
    return-void

    .line 148
    :catch_0
    move-exception v0

    .line 149
    .local v0, "e":Lrx/exceptions/MissingBackpressureException;
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 7
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 155
    .local p0, "this":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    const/4 v2, 0x0

    .line 156
    .local v2, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    iget-object v6, p0, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;

    # getter for: Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;
    invoke-static {v6}, Lrx/internal/operators/OperatorPublish$RequestHandler;->access$200(Lrx/internal/operators/OperatorPublish$RequestHandler;)Lrx/internal/operators/OperatorPublish$State;

    move-result-object v6

    invoke-virtual {v6}, Lrx/internal/operators/OperatorPublish$State;->getSubscribers()[Lrx/Subscriber;

    move-result-object v0

    .local v0, "arr$":[Lrx/Subscriber;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v5, v0, v3

    .line 158
    .local v5, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    :try_start_0
    invoke-virtual {v5, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 156
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 159
    :catch_0
    move-exception v1

    .line 160
    .local v1, "e2":Ljava/lang/Throwable;
    if-nez v2, :cond_0

    .line 161
    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 163
    .restart local v2    # "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :cond_0
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 166
    .end local v1    # "e2":Ljava/lang/Throwable;
    .end local v5    # "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    :cond_1
    invoke-static {v2}, Lrx/exceptions/Exceptions;->throwIfAny(Ljava/util/List;)V

    .line 167
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 172
    .local p0, "this":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v1, p0, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;

    iget-object v2, p0, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;

    # getter for: Lrx/internal/operators/OperatorPublish$RequestHandler;->notifier:Lrx/internal/operators/NotificationLite;
    invoke-static {v2}, Lrx/internal/operators/OperatorPublish$RequestHandler;->access$400(Lrx/internal/operators/OperatorPublish$RequestHandler;)Lrx/internal/operators/NotificationLite;

    move-result-object v2

    invoke-virtual {v2, p1}, Lrx/internal/operators/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lrx/internal/operators/OperatorPublish$RequestHandler;->emit(Ljava/lang/Object;)V
    :try_end_0
    .catch Lrx/exceptions/MissingBackpressureException; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    :goto_0
    return-void

    .line 173
    :catch_0
    move-exception v0

    .line 174
    .local v0, "e":Lrx/exceptions/MissingBackpressureException;
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 136
    .local p0, "this":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    sget v0, Lrx/internal/util/RxRingBuffer;->SIZE:I

    int-to-long v0, v0

    invoke-direct {p0, v0, v1}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->requestMore(J)V

    .line 137
    return-void
.end method
