.class public Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;
.super Ljava/lang/Object;
.source "SessionMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/twitter/sdk/android/core/internal/SessionMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "MonitorState"
.end annotation


# static fields
.field private static final TIME_THRESHOLD_IN_MILLIS:J = 0x1499700L


# instance fields
.field public lastVerification:J

.field private final utcCalendar:Ljava/util/Calendar;

.field public verifying:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    const-string v0, "UTC"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;->utcCalendar:Ljava/util/Calendar;

    .line 125
    return-void
.end method

.method private isOnSameDate(JJ)Z
    .locals 7
    .param p1, "timeA"    # J
    .param p3, "timeB"    # J

    .prologue
    const/4 v6, 0x6

    const/4 v4, 0x1

    .line 144
    iget-object v5, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;->utcCalendar:Ljava/util/Calendar;

    invoke-virtual {v5, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 145
    iget-object v5, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;->utcCalendar:Ljava/util/Calendar;

    invoke-virtual {v5, v6}, Ljava/util/Calendar;->get(I)I

    move-result v0

    .line 146
    .local v0, "dayA":I
    iget-object v5, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;->utcCalendar:Ljava/util/Calendar;

    invoke-virtual {v5, v4}, Ljava/util/Calendar;->get(I)I

    move-result v2

    .line 148
    .local v2, "yearA":I
    iget-object v5, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;->utcCalendar:Ljava/util/Calendar;

    invoke-virtual {v5, p3, p4}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 149
    iget-object v5, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;->utcCalendar:Ljava/util/Calendar;

    invoke-virtual {v5, v6}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 150
    .local v1, "dayB":I
    iget-object v5, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;->utcCalendar:Ljava/util/Calendar;

    invoke-virtual {v5, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 152
    .local v3, "yearB":I
    if-ne v0, v1, :cond_0

    if-ne v2, v3, :cond_0

    :goto_0
    return v4

    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized beginVerification(J)Z
    .locals 9
    .param p1, "currentTime"    # J

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 128
    monitor-enter p0

    :try_start_0
    iget-wide v4, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;->lastVerification:J

    sub-long v4, p1, v4

    const-wide/32 v6, 0x1499700

    cmp-long v4, v4, v6

    if-lez v4, :cond_1

    move v1, v2

    .line 130
    .local v1, "isPastThreshold":Z
    :goto_0
    iget-wide v4, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;->lastVerification:J

    invoke-direct {p0, p1, p2, v4, v5}, Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;->isOnSameDate(JJ)Z

    move-result v4

    if-nez v4, :cond_2

    move v0, v2

    .line 132
    .local v0, "dayHasChanged":Z
    :goto_1
    iget-boolean v4, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;->verifying:Z

    if-nez v4, :cond_3

    if-nez v1, :cond_0

    if-eqz v0, :cond_3

    .line 133
    :cond_0
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;->verifying:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    :goto_2
    monitor-exit p0

    return v2

    .end local v0    # "dayHasChanged":Z
    .end local v1    # "isPastThreshold":Z
    :cond_1
    move v1, v3

    .line 128
    goto :goto_0

    .restart local v1    # "isPastThreshold":Z
    :cond_2
    move v0, v3

    .line 130
    goto :goto_1

    .restart local v0    # "dayHasChanged":Z
    :cond_3
    move v2, v3

    .line 135
    goto :goto_2

    .line 128
    .end local v0    # "dayHasChanged":Z
    .end local v1    # "isPastThreshold":Z
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized endVerification(J)V
    .locals 1
    .param p1, "currentTime"    # J

    .prologue
    .line 139
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;->verifying:Z

    .line 140
    iput-wide p1, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;->lastVerification:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    monitor-exit p0

    return-void

    .line 139
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
