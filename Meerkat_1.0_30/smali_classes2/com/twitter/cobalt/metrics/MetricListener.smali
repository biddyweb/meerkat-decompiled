.class public interface abstract Lcom/twitter/cobalt/metrics/MetricListener;
.super Ljava/lang/Object;
.source "MetricListener.java"


# virtual methods
.method public abstract available(Lcom/twitter/cobalt/metrics/ManagedMetric;)V
.end method

.method public abstract discard(Lcom/twitter/cobalt/metrics/ManagedMetric;)V
.end method

.method public abstract persist(Lcom/twitter/cobalt/metrics/ManagedMetric;)V
.end method

.method public abstract restore()Landroid/content/SharedPreferences;
.end method
