.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;
.super Ljava/lang/Object;
.source "TextSampleEntry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BoxRecord"
.end annotation


# instance fields
.field bottom:I

.field left:I

.field right:I

.field top:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 235
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 236
    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 0
    .param p1, "top"    # I
    .param p2, "left"    # I
    .param p3, "bottom"    # I
    .param p4, "right"    # I

    .prologue
    .line 238
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 239
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->top:I

    .line 240
    iput p2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->left:I

    .line 241
    iput p3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->bottom:I

    .line 242
    iput p4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->right:I

    .line 243
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 265
    if-ne p0, p1, :cond_1

    .line 275
    :cond_0
    :goto_0
    return v1

    .line 266
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 268
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;

    .line 270
    .local v0, "boxRecord":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;
    iget v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->bottom:I

    iget v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->bottom:I

    if-eq v3, v4, :cond_4

    move v1, v2

    goto :goto_0

    .line 271
    :cond_4
    iget v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->left:I

    iget v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->left:I

    if-eq v3, v4, :cond_5

    move v1, v2

    goto :goto_0

    .line 272
    :cond_5
    iget v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->right:I

    iget v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->right:I

    if-eq v3, v4, :cond_6

    move v1, v2

    goto :goto_0

    .line 273
    :cond_6
    iget v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->top:I

    iget v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->top:I

    if-eq v3, v4, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "bb"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 253
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->top:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 254
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->left:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 255
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->bottom:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 256
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->right:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 257
    return-void
.end method

.method public getSize()I
    .locals 1

    .prologue
    .line 260
    const/16 v0, 0x8

    return v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 280
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->top:I

    .line 281
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->left:I

    add-int v0, v1, v2

    .line 282
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->bottom:I

    add-int v0, v1, v2

    .line 283
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->right:I

    add-int v0, v1, v2

    .line 284
    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "in"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 246
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->top:I

    .line 247
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->left:I

    .line 248
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->bottom:I

    .line 249
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;->right:I

    .line 250
    return-void
.end method
