.class public final Lcom/google/android/exoplayer/dash/mpd/RangedUri;
.super Ljava/lang/Object;
.source "RangedUri.java"


# instance fields
.field private final baseUri:Landroid/net/Uri;

.field private hashCode:I

.field public final length:J

.field public final start:J

.field private final stringUri:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/net/Uri;Ljava/lang/String;JJ)V
    .locals 1
    .param p1, "baseUri"    # Landroid/net/Uri;
    .param p2, "stringUri"    # Ljava/lang/String;
    .param p3, "start"    # J
    .param p5, "length"    # J

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    if-nez p1, :cond_0

    if-eqz p2, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 61
    iput-object p1, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->baseUri:Landroid/net/Uri;

    .line 62
    iput-object p2, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->stringUri:Ljava/lang/String;

    .line 63
    iput-wide p3, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->start:J

    .line 64
    iput-wide p5, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    .line 65
    return-void

    .line 60
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public attemptMerge(Lcom/google/android/exoplayer/dash/mpd/RangedUri;)Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .locals 10
    .param p1, "other"    # Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    .prologue
    const/4 v1, 0x0

    const-wide/16 v6, -0x1

    .line 88
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->getUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 97
    :cond_0
    :goto_0
    return-object v1

    .line 90
    :cond_1
    iget-wide v2, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    cmp-long v0, v2, v6

    if-eqz v0, :cond_3

    iget-wide v2, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->start:J

    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    add-long/2addr v2, v4

    iget-wide v4, p1, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->start:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_3

    .line 91
    new-instance v1, Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    iget-object v2, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->baseUri:Landroid/net/Uri;

    iget-object v3, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->stringUri:Ljava/lang/String;

    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->start:J

    iget-wide v8, p1, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    cmp-long v0, v8, v6

    if-nez v0, :cond_2

    :goto_1
    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;-><init>(Landroid/net/Uri;Ljava/lang/String;JJ)V

    goto :goto_0

    :cond_2
    iget-wide v6, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    iget-wide v8, p1, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    add-long/2addr v6, v8

    goto :goto_1

    .line 93
    :cond_3
    iget-wide v2, p1, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    cmp-long v0, v2, v6

    if-eqz v0, :cond_0

    iget-wide v2, p1, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->start:J

    iget-wide v4, p1, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    add-long/2addr v2, v4

    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->start:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_0

    .line 94
    new-instance v1, Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    iget-object v2, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->baseUri:Landroid/net/Uri;

    iget-object v3, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->stringUri:Ljava/lang/String;

    iget-wide v4, p1, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->start:J

    iget-wide v8, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    cmp-long v0, v8, v6

    if-nez v0, :cond_4

    :goto_2
    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;-><init>(Landroid/net/Uri;Ljava/lang/String;JJ)V

    goto :goto_0

    :cond_4
    iget-wide v6, p1, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    iget-wide v8, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    add-long/2addr v6, v8

    goto :goto_2
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 115
    if-ne p0, p1, :cond_1

    .line 124
    :cond_0
    :goto_0
    return v1

    .line 118
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 119
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 121
    check-cast v0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    .line 122
    .local v0, "other":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->start:J

    iget-wide v6, v0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->start:J

    cmp-long v3, v4, v6

    if-nez v3, :cond_4

    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    iget-wide v6, v0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    cmp-long v3, v4, v6

    if-nez v3, :cond_4

    .line 124
    invoke-virtual {p0}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->getUri()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v0}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->getUri()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_4
    move v1, v2

    goto :goto_0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->baseUri:Landroid/net/Uri;

    iget-object v1, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->stringUri:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/util/Util;->getMergedUri(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    .line 103
    iget v1, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->hashCode:I

    if-nez v1, :cond_0

    .line 104
    const/16 v0, 0x11

    .line 105
    .local v0, "result":I
    iget-wide v2, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->start:J

    long-to-int v1, v2

    add-int/lit16 v0, v1, 0x20f

    .line 106
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    long-to-int v2, v2

    add-int v0, v1, v2

    .line 107
    mul-int/lit8 v1, v0, 0x1f

    invoke-virtual {p0}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->getUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 108
    iput v0, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->hashCode:I

    .line 110
    .end local v0    # "result":I
    :cond_0
    iget v1, p0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->hashCode:I

    return v1
.end method
