.class public final Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleWaveBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;
.source "AppleWaveBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "wave"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    const-string v0, "wave"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;-><init>(Ljava/lang/String;)V

    .line 30
    return-void
.end method
