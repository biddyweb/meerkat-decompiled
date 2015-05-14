.class Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber$1;
.super Ljava/lang/Object;
.source "OperatorWindowWithSize.java"

# interfaces
.implements Lrx/functions/Action0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;-><init>(Lrx/internal/operators/OperatorWindowWithSize;Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;

.field final synthetic val$this$0:Lrx/internal/operators/OperatorWindowWithSize;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;Lrx/internal/operators/OperatorWindowWithSize;)V
    .locals 0

    .prologue
    .line 76
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber$1;, "Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber.1;"
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber$1;->this$1:Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;

    iput-object p2, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber$1;->val$this$0:Lrx/internal/operators/OperatorWindowWithSize;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .prologue
    .line 81
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber$1;, "Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber.1;"
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber$1;->this$1:Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;

    iget-boolean v0, v0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->noWindow:Z

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber$1;->this$1:Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;

    iget-object v0, v0, Lrx/internal/operators/OperatorWindowWithSize$ExactSubscriber;->parentSubscription:Lrx/Subscription;

    invoke-interface {v0}, Lrx/Subscription;->unsubscribe()V

    .line 84
    :cond_0
    return-void
.end method
