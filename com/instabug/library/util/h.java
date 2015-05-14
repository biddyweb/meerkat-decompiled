package com.instabug.library.util;

import android.app.Activity;
import android.app.Dialog;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.opengl.GLSurfaceView;
import android.os.AsyncTask;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import com.instabug.library.internal.device.a;
import com.instabug.library.internal.layer.c;
import java.nio.IntBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.CountDownLatch;

public final class h extends AsyncTask
{
  private a a;
  private Activity b;
  private Dialog c;
  private int d;
  private int[] e;
  private View f;
  private View g;
  private Bitmap h;
  private GLSurfaceView i;
  private a j;
  private List k;
  private Exception l;

  public h(Activity paramActivity, Dialog paramDialog, GLSurfaceView paramGLSurfaceView, List paramList, a parama)
  {
    this.b = paramActivity;
    this.c = paramDialog;
    this.i = paramGLSurfaceView;
    this.k = paramList;
    this.j = parama;
  }

  private void a()
  {
    int i3;
    int i4;
    int i5;
    int i6;
    while (true)
    {
      int m;
      int n;
      Canvas localCanvas1;
      try
      {
        this.f = this.b.getWindow().getDecorView();
        if ((this.c != null) && (this.c.isShowing()))
        {
          this.g = this.c.getWindow().getDecorView();
          this.e = new int[2];
          this.g.getLocationOnScreen(this.e);
        }
        this.d = 0;
        ArrayList localArrayList;
        Drawable localDrawable;
        if ((0x400 & this.b.getWindow().getAttributes().flags) != 0)
        {
          m = 1;
          if ((0x800 & this.b.getWindow().getAttributes().flags) != 0)
          {
            n = 1;
            break label789;
            int i1 = this.b.getResources().getIdentifier("status_bar_height", "dimen", "android");
            if ((i1 > 0) && (!this.j.b()))
              this.d = this.b.getResources().getDimensionPixelSize(i1);
            this.h = Bitmap.createBitmap(this.f.getWidth(), this.f.getHeight(), Bitmap.Config.ARGB_8888);
            localCanvas1 = new Canvas();
            localCanvas1.setBitmap(this.h);
            localArrayList = new ArrayList(3);
            if ((this.b.getWindow().getDecorView().getRootView() instanceof ViewGroup))
              a((ViewGroup)this.b.getWindow().getDecorView().getRootView(), localArrayList);
            localDrawable = this.b.getWindow().getDecorView().getBackground();
            if (localDrawable != null)
            {
              this.b.getWindow().setBackgroundDrawable(null);
              localDrawable.draw(localCanvas1);
            }
            if (this.k == null)
              continue;
            Iterator localIterator2 = this.k.iterator();
            if (!localIterator2.hasNext())
              continue;
            c localc = (c)localIterator2.next();
            try
            {
              localc.a(localCanvas1);
            }
            catch (Exception localException2)
            {
            }
            continue;
          }
        }
        else
        {
          m = 0;
          continue;
        }
        n = 0;
        break label789;
        if ((this.i != null) && (this.i.getVisibility() == 0))
        {
          int[] arrayOfInt1 = new int[2];
          this.i.getLocationOnScreen(arrayOfInt1);
          int i2 = this.i.getWidth();
          i3 = this.i.getHeight();
          int[] arrayOfInt2 = new int[i2 * (i3 + 0)];
          IntBuffer localIntBuffer = IntBuffer.wrap(arrayOfInt2);
          localIntBuffer.position(0);
          CountDownLatch localCountDownLatch = new CountDownLatch(1);
          this.i.queueEvent(new i(this, i2, i3, localIntBuffer, localCountDownLatch));
          localCountDownLatch.await();
          int[] arrayOfInt3 = new int[i2 * i3];
          i4 = 0;
          i5 = 0;
          break;
          if (i6 >= i2)
            break label814;
          int i7 = arrayOfInt2[(i6 + i5 * i2)];
          int i8 = 0xFF & i7 >> 16 | (0xFF0000 & i7 << 16 | i7 & 0xFF00FF00);
          arrayOfInt3[(i6 + i2 * (-1 + (i3 - i4)))] = i8;
          i6++;
          continue;
          label564: localCanvas1.drawBitmap(Bitmap.createBitmap(arrayOfInt3, i2, i3, Bitmap.Config.ARGB_8888), arrayOfInt1[0], arrayOfInt1[1], null);
        }
        this.f.setDrawingCacheEnabled(true);
        this.f.setDrawingCacheBackgroundColor(0);
        this.f.buildDrawingCache(true);
        localCanvas1.drawBitmap(this.f.getDrawingCache(), 0.0F, 0.0F, null);
        this.b.getWindow().setBackgroundDrawable(localDrawable);
        Iterator localIterator1 = localArrayList.iterator();
        if (localIterator1.hasNext())
        {
          ((View)localIterator1.next()).setVisibility(0);
          continue;
        }
      }
      catch (Exception localException1)
      {
        this.a.a(Log.getStackTraceString(localException1.getCause()), this.l);
        cancel(true);
        return;
      }
      if (this.g != null)
      {
        Bitmap localBitmap = Bitmap.createBitmap(this.g.getWidth(), this.g.getHeight(), Bitmap.Config.ARGB_8888);
        Canvas localCanvas2 = new Canvas(localBitmap);
        this.g.draw(localCanvas2);
        localCanvas1.drawBitmap(localBitmap, this.e[0], this.e[1], null);
        this.g = null;
        localBitmap.recycle();
        return;
        label789: if (m != 0)
          if (n == 0);
      }
    }
    while (true)
    {
      if (i5 >= i3)
        break label564;
      i6 = 0;
      break;
      label814: i5++;
      i4++;
    }
  }

  private void a(ViewGroup paramViewGroup, List paramList)
  {
    LinkedList localLinkedList = new LinkedList();
    int m = 0;
    if (m < paramViewGroup.getChildCount())
    {
      View localView = paramViewGroup.getChildAt(m);
      if (localView.getClass().getCanonicalName().startsWith("com.instabug.library"))
      {
        localView.setVisibility(8);
        paramList.add(localView);
      }
      while (true)
      {
        m++;
        break;
        if ((localView instanceof ViewGroup))
          localLinkedList.add((ViewGroup)localView);
      }
    }
    Iterator localIterator = localLinkedList.iterator();
    while (localIterator.hasNext())
      a((ViewGroup)localIterator.next(), paramList);
  }

  private Bitmap b()
  {
    try
    {
      Bitmap localBitmap = Bitmap.createBitmap(this.h, 0, this.d, this.h.getWidth(), this.h.getHeight() - this.d);
      return localBitmap;
    }
    catch (Exception localException)
    {
      this.l = localException;
      localException.printStackTrace();
    }
    return null;
  }

  public final void a(a parama)
  {
    this.a = parama;
  }

  protected final void onPreExecute()
  {
    super.onPreExecute();
    if (this.a == null)
      throw new IllegalStateException("OnScreenshotReady Listener cannot be null. Make sure you call setListener or pass a listener through the constructor");
    if (this.b.isFinishing())
    {
      cancel(true);
      this.a.a("Top most activity changed before capturing screenshot", this.l);
      return;
    }
    a();
  }

  public static abstract interface a
  {
    public abstract void a(Bitmap paramBitmap);

    public abstract void a(String paramString, Exception paramException);
  }
}