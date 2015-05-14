.class Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;
.super Lcom/google/android/exoplayer/hls/DataChunk;
.source "HlsChunkSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/hls/HlsChunkSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MediaPlaylistChunk"
.end annotation


# instance fields
.field private final playlistBaseUri:Landroid/net/Uri;

.field final synthetic this$0:Lcom/google/android/exoplayer/hls/HlsChunkSource;

.field final variantIndex:I


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/hls/HlsChunkSource;ILcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Landroid/net/Uri;)V
    .locals 1
    .param p2, "variantIndex"    # I
    .param p3, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p4, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .param p5, "playlistBaseUri"    # Landroid/net/Uri;

    .prologue
    .line 552
    iput-object p1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->this$0:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    .line 553
    iget-object v0, p1, Lcom/google/android/exoplayer/hls/HlsChunkSource;->scratchSpace:[B

    invoke-direct {p0, p3, p4, v0}, Lcom/google/android/exoplayer/hls/DataChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;[B)V

    .line 554
    iput p2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->variantIndex:I

    .line 555
    iput-object p5, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->playlistBaseUri:Landroid/net/Uri;

    .line 556
    return-void
.end method


# virtual methods
.method protected consume([BI)V
    .locals 8
    .param p1, "data"    # [B
    .param p2, "limit"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 560
    iget-object v4, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->this$0:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    # getter for: Lcom/google/android/exoplayer/hls/HlsChunkSource;->playlistParser:Lcom/google/android/exoplayer/hls/HlsPlaylistParser;
    invoke-static {v4}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->access$000(Lcom/google/android/exoplayer/hls/HlsChunkSource;)Lcom/google/android/exoplayer/hls/HlsPlaylistParser;

    move-result-object v4

    new-instance v5, Ljava/io/ByteArrayInputStream;

    invoke-direct {v5, p1, v3, p2}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    iget-object v6, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->playlistBaseUri:Landroid/net/Uri;

    invoke-virtual {v4, v5, v7, v7, v6}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->parse(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Lcom/google/android/exoplayer/hls/HlsPlaylist;

    move-result-object v1

    .line 562
    .local v1, "playlist":Lcom/google/android/exoplayer/hls/HlsPlaylist;
    iget v4, v1, Lcom/google/android/exoplayer/hls/HlsPlaylist;->type:I

    if-ne v4, v2, :cond_0

    :goto_0
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    move-object v0, v1

    .line 563
    check-cast v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    .line 564
    .local v0, "mediaPlaylist":Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->this$0:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    iget v3, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->variantIndex:I

    invoke-virtual {v2, v3, v0}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->setMediaPlaylist(ILcom/google/android/exoplayer/hls/HlsMediaPlaylist;)V

    .line 566
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->this$0:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    iput-object p1, v2, Lcom/google/android/exoplayer/hls/HlsChunkSource;->scratchSpace:[B

    .line 567
    return-void

    .end local v0    # "mediaPlaylist":Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    :cond_0
    move v2, v3

    .line 562
    goto :goto_0
.end method
