package com.instabug.library.util;

import java.nio.IntBuffer;
import java.util.concurrent.CountDownLatch;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.opengles.GL10;

final class i
  implements Runnable
{
  i(h paramh, int paramInt1, int paramInt2, IntBuffer paramIntBuffer, CountDownLatch paramCountDownLatch)
  {
  }

  public final void run()
  {
    EGL10 localEGL10 = (EGL10)EGLContext.getEGL();
    localEGL10.eglWaitGL();
    GL10 localGL10 = (GL10)localEGL10.eglGetCurrentContext().getGL();
    localGL10.glFinish();
    try
    {
      Thread.sleep(200L);
      localGL10.glReadPixels(0, 0, this.a, 0 + this.b, 6408, 5121, this.c);
      this.d.countDown();
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      while (true)
        localInterruptedException.printStackTrace();
    }
  }
}