.class public Lcom/digits/sdk/android/concurrent/ExponentialBackoff;
.super Ljava/lang/Object;
.source "ExponentialBackoff.java"

# interfaces
.implements Lcom/digits/sdk/android/concurrent/Backoff;


# instance fields
.field private final constant:J


# direct methods
.method constructor <init>(J)V
    .locals 1
    .param p1, "constant"    # J

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    iput-wide p1, p0, Lcom/digits/sdk/android/concurrent/ExponentialBackoff;->constant:J

    .line 8
    return-void
.end method


# virtual methods
.method public getDelayMillis(I)J
    .locals 6
    .param p1, "retries"    # I

    .prologue
    .line 12
    iget-wide v0, p0, Lcom/digits/sdk/android/concurrent/ExponentialBackoff;->constant:J

    long-to-double v0, v0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    int-to-double v4, p1

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    mul-double/2addr v0, v2

    double-to-long v0, v0

    return-wide v0
.end method
