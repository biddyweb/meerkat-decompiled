.class Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;
.super Lrx/Subscriber;
.source "OperatorConcat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorConcat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ConcatInnerSubscriber"
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


# static fields
.field private static final ONCE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater",
            "<",
            "Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final child:Lrx/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Subscriber",
            "<TT;>;"
        }
    .end annotation
.end field

.field private volatile once:I

.field private final parent:Lrx/internal/operators/OperatorConcat$ConcatSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorConcat$ConcatSubscriber",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 195
    const-class v0, Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;

    const-string v1, "once"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;->ONCE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-void
.end method

.method public constructor <init>(Lrx/internal/operators/OperatorConcat$ConcatSubscriber;Lrx/Subscriber;J)V
    .locals 1
    .param p3, "initialRequest"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorConcat$ConcatSubscriber",
            "<TT;>;",
            "Lrx/Subscriber",
            "<TT;>;J)V"
        }
    .end annotation

    .prologue
    .line 197
    .local p0, "this":Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;, "Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber<TT;>;"
    .local p1, "parent":Lrx/internal/operators/OperatorConcat$ConcatSubscriber;, "Lrx/internal/operators/OperatorConcat$ConcatSubscriber<TT;>;"
    .local p2, "child":Lrx/Subscriber;, "Lrx/Subscriber<TT;>;"
    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    .line 192
    const/4 v0, 0x0

    iput v0, p0, Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;->once:I

    .line 198
    iput-object p1, p0, Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;->parent:Lrx/internal/operators/OperatorConcat$ConcatSubscriber;

    .line 199
    iput-object p2, p0, Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;->child:Lrx/Subscriber;

    .line 200
    invoke-virtual {p0, p3, p4}, Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;->request(J)V

    .line 201
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 3

    .prologue
    .line 223
    .local p0, "this":Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;, "Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber<TT;>;"
    sget-object v0, Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;->ONCE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 225
    iget-object v0, p0, Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;->parent:Lrx/internal/operators/OperatorConcat$ConcatSubscriber;

    invoke-virtual {v0}, Lrx/internal/operators/OperatorConcat$ConcatSubscriber;->completeInner()V

    .line 227
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 215
    .local p0, "this":Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;, "Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber<TT;>;"
    sget-object v0, Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;->ONCE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 217
    iget-object v0, p0, Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;->parent:Lrx/internal/operators/OperatorConcat$ConcatSubscriber;

    invoke-virtual {v0, p1}, Lrx/internal/operators/OperatorConcat$ConcatSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 219
    :cond_0
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 209
    .local p0, "this":Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;, "Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;->parent:Lrx/internal/operators/OperatorConcat$ConcatSubscriber;

    # invokes: Lrx/internal/operators/OperatorConcat$ConcatSubscriber;->decrementRequested()V
    invoke-static {v0}, Lrx/internal/operators/OperatorConcat$ConcatSubscriber;->access$200(Lrx/internal/operators/OperatorConcat$ConcatSubscriber;)V

    .line 210
    iget-object v0, p0, Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 211
    return-void
.end method

.method requestMore(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 204
    .local p0, "this":Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;, "Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber<TT;>;"
    invoke-virtual {p0, p1, p2}, Lrx/internal/operators/OperatorConcat$ConcatInnerSubscriber;->request(J)V

    .line 205
    return-void
.end method
