package com.instabug.library.internal.view;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.util.AttributeSet;
import android.widget.ImageView;

public class AnimatedImageView extends ImageView
  implements Runnable
{
  private a[] a;
  private Drawable b = null;
  private final Handler c = new Handler();
  private boolean d = false;
  private Thread e;
  private final Runnable f = new a(this);

  public AnimatedImageView(Context paramContext)
  {
    super(paramContext);
  }

  public AnimatedImageView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }

  private boolean c()
  {
    return (this.d) && (this.a != null) && (this.e == null);
  }

  public final void a()
  {
    this.d = true;
    if (c())
    {
      this.e = new Thread(this);
      this.e.start();
    }
  }

  public final void a(a[] paramArrayOfa)
  {
    this.a = paramArrayOfa;
    try
    {
      this.b = getResources().getDrawable(paramArrayOfa[0].a);
      if (c())
      {
        this.e = new Thread(this);
        this.e.start();
      }
      return;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
      this.a = null;
    }
  }

  public final void b()
  {
    this.d = false;
    if (this.e != null)
    {
      this.e.interrupt();
      this.e = null;
    }
  }

  public void run()
  {
    int i = this.a.length;
    while (true)
    {
      int j = 0;
      label8: if (j < i)
      {
        Drawable localDrawable = this.b;
        this.b = getResources().getDrawable(this.a[j].a);
        if (localDrawable != null)
          localDrawable.setCallback(null);
        this.c.post(this.f);
      }
      try
      {
        Thread.sleep(this.a[j].b);
        label72: j++;
        break label8;
        if (this.d)
          continue;
        return;
      }
      catch (InterruptedException localInterruptedException)
      {
        break label72;
      }
    }
  }

  public static final class a
  {
    public int a;
    public int b;

    public a(int paramInt1, int paramInt2)
    {
      this.b = paramInt2;
      this.a = paramInt1;
    }
  }
}