.class public Lcom/twitter/cobalt/metrics/ConsoleReporter;
.super Ljava/lang/Object;
.source "ConsoleReporter.java"

# interfaces
.implements Lcom/twitter/cobalt/metrics/MetricsReporter;


# static fields
.field private static final MAX_TAG_LENGTH:I = 0x17


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected getLogString(Lcom/twitter/cobalt/metrics/Metric;)Ljava/lang/String;
    .locals 6
    .param p1, "metricData"    # Lcom/twitter/cobalt/metrics/Metric;

    .prologue
    .line 31
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .local v2, "sb":Ljava/lang/StringBuilder;
    const-string v3, "Recorded metric "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/twitter/cobalt/metrics/Metric;->getEventName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " duration="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/twitter/cobalt/metrics/Metric;->getDuration()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ownerId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/twitter/cobalt/metrics/Metric;->getOwnerId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 35
    invoke-virtual {p1}, Lcom/twitter/cobalt/metrics/Metric;->getEventValue()Ljava/lang/Long;

    move-result-object v0

    .line 36
    .local v0, "eventValue":Ljava/lang/Long;
    invoke-virtual {p1}, Lcom/twitter/cobalt/metrics/Metric;->getMetaData()Ljava/lang/String;

    move-result-object v1

    .line 37
    .local v1, "metaData":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 38
    const-string v3, " eventValue="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    :cond_0
    if-eqz v1, :cond_1

    .line 41
    const-string v3, " metaData="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 27
    const-class v0, Lcom/twitter/cobalt/metrics/ConsoleReporter;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public report(Lcom/twitter/cobalt/metrics/Metric;)V
    .locals 6
    .param p1, "metric"    # Lcom/twitter/cobalt/metrics/Metric;

    .prologue
    .line 15
    invoke-virtual {p1}, Lcom/twitter/cobalt/metrics/Metric;->getTag()Ljava/lang/String;

    move-result-object v1

    .line 16
    .local v1, "tag":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x17

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 17
    .local v2, "truncatedTag":Ljava/lang/String;
    const/4 v3, 0x3

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 18
    invoke-virtual {p0, p1}, Lcom/twitter/cobalt/metrics/ConsoleReporter;->getLogString(Lcom/twitter/cobalt/metrics/Metric;)Ljava/lang/String;

    move-result-object v0

    .line 19
    .local v0, "message":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 20
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .end local v0    # "message":Ljava/lang/String;
    :cond_0
    return-void
.end method
