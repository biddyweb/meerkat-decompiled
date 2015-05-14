.class Lrx/internal/operators/OperatorPublish$2$2;
.super Ljava/lang/Object;
.source "OperatorPublish.java"

# interfaces
.implements Lrx/functions/Action0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorPublish$2;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lrx/internal/operators/OperatorPublish$2;

.field final synthetic val$subscriber:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorPublish$2;Lrx/Subscriber;)V
    .locals 0

    .prologue
    .line 73
    .local p0, "this":Lrx/internal/operators/OperatorPublish$2$2;, "Lrx/internal/operators/OperatorPublish$2.2;"
    iput-object p1, p0, Lrx/internal/operators/OperatorPublish$2$2;->this$1:Lrx/internal/operators/OperatorPublish$2;

    iput-object p2, p0, Lrx/internal/operators/OperatorPublish$2$2;->val$subscriber:Lrx/Subscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .locals 2

    .prologue
    .line 77
    .local p0, "this":Lrx/internal/operators/OperatorPublish$2$2;, "Lrx/internal/operators/OperatorPublish$2.2;"
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$2$2;->this$1:Lrx/internal/operators/OperatorPublish$2;

    iget-object v0, v0, Lrx/internal/operators/OperatorPublish$2;->val$requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;

    # getter for: Lrx/internal/operators/OperatorPublish$RequestHandler;->state:Lrx/internal/operators/OperatorPublish$State;
    invoke-static {v0}, Lrx/internal/operators/OperatorPublish$RequestHandler;->access$200(Lrx/internal/operators/OperatorPublish$RequestHandler;)Lrx/internal/operators/OperatorPublish$State;

    move-result-object v0

    iget-object v1, p0, Lrx/internal/operators/OperatorPublish$2$2;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0, v1}, Lrx/internal/operators/OperatorPublish$State;->removeSubscriber(Lrx/Subscriber;)V

    .line 78
    return-void
.end method
