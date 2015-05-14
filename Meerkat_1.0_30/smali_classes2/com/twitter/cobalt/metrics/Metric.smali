.class public Lcom/twitter/cobalt/metrics/Metric;
.super Ljava/lang/Object;
.source "Metric.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/cobalt/metrics/Metric$CustomLevel;,
        Lcom/twitter/cobalt/metrics/Metric$Level;
    }
.end annotation


# static fields
.field public static final LEVEL_DEBUG:Lcom/twitter/cobalt/metrics/Metric$Level;

.field public static final LEVEL_PROD_HIGH:Lcom/twitter/cobalt/metrics/Metric$Level;

.field public static final LEVEL_PROD_LOW:Lcom/twitter/cobalt/metrics/Metric$Level;


# instance fields
.field protected mDuration:J

.field protected mEventName:Ljava/lang/String;

.field protected mLevel:Lcom/twitter/cobalt/metrics/Metric$Level;

.field protected mOwnerId:J

.field protected mStartTime:J

.field protected mTag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    new-instance v0, Lcom/twitter/cobalt/metrics/Metric$1;

    invoke-direct {v0}, Lcom/twitter/cobalt/metrics/Metric$1;-><init>()V

    sput-object v0, Lcom/twitter/cobalt/metrics/Metric;->LEVEL_DEBUG:Lcom/twitter/cobalt/metrics/Metric$Level;

    .line 34
    new-instance v0, Lcom/twitter/cobalt/metrics/Metric$2;

    invoke-direct {v0}, Lcom/twitter/cobalt/metrics/Metric$2;-><init>()V

    sput-object v0, Lcom/twitter/cobalt/metrics/Metric;->LEVEL_PROD_LOW:Lcom/twitter/cobalt/metrics/Metric$Level;

    .line 52
    new-instance v0, Lcom/twitter/cobalt/metrics/Metric$3;

    invoke-direct {v0}, Lcom/twitter/cobalt/metrics/Metric$3;-><init>()V

    sput-object v0, Lcom/twitter/cobalt/metrics/Metric;->LEVEL_PROD_HIGH:Lcom/twitter/cobalt/metrics/Metric$Level;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;)V
    .locals 2
    .param p1, "eventName"    # Ljava/lang/String;
    .param p2, "level"    # Lcom/twitter/cobalt/metrics/Metric$Level;

    .prologue
    .line 98
    const-wide/16 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/twitter/cobalt/metrics/Metric;-><init>(Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;J)V

    .line 99
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;J)V
    .locals 3
    .param p1, "eventName"    # Ljava/lang/String;
    .param p2, "level"    # Lcom/twitter/cobalt/metrics/Metric$Level;
    .param p3, "duration"    # J

    .prologue
    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    iput-object p1, p0, Lcom/twitter/cobalt/metrics/Metric;->mEventName:Ljava/lang/String;

    .line 112
    iput-object p2, p0, Lcom/twitter/cobalt/metrics/Metric;->mLevel:Lcom/twitter/cobalt/metrics/Metric$Level;

    .line 113
    iput-wide p3, p0, Lcom/twitter/cobalt/metrics/Metric;->mDuration:J

    .line 114
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/twitter/cobalt/metrics/Metric;->mStartTime:J

    .line 115
    return-void
.end method


# virtual methods
.method public getDuration()J
    .locals 2

    .prologue
    .line 126
    iget-wide v0, p0, Lcom/twitter/cobalt/metrics/Metric;->mDuration:J

    return-wide v0
.end method

.method public getEventName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/Metric;->mEventName:Ljava/lang/String;

    return-object v0
.end method

.method public getEventValue()Ljava/lang/Long;
    .locals 1

    .prologue
    .line 90
    const/4 v0, 0x0

    return-object v0
.end method

.method public getLevel()Lcom/twitter/cobalt/metrics/Metric$Level;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/Metric;->mLevel:Lcom/twitter/cobalt/metrics/Metric$Level;

    return-object v0
.end method

.method public getMetaData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 94
    const/4 v0, 0x0

    return-object v0
.end method

.method public getOwnerId()J
    .locals 2

    .prologue
    .line 146
    iget-wide v0, p0, Lcom/twitter/cobalt/metrics/Metric;->mOwnerId:J

    return-wide v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/Metric;->mTag:Ljava/lang/String;

    return-object v0
.end method

.method public setLevel(Lcom/twitter/cobalt/metrics/Metric$Level;)V
    .locals 0
    .param p1, "level"    # Lcom/twitter/cobalt/metrics/Metric$Level;

    .prologue
    .line 142
    iput-object p1, p0, Lcom/twitter/cobalt/metrics/Metric;->mLevel:Lcom/twitter/cobalt/metrics/Metric$Level;

    .line 143
    return-void
.end method

.method public setOwnerId(J)V
    .locals 1
    .param p1, "ownerId"    # J

    .prologue
    .line 150
    iput-wide p1, p0, Lcom/twitter/cobalt/metrics/Metric;->mOwnerId:J

    .line 151
    return-void
.end method

.method public setTag(Ljava/lang/String;)V
    .locals 0
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 154
    iput-object p1, p0, Lcom/twitter/cobalt/metrics/Metric;->mTag:Ljava/lang/String;

    .line 155
    return-void
.end method

.method public declared-synchronized startMeasuring()V
    .locals 2

    .prologue
    .line 118
    monitor-enter p0

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/twitter/cobalt/metrics/Metric;->mStartTime:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 119
    monitor-exit p0

    return-void

    .line 118
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stopMeasuring()V
    .locals 4

    .prologue
    .line 122
    monitor-enter p0

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/twitter/cobalt/metrics/Metric;->mStartTime:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/twitter/cobalt/metrics/Metric;->mDuration:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 123
    monitor-exit p0

    return-void

    .line 122
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
