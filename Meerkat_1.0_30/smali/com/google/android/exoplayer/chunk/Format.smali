.class public Lcom/google/android/exoplayer/chunk/Format;
.super Ljava/lang/Object;
.source "Format.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/chunk/Format$DecreasingBandwidthComparator;
    }
.end annotation


# instance fields
.field public final audioSamplingRate:I

.field public final bandwidth:I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public final bitrate:I

.field public final codecs:Ljava/lang/String;

.field public final height:I

.field public final id:Ljava/lang/String;

.field public final language:Ljava/lang/String;

.field public final mimeType:Ljava/lang/String;

.field public final numChannels:I

.field public final width:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IIIII)V
    .locals 10
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "numChannels"    # I
    .param p6, "audioSamplingRate"    # I
    .param p7, "bitrate"    # I

    .prologue
    .line 106
    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer/chunk/Format;-><init>(Ljava/lang/String;Ljava/lang/String;IIIIILjava/lang/String;Ljava/lang/String;)V

    .line 107
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IIIIILjava/lang/String;)V
    .locals 10
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "numChannels"    # I
    .param p6, "audioSamplingRate"    # I
    .param p7, "bitrate"    # I
    .param p8, "language"    # Ljava/lang/String;

    .prologue
    .line 121
    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move-object/from16 v8, p8

    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer/chunk/Format;-><init>(Ljava/lang/String;Ljava/lang/String;IIIIILjava/lang/String;Ljava/lang/String;)V

    .line 122
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IIIIILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "numChannels"    # I
    .param p6, "audioSamplingRate"    # I
    .param p7, "bitrate"    # I
    .param p8, "language"    # Ljava/lang/String;
    .param p9, "codecs"    # Ljava/lang/String;

    .prologue
    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    .line 139
    iput-object p2, p0, Lcom/google/android/exoplayer/chunk/Format;->mimeType:Ljava/lang/String;

    .line 140
    iput p3, p0, Lcom/google/android/exoplayer/chunk/Format;->width:I

    .line 141
    iput p4, p0, Lcom/google/android/exoplayer/chunk/Format;->height:I

    .line 142
    iput p5, p0, Lcom/google/android/exoplayer/chunk/Format;->numChannels:I

    .line 143
    iput p6, p0, Lcom/google/android/exoplayer/chunk/Format;->audioSamplingRate:I

    .line 144
    iput p7, p0, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    .line 145
    iput-object p8, p0, Lcom/google/android/exoplayer/chunk/Format;->language:Ljava/lang/String;

    .line 146
    iput-object p9, p0, Lcom/google/android/exoplayer/chunk/Format;->codecs:Ljava/lang/String;

    .line 147
    div-int/lit8 v0, p7, 0x8

    iput v0, p0, Lcom/google/android/exoplayer/chunk/Format;->bandwidth:I

    .line 148
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 160
    if-ne p0, p1, :cond_0

    .line 161
    const/4 v1, 0x1

    .line 167
    :goto_0
    return v1

    .line 163
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_2

    .line 164
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 166
    check-cast v0, Lcom/google/android/exoplayer/chunk/Format;

    .line 167
    .local v0, "other":Lcom/google/android/exoplayer/chunk/Format;
    iget-object v1, v0, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method
