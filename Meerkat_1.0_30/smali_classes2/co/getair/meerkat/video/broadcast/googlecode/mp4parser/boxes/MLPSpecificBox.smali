.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/MLPSpecificBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "MLPSpecificBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "dmlp"


# instance fields
.field format_info:I

.field peak_data_rate:I

.field reserved:I

.field reserved2:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    const-string v0, "dmlp"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 23
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 3
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    const/16 v2, 0x20

    .line 32
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;

    invoke-direct {v0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    .line 33
    .local v0, "brb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;
    invoke-virtual {v0, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/MLPSpecificBox;->format_info:I

    .line 34
    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/MLPSpecificBox;->peak_data_rate:I

    .line 35
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/MLPSpecificBox;->reserved:I

    .line 36
    invoke-virtual {v0, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/MLPSpecificBox;->reserved2:I

    .line 37
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    const/16 v3, 0x20

    .line 41
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;

    invoke-direct {v0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    .line 42
    .local v0, "bwb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/MLPSpecificBox;->format_info:I

    invoke-virtual {v0, v1, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 43
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/MLPSpecificBox;->peak_data_rate:I

    const/16 v2, 0xf

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 44
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/MLPSpecificBox;->reserved:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 45
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/MLPSpecificBox;->reserved2:I

    invoke-virtual {v0, v1, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 47
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 27
    const-wide/16 v0, 0xa

    return-wide v0
.end method

.method public getFormat_info()I
    .locals 1

    .prologue
    .line 50
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/MLPSpecificBox;->format_info:I

    return v0
.end method

.method public getPeak_data_rate()I
    .locals 1

    .prologue
    .line 58
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/MLPSpecificBox;->peak_data_rate:I

    return v0
.end method

.method public getReserved()I
    .locals 1

    .prologue
    .line 66
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/MLPSpecificBox;->reserved:I

    return v0
.end method

.method public getReserved2()I
    .locals 1

    .prologue
    .line 74
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/MLPSpecificBox;->reserved2:I

    return v0
.end method

.method public setFormat_info(I)V
    .locals 0
    .param p1, "format_info"    # I

    .prologue
    .line 54
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/MLPSpecificBox;->format_info:I

    .line 55
    return-void
.end method

.method public setPeak_data_rate(I)V
    .locals 0
    .param p1, "peak_data_rate"    # I

    .prologue
    .line 62
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/MLPSpecificBox;->peak_data_rate:I

    .line 63
    return-void
.end method

.method public setReserved(I)V
    .locals 0
    .param p1, "reserved"    # I

    .prologue
    .line 70
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/MLPSpecificBox;->reserved:I

    .line 71
    return-void
.end method

.method public setReserved2(I)V
    .locals 0
    .param p1, "reserved2"    # I

    .prologue
    .line 78
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/MLPSpecificBox;->reserved2:I

    .line 79
    return-void
.end method
