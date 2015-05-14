.class Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;
.super Lcom/google/android/exoplayer/hls/DataChunk;
.source "HlsChunkSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/hls/HlsChunkSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EncryptionKeyChunk"
.end annotation


# instance fields
.field private final iv:Ljava/lang/String;

.field final synthetic this$0:Lcom/google/android/exoplayer/hls/HlsChunkSource;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/hls/HlsChunkSource;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Ljava/lang/String;)V
    .locals 1
    .param p2, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p3, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .param p4, "iv"    # Ljava/lang/String;

    .prologue
    .line 575
    iput-object p1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;->this$0:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    .line 576
    iget-object v0, p1, Lcom/google/android/exoplayer/hls/HlsChunkSource;->scratchSpace:[B

    invoke-direct {p0, p2, p3, v0}, Lcom/google/android/exoplayer/hls/DataChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;[B)V

    .line 577
    iput-object p4, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;->iv:Ljava/lang/String;

    .line 578
    return-void
.end method


# virtual methods
.method protected consume([BI)V
    .locals 4
    .param p1, "data"    # [B
    .param p2, "limit"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 582
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;->this$0:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-object v1, v1, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;->iv:Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->initEncryptedDataSource(Landroid/net/Uri;Ljava/lang/String;[B)V

    .line 584
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;->this$0:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    iput-object p1, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->scratchSpace:[B

    .line 585
    return-void
.end method
