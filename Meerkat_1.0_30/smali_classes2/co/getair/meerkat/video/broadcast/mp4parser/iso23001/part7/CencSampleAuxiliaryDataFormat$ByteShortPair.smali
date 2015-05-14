.class Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ByteShortPair;
.super Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$AbstractPair;
.source "CencSampleAuxiliaryDataFormat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ByteShortPair"
.end annotation


# instance fields
.field private clear:B

.field private encrypted:S

.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;


# direct methods
.method public constructor <init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;IJ)V
    .locals 1
    .param p2, "clear"    # I
    .param p3, "encrypted"    # J

    .prologue
    .line 131
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ByteShortPair;->this$0:Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$AbstractPair;-><init>(Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$1;)V

    .line 132
    int-to-byte v0, p2

    iput-byte v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ByteShortPair;->clear:B

    .line 133
    long-to-int v0, p3

    int-to-short v0, v0

    iput-short v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ByteShortPair;->encrypted:S

    .line 134
    return-void
.end method


# virtual methods
.method public clear()I
    .locals 1

    .prologue
    .line 137
    iget-byte v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ByteShortPair;->clear:B

    return v0
.end method

.method public encrypted()J
    .locals 2

    .prologue
    .line 141
    iget-short v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$ByteShortPair;->encrypted:S

    int-to-long v0, v0

    return-wide v0
.end method
