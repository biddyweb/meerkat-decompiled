.class Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;
.super Ljava/lang/Object;
.source "ChunkedHWRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CodecInputSurface"
.end annotation


# static fields
.field private static final EGL_RECORDABLE_ANDROID:I = 0x3142

.field public static mEGLDisplayContext:Landroid/opengl/EGLContext;


# instance fields
.field configs:[Landroid/opengl/EGLConfig;

.field private mCurrentSurface:Landroid/opengl/EGLSurface;

.field private mEGLDisplay:Landroid/opengl/EGLDisplay;

.field private mEGLDisplaySurface:Landroid/opengl/EGLSurface;

.field private mEGLEncodeContext:Landroid/opengl/EGLContext;

.field private mEGLEncodeSurface:Landroid/opengl/EGLSurface;

.field private mEglCore:Lco/getair/meerkat/video/broadcast/EglCore;

.field private mEncodingSurface:Landroid/view/Surface;

.field surfaceAttribs:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 933
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    sput-object v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLDisplayContext:Landroid/opengl/EGLContext;

    return-void
.end method

.method public constructor <init>(Landroid/view/Surface;Landroid/opengl/EGLSurface;Lco/getair/meerkat/video/broadcast/EglCore;)V
    .locals 3
    .param p1, "encodingSurface"    # Landroid/view/Surface;
    .param p2, "eglDisplaySurface"    # Landroid/opengl/EGLSurface;
    .param p3, "eglCore"    # Lco/getair/meerkat/video/broadcast/EglCore;

    .prologue
    .line 952
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 931
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    .line 932
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLEncodeContext:Landroid/opengl/EGLContext;

    .line 935
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLDisplaySurface:Landroid/opengl/EGLSurface;

    .line 936
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLEncodeSurface:Landroid/opengl/EGLSurface;

    .line 938
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mCurrentSurface:Landroid/opengl/EGLSurface;

    .line 945
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0x3038

    aput v2, v0, v1

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->surfaceAttribs:[I

    .line 953
    if-nez p1, :cond_0

    .line 954
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 957
    :cond_0
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEncodingSurface:Landroid/view/Surface;

    .line 958
    iput-object p2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLDisplaySurface:Landroid/opengl/EGLSurface;

    .line 960
    iput-object p3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEglCore:Lco/getair/meerkat/video/broadcast/EglCore;

    .line 962
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->eglSetup()V

    .line 963
    return-void
.end method

.method private checkEglError(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 1061
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v0

    .local v0, "error":I
    const/16 v1, 0x3000

    if-eq v0, v1, :cond_0

    .line 1062
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": EGL error: 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1064
    :cond_0
    return-void
.end method

.method private eglSetup()V
    .locals 2

    .prologue
    .line 989
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEglCore:Lco/getair/meerkat/video/broadcast/EglCore;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLDisplaySurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/EglCore;->makeCurrent(Landroid/opengl/EGLSurface;)V

    .line 990
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLDisplaySurface:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mCurrentSurface:Landroid/opengl/EGLSurface;

    .line 992
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLEncodeSurface:Landroid/opengl/EGLSurface;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    if-eq v0, v1, :cond_0

    .line 993
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "surface already created"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 995
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEglCore:Lco/getair/meerkat/video/broadcast/EglCore;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEncodingSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/EglCore;->createWindowSurface(Ljava/lang/Object;)Landroid/opengl/EGLSurface;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLEncodeSurface:Landroid/opengl/EGLSurface;

    .line 996
    return-void
.end method

.method private makeCurrent(Landroid/opengl/EGLSurface;)V
    .locals 1
    .param p1, "eglSurface"    # Landroid/opengl/EGLSurface;

    .prologue
    .line 1034
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEglCore:Lco/getair/meerkat/video/broadcast/EglCore;

    invoke-virtual {v0, p1}, Lco/getair/meerkat/video/broadcast/EglCore;->makeCurrent(Landroid/opengl/EGLSurface;)V

    .line 1035
    const-string v0, "eglMakeCurrent"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->checkEglError(Ljava/lang/String;)V

    .line 1037
    return-void
.end method


# virtual methods
.method public makeDisplayContextCurrent()V
    .locals 1

    .prologue
    .line 1021
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLDisplaySurface:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mCurrentSurface:Landroid/opengl/EGLSurface;

    .line 1022
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLDisplaySurface:Landroid/opengl/EGLSurface;

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->makeCurrent(Landroid/opengl/EGLSurface;)V

    .line 1023
    return-void
.end method

.method public makeEncodeContextCurrent()V
    .locals 1

    .prologue
    .line 1025
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLEncodeSurface:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mCurrentSurface:Landroid/opengl/EGLSurface;

    .line 1026
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLEncodeSurface:Landroid/opengl/EGLSurface;

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->makeCurrent(Landroid/opengl/EGLSurface;)V

    .line 1027
    return-void
.end method

.method public release()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1003
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-eq v0, v1, :cond_0

    .line 1004
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEglCore:Lco/getair/meerkat/video/broadcast/EglCore;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/EglCore;->makeNothingCurrent()V

    .line 1005
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEglCore:Lco/getair/meerkat/video/broadcast/EglCore;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLDisplaySurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/EglCore;->releaseSurface(Landroid/opengl/EGLSurface;)V

    .line 1006
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEglCore:Lco/getair/meerkat/video/broadcast/EglCore;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLEncodeSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/EglCore;->releaseSurface(Landroid/opengl/EGLSurface;)V

    .line 1007
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEglCore:Lco/getair/meerkat/video/broadcast/EglCore;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/EglCore;->release()V

    .line 1010
    :cond_0
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    .line 1011
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLEncodeContext:Landroid/opengl/EGLContext;

    .line 1012
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLDisplaySurface:Landroid/opengl/EGLSurface;

    .line 1014
    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLDisplaySurface:Landroid/opengl/EGLSurface;

    .line 1015
    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLEncodeSurface:Landroid/opengl/EGLSurface;

    .line 1017
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 1018
    return-void
.end method

.method public setPresentationTime(J)V
    .locals 3
    .param p1, "nsecs"    # J

    .prologue
    .line 1052
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEglCore:Lco/getair/meerkat/video/broadcast/EglCore;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLEncodeSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1, p1, p2}, Lco/getair/meerkat/video/broadcast/EglCore;->setPresentationTime(Landroid/opengl/EGLSurface;J)V

    .line 1053
    const-string v0, "eglPresentationTimeANDROID"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->checkEglError(Ljava/lang/String;)V

    .line 1054
    return-void
.end method

.method public swapBuffers()Z
    .locals 3

    .prologue
    .line 1043
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEglCore:Lco/getair/meerkat/video/broadcast/EglCore;

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mCurrentSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/EglCore;->swapBuffers(Landroid/opengl/EGLSurface;)Z

    move-result v0

    .line 1044
    .local v0, "result":Z
    const-string v1, "eglSwapBuffers"

    invoke-direct {p0, v1}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->checkEglError(Ljava/lang/String;)V

    .line 1045
    return v0
.end method

.method public updateSurface(Landroid/view/Surface;)V
    .locals 5
    .param p1, "newEncodingSurface"    # Landroid/view/Surface;

    .prologue
    const/4 v4, 0x0

    .line 967
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLEncodeSurface:Landroid/opengl/EGLSurface;

    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 968
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEncodingSurface:Landroid/view/Surface;

    .line 970
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->configs:[Landroid/opengl/EGLConfig;

    aget-object v1, v1, v4

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEncodingSurface:Landroid/view/Surface;

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->surfaceAttribs:[I

    invoke-static {v0, v1, v2, v3, v4}, Landroid/opengl/EGL14;->eglCreateWindowSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Ljava/lang/Object;[II)Landroid/opengl/EGLSurface;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->mEGLEncodeSurface:Landroid/opengl/EGLSurface;

    .line 972
    const-string v0, "eglCreateWindowSurface"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;->checkEglError(Ljava/lang/String;)V

    .line 974
    return-void
.end method
