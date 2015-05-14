.class Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;
.super Ljava/lang/Object;
.source "ChunkedHWRecorder.java"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SurfaceTextureManager"
.end annotation


# instance fields
.field private mFrameAvailable:Z

.field private mFrameSyncObject:Ljava/lang/Object;

.field private mSurfaceTexture:Landroid/graphics/SurfaceTexture;

.field private mTextureRender:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;


# direct methods
.method public constructor <init>(Z)V
    .locals 2
    .param p1, "flipTexture"    # Z

    .prologue
    .line 1083
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1077
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mFrameSyncObject:Ljava/lang/Object;

    .line 1085
    new-instance v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mTextureRender:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;

    .line 1086
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mTextureRender:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;

    invoke-virtual {v0, p1}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->surfaceCreated(Z)V

    .line 1089
    new-instance v0, Landroid/graphics/SurfaceTexture;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mTextureRender:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->getTextureId()I

    move-result v1

    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 1102
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 1103
    return-void
.end method


# virtual methods
.method public awaitNewImage()V
    .locals 8

    .prologue
    .line 1127
    const/16 v0, 0x64

    .line 1128
    .local v0, "TIMEOUT_MS":I
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mFrameSyncObject:Ljava/lang/Object;

    monitor-enter v4

    .line 1129
    const/4 v2, 0x0

    .line 1130
    .local v2, "waited":I
    :cond_0
    :try_start_0
    iget-boolean v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mFrameAvailable:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v3, :cond_1

    .line 1135
    :try_start_1
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mFrameSyncObject:Ljava/lang/Object;

    const-wide/16 v6, 0x64

    invoke-virtual {v3, v6, v7}, Ljava/lang/Object;->wait(J)V

    .line 1136
    add-int/lit8 v2, v2, 0x64

    .line 1137
    iget-boolean v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mFrameAvailable:Z

    if-nez v3, :cond_0

    .line 1138
    const/16 v3, 0x5dc

    if-le v2, v3, :cond_0

    .line 1139
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v5, "Camera frame wait timed out"

    invoke-direct {v3, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1142
    :catch_0
    move-exception v1

    .line 1144
    .local v1, "ie":Ljava/lang/InterruptedException;
    :try_start_2
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 1149
    .end local v1    # "ie":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3

    .line 1148
    :cond_1
    const/4 v3, 0x0

    :try_start_3
    iput-boolean v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mFrameAvailable:Z

    .line 1149
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1152
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mTextureRender:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;

    const-string v4, "before updateTexImage"

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->checkGlError(Ljava/lang/String;)V

    .line 1153
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v3}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 1155
    return-void
.end method

.method public drawImage(II)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 1161
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mTextureRender:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0, v1, p1, p2}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->drawFrame(Landroid/graphics/SurfaceTexture;II)V

    .line 1163
    return-void
.end method

.method public getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 1

    .prologue
    .line 1118
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    return-object v0
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 3
    .param p1, "st"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 1168
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mFrameSyncObject:Ljava/lang/Object;

    monitor-enter v1

    .line 1169
    :try_start_0
    iget-boolean v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mFrameAvailable:Z

    if-eqz v0, :cond_0

    .line 1170
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v2, "mFrameAvailable already set, frame could be dropped"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1174
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 1172
    :cond_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mFrameAvailable:Z

    .line 1173
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mFrameSyncObject:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1174
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1175
    return-void
.end method

.method public release()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 1110
    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mTextureRender:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;

    .line 1111
    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 1112
    return-void
.end method
