.class public Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;
.super Ljava/lang/Object;
.source "SmoothStreamingManifest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TrackElement"
.end annotation


# instance fields
.field public final audioTag:I

.field public final bitPerSample:I

.field public final bitrate:I

.field public final content:Ljava/lang/String;

.field public final csd:[[B

.field public final index:I

.field public final level:I

.field public final maxHeight:I

.field public final maxWidth:I

.field public final mimeType:Ljava/lang/String;

.field public final nalUnitLengthField:I

.field public final numChannels:I

.field public final packetSize:I

.field public final profile:I

.field public final sampleRate:I


# direct methods
.method public constructor <init>(IILjava/lang/String;[[BIIIIIIIIIILjava/lang/String;)V
    .locals 0
    .param p1, "index"    # I
    .param p2, "bitrate"    # I
    .param p3, "mimeType"    # Ljava/lang/String;
    .param p4, "csd"    # [[B
    .param p5, "profile"    # I
    .param p6, "level"    # I
    .param p7, "maxWidth"    # I
    .param p8, "maxHeight"    # I
    .param p9, "sampleRate"    # I
    .param p10, "channels"    # I
    .param p11, "packetSize"    # I
    .param p12, "audioTag"    # I
    .param p13, "bitPerSample"    # I
    .param p14, "nalUnitLengthField"    # I
    .param p15, "content"    # Ljava/lang/String;

    .prologue
    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    iput p1, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->index:I

    .line 156
    iput p2, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->bitrate:I

    .line 157
    iput-object p3, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->mimeType:Ljava/lang/String;

    .line 158
    iput-object p4, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->csd:[[B

    .line 159
    iput p5, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->profile:I

    .line 160
    iput p6, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->level:I

    .line 161
    iput p7, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->maxWidth:I

    .line 162
    iput p8, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->maxHeight:I

    .line 163
    iput p9, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->sampleRate:I

    .line 164
    iput p10, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->numChannels:I

    .line 165
    iput p11, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->packetSize:I

    .line 166
    iput p12, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->audioTag:I

    .line 167
    iput p13, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->bitPerSample:I

    .line 168
    iput p14, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->nalUnitLengthField:I

    .line 169
    iput-object p15, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->content:Ljava/lang/String;

    .line 170
    return-void
.end method
