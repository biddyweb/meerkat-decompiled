package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzlv;

class zzbd
  implements zzcc
{
  private final long zzEI;
  private final int zzEJ;
  private double zzEK;
  private long zzEL;
  private final Object zzEM = new Object();
  private final long zzazf;
  private final zzlv zzmW;
  private final String zzrc;

  public zzbd(int paramInt, long paramLong1, long paramLong2, String paramString, zzlv paramzzlv)
  {
    this.zzEJ = paramInt;
    this.zzEK = this.zzEJ;
    this.zzEI = paramLong1;
    this.zzazf = paramLong2;
    this.zzrc = paramString;
    this.zzmW = paramzzlv;
  }

  public boolean zzgv()
  {
    synchronized (this.zzEM)
    {
      long l = this.zzmW.currentTimeMillis();
      if (l - this.zzEL < this.zzazf)
      {
        zzbf.zzac("Excessive " + this.zzrc + " detected; call ignored.");
        return false;
      }
      if (this.zzEK < this.zzEJ)
      {
        double d = (l - this.zzEL) / this.zzEI;
        if (d > 0.0D)
          this.zzEK = Math.min(this.zzEJ, d + this.zzEK);
      }
      this.zzEL = l;
      if (this.zzEK >= 1.0D)
      {
        this.zzEK -= 1.0D;
        return true;
      }
    }
    zzbf.zzac("Excessive " + this.zzrc + " detected; call ignored.");
    return false;
  }
}