.class public Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;
.super Ljava/lang/Object;
.source "ChunkedHWRecorder.java"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;,
        Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;,
        Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;
    }
.end annotation


# static fields
.field public static final AUDIO_FORMAT:I = 0x2

.field private static final AUDIO_MIME_TYPE:Ljava/lang/String; = "audio/mp4a-latm"

.field public static final CHANNEL_CONFIG:I = 0x10

.field private static final FRAME_RATE:I = 0x1e

.field public static final IFRAME_INTERVAL:I = 0x3

.field private static final POOL_SIZE:I = 0x12c

.field private static final PREVIEW_HEIGHT:I = 0x2d0

.field private static final PREVIEW_WIDTH:I = 0x500

.field public static final SAMPLES_PER_FRAME:I = 0x400

.field public static final SAMPLE_RATE:I = 0xac44

.field private static final TAG:Ljava/lang/String; = "CameraToMpegTest"

.field private static final TRACE:Z = false

.field private static final VERBOSE:Z = false

.field private static final VIDEO_HEIGHT:I = 0x280

.field private static final VIDEO_MIME_TYPE:Ljava/lang/String; = "video/avc"

.field private static final VIDEO_WIDTH:I = 0x168

.field public static mediaSamplesPool:Lco/getair/meerkat/utilities/objectPool/ObjectPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lco/getair/meerkat/utilities/objectPool/ObjectPool",
            "<",
            "Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field audioEosRequested:Z

.field private audioRecord:Landroid/media/AudioRecord;

.field public builder:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

.field private cameraOnPreviewFrameCallback:Lco/getair/meerkat/utilities/RunnableWithResultObject;

.field private cameraOrientation:I

.field private eglCore:Lco/getair/meerkat/video/broadcast/EglCore;

.field eosReceived:Z

.field eosSentToAudioEncoder:Z

.field eosSentToVideoEncoder:Z

.field firstFrameReady:Z

.field private flashOn:Z

.field frameCount:I

.field fullStopPerformed:Z

.field fullStopReceived:Z

.field private lastEncodedAudioTimeStamp:J

.field private mAudioBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private mAudioEncoder:Landroid/media/MediaCodec;

.field private mAudioFormat:Landroid/media/MediaFormat;

.field private mCamera:Landroid/hardware/Camera;

.field private mCameraId:I

.field private mEGLDisplaySurface:Landroid/opengl/EGLSurface;

.field private mInputSurface:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;

.field private mStManager:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;

.field private mVideoBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private mVideoEncoder:Landroid/media/MediaCodec;

.field private mVideoFormat:Landroid/media/MediaFormat;

.field private puddle:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

.field private screenHeight:I

.field private screenWidth:I

.field startTime:J

.field startWhen:J

.field surfaceHolder:Landroid/view/SurfaceHolder;

.field totalFrameCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 129
    const/4 v0, 0x0

    sput-object v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mediaSamplesPool:Lco/getair/meerkat/utilities/objectPool/ObjectPool;

    return-void
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;II)V
    .locals 9
    .param p1, "mp4Builder"    # Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    const/16 v8, 0x12c

    const/4 v5, 0x1

    const-wide v6, 0x3ffc71c71c71c71cL    # 1.7777777777777777

    const/4 v4, 0x0

    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    new-instance v1, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    invoke-direct {v1, v5}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;-><init>(I)V

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->puddle:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    .line 118
    iput v4, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->frameCount:I

    .line 119
    iput-boolean v4, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eosSentToAudioEncoder:Z

    .line 120
    iput-boolean v4, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->audioEosRequested:Z

    .line 121
    iput-boolean v4, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eosSentToVideoEncoder:Z

    .line 122
    iput-boolean v4, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->fullStopReceived:Z

    .line 123
    iput-boolean v4, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->fullStopPerformed:Z

    .line 126
    iput v4, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->totalFrameCount:I

    .line 139
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->lastEncodedAudioTimeStamp:J

    .line 141
    iput-boolean v4, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->flashOn:Z

    .line 148
    iput v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->cameraOrientation:I

    .line 198
    iput-boolean v4, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->firstFrameReady:Z

    .line 199
    iput-boolean v4, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eosReceived:Z

    .line 151
    iput v4, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCameraId:I

    .line 153
    iput p2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->screenWidth:I

    .line 154
    iput p3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->screenHeight:I

    .line 155
    int-to-double v2, p3

    int-to-double v4, p2

    div-double/2addr v2, v4

    cmpl-double v1, v2, v6

    if-eqz v1, :cond_0

    .line 156
    int-to-double v2, p2

    mul-double/2addr v2, v6

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v2

    long-to-int v1, v2

    iput v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->screenHeight:I

    .line 158
    :cond_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->puddle:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->setPriority(I)V

    .line 159
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->builder:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    .line 161
    new-instance v1, Lco/getair/meerkat/utilities/objectPool/ObjectPool;

    invoke-direct {v1, v8}, Lco/getair/meerkat/utilities/objectPool/ObjectPool;-><init>(I)V

    sput-object v1, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mediaSamplesPool:Lco/getair/meerkat/utilities/objectPool/ObjectPool;

    .line 162
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v8, :cond_1

    .line 164
    sget-object v1, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mediaSamplesPool:Lco/getair/meerkat/utilities/objectPool/ObjectPool;

    new-instance v2, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;

    new-instance v3, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v3}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    invoke-direct {v2, v3}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaSample;-><init>(Landroid/media/MediaCodec$BufferInfo;)V

    invoke-virtual {v1, v2}, Lco/getair/meerkat/utilities/objectPool/ObjectPool;->add(Ljava/lang/Object;)V

    .line 162
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 168
    :cond_1
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Landroid/media/AudioRecord;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    .prologue
    .line 80
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->audioRecord:Landroid/media/AudioRecord;

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Landroid/media/MediaCodec;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    .prologue
    .line 80
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioEncoder:Landroid/media/MediaCodec;

    return-object v0
.end method

.method static synthetic access$200(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Landroid/media/MediaCodec$BufferInfo;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    .prologue
    .line 80
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    return-object v0
.end method

.method static synthetic access$300(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;Landroid/media/MediaCodec;Landroid/media/MediaCodec$BufferInfo;Z)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;
    .param p1, "x1"    # Landroid/media/MediaCodec;
    .param p2, "x2"    # Landroid/media/MediaCodec$BufferInfo;
    .param p3, "x3"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lco/getair/meerkat/utilities/objectPool/NoUnlockedObjectException;
        }
    .end annotation

    .prologue
    .line 80
    invoke-direct {p0, p1, p2, p3}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->drainEncoder(Landroid/media/MediaCodec;Landroid/media/MediaCodec$BufferInfo;Z)V

    return-void
.end method

.method static synthetic access$400(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Lco/getair/meerkat/utilities/RunnableWithResultObject;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    .prologue
    .line 80
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->cameraOnPreviewFrameCallback:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    return-object v0
.end method

.method static synthetic access$402(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;Lco/getair/meerkat/utilities/RunnableWithResultObject;)Lco/getair/meerkat/utilities/RunnableWithResultObject;
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;
    .param p1, "x1"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    .line 80
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->cameraOnPreviewFrameCallback:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    return-object p1
.end method

.method static synthetic access$500(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Landroid/hardware/Camera;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    .prologue
    .line 80
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    return-object v0
.end method

.method static synthetic access$600(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Landroid/media/MediaCodec;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    .prologue
    .line 80
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoEncoder:Landroid/media/MediaCodec;

    return-object v0
.end method

.method static synthetic access$700(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)J
    .locals 2
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    .prologue
    .line 80
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->lastEncodedAudioTimeStamp:J

    return-wide v0
.end method

.method static synthetic access$702(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;J)J
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;
    .param p1, "x1"    # J

    .prologue
    .line 80
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->lastEncodedAudioTimeStamp:J

    return-wide p1
.end method

.method static synthetic access$800(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    .prologue
    .line 80
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->stopAndReleaseVideoEncoder()V

    return-void
.end method

.method static synthetic access$900(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    .prologue
    .line 80
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->stopAndReleaseAudioEncoder()V

    return-void
.end method

.method private static choosePreviewSize(Landroid/hardware/Camera$Parameters;II)V
    .locals 5
    .param p0, "parms"    # Landroid/hardware/Camera$Parameters;
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 439
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getPreferredPreviewSizeForVideo()Landroid/hardware/Camera$Size;

    move-result-object v0

    .line 445
    .local v0, "ppsfv":Landroid/hardware/Camera$Size;
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/Camera$Size;

    .line 446
    .local v1, "size":Landroid/hardware/Camera$Size;
    iget v3, v1, Landroid/hardware/Camera$Size;->width:I

    if-ne v3, p1, :cond_0

    iget v3, v1, Landroid/hardware/Camera$Size;->height:I

    if-ne v3, p2, :cond_0

    .line 447
    invoke-virtual {p0, p1, p2}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 456
    .end local v1    # "size":Landroid/hardware/Camera$Size;
    :cond_1
    :goto_0
    return-void

    .line 452
    :cond_2
    const-string v2, "CameraToMpegTest"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to set preview size to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 453
    if-eqz v0, :cond_1

    .line 454
    iget v2, v0, Landroid/hardware/Camera$Size;->width:I

    iget v3, v0, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {p0, v2, v3}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    goto :goto_0
.end method

.method private chunkAudioEncoder()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 740
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->stopAndReleaseAudioEncoder()V

    .line 742
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 743
    const-string v0, "audio/mp4a-latm"

    invoke-static {v0}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioEncoder:Landroid/media/MediaCodec;

    .line 744
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioEncoder:Landroid/media/MediaCodec;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioFormat:Landroid/media/MediaFormat;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v3, v3, v2}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 745
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 746
    return-void
.end method

.method private chunkVideoEncoder()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 724
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->stopAndReleaseVideoEncoder()V

    .line 726
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 728
    const-string v0, "video/avc"

    invoke-static {v0}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoEncoder:Landroid/media/MediaCodec;

    .line 729
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoEncoder:Landroid/media/MediaCodec;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoFormat:Landroid/media/MediaFormat;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v3, v3, v2}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 730
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mInputSurface:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->updateSurface(Landroid/view/Surface;)V

    .line 731
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 732
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mInputSurface:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->makeEncodeContextCurrent()V

    .line 733
    return-void
.end method

.method private drainEncoder(Landroid/media/MediaCodec;Landroid/media/MediaCodec$BufferInfo;Z)V
    .locals 3
    .param p1, "encoder"    # Landroid/media/MediaCodec;
    .param p2, "bufferInfo"    # Landroid/media/MediaCodec$BufferInfo;
    .param p3, "endOfStream"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lco/getair/meerkat/utilities/objectPool/NoUnlockedObjectException;
        }
    .end annotation

    .prologue
    .line 767
    const/16 v0, 0x32

    .line 768
    .local v0, "TIMEOUT_USEC":I
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->puddle:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    new-instance v2, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;

    invoke-direct {v2, p0, p1, p3, p2}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$4;-><init>(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;Landroid/media/MediaCodec;ZLandroid/media/MediaCodec$BufferInfo;)V

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->run(Ljava/lang/Runnable;)V

    .line 918
    return-void
.end method

.method private prepareCamera(III)V
    .locals 10
    .param p1, "encWidth"    # I
    .param p2, "encHeight"    # I
    .param p3, "cameraType"    # I

    .prologue
    const/4 v9, 0x1

    .line 464
    if-eq p3, v9, :cond_0

    if-eqz p3, :cond_0

    .line 465
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "Invalid cameraType"

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 468
    :cond_0
    new-instance v2, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v2}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 471
    .local v2, "info":Landroid/hardware/Camera$CameraInfo;
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v4

    .line 472
    .local v4, "numCameras":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v4, :cond_1

    .line 473
    invoke-static {v1, v2}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 474
    iget v7, v2, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-ne v7, p3, :cond_3

    .line 475
    invoke-static {v1}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v7

    iput-object v7, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    .line 479
    :cond_1
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    if-nez v7, :cond_2

    .line 480
    const-string v7, "CameraToMpegTest"

    const-string v8, "No front-facing camera found; opening default"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 481
    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    move-result-object v7

    iput-object v7, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    .line 483
    :cond_2
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    if-nez v7, :cond_4

    .line 484
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "Unable to open camera"

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 472
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 487
    :cond_4
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v7}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v5

    .line 489
    .local v5, "params":Landroid/hardware/Camera$Parameters;
    const-string v7, "off"

    invoke-virtual {v5, v7}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 490
    invoke-virtual {v5, v9}, Landroid/hardware/Camera$Parameters;->setRecordingHint(Z)V

    .line 491
    invoke-virtual {v5}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v7

    const-string v8, "auto"

    invoke-interface {v7, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 492
    const-string v7, "auto"

    invoke-virtual {v5, v7}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 495
    :cond_5
    const/16 v7, 0x500

    const/16 v8, 0x2d0

    invoke-static {v5, v7, v8}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->choosePreviewSize(Landroid/hardware/Camera$Parameters;II)V

    .line 497
    invoke-virtual {v5}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    move-result-object v0

    .line 498
    .local v0, "fpsRanges":Ljava/util/List;, "Ljava/util/List<[I>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    .line 499
    .local v3, "maxFpsRange":[I
    const/4 v7, 0x0

    aget v7, v3, v7

    aget v8, v3, v9

    invoke-virtual {v5, v7, v8}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 500
    invoke-virtual {v5}, Landroid/hardware/Camera$Parameters;->isVideoStabilizationSupported()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 501
    invoke-virtual {v5, v9}, Landroid/hardware/Camera$Parameters;->setVideoStabilization(Z)V

    .line 504
    :cond_6
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v7, v5}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 506
    invoke-virtual {v5}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v6

    .line 507
    .local v6, "size":Landroid/hardware/Camera$Size;
    const-string v7, "CameraToMpegTest"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Camera preview size is "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v6, Landroid/hardware/Camera$Size;->width:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "x"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v6, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 509
    return-void
.end method

.method private prepareEncoder(III)V
    .locals 6
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "bitRate"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v0, 0x0

    const/4 v4, 0x0

    .line 643
    iput-boolean v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eosSentToAudioEncoder:Z

    .line 644
    iput-boolean v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eosSentToVideoEncoder:Z

    .line 645
    iput-boolean v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->fullStopReceived:Z

    .line 646
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 648
    const-string v0, "video/avc"

    invoke-static {v0, p1, p2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoFormat:Landroid/media/MediaFormat;

    .line 652
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoFormat:Landroid/media/MediaFormat;

    const-string v1, "color-format"

    const v2, 0x7f000789

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 654
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoFormat:Landroid/media/MediaFormat;

    const-string v1, "bitrate"

    invoke-virtual {v0, v1, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 655
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoFormat:Landroid/media/MediaFormat;

    const-string v1, "frame-rate"

    const/16 v2, 0x1e

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 656
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoFormat:Landroid/media/MediaFormat;

    const-string v1, "i-frame-interval"

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 660
    const-string v0, "CameraToMpegTest"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "format: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoFormat:Landroid/media/MediaFormat;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 669
    const-string v0, "video/avc"

    invoke-static {v0}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoEncoder:Landroid/media/MediaCodec;

    .line 670
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoEncoder:Landroid/media/MediaCodec;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoFormat:Landroid/media/MediaFormat;

    invoke-virtual {v0, v1, v4, v4, v5}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 671
    new-instance v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mEGLDisplaySurface:Landroid/opengl/EGLSurface;

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eglCore:Lco/getair/meerkat/video/broadcast/EglCore;

    invoke-direct {v0, v1, v2, v3}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;-><init>(Landroid/view/Surface;Landroid/opengl/EGLSurface;Lco/getair/meerkat/video/broadcast/EglCore;)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mInputSurface:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;

    .line 672
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 674
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 677
    new-instance v0, Landroid/media/MediaFormat;

    invoke-direct {v0}, Landroid/media/MediaFormat;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioFormat:Landroid/media/MediaFormat;

    .line 678
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioFormat:Landroid/media/MediaFormat;

    const-string v1, "mime"

    const-string v2, "audio/mp4a-latm"

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 679
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioFormat:Landroid/media/MediaFormat;

    const-string v1, "aac-profile"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 680
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioFormat:Landroid/media/MediaFormat;

    const-string v1, "sample-rate"

    const v2, 0xac44

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 681
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioFormat:Landroid/media/MediaFormat;

    const-string v1, "channel-count"

    invoke-virtual {v0, v1, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 682
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioFormat:Landroid/media/MediaFormat;

    const-string v1, "bitrate"

    const v2, 0xfa00

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 683
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioFormat:Landroid/media/MediaFormat;

    const-string v1, "max-input-size"

    const/16 v2, 0x4000

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 685
    const-string v0, "audio/mp4a-latm"

    invoke-static {v0}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioEncoder:Landroid/media/MediaCodec;

    .line 686
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioEncoder:Landroid/media/MediaCodec;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioFormat:Landroid/media/MediaFormat;

    invoke-virtual {v0, v1, v4, v4, v5}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 687
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 690
    return-void
.end method

.method private prepareSurfaceTexture()V
    .locals 6

    .prologue
    const/4 v2, 0x1

    .line 618
    new-instance v3, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;

    iget v4, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCameraId:I

    if-ne v4, v2, :cond_0

    iget v4, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->cameraOrientation:I

    const/16 v5, 0x10e

    if-eq v4, v5, :cond_0

    :goto_0
    invoke-direct {v3, v2}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;-><init>(Z)V

    iput-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mStManager:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;

    .line 619
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mStManager:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v1

    .line 622
    .local v1, "st":Landroid/graphics/SurfaceTexture;
    :try_start_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v2, v1}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 626
    return-void

    .line 618
    .end local v1    # "st":Landroid/graphics/SurfaceTexture;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 623
    .restart local v1    # "st":Landroid/graphics/SurfaceTexture;
    :catch_0
    move-exception v0

    .line 624
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "setPreviewTexture failed"

    invoke-direct {v2, v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private releaseCamera()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 576
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 577
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 578
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 579
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 580
    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    .line 582
    :cond_0
    return-void
.end method

.method private releaseEncodersAndMuxer()V
    .locals 0

    .prologue
    .line 753
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->stopAndReleaseEncoders()V

    .line 754
    return-void
.end method

.method private releaseSurfaceTexture()V
    .locals 1

    .prologue
    .line 632
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mStManager:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;

    if-eqz v0, :cond_0

    .line 633
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mStManager:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->release()V

    .line 634
    const/4 v0, 0x0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mStManager:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;

    .line 636
    :cond_0
    return-void
.end method

.method private setupAudioRecord()V
    .locals 7

    .prologue
    const v2, 0xac44

    const/16 v3, 0x10

    const/4 v4, 0x2

    .line 330
    invoke-static {v2, v3, v4}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v6

    .line 331
    .local v6, "min_buffer_size":I
    const/16 v5, 0x2800

    .line 332
    .local v5, "buffer_size":I
    if-ge v5, v6, :cond_0

    .line 333
    div-int/lit16 v0, v6, 0x400

    add-int/lit8 v0, v0, 0x1

    mul-int/lit16 v0, v0, 0x400

    mul-int/lit8 v5, v0, 0x2

    .line 335
    :cond_0
    new-instance v0, Landroid/media/AudioRecord;

    const/4 v1, 0x1

    invoke-direct/range {v0 .. v5}, Landroid/media/AudioRecord;-><init>(IIIII)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->audioRecord:Landroid/media/AudioRecord;

    .line 343
    return-void
.end method

.method private startAudioRecord()V
    .locals 2

    .prologue
    .line 347
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->audioRecord:Landroid/media/AudioRecord;

    if-eqz v0, :cond_0

    .line 349
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;

    invoke-direct {v1, p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$1;-><init>(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 391
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 395
    :cond_0
    return-void
.end method

.method private stopAndReleaseAudioEncoder()V
    .locals 2

    .prologue
    .line 704
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->lastEncodedAudioTimeStamp:J

    .line 705
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eosSentToAudioEncoder:Z

    .line 707
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioEncoder:Landroid/media/MediaCodec;

    if-eqz v0, :cond_0

    .line 708
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 709
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 710
    const/4 v0, 0x0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioEncoder:Landroid/media/MediaCodec;

    .line 712
    :cond_0
    return-void
.end method

.method private stopAndReleaseEncoders()V
    .locals 0

    .prologue
    .line 715
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->stopAndReleaseVideoEncoder()V

    .line 716
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->stopAndReleaseAudioEncoder()V

    .line 717
    return-void
.end method

.method private stopAndReleaseVideoEncoder()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 693
    iput-boolean v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eosSentToVideoEncoder:Z

    .line 694
    iput v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->frameCount:I

    .line 695
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoEncoder:Landroid/media/MediaCodec;

    if-eqz v0, :cond_0

    .line 696
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 697
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 698
    const/4 v0, 0x0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoEncoder:Landroid/media/MediaCodec;

    .line 700
    :cond_0
    return-void
.end method


# virtual methods
.method public endStream()V
    .locals 1

    .prologue
    .line 324
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->builder:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->finishStreaming()V

    .line 326
    return-void
.end method

.method public getCameraId()I
    .locals 1

    .prologue
    .line 176
    iget v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCameraId:I

    return v0
.end method

.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 2
    .param p1, "data"    # [B
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    .line 523
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->puddle:Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;

    new-instance v1, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$2;

    invoke-direct {v1, p0, p1}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$2;-><init>(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;[B)V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/dfh/thread/ThreadPuddle;->run(Ljava/lang/Runnable;)V

    .line 568
    return-void
.end method

.method public requestFrameFromCamera(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 4
    .param p1, "resultRunnable"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    .line 594
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    if-nez v0, :cond_0

    .line 597
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$3;

    invoke-direct {v1, p0, p1}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$3;-><init>(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 610
    :goto_0
    return-void

    .line 605
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0, p0}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 606
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->cameraOnPreviewFrameCallback:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    goto :goto_0
.end method

.method public sendAudioToEncoder(Z)V
    .locals 20
    .param p1, "endOfStream"    # Z

    .prologue
    .line 400
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v2}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v10

    .line 401
    .local v10, "inputBuffers":[Ljava/nio/ByteBuffer;
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioEncoder:Landroid/media/MediaCodec;

    const-wide/16 v14, -0x1

    invoke-virtual {v2, v14, v15}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v3

    .line 402
    .local v3, "inputBufferIndex":I
    if-ltz v3, :cond_1

    .line 403
    aget-object v9, v10, v3

    .line 404
    .local v9, "inputBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 405
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v12

    .line 406
    .local v12, "presentationTimeNs":J
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->audioRecord:Landroid/media/AudioRecord;

    const/16 v4, 0x400

    invoke-virtual {v2, v9, v4}, Landroid/media/AudioRecord;->read(Ljava/nio/ByteBuffer;I)I

    move-result v5

    .line 407
    .local v5, "inputLength":I
    long-to-double v14, v12

    int-to-double v0, v5

    move-wide/from16 v16, v0

    const-wide v18, 0x40e5888000000000L    # 44100.0

    div-double v16, v16, v18

    const-wide v18, 0x41cdcd6500000000L    # 1.0E9

    div-double v16, v16, v18

    sub-double v14, v14, v16

    double-to-long v12, v14

    .line 408
    const/4 v2, -0x3

    if-ne v5, v2, :cond_0

    .line 409
    const-string v2, "CameraToMpegTest"

    const-string v4, "Audio read error"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 412
    :cond_0
    long-to-double v14, v12

    const-wide v16, 0x408f400000000000L    # 1000.0

    div-double v14, v14, v16

    double-to-long v6, v14

    .line 414
    .local v6, "presentationTimeUs":J
    if-eqz p1, :cond_2

    .line 415
    const-string v2, "CameraToMpegTest"

    const-string v4, "EOS received in sendAudioToEncoder"

    invoke-static {v2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 416
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioEncoder:Landroid/media/MediaCodec;

    const/4 v4, 0x0

    const/4 v8, 0x4

    invoke-virtual/range {v2 .. v8}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 417
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eosSentToAudioEncoder:Z

    .line 426
    .end local v3    # "inputBufferIndex":I
    .end local v5    # "inputLength":I
    .end local v6    # "presentationTimeUs":J
    .end local v9    # "inputBuffer":Ljava/nio/ByteBuffer;
    .end local v10    # "inputBuffers":[Ljava/nio/ByteBuffer;
    .end local v12    # "presentationTimeNs":J
    :cond_1
    :goto_0
    return-void

    .line 419
    .restart local v3    # "inputBufferIndex":I
    .restart local v5    # "inputLength":I
    .restart local v6    # "presentationTimeUs":J
    .restart local v9    # "inputBuffer":Ljava/nio/ByteBuffer;
    .restart local v10    # "inputBuffers":[Ljava/nio/ByteBuffer;
    .restart local v12    # "presentationTimeNs":J
    :cond_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mAudioEncoder:Landroid/media/MediaCodec;

    const/4 v4, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v2 .. v8}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 422
    .end local v3    # "inputBufferIndex":I
    .end local v5    # "inputLength":I
    .end local v6    # "presentationTimeUs":J
    .end local v9    # "inputBuffer":Ljava/nio/ByteBuffer;
    .end local v10    # "inputBuffers":[Ljava/nio/ByteBuffer;
    .end local v12    # "presentationTimeNs":J
    :catch_0
    move-exception v11

    .line 423
    .local v11, "t":Ljava/lang/Throwable;
    const-string v2, "CameraToMpegTest"

    const-string v4, "_offerAudioEncoder exception"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 424
    invoke-virtual {v11}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public setBitRateRatio(D)V
    .locals 0
    .param p1, "bitRateRatio"    # D

    .prologue
    .line 196
    return-void
.end method

.method public setCameraDisplayOrientation(I)V
    .locals 0
    .param p1, "orientation"    # I

    .prologue
    .line 515
    iput p1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->cameraOrientation:I

    .line 516
    return-void
.end method

.method public setCameraId(I)V
    .locals 0
    .param p1, "index"    # I

    .prologue
    .line 172
    iput p1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCameraId:I

    .line 173
    return-void
.end method

.method public setDisplayEGLContext(Landroid/opengl/EGLContext;)V
    .locals 1
    .param p1, "context"    # Landroid/opengl/EGLContext;

    .prologue
    .line 186
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mInputSurface:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;

    sput-object p1, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLDisplayContext:Landroid/opengl/EGLContext;

    .line 187
    return-void
.end method

.method public setSurfaceHolder(Landroid/view/SurfaceHolder;)V
    .locals 0
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 182
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->surfaceHolder:Landroid/view/SurfaceHolder;

    .line 183
    return-void
.end method

.method public startRecording()V
    .locals 8

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 202
    new-instance v3, Lco/getair/meerkat/video/broadcast/EglCore;

    const/4 v6, 0x0

    invoke-direct {v3, v6, v5}, Lco/getair/meerkat/video/broadcast/EglCore;-><init>(Landroid/opengl/EGLContext;I)V

    iput-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eglCore:Lco/getair/meerkat/video/broadcast/EglCore;

    .line 203
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eglCore:Lco/getair/meerkat/video/broadcast/EglCore;

    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->surfaceHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v6}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v6

    invoke-virtual {v3, v6}, Lco/getair/meerkat/video/broadcast/EglCore;->createWindowSurface(Ljava/lang/Object;)Landroid/opengl/EGLSurface;

    move-result-object v3

    iput-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mEGLDisplaySurface:Landroid/opengl/EGLSurface;

    .line 204
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eglCore:Lco/getair/meerkat/video/broadcast/EglCore;

    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mEGLDisplaySurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v3, v6}, Lco/getair/meerkat/video/broadcast/EglCore;->makeCurrent(Landroid/opengl/EGLSurface;)V

    .line 207
    const v1, 0x70600    # 6.45001E-40f

    .line 210
    .local v1, "encBitRate":I
    const/16 v3, 0x168

    const/16 v6, 0x280

    :try_start_0
    iget v7, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCameraId:I

    invoke-direct {p0, v3, v6, v7}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->prepareCamera(III)V

    .line 211
    const/16 v3, 0x168

    const/16 v6, 0x280

    invoke-direct {p0, v3, v6, v1}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->prepareEncoder(III)V

    .line 212
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->prepareSurfaceTexture()V

    .line 213
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mInputSurface:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->makeEncodeContextCurrent()V

    .line 216
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->setupAudioRecord()V

    .line 218
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->startAudioRecord()V

    .line 220
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    iput-wide v6, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->startWhen:J

    .line 222
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v3}, Landroid/hardware/Camera;->startPreview()V

    .line 223
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mStManager:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v2

    .line 224
    .local v2, "st":Landroid/graphics/SurfaceTexture;
    const/4 v3, 0x0

    iput-boolean v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eosReceived:Z

    .line 226
    :goto_0
    iget-boolean v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->fullStopReceived:Z

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eosSentToVideoEncoder:Z

    if-eqz v3, :cond_0

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mInputSurface:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;

    if-nez v3, :cond_3

    .line 229
    :cond_0
    const/4 v3, 0x0

    iput-boolean v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eosReceived:Z

    .line 230
    iget-boolean v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eosReceived:Z

    if-eqz v3, :cond_1

    const-string v3, "CameraToMpegTest"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Chunkpoint on frame "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->frameCount:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    :cond_1
    iget-boolean v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eosReceived:Z

    iput-boolean v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->audioEosRequested:Z

    .line 233
    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoEncoder:Landroid/media/MediaCodec;

    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mVideoBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-boolean v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->eosReceived:Z

    if-nez v3, :cond_2

    iget-boolean v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->fullStopReceived:Z

    if-eqz v3, :cond_4

    :cond_2
    move v3, v5

    :goto_1
    invoke-direct {p0, v6, v7, v3}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->drainEncoder(Landroid/media/MediaCodec;Landroid/media/MediaCodec$BufferInfo;Z)V

    .line 235
    iget-boolean v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->fullStopReceived:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_5

    .line 271
    :cond_3
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->stopRecording()V

    .line 273
    .end local v2    # "st":Landroid/graphics/SurfaceTexture;
    :goto_2
    return-void

    .restart local v2    # "st":Landroid/graphics/SurfaceTexture;
    :cond_4
    move v3, v4

    .line 233
    goto :goto_1

    .line 238
    :cond_5
    :try_start_1
    iget v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->frameCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->frameCount:I

    .line 239
    iget v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->totalFrameCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->totalFrameCount:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 248
    :try_start_2
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mStManager:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->awaitNewImage()V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 254
    :goto_3
    :try_start_3
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mInputSurface:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->makeDisplayContextCurrent()V

    .line 255
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mStManager:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;

    iget v6, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->screenWidth:I

    iget v7, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->screenHeight:I

    invoke-virtual {v3, v6, v7}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->drawImage(II)V

    .line 256
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mInputSurface:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->swapBuffers()Z

    .line 258
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mInputSurface:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->makeEncodeContextCurrent()V

    .line 259
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mStManager:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;

    const/16 v6, 0x168

    const/16 v7, 0x280

    invoke-virtual {v3, v6, v7}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->drawImage(II)V

    .line 260
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mInputSurface:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;

    invoke-virtual {v2}, Landroid/graphics/SurfaceTexture;->getTimestamp()J

    move-result-wide v6

    invoke-virtual {v3, v6, v7}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->setPresentationTime(J)V

    .line 262
    iget-boolean v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->firstFrameReady:Z

    if-nez v3, :cond_6

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    iput-wide v6, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->startTime:J

    .line 263
    :cond_6
    const/4 v3, 0x1

    iput-boolean v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->firstFrameReady:Z

    .line 264
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mInputSurface:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->swapBuffers()Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0

    .line 268
    .end local v2    # "st":Landroid/graphics/SurfaceTexture;
    :catch_0
    move-exception v0

    .line 269
    .local v0, "e":Ljava/lang/Exception;
    :try_start_4
    const-string v3, "CameraToMpegTest"

    const-string v4, "error "

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 271
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->stopRecording()V

    goto :goto_2

    .line 249
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "st":Landroid/graphics/SurfaceTexture;
    :catch_1
    move-exception v0

    .line 250
    .local v0, "e":Ljava/lang/RuntimeException;
    :try_start_5
    const-string v3, "CameraToMpegTest"

    const-string v6, "FATAL: Camera Failed to give preview! needs a restart or fail alert"

    invoke-static {v3, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_3

    .line 271
    .end local v0    # "e":Ljava/lang/RuntimeException;
    .end local v2    # "st":Landroid/graphics/SurfaceTexture;
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->stopRecording()V

    throw v3
.end method

.method public stopRecording()V
    .locals 6

    .prologue
    .line 300
    const-string v2, "CameraToMpegTest"

    const-string v3, "stopRecording"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    if-eqz v2, :cond_1

    .line 303
    const/4 v2, 0x1

    iput-boolean v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->fullStopReceived:Z

    .line 306
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->releaseCamera()V

    .line 307
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->releaseEncodersAndMuxer()V

    .line 308
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->releaseSurfaceTexture()V

    .line 310
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mInputSurface:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;

    if-eqz v2, :cond_0

    .line 311
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mInputSurface:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->release()V

    .line 312
    const/4 v2, 0x0

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mInputSurface:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;

    .line 315
    :cond_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->builder:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->stop()V

    .line 316
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    iget-wide v4, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->startTime:J

    sub-long/2addr v2, v4

    long-to-double v2, v2

    const-wide v4, 0x41cdcd6500000000L    # 1.0E9

    div-double v0, v2, v4

    .line 317
    .local v0, "recordingDurationSec":D
    const-string v2, "CameraToMpegTest"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Recorded "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " s. Expected "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-wide/high16 v4, 0x403e000000000000L    # 30.0

    mul-double/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " frames. Got "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->totalFrameCount:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->totalFrameCount:I

    int-to-double v4, v4

    div-double/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " fps"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    .end local v0    # "recordingDurationSec":D
    :cond_1
    return-void
.end method

.method public toggleFlashMode()V
    .locals 4

    .prologue
    .line 279
    :try_start_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v2}, Landroid/hardware/Camera;->lock()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 284
    :goto_0
    :try_start_1
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v2}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    .line 285
    .local v1, "params":Landroid/hardware/Camera$Parameters;
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getFlashMode()Ljava/lang/String;

    move-result-object v2

    const-string v3, "torch"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "off"

    :goto_1
    invoke-virtual {v1, v2}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 286
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v2, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 292
    .end local v1    # "params":Landroid/hardware/Camera$Parameters;
    :goto_2
    :try_start_2
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v2}, Landroid/hardware/Camera;->unlock()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    .line 297
    :goto_3
    return-void

    .line 280
    :catch_0
    move-exception v0

    .line 281
    .local v0, "e":Ljava/lang/Throwable;
    const-string v2, "CameraToMpegTest"

    const-string v3, "Could not lock camera "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 285
    .end local v0    # "e":Ljava/lang/Throwable;
    .restart local v1    # "params":Landroid/hardware/Camera$Parameters;
    :cond_0
    :try_start_3
    const-string v2, "torch"
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 288
    .end local v1    # "params":Landroid/hardware/Camera$Parameters;
    :catch_1
    move-exception v0

    .line 289
    .restart local v0    # "e":Ljava/lang/Throwable;
    const-string v2, "CameraToMpegTest"

    const-string v3, "Could not set Flash Parameters on camera "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 293
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_2
    move-exception v0

    .line 294
    .restart local v0    # "e":Ljava/lang/Throwable;
    const-string v2, "CameraToMpegTest"

    const-string v3, "Could not unlock camera "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3
.end method
