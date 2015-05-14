.class Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;
.super Ljava/lang/Object;
.source "DefaultLoadControl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/DefaultLoadControl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LoaderState"
.end annotation


# instance fields
.field public final bufferSizeContribution:I

.field public bufferState:I

.field public failed:Z

.field public loading:Z

.field public nextLoadPositionUs:J


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "bufferSizeContribution"    # I

    .prologue
    const/4 v0, 0x0

    .line 274
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 275
    iput p1, p0, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->bufferSizeContribution:I

    .line 276
    iput v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->bufferState:I

    .line 277
    iput-boolean v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->loading:Z

    .line 278
    iput-boolean v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->failed:Z

    .line 279
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->nextLoadPositionUs:J

    .line 280
    return-void
.end method
