.class final Lrx/internal/operators/OperatorMergeMaxConcurrent$MergeMaxConcurrentProducer;
.super Ljava/lang/Object;
.source "OperatorMergeMaxConcurrent.java"

# interfaces
.implements Lrx/Producer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorMergeMaxConcurrent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MergeMaxConcurrentProducer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/Producer;"
    }
.end annotation


# instance fields
.field final ssub:Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 60
    .local p0, "this":Lrx/internal/operators/OperatorMergeMaxConcurrent$MergeMaxConcurrentProducer;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$MergeMaxConcurrentProducer<TT;>;"
    .local p1, "ssub":Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$MergeMaxConcurrentProducer;->ssub:Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;

    .line 62
    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 65
    .local p0, "this":Lrx/internal/operators/OperatorMergeMaxConcurrent$MergeMaxConcurrentProducer;, "Lrx/internal/operators/OperatorMergeMaxConcurrent$MergeMaxConcurrentProducer<TT;>;"
    iget-object v0, p0, Lrx/internal/operators/OperatorMergeMaxConcurrent$MergeMaxConcurrentProducer;->ssub:Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;

    invoke-virtual {v0, p1, p2}, Lrx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber;->downstreamRequest(J)V

    .line 66
    return-void
.end method
