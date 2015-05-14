.class public interface abstract Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;
.super Ljava/lang/Object;
.source "ChunkSampleSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/chunk/ChunkSampleSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "EventListener"
.end annotation


# virtual methods
.method public abstract onConsumptionError(ILjava/io/IOException;)V
.end method

.method public abstract onDownstreamDiscarded(IIIJ)V
.end method

.method public abstract onDownstreamFormatChanged(ILjava/lang/String;II)V
.end method

.method public abstract onLoadCanceled(IJ)V
.end method

.method public abstract onLoadCompleted(IJ)V
.end method

.method public abstract onLoadStarted(ILjava/lang/String;IZIIJ)V
.end method

.method public abstract onUpstreamDiscarded(IIIJ)V
.end method

.method public abstract onUpstreamError(ILjava/io/IOException;)V
.end method
