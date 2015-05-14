.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/PicTiming;
.super Ljava/lang/Object;
.source "PicTiming.java"


# direct methods
.method constructor <init>(ILjava/io/InputStream;)V
    .locals 0
    .param p1, "payloadSize"    # I
    .param p2, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method
