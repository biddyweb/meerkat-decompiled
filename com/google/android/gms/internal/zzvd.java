package com.google.android.gms.internal;

import java.io.IOException;

public abstract interface zzvd
{
  public static final class zza extends zzws<zza>
  {
    public long zzaBK;
    public zzc.zzj zzaBL;
    public zzc.zzf zzgs;

    public zza()
    {
      zzug();
    }

    public static zza zzm(byte[] paramArrayOfByte)
      throws zzwx
    {
      return (zza)zzwy.zza(new zza(), paramArrayOfByte);
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zza localzza;
      do
      {
        zzc.zzf localzzf;
        do
        {
          boolean bool3;
          do
          {
            boolean bool1;
            do
            {
              return bool2;
              bool1 = paramObject instanceof zza;
              bool2 = false;
            }
            while (!bool1);
            localzza = (zza)paramObject;
            bool3 = this.zzaBK < localzza.zzaBK;
            bool2 = false;
          }
          while (bool3);
          if (this.zzgs != null)
            break;
          localzzf = localzza.zzgs;
          bool2 = false;
        }
        while (localzzf != null);
        if (this.zzaBL != null)
          break label111;
        localzzj = localzza.zzaBL;
        bool2 = false;
      }
      while (localzzj != null);
      label111: 
      while (this.zzaBL.equals(localzza.zzaBL))
      {
        zzc.zzj localzzj;
        return zza(localzza);
        if (this.zzgs.equals(localzza.zzgs))
          break;
        return false;
      }
      return false;
    }

    public int hashCode()
    {
      int i = 31 * (527 + (int)(this.zzaBK ^ this.zzaBK >>> 32));
      int j;
      int k;
      int m;
      if (this.zzgs == null)
      {
        j = 0;
        k = 31 * (j + i);
        zzc.zzj localzzj = this.zzaBL;
        m = 0;
        if (localzzj != null)
          break label75;
      }
      while (true)
      {
        return 31 * (k + m) + zzvL();
        j = this.zzgs.hashCode();
        break;
        label75: m = this.zzaBL.hashCode();
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      paramzzwr.zzb(1, this.zzaBK);
      if (this.zzgs != null)
        paramzzwr.zza(2, this.zzgs);
      if (this.zzaBL != null)
        paramzzwr.zza(3, this.zzaBL);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc() + zzwr.zzd(1, this.zzaBK);
      if (this.zzgs != null)
        i += zzwr.zzc(2, this.zzgs);
      if (this.zzaBL != null)
        i += zzwr.zzc(3, this.zzaBL);
      return i;
    }

    public zza zzt(zzwq paramzzwq)
      throws IOException
    {
      while (true)
      {
        int i = paramzzwq.zzvu();
        switch (i)
        {
        default:
          if (zza(paramzzwq, i))
            continue;
        case 0:
          return this;
        case 8:
          this.zzaBK = paramzzwq.zzvw();
          break;
        case 18:
          if (this.zzgs == null)
            this.zzgs = new zzc.zzf();
          paramzzwq.zza(this.zzgs);
          break;
        case 26:
        }
        if (this.zzaBL == null)
          this.zzaBL = new zzc.zzj();
        paramzzwq.zza(this.zzaBL);
      }
    }

    public zza zzug()
    {
      this.zzaBK = 0L;
      this.zzgs = null;
      this.zzaBL = null;
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }
  }
}