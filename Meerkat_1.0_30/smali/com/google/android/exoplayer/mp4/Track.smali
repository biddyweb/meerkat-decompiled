.class public final Lcom/google/android/exoplayer/mp4/Track;
.super Ljava/lang/Object;
.source "Track.java"


# static fields
.field public static final TYPE_AUDIO:I = 0x736f756e

.field public static final TYPE_HINT:I = 0x68696e74

.field public static final TYPE_META:I = 0x6d657461

.field public static final TYPE_TEXT:I = 0x74657874

.field public static final TYPE_TIME_CODE:I = 0x746d6364

.field public static final TYPE_VIDEO:I = 0x76696465


# instance fields
.field public final durationUs:J

.field public final id:I

.field public final mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

.field public final sampleDescriptionEncryptionBoxes:[Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;

.field public final timescale:J

.field public final type:I


# direct methods
.method public constructor <init>(IIJJLcom/google/android/exoplayer/MediaFormat;[Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "type"    # I
    .param p3, "timescale"    # J
    .param p5, "durationUs"    # J
    .param p7, "mediaFormat"    # Lcom/google/android/exoplayer/MediaFormat;
    .param p8, "sampleDescriptionEncryptionBoxes"    # [Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    iput p1, p0, Lcom/google/android/exoplayer/mp4/Track;->id:I

    .line 86
    iput p2, p0, Lcom/google/android/exoplayer/mp4/Track;->type:I

    .line 87
    iput-wide p3, p0, Lcom/google/android/exoplayer/mp4/Track;->timescale:J

    .line 88
    iput-wide p5, p0, Lcom/google/android/exoplayer/mp4/Track;->durationUs:J

    .line 89
    iput-object p7, p0, Lcom/google/android/exoplayer/mp4/Track;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    .line 90
    iput-object p8, p0, Lcom/google/android/exoplayer/mp4/Track;->sampleDescriptionEncryptionBoxes:[Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;

    .line 91
    return-void
.end method
