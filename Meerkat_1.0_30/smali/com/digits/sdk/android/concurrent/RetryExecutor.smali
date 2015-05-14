.class public Lcom/digits/sdk/android/concurrent/RetryExecutor;
.super Ljava/util/concurrent/ThreadPoolExecutor;
.source "RetryExecutor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;
    }
.end annotation


# instance fields
.field private final backoff:Lcom/digits/sdk/android/concurrent/Backoff;

.field private final delayQueue:Ljava/util/concurrent/DelayQueue;

.field private final retryPolicy:Lcom/digits/sdk/android/concurrent/RetryPolicy;


# direct methods
.method public constructor <init>(ILcom/digits/sdk/android/concurrent/RetryPolicy;)V
    .locals 4
    .param p1, "corePoolSize"    # I
    .param p2, "retryPolicy"    # Lcom/digits/sdk/android/concurrent/RetryPolicy;

    .prologue
    .line 14
    new-instance v0, Lcom/digits/sdk/android/concurrent/ExponentialBackoff;

    const-wide/16 v2, 0x3e8

    invoke-direct {v0, v2, v3}, Lcom/digits/sdk/android/concurrent/ExponentialBackoff;-><init>(J)V

    invoke-direct {p0, p1, p2, v0}, Lcom/digits/sdk/android/concurrent/RetryExecutor;-><init>(ILcom/digits/sdk/android/concurrent/RetryPolicy;Lcom/digits/sdk/android/concurrent/Backoff;)V

    .line 15
    return-void
.end method

.method public constructor <init>(ILcom/digits/sdk/android/concurrent/RetryPolicy;Lcom/digits/sdk/android/concurrent/Backoff;)V
    .locals 1
    .param p1, "corePoolSize"    # I
    .param p2, "retryPolicy"    # Lcom/digits/sdk/android/concurrent/RetryPolicy;
    .param p3, "backoff"    # Lcom/digits/sdk/android/concurrent/Backoff;

    .prologue
    .line 18
    new-instance v0, Ljava/util/concurrent/DelayQueue;

    invoke-direct {v0}, Ljava/util/concurrent/DelayQueue;-><init>()V

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/digits/sdk/android/concurrent/RetryExecutor;-><init>(ILcom/digits/sdk/android/concurrent/RetryPolicy;Lcom/digits/sdk/android/concurrent/Backoff;Ljava/util/concurrent/DelayQueue;)V

    .line 19
    return-void
.end method

.method constructor <init>(ILcom/digits/sdk/android/concurrent/RetryPolicy;Lcom/digits/sdk/android/concurrent/Backoff;Ljava/util/concurrent/DelayQueue;)V
    .locals 8
    .param p1, "corePoolSize"    # I
    .param p2, "retryPolicy"    # Lcom/digits/sdk/android/concurrent/RetryPolicy;
    .param p3, "backoff"    # Lcom/digits/sdk/android/concurrent/Backoff;
    .param p4, "delayQueue"    # Ljava/util/concurrent/DelayQueue;

    .prologue
    .line 26
    mul-int/lit8 v3, p1, 0x2

    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v1, p0

    move v2, p1

    move-object v7, p4

    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    .line 28
    if-nez p2, :cond_0

    .line 29
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "retry policy cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_0
    if-nez p3, :cond_1

    .line 33
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "backoff cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 36
    :cond_1
    iput-object p2, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor;->retryPolicy:Lcom/digits/sdk/android/concurrent/RetryPolicy;

    .line 37
    iput-object p3, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor;->backoff:Lcom/digits/sdk/android/concurrent/Backoff;

    .line 38
    iput-object p4, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor;->delayQueue:Ljava/util/concurrent/DelayQueue;

    .line 39
    return-void
.end method

.method static synthetic access$000(Lcom/digits/sdk/android/concurrent/RetryExecutor;)Lcom/digits/sdk/android/concurrent/RetryPolicy;
    .locals 1
    .param p0, "x0"    # Lcom/digits/sdk/android/concurrent/RetryExecutor;

    .prologue
    .line 8
    iget-object v0, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor;->retryPolicy:Lcom/digits/sdk/android/concurrent/RetryPolicy;

    return-object v0
.end method

.method static synthetic access$100(Lcom/digits/sdk/android/concurrent/RetryExecutor;)Lcom/digits/sdk/android/concurrent/Backoff;
    .locals 1
    .param p0, "x0"    # Lcom/digits/sdk/android/concurrent/RetryExecutor;

    .prologue
    .line 8
    iget-object v0, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor;->backoff:Lcom/digits/sdk/android/concurrent/Backoff;

    return-object v0
.end method

.method static synthetic access$200(Lcom/digits/sdk/android/concurrent/RetryExecutor;)Ljava/util/concurrent/DelayQueue;
    .locals 1
    .param p0, "x0"    # Lcom/digits/sdk/android/concurrent/RetryExecutor;

    .prologue
    .line 8
    iget-object v0, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor;->delayQueue:Ljava/util/concurrent/DelayQueue;

    return-object v0
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "command"    # Ljava/lang/Runnable;

    .prologue
    .line 43
    if-nez p1, :cond_0

    .line 44
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "runnable cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_0
    new-instance v0, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;

    invoke-direct {v0, p0, p1}, Lcom/digits/sdk/android/concurrent/RetryExecutor$RetryRunnable;-><init>(Lcom/digits/sdk/android/concurrent/RetryExecutor;Ljava/lang/Runnable;)V

    invoke-super {p0, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 48
    return-void
.end method

.method public getBackoff()Lcom/digits/sdk/android/concurrent/Backoff;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor;->backoff:Lcom/digits/sdk/android/concurrent/Backoff;

    return-object v0
.end method

.method public getRetryPolicy()Lcom/digits/sdk/android/concurrent/RetryPolicy;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/digits/sdk/android/concurrent/RetryExecutor;->retryPolicy:Lcom/digits/sdk/android/concurrent/RetryPolicy;

    return-object v0
.end method
