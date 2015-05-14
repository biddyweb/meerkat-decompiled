.class public final Lcom/google/android/exoplayer/audio/AudioCapabilities;
.super Ljava/lang/Object;
.source "AudioCapabilities.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# instance fields
.field private final maxChannelCount:I

.field private final supportedEncodings:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>([II)V
    .locals 5
    .param p1, "supportedEncodings"    # [I
    .param p2, "maxChannelCount"    # I

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lcom/google/android/exoplayer/audio/AudioCapabilities;->supportedEncodings:Ljava/util/Set;

    .line 45
    if-eqz p1, :cond_0

    .line 46
    array-length v2, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_0

    aget v0, p1, v1

    .line 47
    .local v0, "i":I
    iget-object v3, p0, Lcom/google/android/exoplayer/audio/AudioCapabilities;->supportedEncodings:Ljava/util/Set;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 46
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 50
    .end local v0    # "i":I
    :cond_0
    iput p2, p0, Lcom/google/android/exoplayer/audio/AudioCapabilities;->maxChannelCount:I

    .line 51
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 75
    if-ne p0, p1, :cond_1

    .line 82
    :cond_0
    :goto_0
    return v1

    .line 78
    :cond_1
    instance-of v3, p1, Lcom/google/android/exoplayer/audio/AudioCapabilities;

    if-nez v3, :cond_2

    move v1, v2

    .line 79
    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 81
    check-cast v0, Lcom/google/android/exoplayer/audio/AudioCapabilities;

    .line 82
    .local v0, "audioCapabilities":Lcom/google/android/exoplayer/audio/AudioCapabilities;
    iget-object v3, p0, Lcom/google/android/exoplayer/audio/AudioCapabilities;->supportedEncodings:Ljava/util/Set;

    iget-object v4, v0, Lcom/google/android/exoplayer/audio/AudioCapabilities;->supportedEncodings:Ljava/util/Set;

    invoke-interface {v3, v4}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget v3, p0, Lcom/google/android/exoplayer/audio/AudioCapabilities;->maxChannelCount:I

    iget v4, v0, Lcom/google/android/exoplayer/audio/AudioCapabilities;->maxChannelCount:I

    if-eq v3, v4, :cond_0

    :cond_3
    move v1, v2

    goto :goto_0
.end method

.method public getMaxChannelCount()I
    .locals 1

    .prologue
    .line 70
    iget v0, p0, Lcom/google/android/exoplayer/audio/AudioCapabilities;->maxChannelCount:I

    return v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 88
    iget v0, p0, Lcom/google/android/exoplayer/audio/AudioCapabilities;->maxChannelCount:I

    iget-object v1, p0, Lcom/google/android/exoplayer/audio/AudioCapabilities;->supportedEncodings:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v0, v1

    return v0
.end method

.method public supportsAc3()Z
    .locals 2

    .prologue
    .line 55
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioCapabilities;->supportedEncodings:Ljava/util/Set;

    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public supportsEAc3()Z
    .locals 2

    .prologue
    .line 60
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioCapabilities;->supportedEncodings:Ljava/util/Set;

    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public supportsPcm()Z
    .locals 2

    .prologue
    .line 65
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioCapabilities;->supportedEncodings:Ljava/util/Set;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AudioCapabilities[maxChannelCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/audio/AudioCapabilities;->maxChannelCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", supportedEncodings="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/exoplayer/audio/AudioCapabilities;->supportedEncodings:Ljava/util/Set;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
