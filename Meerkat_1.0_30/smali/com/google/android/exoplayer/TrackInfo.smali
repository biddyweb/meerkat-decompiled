.class public final Lcom/google/android/exoplayer/TrackInfo;
.super Ljava/lang/Object;
.source "TrackInfo.java"


# instance fields
.field public final durationUs:J

.field public final mimeType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;J)V
    .locals 0
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "durationUs"    # J

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/google/android/exoplayer/TrackInfo;->mimeType:Ljava/lang/String;

    .line 40
    iput-wide p2, p0, Lcom/google/android/exoplayer/TrackInfo;->durationUs:J

    .line 41
    return-void
.end method
