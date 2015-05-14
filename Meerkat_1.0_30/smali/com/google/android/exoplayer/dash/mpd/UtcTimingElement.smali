.class public Lcom/google/android/exoplayer/dash/mpd/UtcTimingElement;
.super Ljava/lang/Object;
.source "UtcTimingElement.java"


# instance fields
.field public final schemeIdUri:Ljava/lang/String;

.field public final value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "schemeIdUri"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/google/android/exoplayer/dash/mpd/UtcTimingElement;->schemeIdUri:Ljava/lang/String;

    .line 28
    iput-object p2, p0, Lcom/google/android/exoplayer/dash/mpd/UtcTimingElement;->value:Ljava/lang/String;

    .line 29
    return-void
.end method
