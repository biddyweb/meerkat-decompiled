.class Lcom/twitter/cobalt/metrics/MetricsManager$1;
.super Ljava/lang/Object;
.source "MetricsManager.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/twitter/cobalt/metrics/MetricsManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/twitter/cobalt/metrics/ManagedMetric;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/cobalt/metrics/MetricsManager;


# direct methods
.method constructor <init>(Lcom/twitter/cobalt/metrics/MetricsManager;)V
    .locals 0

    .prologue
    .line 43
    iput-object p1, p0, Lcom/twitter/cobalt/metrics/MetricsManager$1;->this$0:Lcom/twitter/cobalt/metrics/MetricsManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/twitter/cobalt/metrics/ManagedMetric;Lcom/twitter/cobalt/metrics/ManagedMetric;)I
    .locals 4
    .param p1, "lhs"    # Lcom/twitter/cobalt/metrics/ManagedMetric;
    .param p2, "rhs"    # Lcom/twitter/cobalt/metrics/ManagedMetric;

    .prologue
    .line 46
    iget-wide v0, p1, Lcom/twitter/cobalt/metrics/ManagedMetric;->mCreationTime:J

    iget-wide v2, p2, Lcom/twitter/cobalt/metrics/ManagedMetric;->mCreationTime:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, -0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 43
    check-cast p1, Lcom/twitter/cobalt/metrics/ManagedMetric;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/twitter/cobalt/metrics/ManagedMetric;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/twitter/cobalt/metrics/MetricsManager$1;->compare(Lcom/twitter/cobalt/metrics/ManagedMetric;Lcom/twitter/cobalt/metrics/ManagedMetric;)I

    move-result v0

    return v0
.end method
