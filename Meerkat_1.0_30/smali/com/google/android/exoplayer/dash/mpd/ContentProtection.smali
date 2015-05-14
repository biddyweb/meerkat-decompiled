.class public Lcom/google/android/exoplayer/dash/mpd/ContentProtection;
.super Ljava/lang/Object;
.source "ContentProtection.java"


# instance fields
.field public final data:[B

.field public final schemeUriId:Ljava/lang/String;

.field public final uuid:Ljava/util/UUID;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/UUID;[B)V
    .locals 0
    .param p1, "schemeUriId"    # Ljava/lang/String;
    .param p2, "uuid"    # Ljava/util/UUID;
    .param p3, "data"    # [B

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->schemeUriId:Ljava/lang/String;

    .line 50
    iput-object p2, p0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->uuid:Ljava/util/UUID;

    .line 51
    iput-object p3, p0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->data:[B

    .line 52
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 56
    instance-of v3, p1, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;

    if-nez v3, :cond_1

    move v1, v2

    .line 66
    :cond_0
    :goto_0
    return v1

    .line 59
    :cond_1
    if-eq p1, p0, :cond_0

    move-object v0, p1

    .line 63
    check-cast v0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;

    .line 64
    .local v0, "other":Lcom/google/android/exoplayer/dash/mpd/ContentProtection;
    iget-object v3, p0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->schemeUriId:Ljava/lang/String;

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->schemeUriId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->uuid:Ljava/util/UUID;

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->uuid:Ljava/util/UUID;

    .line 65
    invoke-static {v3, v4}, Lcom/google/android/exoplayer/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->data:[B

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->data:[B

    .line 66
    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_2
    move v1, v2

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 71
    const/4 v0, 0x1

    .line 73
    .local v0, "hashCode":I
    iget-object v1, p0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->schemeUriId:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/lit8 v0, v1, 0x25

    .line 74
    iget-object v1, p0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->uuid:Ljava/util/UUID;

    if-eqz v1, :cond_0

    .line 75
    mul-int/lit8 v1, v0, 0x25

    iget-object v2, p0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->uuid:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 77
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->data:[B

    if-eqz v1, :cond_1

    .line 78
    mul-int/lit8 v1, v0, 0x25

    iget-object v2, p0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->data:[B

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([B)I

    move-result v2

    add-int v0, v1, v2

    .line 80
    :cond_1
    return v0
.end method
