.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/SampleEncryptionBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;
.source "SampleEncryptionBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "senc"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 18
    const-string v0, "senc"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AbstractSampleEncryptionBox;-><init>(Ljava/lang/String;)V

    .line 19
    return-void
.end method
