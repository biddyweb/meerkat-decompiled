.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/PixelAspectRationAtom;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "PixelAspectRationAtom.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "pasp"


# instance fields
.field private hSpacing:I

.field private vSpacing:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 19
    const-string v0, "pasp"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 20
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 64
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/PixelAspectRationAtom;->hSpacing:I

    .line 65
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/PixelAspectRationAtom;->vSpacing:I

    .line 68
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 57
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/PixelAspectRationAtom;->hSpacing:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 58
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/PixelAspectRationAtom;->vSpacing:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 60
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 52
    const-wide/16 v0, 0x8

    return-wide v0
.end method

.method public gethSpacing()I
    .locals 1

    .prologue
    .line 35
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/PixelAspectRationAtom;->hSpacing:I

    return v0
.end method

.method public getvSpacing()I
    .locals 1

    .prologue
    .line 43
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/PixelAspectRationAtom;->vSpacing:I

    return v0
.end method

.method public sethSpacing(I)V
    .locals 0
    .param p1, "hSpacing"    # I

    .prologue
    .line 39
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/PixelAspectRationAtom;->hSpacing:I

    .line 40
    return-void
.end method

.method public setvSpacing(I)V
    .locals 0
    .param p1, "vSpacing"    # I

    .prologue
    .line 47
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/PixelAspectRationAtom;->vSpacing:I

    .line 48
    return-void
.end method
