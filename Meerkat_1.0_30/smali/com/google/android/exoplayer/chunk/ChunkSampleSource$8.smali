.class Lcom/google/android/exoplayer/chunk/ChunkSampleSource$8;
.super Ljava/lang/Object;
.source "ChunkSampleSource.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->notifyDownstreamDiscarded(JJJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

.field final synthetic val$bytesDiscarded:J

.field final synthetic val$mediaEndTimeUs:J

.field final synthetic val$mediaStartTimeUs:J


# direct methods
.method constructor <init>(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;JJJ)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    .prologue
    .line 822
    iput-object p1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$8;->this$0:Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    iput-wide p2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$8;->val$mediaStartTimeUs:J

    iput-wide p4, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$8;->val$mediaEndTimeUs:J

    iput-wide p6, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$8;->val$bytesDiscarded:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 825
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$8;->this$0:Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    # getter for: Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventListener:Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;
    invoke-static {v0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->access$100(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;)Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$8;->this$0:Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    # getter for: Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventSourceId:I
    invoke-static {v1}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->access$000(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;)I

    move-result v1

    iget-object v2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$8;->this$0:Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    iget-wide v4, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$8;->val$mediaStartTimeUs:J

    invoke-virtual {v2, v4, v5}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->usToMs(J)I

    move-result v2

    iget-object v3, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$8;->this$0:Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    iget-wide v4, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$8;->val$mediaEndTimeUs:J

    .line 826
    invoke-virtual {v3, v4, v5}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->usToMs(J)I

    move-result v3

    iget-wide v4, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$8;->val$bytesDiscarded:J

    .line 825
    invoke-interface/range {v0 .. v5}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;->onDownstreamDiscarded(IIIJ)V

    .line 827
    return-void
.end method
