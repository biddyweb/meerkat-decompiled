package com.google.android.gms.internal;

import java.io.IOException;

public abstract interface zzxe
{
  public static final class zza extends zzwy
  {
    public String description;
    public String name;
    public Long zzaIL;
    public Long zzaIM;
    public Long zzaIN;
    public Integer zzaIO;
    public zzxc.zza zzaIe;
    public String zzfl;

    public zza()
    {
      zzwn();
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      zza localzza;
      do
      {
        do
        {
          return true;
          if (!(paramObject instanceof zza))
            return false;
          localzza = (zza)paramObject;
          if (this.zzfl == null)
          {
            if (localzza.zzfl != null)
              return false;
          }
          else if (!this.zzfl.equals(localzza.zzfl))
            return false;
          if (this.name == null)
          {
            if (localzza.name != null)
              return false;
          }
          else if (!this.name.equals(localzza.name))
            return false;
          if (this.description == null)
          {
            if (localzza.description != null)
              return false;
          }
          else if (!this.description.equals(localzza.description))
            return false;
          if (this.zzaIL == null)
          {
            if (localzza.zzaIL != null)
              return false;
          }
          else if (!this.zzaIL.equals(localzza.zzaIL))
            return false;
          if (this.zzaIM == null)
          {
            if (localzza.zzaIM != null)
              return false;
          }
          else if (!this.zzaIM.equals(localzza.zzaIM))
            return false;
          if (this.zzaIN == null)
          {
            if (localzza.zzaIN != null)
              return false;
          }
          else if (!this.zzaIN.equals(localzza.zzaIN))
            return false;
          if (this.zzaIe == null)
          {
            if (localzza.zzaIe != null)
              return false;
          }
          else if (!this.zzaIe.equals(localzza.zzaIe))
            return false;
          if (this.zzaIO != null)
            break;
        }
        while (localzza.zzaIO == null);
        return false;
      }
      while (this.zzaIO.equals(localzza.zzaIO));
      return false;
    }

    public int hashCode()
    {
      int i;
      int k;
      label27: int n;
      label45: int i2;
      label65: int i4;
      label85: int i6;
      label105: int i8;
      label125: int i9;
      int i10;
      if (this.zzfl == null)
      {
        i = 0;
        int j = 31 * (i + 527);
        if (this.name != null)
          break label166;
        k = 0;
        int m = 31 * (k + j);
        if (this.description != null)
          break label177;
        n = 0;
        int i1 = 31 * (n + m);
        if (this.zzaIL != null)
          break label189;
        i2 = 0;
        int i3 = 31 * (i2 + i1);
        if (this.zzaIM != null)
          break label201;
        i4 = 0;
        int i5 = 31 * (i4 + i3);
        if (this.zzaIN != null)
          break label213;
        i6 = 0;
        int i7 = 31 * (i6 + i5);
        if (this.zzaIe != null)
          break label225;
        i8 = 0;
        i9 = 31 * (i8 + i7);
        Integer localInteger = this.zzaIO;
        i10 = 0;
        if (localInteger != null)
          break label237;
      }
      while (true)
      {
        return i9 + i10;
        i = this.zzfl.hashCode();
        break;
        label166: k = this.name.hashCode();
        break label27;
        label177: n = this.description.hashCode();
        break label45;
        label189: i2 = this.zzaIL.hashCode();
        break label65;
        label201: i4 = this.zzaIM.hashCode();
        break label85;
        label213: i6 = this.zzaIN.hashCode();
        break label105;
        label225: i8 = this.zzaIe.hashCode();
        break label125;
        label237: i10 = this.zzaIO.hashCode();
      }
    }

    public zza zzJ(zzwq paramzzwq)
      throws IOException
    {
      while (true)
      {
        int i = paramzzwq.zzvu();
        switch (i)
        {
        default:
          if (zzxb.zzb(paramzzwq, i))
            continue;
        case 0:
          return this;
        case 10:
          this.zzfl = paramzzwq.readString();
          break;
        case 18:
          this.name = paramzzwq.readString();
          break;
        case 26:
          this.description = paramzzwq.readString();
          break;
        case 32:
          this.zzaIL = Long.valueOf(paramzzwq.zzvw());
          break;
        case 40:
          this.zzaIM = Long.valueOf(paramzzwq.zzvw());
          break;
        case 64:
          this.zzaIN = Long.valueOf(paramzzwq.zzvw());
          break;
        case 74:
          if (this.zzaIe == null)
            this.zzaIe = new zzxc.zza();
          paramzzwq.zza(this.zzaIe);
          break;
        case 80:
        }
        this.zzaIO = Integer.valueOf(paramzzwq.zzvx());
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (this.zzfl != null)
        paramzzwr.zzb(1, this.zzfl);
      if (this.name != null)
        paramzzwr.zzb(2, this.name);
      if (this.description != null)
        paramzzwr.zzb(3, this.description);
      if (this.zzaIL != null)
        paramzzwr.zzb(4, this.zzaIL.longValue());
      if (this.zzaIM != null)
        paramzzwr.zzb(5, this.zzaIM.longValue());
      if (this.zzaIN != null)
        paramzzwr.zzb(8, this.zzaIN.longValue());
      if (this.zzaIe != null)
        paramzzwr.zza(9, this.zzaIe);
      if (this.zzaIO != null)
        paramzzwr.zzy(10, this.zzaIO.intValue());
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if (this.zzfl != null)
        i += zzwr.zzj(1, this.zzfl);
      if (this.name != null)
        i += zzwr.zzj(2, this.name);
      if (this.description != null)
        i += zzwr.zzj(3, this.description);
      if (this.zzaIL != null)
        i += zzwr.zzd(4, this.zzaIL.longValue());
      if (this.zzaIM != null)
        i += zzwr.zzd(5, this.zzaIM.longValue());
      if (this.zzaIN != null)
        i += zzwr.zzd(8, this.zzaIN.longValue());
      if (this.zzaIe != null)
        i += zzwr.zzc(9, this.zzaIe);
      if (this.zzaIO != null)
        i += zzwr.zzA(10, this.zzaIO.intValue());
      return i;
    }

    public zza zzwn()
    {
      this.zzfl = null;
      this.name = null;
      this.description = null;
      this.zzaIL = null;
      this.zzaIM = null;
      this.zzaIN = null;
      this.zzaIe = null;
      this.zzaIO = null;
      this.zzaHM = -1;
      return this;
    }
  }
}