package com.google.android.gms.tagmanager;

class zzcr
  implements zzcc
{
  private final long zzEI;
  private final int zzEJ;
  private double zzEK;
  private final Object zzEM = new Object();
  private long zzaAu;

  public zzcr()
  {
    this(60, 2000L);
  }

  public zzcr(int paramInt, long paramLong)
  {
    this.zzEJ = paramInt;
    this.zzEK = this.zzEJ;
    this.zzEI = paramLong;
  }

  public boolean zzgv()
  {
    synchronized (this.zzEM)
    {
      long l = System.currentTimeMillis();
      if (this.zzEK < this.zzEJ)
      {
        double d = (l - this.zzaAu) / this.zzEI;
        if (d > 0.0D)
          this.zzEK = Math.min(this.zzEJ, d + this.zzEK);
      }
      this.zzaAu = l;
      if (this.zzEK >= 1.0D)
      {
        this.zzEK -= 1.0D;
        return true;
      }
      zzbf.zzac("No more tokens available.");
      return false;
    }
  }
}