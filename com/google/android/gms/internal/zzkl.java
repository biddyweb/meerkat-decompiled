package com.google.android.gms.internal;

import android.graphics.Canvas;
import android.graphics.Path;
import android.net.Uri;
import android.widget.ImageView;

public final class zzkl extends ImageView
{
  private Uri zzPe;
  private int zzPf;
  private int zzPg;
  private zza zzPh;
  private int zzPi;
  private float zzPj;

  protected void onDraw(Canvas paramCanvas)
  {
    if (this.zzPh != null)
      paramCanvas.clipPath(this.zzPh.zzk(getWidth(), getHeight()));
    super.onDraw(paramCanvas);
    if (this.zzPg != 0)
      paramCanvas.drawColor(this.zzPg);
  }

  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    int j;
    int i;
    switch (this.zzPi)
    {
    default:
      return;
    case 1:
      j = getMeasuredHeight();
      i = (int)(j * this.zzPj);
    case 2:
    }
    while (true)
    {
      setMeasuredDimension(i, j);
      return;
      i = getMeasuredWidth();
      j = (int)(i / this.zzPj);
    }
  }

  public void zzaE(int paramInt)
  {
    this.zzPf = paramInt;
  }

  public void zzi(Uri paramUri)
  {
    this.zzPe = paramUri;
  }

  public int zziK()
  {
    return this.zzPf;
  }

  public static abstract interface zza
  {
    public abstract Path zzk(int paramInt1, int paramInt2);
  }
}