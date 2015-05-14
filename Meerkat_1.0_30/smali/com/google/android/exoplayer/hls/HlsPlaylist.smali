.class public abstract Lcom/google/android/exoplayer/hls/HlsPlaylist;
.super Ljava/lang/Object;
.source "HlsPlaylist.java"


# static fields
.field public static final TYPE_MASTER:I = 0x0

.field public static final TYPE_MEDIA:I = 0x1


# instance fields
.field public final baseUri:Landroid/net/Uri;

.field public final type:I


# direct methods
.method protected constructor <init>(Landroid/net/Uri;I)V
    .locals 0
    .param p1, "baseUri"    # Landroid/net/Uri;
    .param p2, "type"    # I

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/google/android/exoplayer/hls/HlsPlaylist;->baseUri:Landroid/net/Uri;

    .line 33
    iput p2, p0, Lcom/google/android/exoplayer/hls/HlsPlaylist;->type:I

    .line 34
    return-void
.end method
