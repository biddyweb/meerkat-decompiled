.class public Lco/getair/meerkat/utilities/DateFormatter;
.super Ljava/lang/Object;
.source "DateFormatter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static futureTimeString(JLjava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p0, "startTime"    # J
    .param p2, "format"    # Ljava/lang/String;

    .prologue
    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    div-long v4, v6, v8

    .line 17
    .local v4, "unixTime":J
    sub-long v0, p0, v4

    .line 19
    .local v0, "timeFromNow":J
    const-string v2, "hours"

    .line 20
    .local v2, "timeUnit":Ljava/lang/String;
    const-wide/16 v6, 0xe10

    cmp-long v3, v0, v6

    if-lez v3, :cond_1

    .line 22
    const-wide/16 v6, 0xe10

    div-long/2addr v0, v6

    .line 23
    const-wide/16 v6, 0x1

    cmp-long v3, v0, v6

    if-nez v3, :cond_0

    .line 25
    const-string v2, "hour"

    .line 44
    :cond_0
    :goto_0
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v3, v6

    const/4 v6, 0x1

    aput-object v2, v3, v6

    invoke-static {p2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    :goto_1
    return-object v3

    .line 27
    :cond_1
    const-wide/16 v6, 0x3c

    cmp-long v3, v0, v6

    if-lez v3, :cond_3

    .line 28
    const-wide/16 v6, 0x3c

    div-long/2addr v0, v6

    .line 29
    const-wide/16 v6, 0x1

    cmp-long v3, v0, v6

    if-nez v3, :cond_2

    .line 31
    const-string v2, "minute"

    goto :goto_0

    .line 33
    :cond_2
    const-string v2, "minutes"

    goto :goto_0

    .line 36
    :cond_3
    const-wide/16 v6, 0x0

    cmp-long v3, v0, v6

    if-lez v3, :cond_4

    const-wide/16 v6, 0x3c

    cmp-long v3, v0, v6

    if-gtz v3, :cond_4

    .line 38
    const-wide/16 v0, 0x1

    .line 39
    const-string v2, "minute"

    goto :goto_0

    .line 41
    :cond_4
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public static timeToFuture(J)J
    .locals 4
    .param p0, "futureTime"    # J

    .prologue
    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 50
    .local v2, "unixTime":J
    sub-long v0, p0, v2

    .line 52
    .local v0, "timeFromNow":J
    return-wide v0
.end method
