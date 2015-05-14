package com.google.android.gms.internal;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.Callback;
import android.graphics.drawable.Drawable.ConstantState;
import android.os.SystemClock;

public final class zzkj extends Drawable
  implements Drawable.Callback
{
  private int mFrom;
  private boolean zzOF = true;
  private int zzOM = 0;
  private long zzON;
  private int zzOO;
  private int zzOP = 255;
  private int zzOQ;
  private int zzOR = 0;
  private boolean zzOS;
  private zzb zzOT;
  private Drawable zzOU;
  private Drawable zzOV;
  private boolean zzOW;
  private boolean zzOX;
  private boolean zzOY;
  private int zzOZ;

  public zzkj(Drawable paramDrawable1, Drawable paramDrawable2)
  {
    this(null);
    if (paramDrawable1 == null)
      paramDrawable1 = zza.zziJ();
    this.zzOU = paramDrawable1;
    paramDrawable1.setCallback(this);
    zzb localzzb1 = this.zzOT;
    localzzb1.zzPd |= paramDrawable1.getChangingConfigurations();
    if (paramDrawable2 == null)
      paramDrawable2 = zza.zziJ();
    this.zzOV = paramDrawable2;
    paramDrawable2.setCallback(this);
    zzb localzzb2 = this.zzOT;
    localzzb2.zzPd |= paramDrawable2.getChangingConfigurations();
  }

  zzkj(zzb paramzzb)
  {
    this.zzOT = new zzb(paramzzb);
  }

  public boolean canConstantState()
  {
    if (!this.zzOW)
      if ((this.zzOU.getConstantState() == null) || (this.zzOV.getConstantState() == null))
        break label44;
    label44: for (boolean bool = true; ; bool = false)
    {
      this.zzOX = bool;
      this.zzOW = true;
      return this.zzOX;
    }
  }

  public void draw(Canvas paramCanvas)
  {
    int i = 1;
    switch (this.zzOM)
    {
    default:
    case 1:
    case 2:
    }
    int k;
    boolean bool;
    Drawable localDrawable1;
    Drawable localDrawable2;
    do
      for (int j = i; ; j = 0)
      {
        k = this.zzOR;
        bool = this.zzOF;
        localDrawable1 = this.zzOU;
        localDrawable2 = this.zzOV;
        if (j == 0)
          break;
        if ((!bool) || (k == 0))
          localDrawable1.draw(paramCanvas);
        if (k == this.zzOP)
        {
          localDrawable2.setAlpha(this.zzOP);
          localDrawable2.draw(paramCanvas);
        }
        return;
        this.zzON = SystemClock.uptimeMillis();
        this.zzOM = 2;
      }
    while (this.zzON < 0L);
    float f1 = (float)(SystemClock.uptimeMillis() - this.zzON) / this.zzOQ;
    if (f1 >= 1.0F);
    while (true)
    {
      if (i != 0)
        this.zzOM = 0;
      float f2 = Math.min(f1, 1.0F);
      this.zzOR = ((int)(this.mFrom + f2 * (this.zzOO - this.mFrom)));
      break;
      i = 0;
    }
    if (bool)
      localDrawable1.setAlpha(this.zzOP - k);
    localDrawable1.draw(paramCanvas);
    if (bool)
      localDrawable1.setAlpha(this.zzOP);
    if (k > 0)
    {
      localDrawable2.setAlpha(k);
      localDrawable2.draw(paramCanvas);
      localDrawable2.setAlpha(this.zzOP);
    }
    invalidateSelf();
  }

  public int getChangingConfigurations()
  {
    return super.getChangingConfigurations() | this.zzOT.zzPc | this.zzOT.zzPd;
  }

  public Drawable.ConstantState getConstantState()
  {
    if (canConstantState())
    {
      this.zzOT.zzPc = getChangingConfigurations();
      return this.zzOT;
    }
    return null;
  }

  public int getIntrinsicHeight()
  {
    return Math.max(this.zzOU.getIntrinsicHeight(), this.zzOV.getIntrinsicHeight());
  }

  public int getIntrinsicWidth()
  {
    return Math.max(this.zzOU.getIntrinsicWidth(), this.zzOV.getIntrinsicWidth());
  }

  public int getOpacity()
  {
    if (!this.zzOY)
    {
      this.zzOZ = Drawable.resolveOpacity(this.zzOU.getOpacity(), this.zzOV.getOpacity());
      this.zzOY = true;
    }
    return this.zzOZ;
  }

  public void invalidateDrawable(Drawable paramDrawable)
  {
    if (zzme.zzkd())
    {
      Drawable.Callback localCallback = getCallback();
      if (localCallback != null)
        localCallback.invalidateDrawable(this);
    }
  }

  public Drawable mutate()
  {
    if ((!this.zzOS) && (super.mutate() == this))
    {
      if (!canConstantState())
        throw new IllegalStateException("One or more children of this LayerDrawable does not have constant state; this drawable cannot be mutated.");
      this.zzOU.mutate();
      this.zzOV.mutate();
      this.zzOS = true;
    }
    return this;
  }

  protected void onBoundsChange(Rect paramRect)
  {
    this.zzOU.setBounds(paramRect);
    this.zzOV.setBounds(paramRect);
  }

  public void scheduleDrawable(Drawable paramDrawable, Runnable paramRunnable, long paramLong)
  {
    if (zzme.zzkd())
    {
      Drawable.Callback localCallback = getCallback();
      if (localCallback != null)
        localCallback.scheduleDrawable(this, paramRunnable, paramLong);
    }
  }

  public void setAlpha(int paramInt)
  {
    if (this.zzOR == this.zzOP)
      this.zzOR = paramInt;
    this.zzOP = paramInt;
    invalidateSelf();
  }

  public void setColorFilter(ColorFilter paramColorFilter)
  {
    this.zzOU.setColorFilter(paramColorFilter);
    this.zzOV.setColorFilter(paramColorFilter);
  }

  public void startTransition(int paramInt)
  {
    this.mFrom = 0;
    this.zzOO = this.zzOP;
    this.zzOR = 0;
    this.zzOQ = paramInt;
    this.zzOM = 1;
    invalidateSelf();
  }

  public void unscheduleDrawable(Drawable paramDrawable, Runnable paramRunnable)
  {
    if (zzme.zzkd())
    {
      Drawable.Callback localCallback = getCallback();
      if (localCallback != null)
        localCallback.unscheduleDrawable(this, paramRunnable);
    }
  }

  public Drawable zziI()
  {
    return this.zzOV;
  }

  private static final class zza extends Drawable
  {
    private static final zza zzPa = new zza();
    private static final zza zzPb = new zza(null);

    public void draw(Canvas paramCanvas)
    {
    }

    public Drawable.ConstantState getConstantState()
    {
      return zzPb;
    }

    public int getOpacity()
    {
      return -2;
    }

    public void setAlpha(int paramInt)
    {
    }

    public void setColorFilter(ColorFilter paramColorFilter)
    {
    }

    private static final class zza extends Drawable.ConstantState
    {
      public int getChangingConfigurations()
      {
        return 0;
      }

      public Drawable newDrawable()
      {
        return zzkj.zza.zziJ();
      }
    }
  }

  static final class zzb extends Drawable.ConstantState
  {
    int zzPc;
    int zzPd;

    zzb(zzb paramzzb)
    {
      if (paramzzb != null)
      {
        this.zzPc = paramzzb.zzPc;
        this.zzPd = paramzzb.zzPd;
      }
    }

    public int getChangingConfigurations()
    {
      return this.zzPc;
    }

    public Drawable newDrawable()
    {
      return new zzkj(this);
    }
  }
}