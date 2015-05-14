.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "CompositionShiftLeastGreatestAtom.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "cslg"


# instance fields
.field compositionOffsetToDisplayOffsetShift:I

.field displayEndTime:I

.field displayStartTime:I

.field greatestDisplayOffset:I

.field leastDisplayOffset:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    const-string v0, "cslg"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 22
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 48
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->compositionOffsetToDisplayOffsetShift:I

    .line 49
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->leastDisplayOffset:I

    .line 50
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->greatestDisplayOffset:I

    .line 51
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->displayStartTime:I

    .line 52
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->displayEndTime:I

    .line 53
    return-void
.end method

.method public getCompositionOffsetToDisplayOffsetShift()I
    .locals 1

    .prologue
    .line 67
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->compositionOffsetToDisplayOffsetShift:I

    return v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 57
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 58
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->compositionOffsetToDisplayOffsetShift:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 59
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->leastDisplayOffset:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 60
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->greatestDisplayOffset:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 61
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->displayStartTime:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 62
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->displayEndTime:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 63
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 42
    const-wide/16 v0, 0x18

    return-wide v0
.end method

.method public getDisplayEndTime()I
    .locals 1

    .prologue
    .line 99
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->displayEndTime:I

    return v0
.end method

.method public getDisplayStartTime()I
    .locals 1

    .prologue
    .line 91
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->displayStartTime:I

    return v0
.end method

.method public getGreatestDisplayOffset()I
    .locals 1

    .prologue
    .line 83
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->greatestDisplayOffset:I

    return v0
.end method

.method public getLeastDisplayOffset()I
    .locals 1

    .prologue
    .line 75
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->leastDisplayOffset:I

    return v0
.end method

.method public setCompositionOffsetToDisplayOffsetShift(I)V
    .locals 0
    .param p1, "compositionOffsetToDisplayOffsetShift"    # I

    .prologue
    .line 71
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->compositionOffsetToDisplayOffsetShift:I

    .line 72
    return-void
.end method

.method public setDisplayEndTime(I)V
    .locals 0
    .param p1, "displayEndTime"    # I

    .prologue
    .line 103
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->displayEndTime:I

    .line 104
    return-void
.end method

.method public setDisplayStartTime(I)V
    .locals 0
    .param p1, "displayStartTime"    # I

    .prologue
    .line 95
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->displayStartTime:I

    .line 96
    return-void
.end method

.method public setGreatestDisplayOffset(I)V
    .locals 0
    .param p1, "greatestDisplayOffset"    # I

    .prologue
    .line 87
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->greatestDisplayOffset:I

    .line 88
    return-void
.end method

.method public setLeastDisplayOffset(I)V
    .locals 0
    .param p1, "leastDisplayOffset"    # I

    .prologue
    .line 79
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionShiftLeastGreatestAtom;->leastDisplayOffset:I

    .line 80
    return-void
.end method
