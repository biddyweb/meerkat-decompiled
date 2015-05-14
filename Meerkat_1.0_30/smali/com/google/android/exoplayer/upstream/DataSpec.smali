.class public final Lcom/google/android/exoplayer/upstream/DataSpec;
.super Ljava/lang/Object;
.source "DataSpec.java"


# instance fields
.field public final absoluteStreamPosition:J

.field public final key:Ljava/lang/String;

.field public final length:J

.field public final position:J

.field public final uri:Landroid/net/Uri;

.field public final uriIsFullStream:Z


# direct methods
.method public constructor <init>(Landroid/net/Uri;)V
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 62
    const-wide/16 v2, 0x0

    const-wide/16 v4, -0x1

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;JJLjava/lang/String;)V
    .locals 10
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "absoluteStreamPosition"    # J
    .param p4, "length"    # J
    .param p6, "key"    # Ljava/lang/String;

    .prologue
    .line 74
    const/4 v9, 0x1

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    move-object/from16 v6, p6

    move-wide v7, p2

    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;JZ)V

    .line 75
    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;JJLjava/lang/String;J)V
    .locals 10
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "absoluteStreamPosition"    # J
    .param p4, "length"    # J
    .param p6, "key"    # Ljava/lang/String;
    .param p7, "position"    # J

    .prologue
    .line 87
    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    move-object/from16 v6, p6

    move-wide/from16 v7, p7

    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;JZ)V

    .line 88
    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;JJLjava/lang/String;JZ)V
    .locals 6
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "absoluteStreamPosition"    # J
    .param p4, "length"    # J
    .param p6, "key"    # Ljava/lang/String;
    .param p7, "position"    # J
    .param p9, "uriIsFullStream"    # Z

    .prologue
    const-wide/16 v4, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    cmp-long v0, p2, v4

    if-ltz v0, :cond_3

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 103
    cmp-long v0, p7, v4

    if-ltz v0, :cond_4

    move v0, v1

    :goto_1
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 104
    cmp-long v0, p4, v4

    if-gtz v0, :cond_0

    const-wide/16 v4, -0x1

    cmp-long v0, p4, v4

    if-nez v0, :cond_5

    :cond_0
    move v0, v1

    :goto_2
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 105
    cmp-long v0, p2, p7

    if-eqz v0, :cond_1

    if-nez p9, :cond_2

    :cond_1
    move v2, v1

    :cond_2
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 106
    iput-object p1, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    .line 107
    iput-boolean p9, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->uriIsFullStream:Z

    .line 108
    iput-wide p2, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->absoluteStreamPosition:J

    .line 109
    iput-wide p7, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->position:J

    .line 110
    iput-wide p4, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    .line 111
    iput-object p6, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->key:Ljava/lang/String;

    .line 112
    return-void

    :cond_3
    move v0, v2

    .line 102
    goto :goto_0

    :cond_4
    move v0, v2

    .line 103
    goto :goto_1

    :cond_5
    move v0, v2

    .line 104
    goto :goto_2
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DataSpec["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->uriIsFullStream:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->absoluteStreamPosition:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->position:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
