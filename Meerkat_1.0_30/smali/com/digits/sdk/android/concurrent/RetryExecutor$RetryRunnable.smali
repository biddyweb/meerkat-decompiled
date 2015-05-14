.class Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;
.super Ljava/lang/Object;
.source "RetryExecutor.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Ljava/util/concurrent/Delayed;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/digits/sdk/android/concurrent/RetryExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RetryRunnable"
.end annotation


# instance fields
.field private final command:Ljava/lang/Runnable;

.field private final delay:J

.field private final retries:I

.field final synthetic this$0:Lcom/digits/sdk/android/concurrent/RetryExecutor;


# direct methods
.method public constructor <init>(Lcom/digits/sdk/android/concurrent/RetryExecutor;Ljava/lang/Runnable;)V
    .locals 2
    .param p2, "command"    # Ljava/lang/Runnable;

    .prologue
    .line 64
    const-wide/16 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;-><init>(Lcom/digits/sdk/android/concurrent/RetryExecutor;Ljava/lang/Runnable;J)V

    .line 65
    return-void
.end method

.method public constructor <init>(Lcom/digits/sdk/android/concurrent/RetryExecutor;Ljava/lang/Runnable;J)V
    .locals 7
    .param p2, "command"    # Ljava/lang/Runnable;
    .param p3, "delay"    # J

    .prologue
    .line 68
    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    invoke-direct/range {v1 .. v6}, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;-><init>(Lcom/digits/sdk/android/concurrent/RetryExecutor;Ljava/lang/Runnable;JI)V

    .line 69
    return-void
.end method

.method public constructor <init>(Lcom/digits/sdk/android/concurrent/RetryExecutor;Ljava/lang/Runnable;JI)V
    .locals 3
    .param p2, "command"    # Ljava/lang/Runnable;
    .param p3, "delay"    # J
    .param p5, "retries"    # I

    .prologue
    .line 71
    iput-object p1, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;->this$0:Lcom/digits/sdk/android/concurrent/RetryExecutor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-object p2, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;->command:Ljava/lang/Runnable;

    .line 73
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    add-long/2addr v0, p3

    iput-wide v0, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;->delay:J

    .line 74
    iput p5, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;->retries:I

    .line 75
    return-void
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 58
    check-cast p1, Ljava/util/concurrent/Delayed;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;->compareTo(Ljava/util/concurrent/Delayed;)I

    move-result v0

    return v0
.end method

.method public compareTo(Ljava/util/concurrent/Delayed;)I
    .locals 4
    .param p1, "delayed"    # Ljava/util/concurrent/Delayed;

    .prologue
    .line 89
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {p1, v2}, Ljava/util/concurrent/Delayed;->getDelay(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    .line 90
    .local v0, "other":J
    iget-wide v2, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;->delay:J

    cmp-long v2, v2, v0

    if-gez v2, :cond_0

    .line 91
    const/4 v2, -0x1

    .line 95
    :goto_0
    return v2

    .line 92
    :cond_0
    iget-wide v2, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;->delay:J

    cmp-long v2, v2, v0

    if-lez v2, :cond_1

    .line 93
    const/4 v2, 0x1

    goto :goto_0

    .line 95
    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public getDelay(Ljava/util/concurrent/TimeUnit;)J
    .locals 6
    .param p1, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 83
    iget-wide v2, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;->delay:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v0, v2, v4

    .line 84
    .local v0, "diff":J
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v2

    return-wide v2
.end method

.method public getRetries()I
    .locals 1

    .prologue
    .line 78
    iget v0, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;->retries:I

    return v0
.end method

.method public run()V
    .locals 8

    .prologue
    .line 102
    :try_start_0
    iget-object v1, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;->command:Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    :cond_0
    :goto_0
    return-void

    .line 103
    :catch_0
    move-exception v0

    .line 104
    .local v0, "e":Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;->this$0:Lcom/digits/sdk/android/concurrent/RetryExecutor;

    # getter for: Lcom/digits/sdk/android/concurrent/RetryExecutor;->retryPolicy:Lcom/digits/sdk/android/concurrent/RetryPolicy;
    invoke-static {v1}, Lcom/digits/sdk/android/concurrent/RetryExecutor;->access$000(Lcom/digits/sdk/android/concurrent/RetryExecutor;)Lcom/digits/sdk/android/concurrent/RetryPolicy;

    move-result-object v1

    iget v2, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;->retries:I

    invoke-interface {v1, v2, v0}, Lcom/digits/sdk/android/concurrent/RetryPolicy;->shouldRetry(ILjava/lang/Throwable;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 105
    iget-object v1, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;->this$0:Lcom/digits/sdk/android/concurrent/RetryExecutor;

    # getter for: Lcom/digits/sdk/android/concurrent/RetryExecutor;->backoff:Lcom/digits/sdk/android/concurrent/Backoff;
    invoke-static {v1}, Lcom/digits/sdk/android/concurrent/RetryExecutor;->access$100(Lcom/digits/sdk/android/concurrent/RetryExecutor;)Lcom/digits/sdk/android/concurrent/Backoff;

    move-result-object v1

    iget v2, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;->retries:I

    invoke-interface {v1, v2}, Lcom/digits/sdk/android/concurrent/Backoff;->getDelayMillis(I)J

    move-result-wide v4

    .line 106
    .local v4, "delay":J
    iget-object v1, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;->this$0:Lcom/digits/sdk/android/concurrent/RetryExecutor;

    # getter for: Lcom/digits/sdk/android/concurrent/RetryExecutor;->delayQueue:Ljava/util/concurrent/DelayQueue;
    invoke-static {v1}, Lcom/digits/sdk/android/concurrent/RetryExecutor;->access$200(Lcom/digits/sdk/android/concurrent/RetryExecutor;)Ljava/util/concurrent/DelayQueue;

    move-result-object v7

    new-instance v1, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;

    iget-object v2, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;->this$0:Lcom/digits/sdk/android/concurrent/RetryExecutor;

    iget-object v3, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;->command:Ljava/lang/Runnable;

    iget v6, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;->retries:I

    add-int/lit8 v6, v6, 0x1

    invoke-direct/range {v1 .. v6}, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;-><init>(Lcom/digits/sdk/android/concurrent/RetryExecutor;Ljava/lang/Runnable;JI)V

    invoke-virtual {v7, v1}, Ljava/util/concurrent/DelayQueue;->offer(Ljava/util/concurrent/Delayed;)Z

    goto :goto_0
.end method
