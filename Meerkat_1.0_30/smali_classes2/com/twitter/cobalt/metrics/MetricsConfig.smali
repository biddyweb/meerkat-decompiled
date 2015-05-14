.class public Lcom/twitter/cobalt/metrics/MetricsConfig;
.super Ljava/lang/Object;
.source "MetricsConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;,
        Lcom/twitter/cobalt/metrics/MetricsConfig$Values;
    }
.end annotation


# static fields
.field private static final DAY_MILLIS:J = 0x5265c00L

.field private static final DEFAULT_REPORTING_INTERVAL_LONG:I = 0x5265c00

.field private static final DEFAULT_REPORTING_INTERVAL_REGULAR:I = 0x36ee80

.field private static final DEFAULT_REPORTING_INTERVAL_SHORT:I = 0x927c0

.field private static final DEFAULT_SAMPLING_RATE_DEBUG:I = 0x64

.field private static final DEFAULT_SAMPLING_RATE_HIGH:I = 0x2710

.field private static final DEFAULT_SAMPLING_RATE_LOW:I = 0x64

.field private static final HOUR_MILLIS:J = 0x36ee80L

.field private static final LOCK:Ljava/lang/Object;

.field private static final MINUTE_MILLIS:J = 0xea60L

.field private static final SECOND_MILLIS:J = 0x3e8L

.field private static sListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;",
            ">;>;"
        }
    .end annotation
.end field

.field private static sValues:Lcom/twitter/cobalt/metrics/MetricsConfig$Values;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/16 v1, 0x64

    .line 26
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/twitter/cobalt/metrics/MetricsConfig;->LOCK:Ljava/lang/Object;

    .line 28
    new-instance v0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;

    const/16 v3, 0x2710

    const v4, 0x927c0

    const v5, 0x36ee80

    const v6, 0x5265c00

    move v2, v1

    invoke-direct/range {v0 .. v6}, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;-><init>(IIIIII)V

    sput-object v0, Lcom/twitter/cobalt/metrics/MetricsConfig;->sValues:Lcom/twitter/cobalt/metrics/MetricsConfig$Values;

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/twitter/cobalt/metrics/MetricsConfig;->sListeners:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    return-void
.end method

.method public static addListener(Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;)V
    .locals 3
    .param p0, "listener"    # Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;

    .prologue
    .line 65
    sget-object v1, Lcom/twitter/cobalt/metrics/MetricsConfig;->sListeners:Ljava/util/ArrayList;

    monitor-enter v1

    .line 66
    :try_start_0
    sget-object v0, Lcom/twitter/cobalt/metrics/MetricsConfig;->sListeners:Ljava/util/ArrayList;

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    monitor-exit v1

    .line 68
    return-void

    .line 67
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static getValues()Lcom/twitter/cobalt/metrics/MetricsConfig$Values;
    .locals 2

    .prologue
    .line 39
    sget-object v1, Lcom/twitter/cobalt/metrics/MetricsConfig;->LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 40
    :try_start_0
    sget-object v0, Lcom/twitter/cobalt/metrics/MetricsConfig;->sValues:Lcom/twitter/cobalt/metrics/MetricsConfig$Values;

    monitor-exit v1

    return-object v0

    .line 41
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static removeListener(Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;)V
    .locals 4
    .param p0, "listenerToRemove"    # Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;

    .prologue
    .line 71
    sget-object v3, Lcom/twitter/cobalt/metrics/MetricsConfig;->sListeners:Ljava/util/ArrayList;

    monitor-enter v3

    .line 72
    :try_start_0
    sget-object v2, Lcom/twitter/cobalt/metrics/MetricsConfig;->sListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 73
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/ref/WeakReference<Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;>;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 74
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;

    .line 75
    .local v1, "listener":Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;
    if-eq v1, p0, :cond_1

    if-nez v1, :cond_0

    .line 76
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 79
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/ref/WeakReference<Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;>;>;"
    .end local v1    # "listener":Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/ref/WeakReference<Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;>;>;"
    :cond_2
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    return-void
.end method

.method public static setValues(Lcom/twitter/cobalt/metrics/MetricsConfig$Values;)V
    .locals 4
    .param p0, "values"    # Lcom/twitter/cobalt/metrics/MetricsConfig$Values;

    .prologue
    .line 45
    sget-object v3, Lcom/twitter/cobalt/metrics/MetricsConfig;->LOCK:Ljava/lang/Object;

    monitor-enter v3

    .line 46
    :try_start_0
    sget-object v2, Lcom/twitter/cobalt/metrics/MetricsConfig;->sValues:Lcom/twitter/cobalt/metrics/MetricsConfig$Values;

    invoke-virtual {v2, p0}, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 47
    monitor-exit v3

    .line 62
    :goto_0
    return-void

    .line 49
    :cond_0
    sput-object p0, Lcom/twitter/cobalt/metrics/MetricsConfig;->sValues:Lcom/twitter/cobalt/metrics/MetricsConfig$Values;

    .line 50
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 51
    sget-object v3, Lcom/twitter/cobalt/metrics/MetricsConfig;->sListeners:Ljava/util/ArrayList;

    monitor-enter v3

    .line 52
    :try_start_1
    sget-object v2, Lcom/twitter/cobalt/metrics/MetricsConfig;->sListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 53
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/ref/WeakReference<Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;>;>;"
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 54
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;

    .line 55
    .local v1, "listener":Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;
    if-nez v1, :cond_1

    .line 56
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 61
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/ref/WeakReference<Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;>;>;"
    .end local v1    # "listener":Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 50
    :catchall_1
    move-exception v2

    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v2

    .line 58
    .restart local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/ref/WeakReference<Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;>;>;"
    .restart local v1    # "listener":Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;
    :cond_1
    :try_start_3
    invoke-interface {v1}, Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;->onConfigChanged()V

    goto :goto_1

    .line 61
    .end local v1    # "listener":Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;
    :cond_2
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method
