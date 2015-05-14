.class final Lcom/instabug/library/util/i;
.super Ljava/lang/Object;
.source "ScreenshotProcessor.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:I

.field private synthetic b:I

.field private synthetic c:Ljava/nio/IntBuffer;

.field private synthetic d:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method constructor <init>(Lcom/instabug/library/util/h;IILjava/nio/IntBuffer;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .prologue
    .line 155
    iput p2, p0, Lcom/instabug/library/util/i;->a:I

    iput p3, p0, Lcom/instabug/library/util/i;->b:I

    iput-object p4, p0, Lcom/instabug/library/util/i;->c:Ljava/nio/IntBuffer;

    iput-object p5, p0, Lcom/instabug/library/util/i;->d:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .prologue
    const/4 v1, 0x0

    .line 158
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v0

    check-cast v0, Ljavax/microedition/khronos/egl/EGL10;

    .line 159
    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglWaitGL()Z

    .line 160
    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetCurrentContext()Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/microedition/khronos/egl/EGLContext;->getGL()Ljavax/microedition/khronos/opengles/GL;

    move-result-object v0

    check-cast v0, Ljavax/microedition/khronos/opengles/GL10;

    .line 162
    invoke-interface {v0}, Ljavax/microedition/khronos/opengles/GL10;->glFinish()V

    .line 165
    const-wide/16 v2, 0xc8

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 170
    :goto_0
    iget v3, p0, Lcom/instabug/library/util/i;->a:I

    iget v2, p0, Lcom/instabug/library/util/i;->b:I

    add-int/lit8 v4, v2, 0x0

    const/16 v5, 0x1908

    const/16 v6, 0x1401

    iget-object v7, p0, Lcom/instabug/library/util/i;->c:Ljava/nio/IntBuffer;

    move v2, v1

    invoke-interface/range {v0 .. v7}, Ljavax/microedition/khronos/opengles/GL10;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 171
    iget-object v0, p0, Lcom/instabug/library/util/i;->d:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 173
    return-void

    .line 166
    :catch_0
    move-exception v2

    .line 167
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method
