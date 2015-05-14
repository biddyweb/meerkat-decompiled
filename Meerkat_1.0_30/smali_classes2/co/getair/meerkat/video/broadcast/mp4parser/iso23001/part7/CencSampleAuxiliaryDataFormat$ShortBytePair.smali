.class Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortBytePair;
.super Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$AbstractPair;
.source "CencSampleAuxiliaryDataFormat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ShortBytePair"
.end annotation


# instance fields
.field private clear:S

.field private encrypted:B

.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;


# direct methods
.method public constructor <init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;IJ)V
    .locals 1
    .param p2, "clear"    # I
    .param p3, "encrypted"    # J

    .prologue
    .line 185
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortBytePair;->this$0:Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$AbstractPair;-><init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$1;)V

    .line 186
    int-to-short v0, p2

    iput-short v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortBytePair;->clear:S

    .line 187
    long-to-int v0, p3

    int-to-byte v0, v0

    iput-byte v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortBytePair;->encrypted:B

    .line 188
    return-void
.end method


# virtual methods
.method public clear()I
    .locals 1

    .prologue
    .line 191
    iget-short v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortBytePair;->clear:S

    return v0
.end method

.method public encrypted()J
    .locals 2

    .prologue
    .line 195
    iget-byte v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ShortBytePair;->encrypted:B

    int-to-long v0, v0

    return-wide v0
.end method
