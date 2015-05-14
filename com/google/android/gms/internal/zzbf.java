package com.google.android.gms.internal;

import java.util.Random;

public class zzbf extends zzbl.zza
{
  private Object zznh = new Object();
  private final Random zzpl = new Random();
  private long zzpm;

  public zzbf()
  {
    zzbG();
  }

  public long getValue()
  {
    return this.zzpm;
  }

  public void zzbG()
  {
    Object localObject1 = this.zznh;
    int i = 3;
    long l = 0L;
    while (true)
    {
      i--;
      if (i > 0);
      try
      {
        l = 2147483648L + this.zzpl.nextInt();
        if ((l == this.zzpm) || (l == 0L))
          continue;
        this.zzpm = l;
        return;
      }
      finally
      {
      }
    }
  }
}