.class Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber$1;
.super Ljava/lang/Object;
.source "OperatorWindowWithSize.java"

# interfaces
.implements Lrx/functions/Action0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;-><init>(Lrx/internal/operators/OperatorWindowWithSize;Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;

.field final synthetic val$this$0:Lrx/internal/operators/OperatorWindowWithSize;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;Lrx/internal/operators/OperatorWindowWithSize;)V
    .locals 0

    .prologue
    .line 148
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber$1;, "Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber.1;"
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber$1;->this$1:Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;

    iput-object p2, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber$1;->val$this$0:Lrx/internal/operators/OperatorWindowWithSize;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .prologue
    .line 153
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber$1;, "Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber.1;"
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber$1;->this$1:Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;

    iget-object v0, v0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->chunks:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber$1;->this$1:Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;

    iget-object v0, v0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->chunks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_1

    .line 154
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber$1;->this$1:Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;

    iget-object v0, v0, Lrx/internal/operators/OperatorWindowWithSize$InexactSubscriber;->parentSubscription:Lrx/Subscription;

    invoke-interface {v0}, Lrx/Subscription;->unsubscribe()V

    .line 156
    :cond_1
    return-void
.end method
