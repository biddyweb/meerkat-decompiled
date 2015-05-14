.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeInformationBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;
.source "SchemeInformationBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "schi"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 31
    const-string v0, "schi"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;-><init>(Ljava/lang/String;)V

    .line 32
    return-void
.end method
