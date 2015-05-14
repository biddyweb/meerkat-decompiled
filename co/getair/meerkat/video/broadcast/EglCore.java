package co.getair.meerkat.video.broadcast;

import android.graphics.SurfaceTexture;
import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLExt;
import android.opengl.EGLSurface;
import android.util.Log;
import android.view.Surface;

public final class EglCore
{
  private static final int EGL_RECORDABLE_ANDROID = 12610;
  public static final int FLAG_RECORDABLE = 1;
  public static final int FLAG_TRY_GLES3 = 2;
  private static final String TAG = "EglCore";
  private EGLConfig mEGLConfig = null;
  private EGLContext mEGLContext = EGL14.EGL_NO_CONTEXT;
  private EGLDisplay mEGLDisplay = EGL14.EGL_NO_DISPLAY;
  private int mGlVersion = -1;

  public EglCore()
  {
    this(null, 0);
  }

  public EglCore(EGLContext paramEGLContext, int paramInt)
  {
    if (this.mEGLDisplay != EGL14.EGL_NO_DISPLAY)
      throw new RuntimeException("EGL already set up");
    if (paramEGLContext == null)
      paramEGLContext = EGL14.EGL_NO_CONTEXT;
    this.mEGLDisplay = EGL14.eglGetDisplay(0);
    if (this.mEGLDisplay == EGL14.EGL_NO_DISPLAY)
      throw new RuntimeException("unable to get EGL14 display");
    int[] arrayOfInt1 = new int[2];
    if (!EGL14.eglInitialize(this.mEGLDisplay, arrayOfInt1, 0, arrayOfInt1, 1))
    {
      this.mEGLDisplay = null;
      throw new RuntimeException("unable to initialize EGL14");
    }
    if ((paramInt & 0x2) != 0)
    {
      EGLConfig localEGLConfig2 = getConfig(paramInt, 3);
      if (localEGLConfig2 != null)
      {
        int[] arrayOfInt4 = { 12440, 3, 12344 };
        EGLContext localEGLContext2 = EGL14.eglCreateContext(this.mEGLDisplay, localEGLConfig2, paramEGLContext, arrayOfInt4, 0);
        if (EGL14.eglGetError() == 12288)
        {
          this.mEGLConfig = localEGLConfig2;
          this.mEGLContext = localEGLContext2;
          this.mGlVersion = 3;
        }
      }
    }
    if (this.mEGLContext == EGL14.EGL_NO_CONTEXT)
    {
      EGLConfig localEGLConfig1 = getConfig(paramInt, 2);
      if (localEGLConfig1 == null)
        throw new RuntimeException("Unable to find a suitable EGLConfig");
      int[] arrayOfInt3 = { 12440, 2, 12344 };
      EGLContext localEGLContext1 = EGL14.eglCreateContext(this.mEGLDisplay, localEGLConfig1, paramEGLContext, arrayOfInt3, 0);
      checkEglError("eglCreateContext");
      this.mEGLConfig = localEGLConfig1;
      this.mEGLContext = localEGLContext1;
      this.mGlVersion = 2;
    }
    int[] arrayOfInt2 = new int[1];
    EGL14.eglQueryContext(this.mEGLDisplay, this.mEGLContext, 12440, arrayOfInt2, 0);
    Log.d("EglCore", "EGLContext created, client version " + arrayOfInt2[0]);
  }

  private void checkEglError(String paramString)
  {
    int i = EGL14.eglGetError();
    if (i != 12288)
      throw new RuntimeException(paramString + ": EGL error: 0x" + Integer.toHexString(i));
  }

  private EGLConfig getConfig(int paramInt1, int paramInt2)
  {
    int i = 4;
    if (paramInt2 >= 3)
      i |= 64;
    int[] arrayOfInt1 = { 12324, 8, 12323, 8, 12322, 8, 12321, 8, 12352, i, 12344, 0, 12344 };
    if ((paramInt1 & 0x1) != 0)
    {
      arrayOfInt1[(-3 + arrayOfInt1.length)] = 12610;
      arrayOfInt1[(-2 + arrayOfInt1.length)] = 1;
    }
    EGLConfig[] arrayOfEGLConfig = new EGLConfig[1];
    int[] arrayOfInt2 = new int[1];
    if (!EGL14.eglChooseConfig(this.mEGLDisplay, arrayOfInt1, 0, arrayOfEGLConfig, 0, arrayOfEGLConfig.length, arrayOfInt2, 0))
    {
      Log.w("EglCore", "unable to find RGB8888 / " + paramInt2 + " EGLConfig");
      return null;
    }
    return arrayOfEGLConfig[0];
  }

  public static void logCurrent(String paramString)
  {
    EGLDisplay localEGLDisplay = EGL14.eglGetCurrentDisplay();
    EGLContext localEGLContext = EGL14.eglGetCurrentContext();
    EGLSurface localEGLSurface = EGL14.eglGetCurrentSurface(12377);
    Log.i("EglCore", "Current EGL (" + paramString + "): display=" + localEGLDisplay + ", context=" + localEGLContext + ", surface=" + localEGLSurface);
  }

  public EGLSurface createOffscreenSurface(int paramInt1, int paramInt2)
  {
    int[] arrayOfInt = { 12375, paramInt1, 12374, paramInt2, 12344 };
    EGLSurface localEGLSurface = EGL14.eglCreatePbufferSurface(this.mEGLDisplay, this.mEGLConfig, arrayOfInt, 0);
    checkEglError("eglCreatePbufferSurface");
    if (localEGLSurface == null)
      throw new RuntimeException("surface was null");
    return localEGLSurface;
  }

  public EGLSurface createWindowSurface(Object paramObject)
  {
    if ((!(paramObject instanceof Surface)) && (!(paramObject instanceof SurfaceTexture)))
      throw new RuntimeException("invalid surface: " + paramObject);
    int[] arrayOfInt = { 12344 };
    EGLSurface localEGLSurface = EGL14.eglCreateWindowSurface(this.mEGLDisplay, this.mEGLConfig, paramObject, arrayOfInt, 0);
    checkEglError("eglCreateWindowSurface");
    if (localEGLSurface == null)
      throw new RuntimeException("surface was null");
    return localEGLSurface;
  }

  protected void finalize()
    throws Throwable
  {
    try
    {
      if (this.mEGLDisplay != EGL14.EGL_NO_DISPLAY)
      {
        Log.w("EglCore", "WARNING: EglCore was not explicitly released -- state may be leaked");
        release();
      }
      return;
    }
    finally
    {
      super.finalize();
    }
  }

  public int getGlVersion()
  {
    return this.mGlVersion;
  }

  public boolean isCurrent(EGLSurface paramEGLSurface)
  {
    return (this.mEGLContext.equals(EGL14.eglGetCurrentContext())) && (paramEGLSurface.equals(EGL14.eglGetCurrentSurface(12377)));
  }

  public void makeCurrent(EGLSurface paramEGLSurface)
  {
    if (this.mEGLDisplay == EGL14.EGL_NO_DISPLAY)
      Log.d("EglCore", "NOTE: makeCurrent w/o display");
    if (!EGL14.eglMakeCurrent(this.mEGLDisplay, paramEGLSurface, paramEGLSurface, this.mEGLContext))
      throw new RuntimeException("eglMakeCurrent failed");
  }

  public void makeCurrent(EGLSurface paramEGLSurface1, EGLSurface paramEGLSurface2)
  {
    if (this.mEGLDisplay == EGL14.EGL_NO_DISPLAY)
      Log.d("EglCore", "NOTE: makeCurrent w/o display");
    if (!EGL14.eglMakeCurrent(this.mEGLDisplay, paramEGLSurface1, paramEGLSurface2, this.mEGLContext))
      throw new RuntimeException("eglMakeCurrent(draw,read) failed");
  }

  public void makeNothingCurrent()
  {
    if (!EGL14.eglMakeCurrent(this.mEGLDisplay, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT))
      throw new RuntimeException("eglMakeCurrent failed");
  }

  public String queryString(int paramInt)
  {
    return EGL14.eglQueryString(this.mEGLDisplay, paramInt);
  }

  public int querySurface(EGLSurface paramEGLSurface, int paramInt)
  {
    int[] arrayOfInt = new int[1];
    EGL14.eglQuerySurface(this.mEGLDisplay, paramEGLSurface, paramInt, arrayOfInt, 0);
    return arrayOfInt[0];
  }

  public void release()
  {
    if (this.mEGLDisplay != EGL14.EGL_NO_DISPLAY)
    {
      EGL14.eglMakeCurrent(this.mEGLDisplay, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT);
      EGL14.eglDestroyContext(this.mEGLDisplay, this.mEGLContext);
      EGL14.eglReleaseThread();
      EGL14.eglTerminate(this.mEGLDisplay);
    }
    this.mEGLDisplay = EGL14.EGL_NO_DISPLAY;
    this.mEGLContext = EGL14.EGL_NO_CONTEXT;
    this.mEGLConfig = null;
  }

  public void releaseSurface(EGLSurface paramEGLSurface)
  {
    EGL14.eglDestroySurface(this.mEGLDisplay, paramEGLSurface);
  }

  public void setPresentationTime(EGLSurface paramEGLSurface, long paramLong)
  {
    EGLExt.eglPresentationTimeANDROID(this.mEGLDisplay, paramEGLSurface, paramLong);
  }

  public boolean swapBuffers(EGLSurface paramEGLSurface)
  {
    return EGL14.eglSwapBuffers(this.mEGLDisplay, paramEGLSurface);
  }
}