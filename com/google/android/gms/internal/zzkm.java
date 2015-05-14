package com.google.android.gms.internal;

import android.graphics.drawable.Drawable;
import com.google.android.gms.common.internal.zzw;

public final class zzkm extends zzkv<zza, Drawable>
{
  public zzkm()
  {
    super(10);
  }

  public static final class zza
  {
    public final int zzPk;
    public final int zzPl;

    public zza(int paramInt1, int paramInt2)
    {
      this.zzPk = paramInt1;
      this.zzPl = paramInt2;
    }

    public boolean equals(Object paramObject)
    {
      boolean bool = true;
      if (!(paramObject instanceof zza))
        bool = false;
      zza localzza;
      do
      {
        do
          return bool;
        while (this == paramObject);
        localzza = (zza)paramObject;
      }
      while ((localzza.zzPk == this.zzPk) && (localzza.zzPl == this.zzPl));
      return false;
    }

    public int hashCode()
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = Integer.valueOf(this.zzPk);
      arrayOfObject[1] = Integer.valueOf(this.zzPl);
      return zzw.hashCode(arrayOfObject);
    }
  }
}