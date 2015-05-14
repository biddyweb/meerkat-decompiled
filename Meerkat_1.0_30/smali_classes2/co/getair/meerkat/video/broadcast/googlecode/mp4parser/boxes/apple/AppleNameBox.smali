.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleNameBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/Utf8AppleDataBox;
.source "AppleNameBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "\u00a9nam"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 9
    const-string v0, "\u00a9nam"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/Utf8AppleDataBox;-><init>(Ljava/lang/String;)V

    .line 10
    return-void
.end method
