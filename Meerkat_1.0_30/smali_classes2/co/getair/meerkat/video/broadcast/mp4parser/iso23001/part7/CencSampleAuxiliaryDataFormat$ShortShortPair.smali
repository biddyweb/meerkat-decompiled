.class Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortShortPair;
.super Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$AbstractPair;
.source "CencSampleAuxiliaryDataFormat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ShortShortPair"
.end annotation


# instance fields
.field private clear:S

.field private encrypted:S

.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;


# direct methods
.method public constructor <init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;IJ)V
    .locals 1
    .param p2, "clear"    # I
    .param p3, "encrypted"    # J

    .prologue
    .line 203
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortShortPair;->this$0:Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$AbstractPair;-><init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$1;)V

    .line 204
    int-to-short v0, p2

    iput-short v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortShortPair;->clear:S

    .line 205
    long-to-int v0, p3

    int-to-short v0, v0

    iput-short v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortShortPair;->encrypted:S

    .line 206
    return-void
.end method


# virtual methods
.method public clear()I
    .locals 1

    .prologue
    .line 209
    iget-short v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortShortPair;->clear:S

    return v0
.end method

.method public encrypted()J
    .locals 2

    .prologue
    .line 213
    iget-short v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortShortPair;->encrypted:S

    int-to-long v0, v0

    return-wide v0
.end method
