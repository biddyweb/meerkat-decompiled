.class public final Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;
.super Lcom/google/android/exoplayer/hls/HlsPlaylist;
.source "HlsMasterPlaylist.java"


# instance fields
.field public final variants:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/hls/Variant;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/net/Uri;Ljava/util/List;)V
    .locals 1
    .param p1, "baseUri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/hls/Variant;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p2, "variants":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/hls/Variant;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/exoplayer/hls/HlsPlaylist;-><init>(Landroid/net/Uri;I)V

    .line 31
    iput-object p2, p0, Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;->variants:Ljava/util/List;

    .line 32
    return-void
.end method
