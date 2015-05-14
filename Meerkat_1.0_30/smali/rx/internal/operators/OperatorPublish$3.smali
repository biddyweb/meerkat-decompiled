.class Lrx/internal/operators/OperatorPublish$3;
.super Ljava/lang/Object;
.source "OperatorPublish.java"

# interfaces
.implements Lrx/functions/Action0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorPublish;->connect(Lrx/functions/Action1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrx/internal/operators/OperatorPublish;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorPublish;)V
    .locals 0

    .prologue
    .line 102
    .local p0, "this":Lrx/internal/operators/OperatorPublish$3;, "Lrx/internal/operators/OperatorPublish.3;"
    iput-object p1, p0, Lrx/internal/operators/OperatorPublish$3;->this$0:Lrx/internal/operators/OperatorPublish;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .prologue
    .line 105
    .local p0, "this":Lrx/internal/operators/OperatorPublish$3;, "Lrx/internal/operators/OperatorPublish.3;"
    iget-object v1, p0, Lrx/internal/operators/OperatorPublish$3;->this$0:Lrx/internal/operators/OperatorPublish;

    # getter for: Lrx/internal/operators/OperatorPublish;->requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;
    invoke-static {v1}, Lrx/internal/operators/OperatorPublish;->access$300(Lrx/internal/operators/OperatorPublish;)Lrx/internal/operators/OperatorPublish$RequestHandler;

    move-result-object v1

    # getter for: Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;
    invoke-static {v1}, Lrx/internal/operators/OperatorPublish$RequestHandler;->access$200(Lrx/internal/operators/OperatorPublish$RequestHandler;)Lrx/internal/operators/OperatorPublish$State;

    move-result-object v1

    invoke-virtual {v1}, Lrx/internal/operators/OperatorPublish$State;->getOrigin()Lrx/internal/operators/OperatorPublish$OriginSubscriber;

    move-result-object v0

    .line 106
    .local v0, "s":Lrx/internal/operators/OperatorPublish$OriginSubscriber;, "Lrx/internal/operators/OperatorPublish$OriginSubscriber<TT;>;"
    iget-object v1, p0, Lrx/internal/operators/OperatorPublish$3;->this$0:Lrx/internal/operators/OperatorPublish;

    # getter for: Lrx/internal/operators/OperatorPublish;->requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;
    invoke-static {v1}, Lrx/internal/operators/OperatorPublish;->access$300(Lrx/internal/operators/OperatorPublish;)Lrx/internal/operators/OperatorPublish$RequestHandler;

    move-result-object v1

    # getter for: Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;
    invoke-static {v1}, Lrx/internal/operators/OperatorPublish$RequestHandler;->access$200(Lrx/internal/operators/OperatorPublish$RequestHandler;)Lrx/internal/operators/OperatorPublish$State;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lrx/internal/operators/OperatorPublish$State;->setOrigin(Lrx/internal/operators/OperatorPublish$OriginSubscriber;)V

    .line 107
    if-eqz v0, :cond_0

    .line 108
    invoke-virtual {v0}, Lrx/internal/operators/OperatorPublish$OriginSubscriber;->unsubscribe()V

    .line 110
    :cond_0
    return-void
.end method
