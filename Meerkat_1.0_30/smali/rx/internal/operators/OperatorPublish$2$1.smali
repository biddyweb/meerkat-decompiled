.class Lrx/internal/operators/OperatorPublish$2$1;
.super Ljava/lang/Object;
.source "OperatorPublish.java"

# interfaces
.implements Lrx/Producer;


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
    .line 65
    .local p0, "this":Lrx/internal/operators/OperatorPublish$2$1;, "Lrx/internal/operators/OperatorPublish$2.1;"
    iput-object p1, p0, Lrx/internal/operators/OperatorPublish$2$1;->this$1:Lrx/internal/operators/OperatorPublish$2;

    iput-object p2, p0, Lrx/internal/operators/OperatorPublish$2$1;->val$subscriber:Lrx/Subscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 3
    .param p1, "n"    # J

    .prologue
    .line 69
    .local p0, "this":Lrx/internal/operators/OperatorPublish$2$1;, "Lrx/internal/operators/OperatorPublish$2.1;"
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$2$1;->this$1:Lrx/internal/operators/OperatorPublish$2;

    iget-object v0, v0, Lrx/internal/operators/OperatorPublish$2;->val$requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;

    iget-object v1, p0, Lrx/internal/operators/OperatorPublish$2$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0, v1, p1, p2}, Lrx/internal/operators/OperatorPublish$RequestHandler;->requestFromChildSubscriber(Lrx/Subscriber;J)V

    .line 70
    return-void
.end method
