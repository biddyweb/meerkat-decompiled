.class Lcom/google/android/exoplayer/text/webvtt/WebvttParser$WebvttCue;
.super Ljava/lang/Object;
.source "WebvttParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/text/webvtt/WebvttParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "WebvttCue"
.end annotation


# instance fields
.field public final endTime:J

.field public final startTime:J

.field public final text:Ljava/lang/String;


# direct methods
.method public constructor <init>(JJLjava/lang/String;)V
    .locals 1
    .param p1, "startTime"    # J
    .param p3, "endTime"    # J
    .param p5, "text"    # Ljava/lang/String;

    .prologue
    .line 248
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 249
    iput-wide p1, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttParser$WebvttCue;->startTime:J

    .line 250
    iput-wide p3, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttParser$WebvttCue;->endTime:J

    .line 251
    iput-object p5, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttParser$WebvttCue;->text:Ljava/lang/String;

    .line 252
    return-void
.end method
