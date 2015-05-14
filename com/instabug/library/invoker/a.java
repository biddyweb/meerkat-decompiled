package com.instabug.library.invoker;

import android.app.Activity;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.Resources;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.OvalShape;
import android.os.Handler;
import android.os.Looper;
import android.util.DisplayMetrics;
import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageButton;
import android.widget.ImageView.ScaleType;
import com.instabug.library.Instabug.IBGFloatingButtonEdge;

public final class a
  implements View.OnClickListener
{
  int a;
  int b = 0;
  private FrameLayout.LayoutParams c;
  private int d;
  private int e;
  private e f;
  private b g;
  private c h;
  private int i;
  private d j;

  public a(e parame)
  {
    this.f = parame;
  }

  public final void a()
  {
    this.h.setOnClickListener(null);
    if ((this.h != null) && (this.h.getParent() != null) && ((this.h.getParent() instanceof ViewGroup)))
      ((ViewGroup)this.h.getParent()).removeView(this.h);
  }

  public final void a(Activity paramActivity)
  {
    this.h = new c(paramActivity);
    if (this.j == null)
      this.j = new d();
    float f1 = paramActivity.getResources().getDisplayMetrics().density;
    this.e = paramActivity.getResources().getDisplayMetrics().heightPixels;
    this.d = paramActivity.getResources().getDisplayMetrics().widthPixels;
    this.i = ((int)(f1 * 50.0F));
    this.g = new b(paramActivity);
    ShapeDrawable localShapeDrawable1 = new ShapeDrawable(new OvalShape());
    localShapeDrawable1.getPaint().setColor(this.j.b);
    ShapeDrawable localShapeDrawable2 = new ShapeDrawable(new OvalShape());
    localShapeDrawable2.getPaint().setColor(this.j.a);
    localShapeDrawable2.setShaderFactory(new b(this));
    LayerDrawable localLayerDrawable = new LayerDrawable(new Drawable[] { localShapeDrawable2, localShapeDrawable1 });
    localLayerDrawable.setLayerInset(0, 0, 0, 0, 0);
    localLayerDrawable.setLayerInset(1, 2, 2, 2, 2);
    this.g.setBackgroundDrawable(localLayerDrawable);
    Drawable localDrawable = paramActivity.getResources().getDrawable(paramActivity.getResources().getIdentifier("instabug_logo", "drawable", paramActivity.getApplicationInfo().packageName));
    localDrawable.setColorFilter(new PorterDuffColorFilter(this.j.a, PorterDuff.Mode.SRC_IN));
    this.g.setImageDrawable(localDrawable);
    if (this.c == null)
      if (this.j.c == Instabug.IBGFloatingButtonEdge.Left)
      {
        this.c = new FrameLayout.LayoutParams(this.i, this.i, 51);
        this.g.setLayoutParams(this.c);
        this.g.a(-10, this.j.d);
      }
    while (true)
    {
      this.g.setOnClickListener(this);
      this.g.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
      this.h.addView(this.g);
      paramActivity.getWindow().addContentView(this.h, new ViewGroup.LayoutParams(-1, -1));
      return;
      this.c = new FrameLayout.LayoutParams(this.i, this.i, 53);
      this.g.setLayoutParams(this.c);
      this.g.a(10 + this.d, this.j.d);
      continue;
      this.g.setLayoutParams(this.c);
    }
  }

  public final void a(d paramd)
  {
    this.j = paramd;
  }

  public final void onClick(View paramView)
  {
    if (this.f != null)
      this.f.w();
  }

  static final class a extends GestureDetector.SimpleOnGestureListener
  {
    public final boolean onFling(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
    {
      return (Math.abs(paramMotionEvent2.getX() - paramMotionEvent1.getX()) < 50.0F) && (paramMotionEvent2.getY() - paramMotionEvent1.getY() > 50.0F);
    }
  }

  public final class b extends ImageButton
  {
    private GestureDetector b;
    private boolean c = true;
    private a d;
    private long e;
    private float f;
    private float g;
    private boolean h = false;

    public b(Context arg2)
    {
      super();
      this.b = new GestureDetector(localContext, new a.a());
      this.d = new a((byte)0);
    }

    private void a()
    {
      if (a.a(a.this).c == Instabug.IBGFloatingButtonEdge.Left)
      {
        float f3;
        a locala2;
        if (a.this.a >= a.b(a.this) / 2.0F)
        {
          f3 = 10 + (a.b(a.this) - a.c(a.this));
          locala2 = this.d;
          if (a.this.b <= a.d(a.this) - a.c(a.this))
            break label127;
        }
        label127: for (float f4 = a.d(a.this) - (a.c(a.this) << 1); ; f4 = a.this.b)
        {
          a.a(locala2, f3, f4);
          return;
          f3 = -10.0F;
          break;
        }
      }
      float f1;
      a locala1;
      if (a.this.a >= a.b(a.this) / 2.0F)
      {
        f1 = 10 + a.b(a.this);
        locala1 = this.d;
        if (a.this.b <= a.d(a.this) - a.c(a.this))
          break label245;
      }
      label245: for (float f2 = a.d(a.this) - (a.c(a.this) << 1); ; f2 = a.this.b)
      {
        a.a(locala1, f1, f2);
        return;
        f1 = -10 + a.c(a.this);
        break;
      }
    }

    final void a(int paramInt1, int paramInt2)
    {
      a.this.a = paramInt1;
      a.this.b = paramInt2;
      a.e(a.this).leftMargin = (0 + a.this.a);
      a.e(a.this).rightMargin = (a.b(a.this) - a.this.a);
      a.e(a.this).topMargin = (0 + a.this.b);
      a.e(a.this).bottomMargin = (a.d(a.this) - a.this.b);
      setLayoutParams(a.e(a.this));
    }

    public final boolean onTouchEvent(MotionEvent paramMotionEvent)
    {
      if (this.c);
      for (boolean bool = this.b.onTouchEvent(paramMotionEvent); ; bool = false)
      {
        if (bool)
        {
          a();
          return true;
        }
        float f1 = paramMotionEvent.getRawX();
        float f2 = paramMotionEvent.getRawY();
        int i = paramMotionEvent.getAction();
        if (i == 0)
        {
          this.e = System.currentTimeMillis();
          a.a(this.d);
          this.h = true;
        }
        while (true)
        {
          this.f = f1;
          this.g = f2;
          return true;
          if (i == 1)
          {
            if (System.currentTimeMillis() - this.e < 200L)
              performClick();
            this.h = false;
            a();
          }
          else if ((i == 2) && (this.h))
          {
            float f3 = f1 - this.f;
            float f4 = f2 - this.g;
            a((int)(f3 + a.this.a), (int)(f4 + a.this.b));
            if ((this.c) && (!this.h) && (Math.abs(a.e(a.this).rightMargin) < 50) && (Math.abs(a.e(a.this).topMargin - getContext().getResources().getDisplayMetrics().heightPixels / 2) < 250))
              a();
          }
        }
      }
    }

    public final void setLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
    {
      a.a(a.this, (FrameLayout.LayoutParams)paramLayoutParams);
      super.setLayoutParams(paramLayoutParams);
    }

    final class a
      implements Runnable
    {
      private Handler a = new Handler(Looper.getMainLooper());
      private float b;
      private float c;
      private long d;

      private a()
      {
      }

      public final void run()
      {
        if ((a.b.this != null) && (a.b.this.getParent() != null))
        {
          float f1 = Math.min(1.0F, (float)(System.currentTimeMillis() - this.d) / 400.0F);
          float f2 = f1 * (this.b - a.this.a);
          float f3 = f1 * (this.c - a.this.b);
          a.b.this.a((int)(f2 + a.this.a), (int)(f3 + a.this.b));
          if (f1 < 1.0F)
            this.a.post(this);
        }
      }
    }
  }

  public static final class c extends FrameLayout
  {
    public c(Context paramContext)
    {
      super();
    }
  }

  public static final class d
  {
    public int a = -16776961;
    public int b = -1;
    public Instabug.IBGFloatingButtonEdge c = Instabug.IBGFloatingButtonEdge.Right;
    public int d = 50;
  }

  public static abstract interface e
  {
    public abstract void w();
  }
}