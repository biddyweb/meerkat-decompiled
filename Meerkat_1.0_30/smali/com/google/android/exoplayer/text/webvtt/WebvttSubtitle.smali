.class public Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;
.super Ljava/lang/Object;
.source "WebvttSubtitle.java"

# interfaces
.implements Lcom/google/android/exoplayer/text/Subtitle;


# instance fields
.field private final cueText:[Ljava/lang/String;

.field private final cueTimesUs:[J

.field private final sortedCueTimesUs:[J

.field private final startTimeUs:J


# direct methods
.method public constructor <init>([Ljava/lang/String;J[J)V
    .locals 2
    .param p1, "cueText"    # [Ljava/lang/String;
    .param p2, "startTimeUs"    # J
    .param p4, "cueTimesUs"    # [J

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;->cueText:[Ljava/lang/String;

    .line 42
    iput-wide p2, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;->startTimeUs:J

    .line 43
    iput-object p4, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;->cueTimesUs:[J

    .line 44
    array-length v0, p4

    invoke-static {p4, v0}, Ljava/util/Arrays;->copyOf([JI)[J

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;->sortedCueTimesUs:[J

    .line 45
    iget-object v0, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;->sortedCueTimesUs:[J

    invoke-static {v0}, Ljava/util/Arrays;->sort([J)V

    .line 46
    return-void
.end method


# virtual methods
.method public getEventTime(I)J
    .locals 3
    .param p1, "index"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 67
    if-ltz p1, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 68
    iget-object v0, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;->sortedCueTimesUs:[J

    array-length v0, v0

    if-ge p1, v0, :cond_1

    :goto_1
    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 69
    iget-object v0, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;->sortedCueTimesUs:[J

    aget-wide v0, v0, p1

    return-wide v0

    :cond_0
    move v0, v2

    .line 67
    goto :goto_0

    :cond_1
    move v1, v2

    .line 68
    goto :goto_1
.end method

.method public getEventTimeCount()I
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;->sortedCueTimesUs:[J

    array-length v0, v0

    return v0
.end method

.method public getLastEventTime()J
    .locals 2

    .prologue
    .line 74
    invoke-virtual {p0}, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;->getEventTimeCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 75
    const-wide/16 v0, -0x1

    .line 77
    :goto_0
    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;->sortedCueTimesUs:[J

    iget-object v1, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;->sortedCueTimesUs:[J

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    aget-wide v0, v0, v1

    goto :goto_0
.end method

.method public getNextEventTimeIndex(J)I
    .locals 7
    .param p1, "timeUs"    # J

    .prologue
    const/4 v2, 0x0

    .line 55
    const-wide/16 v4, 0x0

    cmp-long v1, p1, v4

    if-ltz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 56
    iget-object v1, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;->sortedCueTimesUs:[J

    invoke-static {v1, p1, p2, v2, v2}, Lcom/google/android/exoplayer/util/Util;->binarySearchCeil([JJZZ)I

    move-result v0

    .line 57
    .local v0, "index":I
    iget-object v1, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;->sortedCueTimesUs:[J

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .end local v0    # "index":I
    :goto_1
    return v0

    :cond_0
    move v1, v2

    .line 55
    goto :goto_0

    .line 57
    .restart local v0    # "index":I
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method public getStartTime()J
    .locals 2

    .prologue
    .line 50
    iget-wide v0, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;->startTimeUs:J

    return-wide v0
.end method

.method public getText(J)Ljava/lang/String;
    .locals 7
    .param p1, "timeUs"    # J

    .prologue
    .line 82
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .local v1, "stringBuilder":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v3, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;->cueTimesUs:[J

    array-length v3, v3

    if-ge v0, v3, :cond_1

    .line 85
    iget-object v3, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;->cueTimesUs:[J

    aget-wide v4, v3, v0

    cmp-long v3, v4, p1

    if-gtz v3, :cond_0

    iget-object v3, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;->cueTimesUs:[J

    add-int/lit8 v4, v0, 0x1

    aget-wide v4, v3, v4

    cmp-long v3, p1, v4

    if-gez v3, :cond_0

    .line 86
    iget-object v3, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;->cueText:[Ljava/lang/String;

    div-int/lit8 v4, v0, 0x2

    aget-object v3, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    :cond_0
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 90
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    .line 91
    .local v2, "stringLength":I
    if-lez v2, :cond_2

    add-int/lit8 v3, v2, -0x1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    const/16 v4, 0xa

    if-ne v3, v4, :cond_2

    .line 93
    add-int/lit8 v2, v2, -0x1

    .line 96
    :cond_2
    if-nez v2, :cond_3

    const/4 v3, 0x0

    :goto_1
    return-object v3

    :cond_3
    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_1
.end method
