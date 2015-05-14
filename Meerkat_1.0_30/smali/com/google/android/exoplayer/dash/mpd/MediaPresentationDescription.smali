.class public Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
.super Ljava/lang/Object;
.source "MediaPresentationDescription.java"


# instance fields
.field public final availabilityStartTime:J

.field public final duration:J

.field public final dynamic:Z

.field public final minBufferTime:J

.field public final minUpdatePeriod:J

.field public final periods:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/Period;",
            ">;"
        }
    .end annotation
.end field

.field public final timeShiftBufferDepth:J

.field public final utcTiming:Lcom/google/android/exoplayer/dash/mpd/UtcTimingElement;


# direct methods
.method public constructor <init>(JJJZJJLcom/google/android/exoplayer/dash/mpd/UtcTimingElement;Ljava/util/List;)V
    .locals 1
    .param p1, "availabilityStartTime"    # J
    .param p3, "duration"    # J
    .param p5, "minBufferTime"    # J
    .param p7, "dynamic"    # Z
    .param p8, "minUpdatePeriod"    # J
    .param p10, "timeShiftBufferDepth"    # J
    .param p12, "utcTiming"    # Lcom/google/android/exoplayer/dash/mpd/UtcTimingElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJJZJJ",
            "Lcom/google/android/exoplayer/dash/mpd/UtcTimingElement;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/Period;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p13, "periods":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/Period;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-wide p1, p0, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->availabilityStartTime:J

    .line 46
    iput-wide p3, p0, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->duration:J

    .line 47
    iput-wide p5, p0, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->minBufferTime:J

    .line 48
    iput-boolean p7, p0, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->dynamic:Z

    .line 49
    iput-wide p8, p0, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->minUpdatePeriod:J

    .line 50
    iput-wide p10, p0, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->timeShiftBufferDepth:J

    .line 51
    iput-object p12, p0, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->utcTiming:Lcom/google/android/exoplayer/dash/mpd/UtcTimingElement;

    .line 52
    invoke-static {p13}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->periods:Ljava/util/List;

    .line 53
    return-void
.end method
