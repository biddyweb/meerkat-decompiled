.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
.super Ljava/lang/Object;
.source "TrackRunBox.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Entry"
.end annotation


# instance fields
.field private sampleCompositionTimeOffset:J

.field private sampleDuration:J

.field private sampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

.field private sampleSize:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    return-void
.end method

.method public constructor <init>(JJLco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;I)V
    .locals 3
    .param p1, "sampleDuration"    # J
    .param p3, "sampleSize"    # J
    .param p5, "sampleFlags"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    .param p6, "sampleCompositionTimeOffset"    # I

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleDuration:J

    .line 72
    iput-wide p3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleSize:J

    .line 73
    iput-object p5, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    .line 74
    int-to-long v0, p6

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleCompositionTimeOffset:J

    .line 75
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;)J
    .locals 2
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;

    .prologue
    .line 61
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleDuration:J

    return-wide v0
.end method

.method static synthetic access$002(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;J)J
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    .param p1, "x1"    # J

    .prologue
    .line 61
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleDuration:J

    return-wide p1
.end method

.method static synthetic access$100(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;)J
    .locals 2
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;

    .prologue
    .line 61
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleSize:J

    return-wide v0
.end method

.method static synthetic access$102(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;J)J
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    .param p1, "x1"    # J

    .prologue
    .line 61
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleSize:J

    return-wide p1
.end method

.method static synthetic access$200(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;

    .prologue
    .line 61
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    return-object v0
.end method

.method static synthetic access$202(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    .param p1, "x1"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    .prologue
    .line 61
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    return-object p1
.end method

.method static synthetic access$300(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;)J
    .locals 2
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;

    .prologue
    .line 61
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleCompositionTimeOffset:J

    return-wide v0
.end method

.method static synthetic access$302(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;J)J
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    .param p1, "x1"    # J

    .prologue
    .line 61
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleCompositionTimeOffset:J

    return-wide p1
.end method


# virtual methods
.method public getSampleCompositionTimeOffset()J
    .locals 2

    .prologue
    .line 90
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleCompositionTimeOffset:J

    return-wide v0
.end method

.method public getSampleDuration()J
    .locals 2

    .prologue
    .line 78
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleDuration:J

    return-wide v0
.end method

.method public getSampleFlags()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    return-object v0
.end method

.method public getSampleSize()J
    .locals 2

    .prologue
    .line 82
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleSize:J

    return-wide v0
.end method

.method public setSampleCompositionTimeOffset(I)V
    .locals 2
    .param p1, "sampleCompositionTimeOffset"    # I

    .prologue
    .line 106
    int-to-long v0, p1

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleCompositionTimeOffset:J

    .line 107
    return-void
.end method

.method public setSampleDuration(J)V
    .locals 1
    .param p1, "sampleDuration"    # J

    .prologue
    .line 94
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleDuration:J

    .line 95
    return-void
.end method

.method public setSampleFlags(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;)V
    .locals 0
    .param p1, "sampleFlags"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    .prologue
    .line 102
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    .line 103
    return-void
.end method

.method public setSampleSize(J)V
    .locals 1
    .param p1, "sampleSize"    # J

    .prologue
    .line 98
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleSize:J

    .line 99
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Entry{duration="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleDuration:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", size="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleSize:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", dlags="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", compTimeOffset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->sampleCompositionTimeOffset:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
