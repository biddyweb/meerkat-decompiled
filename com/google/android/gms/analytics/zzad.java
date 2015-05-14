package com.google.android.gms.analytics;

class zzad
  implements zzah
{
  private final long zzEI;
  private final int zzEJ;
  private double zzEK;
  private long zzEL;
  private final Object zzEM = new Object();
  private final String zzrc;

  public zzad(int paramInt, long paramLong, String paramString)
  {
    this.zzEJ = paramInt;
    this.zzEK = this.zzEJ;
    this.zzEI = paramLong;
    this.zzrc = paramString;
  }

  public zzad(String paramString)
  {
    this(60, 2000L, paramString);
  }

  public boolean zzgv()
  {
    synchronized (this.zzEM)
    {
      long l = System.currentTimeMillis();
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
      zzae.zzac("Excessive " + this.zzrc + " detected; call ignored.");
      return false;
    }
  }
}