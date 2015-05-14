.class Lcom/twitter/cobalt/metrics/PeriodicMetric$1;
.super Ljava/lang/Object;
.source "PeriodicMetric.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/twitter/cobalt/metrics/PeriodicMetric;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/cobalt/metrics/PeriodicMetric;


# direct methods
.method constructor <init>(Lcom/twitter/cobalt/metrics/PeriodicMetric;)V
    .locals 0

    .prologue
    .line 49
    iput-object p1, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric$1;->this$0:Lcom/twitter/cobalt/metrics/PeriodicMetric;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 52
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric$1;->this$0:Lcom/twitter/cobalt/metrics/PeriodicMetric;

    invoke-virtual {v0}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->isReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric$1;->this$0:Lcom/twitter/cobalt/metrics/PeriodicMetric;

    invoke-virtual {v0}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->makeAvailable()V

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric$1;->this$0:Lcom/twitter/cobalt/metrics/PeriodicMetric;

    # getter for: Lcom/twitter/cobalt/metrics/PeriodicMetric;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->access$000(Lcom/twitter/cobalt/metrics/PeriodicMetric;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric$1;->this$0:Lcom/twitter/cobalt/metrics/PeriodicMetric;

    invoke-virtual {v1}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->getReportInterval()I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 56
    return-void
.end method
