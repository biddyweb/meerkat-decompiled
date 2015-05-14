.class public Lcom/digits/sdk/android/concurrent/DigitsRetryPolicy;
.super Ljava/lang/Object;
.source "DigitsRetryPolicy.java"

# interfaces
.implements Lcom/digits/sdk/android/concurrent/RetryPolicy;


# instance fields
.field private final maxRetries:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 7
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/digits/sdk/android/concurrent/DigitsRetryPolicy;-><init>(I)V

    .line 8
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "maxRetries"    # I

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput p1, p0, Lcom/digits/sdk/android/concurrent/DigitsRetryPolicy;->maxRetries:I

    .line 12
    return-void
.end method


# virtual methods
.method public shouldRetry(ILjava/lang/Throwable;)Z
    .locals 1
    .param p1, "retries"    # I
    .param p2, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 15
    iget v0, p0, Lcom/digits/sdk/android/concurrent/DigitsRetryPolicy;->maxRetries:I

    if-ge p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
