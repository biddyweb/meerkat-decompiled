.class Lcom/twitter/sdk/android/core/TwitterRateLimit;
.super Ljava/lang/Object;
.source "TwitterRateLimit.java"


# static fields
.field private static final LIMIT_KEY:Ljava/lang/String; = "x-rate-limit-limit"

.field private static final REMAINING_KEY:Ljava/lang/String; = "x-rate-limit-remaining"

.field private static final RESET_KEY:Ljava/lang/String; = "x-rate-limit-reset"


# instance fields
.field private limit:I

.field private remainingRequest:I

.field private reset:J

.field private final timeStamp:J


# direct methods
.method constructor <init>(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lretrofit/client/Header;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 23
    .local p1, "headers":Ljava/util/List;, "Ljava/util/List<Lretrofit/client/Header;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    if-nez p1, :cond_0

    .line 25
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "headers must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 27
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/twitter/sdk/android/core/TwitterRateLimit;->timeStamp:J

    .line 28
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lretrofit/client/Header;

    .line 29
    .local v0, "header":Lretrofit/client/Header;
    const-string v2, "x-rate-limit-limit"

    invoke-virtual {v0}, Lretrofit/client/Header;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 30
    invoke-virtual {v0}, Lretrofit/client/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, p0, Lcom/twitter/sdk/android/core/TwitterRateLimit;->limit:I

    goto :goto_0

    .line 31
    :cond_2
    const-string v2, "x-rate-limit-remaining"

    invoke-virtual {v0}, Lretrofit/client/Header;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 32
    invoke-virtual {v0}, Lretrofit/client/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, p0, Lcom/twitter/sdk/android/core/TwitterRateLimit;->remainingRequest:I

    goto :goto_0

    .line 33
    :cond_3
    const-string v2, "x-rate-limit-reset"

    invoke-virtual {v0}, Lretrofit/client/Header;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 34
    invoke-virtual {v0}, Lretrofit/client/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/twitter/sdk/android/core/TwitterRateLimit;->reset:J

    goto :goto_0

    .line 37
    .end local v0    # "header":Lretrofit/client/Header;
    :cond_4
    return-void
.end method


# virtual methods
.method public getLimit()I
    .locals 1

    .prologue
    .line 43
    iget v0, p0, Lcom/twitter/sdk/android/core/TwitterRateLimit;->limit:I

    return v0
.end method

.method public getRemaining()I
    .locals 1

    .prologue
    .line 50
    iget v0, p0, Lcom/twitter/sdk/android/core/TwitterRateLimit;->remainingRequest:I

    return v0
.end method

.method public getRemainingTime()J
    .locals 4

    .prologue
    .line 71
    iget-wide v0, p0, Lcom/twitter/sdk/android/core/TwitterRateLimit;->reset:J

    iget-wide v2, p0, Lcom/twitter/sdk/android/core/TwitterRateLimit;->timeStamp:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 72
    const-wide/16 v0, 0x0

    .line 74
    :goto_0
    return-wide v0

    :cond_0
    iget-wide v0, p0, Lcom/twitter/sdk/android/core/TwitterRateLimit;->reset:J

    iget-wide v2, p0, Lcom/twitter/sdk/android/core/TwitterRateLimit;->timeStamp:J

    sub-long/2addr v0, v2

    goto :goto_0
.end method

.method public getRequestedTime()J
    .locals 2

    .prologue
    .line 64
    iget-wide v0, p0, Lcom/twitter/sdk/android/core/TwitterRateLimit;->timeStamp:J

    return-wide v0
.end method

.method public getReset()J
    .locals 2

    .prologue
    .line 57
    iget-wide v0, p0, Lcom/twitter/sdk/android/core/TwitterRateLimit;->reset:J

    return-wide v0
.end method
