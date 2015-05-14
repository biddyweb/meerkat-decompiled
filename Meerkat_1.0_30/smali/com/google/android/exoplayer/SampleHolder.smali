.class public final Lcom/google/android/exoplayer/SampleHolder;
.super Ljava/lang/Object;
.source "SampleHolder.java"


# static fields
.field public static final BUFFER_REPLACEMENT_MODE_DIRECT:I = 0x2

.field public static final BUFFER_REPLACEMENT_MODE_DISABLED:I = 0x0

.field public static final BUFFER_REPLACEMENT_MODE_NORMAL:I = 0x1


# instance fields
.field private final bufferReplacementMode:I

.field public final cryptoInfo:Lcom/google/android/exoplayer/CryptoInfo;

.field public data:Ljava/nio/ByteBuffer;

.field public decodeOnly:Z

.field public flags:I

.field public size:I

.field public timeUs:J


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "bufferReplacementMode"    # I

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    new-instance v0, Lcom/google/android/exoplayer/CryptoInfo;

    invoke-direct {v0}, Lcom/google/android/exoplayer/CryptoInfo;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/SampleHolder;->cryptoInfo:Lcom/google/android/exoplayer/CryptoInfo;

    .line 78
    iput p1, p0, Lcom/google/android/exoplayer/SampleHolder;->bufferReplacementMode:I

    .line 79
    return-void
.end method


# virtual methods
.method public clearData()V
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    .line 104
    iget-object v0, p0, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 106
    :cond_0
    return-void
.end method

.method public replaceBuffer(I)Z
    .locals 2
    .param p1, "capacity"    # I

    .prologue
    const/4 v0, 0x1

    .line 88
    iget v1, p0, Lcom/google/android/exoplayer/SampleHolder;->bufferReplacementMode:I

    packed-switch v1, :pswitch_data_0

    .line 96
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 90
    :pswitch_0
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    goto :goto_0

    .line 93
    :pswitch_1
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    goto :goto_0

    .line 88
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
