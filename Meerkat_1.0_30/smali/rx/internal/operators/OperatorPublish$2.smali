.class Lrx/internal/operators/OperatorPublish$2;
.super Ljava/lang/Object;
.source "OperatorPublish.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorPublish;-><init>(Lrx/Observable;Ljava/lang/Object;Lrx/internal/operators/OperatorPublish$RequestHandler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/Observable$OnSubscribe",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic val$requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorPublish$RequestHandler;)V
    .locals 0

    .prologue
    .line 62
    .local p0, "this":Lrx/internal/operators/OperatorPublish$2;, "Lrx/internal/operators/OperatorPublish.2;"
    iput-object p1, p0, Lrx/internal/operators/OperatorPublish$2;->val$requestHandler:Lrx/internal/operators/OperatorPublish$RequestHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 62
    .local p0, "this":Lrx/internal/operators/OperatorPublish$2;, "Lrx/internal/operators/OperatorPublish.2;"
    check-cast p1, Lrx/Subscriber;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorPublish$2;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, "this":Lrx/internal/operators/OperatorPublish$2;, "Lrx/internal/operators/OperatorPublish.2;"
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorPublish$2$1;

    invoke-direct {v0, p0, p1}, Lrx/internal/operators/OperatorPublish$2$1;-><init>(Lrx/internal/operators/OperatorPublish$2;Lrx/Subscriber;)V

    invoke-virtual {p1, v0}, Lrx/Subscriber;->setProducer(Lrx/Producer;)V

    .line 73
    new-instance v0, Lrx/internal/operators/OperatorPublish$2$2;

    invoke-direct {v0, p0, p1}, Lrx/internal/operators/OperatorPublish$2$2;-><init>(Lrx/internal/operators/OperatorPublish$2;Lrx/Subscriber;)V

    invoke-static {v0}, Lrx/subscriptions/Subscriptions;->create(Lrx/functions/Action0;)Lrx/Subscription;

    move-result-object v0

    invoke-virtual {p1, v0}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 81
    return-void
.end method
