.class Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;
.super Ljava/lang/Object;
.source "ChunkSampleSource.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->notifyLoadStarted(Ljava/lang/String;IZJJJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

.field final synthetic val$formatId:Ljava/lang/String;

.field final synthetic val$isInitialization:Z

.field final synthetic val$length:J

.field final synthetic val$mediaEndTimeUs:J

.field final synthetic val$mediaStartTimeUs:J

.field final synthetic val$trigger:I


# direct methods
.method constructor <init>(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;Ljava/lang/String;IZJJJ)V
    .locals 1
    .param p1, "this$0"    # Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    .prologue
    .line 739
    iput-object p1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;->this$0:Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    iput-object p2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;->val$formatId:Ljava/lang/String;

    iput p3, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;->val$trigger:I

    iput-boolean p4, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;->val$isInitialization:Z

    iput-wide p5, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;->val$mediaStartTimeUs:J

    iput-wide p7, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;->val$mediaEndTimeUs:J

    iput-wide p9, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;->val$length:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 742
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;->this$0:Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    # getter for: Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventListener:Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;
    invoke-static {v0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->access$100(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;)Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;->this$0:Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    # getter for: Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventSourceId:I
    invoke-static {v0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->access$000(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;)I

    move-result v2

    iget-object v3, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;->val$formatId:Ljava/lang/String;

    iget v4, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;->val$trigger:I

    iget-boolean v5, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;->val$isInitialization:Z

    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;->this$0:Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    iget-wide v6, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;->val$mediaStartTimeUs:J

    .line 743
    invoke-virtual {v0, v6, v7}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->usToMs(J)I

    move-result v6

    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;->this$0:Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    iget-wide v8, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;->val$mediaEndTimeUs:J

    invoke-virtual {v0, v8, v9}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->usToMs(J)I

    move-result v7

    iget-wide v8, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;->val$length:J

    .line 742
    invoke-interface/range {v1 .. v9}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;->onLoadStarted(ILjava/lang/String;IZIIJ)V

    .line 744
    return-void
.end method
