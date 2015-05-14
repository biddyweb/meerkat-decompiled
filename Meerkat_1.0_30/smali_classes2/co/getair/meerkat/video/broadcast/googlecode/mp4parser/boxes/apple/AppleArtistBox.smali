.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleArtistBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/Utf8AppleDataBox;
.source "AppleArtistBox.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    const-string v0, "\u00a9ART"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/Utf8AppleDataBox;-><init>(Ljava/lang/String;)V

    .line 9
    return-void
.end method
