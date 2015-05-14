.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataInformationBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;
.source "DataInformationBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "dinf"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    const-string v0, "dinf"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;-><init>(Ljava/lang/String;)V

    .line 35
    return-void
.end method
