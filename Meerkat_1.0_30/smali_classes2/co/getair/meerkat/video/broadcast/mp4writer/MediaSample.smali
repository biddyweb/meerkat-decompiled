.class public Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;
.super Ljava/lang/Object;
.source "MediaSample.java"


# instance fields
.field public buffer:Ljava/nio/ByteBuffer;

.field private data:[B

.field public duration:I

.field public info:Landroid/media/MediaCodec$BufferInfo;


# direct methods
.method public constructor <init>(Landroid/media/MediaCodec$BufferInfo;)V
    .locals 1
    .param p1, "info"    # Landroid/media/MediaCodec$BufferInfo;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/4 v0, 0x0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->duration:I

    .line 18
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->info:Landroid/media/MediaCodec$BufferInfo;

    .line 19
    return-void
.end method


# virtual methods
.method public getData()Ljava/nio/ByteBuffer;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method public getType()I
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v0, 0x0

    .line 29
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    if-eq v1, v3, :cond_1

    .line 32
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    and-int/lit8 v0, v0, 0x1f

    goto :goto_0
.end method

.method public setBuffer(Ljava/nio/ByteBuffer;)V
    .locals 0
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 23
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;->buffer:Ljava/nio/ByteBuffer;

    .line 26
    return-void
.end method
