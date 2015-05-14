package com.google.android.gms.internal;

import java.io.IOException;

public abstract interface zzop
{
  public static final class zza extends zzws<zza>
  {
    public zza[] zzale;

    public zza()
    {
      zzpf();
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zza localzza;
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
        bool3 = zzww.equals(this.zzale, localzza.zzale);
        bool2 = false;
      }
      while (!bool3);
      return zza(localzza);
    }

    public int hashCode()
    {
      return 31 * (527 + zzww.hashCode(this.zzale)) + zzvL();
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if ((this.zzale != null) && (this.zzale.length > 0))
        for (int i = 0; i < this.zzale.length; i++)
        {
          zza localzza = this.zzale[i];
          if (localzza != null)
            paramzzwr.zza(1, localzza);
        }
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if ((this.zzale != null) && (this.zzale.length > 0))
        for (int j = 0; j < this.zzale.length; j++)
        {
          zza localzza = this.zzale[j];
          if (localzza != null)
            i += zzwr.zzc(1, localzza);
        }
      return i;
    }

    public zza zzo(zzwq paramzzwq)
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
        case 10:
        }
        int j = zzxb.zzc(paramzzwq, 10);
        if (this.zzale == null);
        zza[] arrayOfzza;
        for (int k = 0; ; k = this.zzale.length)
        {
          arrayOfzza = new zza[j + k];
          if (k != 0)
            System.arraycopy(this.zzale, 0, arrayOfzza, 0, k);
          while (k < -1 + arrayOfzza.length)
          {
            arrayOfzza[k] = new zza();
            paramzzwq.zza(arrayOfzza[k]);
            paramzzwq.zzvu();
            k++;
          }
        }
        arrayOfzza[k] = new zza();
        paramzzwq.zza(arrayOfzza[k]);
        this.zzale = arrayOfzza;
      }
    }

    public zza zzpf()
    {
      this.zzale = zza.zzpg();
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }

    public static final class zza extends zzws<zza>
    {
      private static volatile zza[] zzalf;
      public int viewId;
      public String zzalg;
      public String zzalh;

      public zza()
      {
        zzph();
      }

      public static zza[] zzpg()
      {
        if (zzalf == null);
        synchronized (zzww.zzaHL)
        {
          if (zzalf == null)
            zzalf = new zza[0];
          return zzalf;
        }
      }

      public boolean equals(Object paramObject)
      {
        boolean bool2;
        if (paramObject == this)
          bool2 = true;
        zza localzza;
        label47: 
        do
        {
          String str2;
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
            if (this.zzalg != null)
              break;
            str2 = localzza.zzalg;
            bool2 = false;
          }
          while (str2 != null);
          if (this.zzalh != null)
            break label114;
          str1 = localzza.zzalh;
          bool2 = false;
        }
        while (str1 != null);
        label114: 
        while (this.zzalh.equals(localzza.zzalh))
        {
          String str1;
          int i = this.viewId;
          int j = localzza.viewId;
          bool2 = false;
          if (i != j)
            break;
          return zza(localzza);
          if (this.zzalg.equals(localzza.zzalg))
            break label47;
          return false;
        }
        return false;
      }

      public int hashCode()
      {
        int i;
        int j;
        int k;
        if (this.zzalg == null)
        {
          i = 0;
          j = 31 * (i + 527);
          String str = this.zzalh;
          k = 0;
          if (str != null)
            break label62;
        }
        while (true)
        {
          return 31 * (31 * (j + k) + this.viewId) + zzvL();
          i = this.zzalg.hashCode();
          break;
          label62: k = this.zzalh.hashCode();
        }
      }

      public void zza(zzwr paramzzwr)
        throws IOException
      {
        if (!this.zzalg.equals(""))
          paramzzwr.zzb(1, this.zzalg);
        if (!this.zzalh.equals(""))
          paramzzwr.zzb(2, this.zzalh);
        if (this.viewId != 0)
          paramzzwr.zzy(3, this.viewId);
        super.zza(paramzzwr);
      }

      protected int zzc()
      {
        int i = super.zzc();
        if (!this.zzalg.equals(""))
          i += zzwr.zzj(1, this.zzalg);
        if (!this.zzalh.equals(""))
          i += zzwr.zzj(2, this.zzalh);
        if (this.viewId != 0)
          i += zzwr.zzA(3, this.viewId);
        return i;
      }

      public zza zzp(zzwq paramzzwq)
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
          case 10:
            this.zzalg = paramzzwq.readString();
            break;
          case 18:
            this.zzalh = paramzzwq.readString();
            break;
          case 24:
          }
          this.viewId = paramzzwq.zzvx();
        }
      }

      public zza zzph()
      {
        this.zzalg = "";
        this.zzalh = "";
        this.viewId = 0;
        this.zzaHB = null;
        this.zzaHM = -1;
        return this;
      }
    }
  }

  public static final class zzb extends zzws<zzb>
  {
    private static volatile zzb[] zzali;
    public String name;
    public zzop.zzd zzalj;

    public zzb()
    {
      zzpj();
    }

    public static zzb[] zzpi()
    {
      if (zzali == null);
      synchronized (zzww.zzaHL)
      {
        if (zzali == null)
          zzali = new zzb[0];
        return zzali;
      }
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zzb localzzb;
      do
      {
        String str;
        do
        {
          boolean bool1;
          do
          {
            return bool2;
            bool1 = paramObject instanceof zzb;
            bool2 = false;
          }
          while (!bool1);
          localzzb = (zzb)paramObject;
          if (this.name != null)
            break;
          str = localzzb.name;
          bool2 = false;
        }
        while (str != null);
        if (this.zzalj != null)
          break label92;
        localzzd = localzzb.zzalj;
        bool2 = false;
      }
      while (localzzd != null);
      label92: 
      while (this.zzalj.equals(localzzb.zzalj))
      {
        zzop.zzd localzzd;
        return zza(localzzb);
        if (this.name.equals(localzzb.name))
          break;
        return false;
      }
      return false;
    }

    public int hashCode()
    {
      int i;
      int j;
      int k;
      if (this.name == null)
      {
        i = 0;
        j = 31 * (i + 527);
        zzop.zzd localzzd = this.zzalj;
        k = 0;
        if (localzzd != null)
          break label54;
      }
      while (true)
      {
        return 31 * (j + k) + zzvL();
        i = this.name.hashCode();
        break;
        label54: k = this.zzalj.hashCode();
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (!this.name.equals(""))
        paramzzwr.zzb(1, this.name);
      if (this.zzalj != null)
        paramzzwr.zza(2, this.zzalj);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if (!this.name.equals(""))
        i += zzwr.zzj(1, this.name);
      if (this.zzalj != null)
        i += zzwr.zzc(2, this.zzalj);
      return i;
    }

    public zzb zzpj()
    {
      this.name = "";
      this.zzalj = null;
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }

    public zzb zzq(zzwq paramzzwq)
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
        case 10:
          this.name = paramzzwq.readString();
          break;
        case 18:
        }
        if (this.zzalj == null)
          this.zzalj = new zzop.zzd();
        paramzzwq.zza(this.zzalj);
      }
    }
  }

  public static final class zzc extends zzws<zzc>
  {
    public String type;
    public zzop.zzb[] zzalk;

    public zzc()
    {
      zzpk();
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zzc localzzc;
      do
      {
        boolean bool1;
        do
        {
          return bool2;
          bool1 = paramObject instanceof zzc;
          bool2 = false;
        }
        while (!bool1);
        localzzc = (zzc)paramObject;
        if (this.type != null)
          break;
        str = localzzc.type;
        bool2 = false;
      }
      while (str != null);
      while (this.type.equals(localzzc.type))
      {
        String str;
        boolean bool3 = zzww.equals(this.zzalk, localzzc.zzalk);
        bool2 = false;
        if (!bool3)
          break;
        return zza(localzzc);
      }
      return false;
    }

    public int hashCode()
    {
      if (this.type == null);
      for (int i = 0; ; i = this.type.hashCode())
        return 31 * (31 * (i + 527) + zzww.hashCode(this.zzalk)) + zzvL();
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (!this.type.equals(""))
        paramzzwr.zzb(1, this.type);
      if ((this.zzalk != null) && (this.zzalk.length > 0))
        for (int i = 0; i < this.zzalk.length; i++)
        {
          zzop.zzb localzzb = this.zzalk[i];
          if (localzzb != null)
            paramzzwr.zza(2, localzzb);
        }
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if (!this.type.equals(""))
        i += zzwr.zzj(1, this.type);
      if ((this.zzalk != null) && (this.zzalk.length > 0))
      {
        int j = i;
        for (int k = 0; k < this.zzalk.length; k++)
        {
          zzop.zzb localzzb = this.zzalk[k];
          if (localzzb != null)
            j += zzwr.zzc(2, localzzb);
        }
        i = j;
      }
      return i;
    }

    public zzc zzpk()
    {
      this.type = "";
      this.zzalk = zzop.zzb.zzpi();
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }

    public zzc zzr(zzwq paramzzwq)
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
        case 10:
          this.type = paramzzwq.readString();
          break;
        case 18:
        }
        int j = zzxb.zzc(paramzzwq, 18);
        if (this.zzalk == null);
        zzop.zzb[] arrayOfzzb;
        for (int k = 0; ; k = this.zzalk.length)
        {
          arrayOfzzb = new zzop.zzb[j + k];
          if (k != 0)
            System.arraycopy(this.zzalk, 0, arrayOfzzb, 0, k);
          while (k < -1 + arrayOfzzb.length)
          {
            arrayOfzzb[k] = new zzop.zzb();
            paramzzwq.zza(arrayOfzzb[k]);
            paramzzwq.zzvu();
            k++;
          }
        }
        arrayOfzzb[k] = new zzop.zzb();
        paramzzwq.zza(arrayOfzzb[k]);
        this.zzalk = arrayOfzzb;
      }
    }
  }

  public static final class zzd extends zzws<zzd>
  {
    public String zzQN;
    public boolean zzall;
    public long zzalm;
    public double zzaln;
    public zzop.zzc zzalo;

    public zzd()
    {
      zzpl();
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zzd localzzd;
      do
      {
        boolean bool6;
        do
        {
          boolean bool5;
          do
          {
            String str;
            do
            {
              boolean bool3;
              boolean bool4;
              do
              {
                boolean bool1;
                do
                {
                  return bool2;
                  bool1 = paramObject instanceof zzd;
                  bool2 = false;
                }
                while (!bool1);
                localzzd = (zzd)paramObject;
                bool3 = this.zzall;
                bool4 = localzzd.zzall;
                bool2 = false;
              }
              while (bool3 != bool4);
              if (this.zzQN != null)
                break;
              str = localzzd.zzQN;
              bool2 = false;
            }
            while (str != null);
            bool5 = this.zzalm < localzzd.zzalm;
            bool2 = false;
          }
          while (bool5);
          bool6 = Double.doubleToLongBits(this.zzaln) < Double.doubleToLongBits(localzzd.zzaln);
          bool2 = false;
        }
        while (bool6);
        if (this.zzalo != null)
          break label158;
        localzzc = localzzd.zzalo;
        bool2 = false;
      }
      while (localzzc != null);
      label158: 
      while (this.zzalo.equals(localzzd.zzalo))
      {
        zzop.zzc localzzc;
        return zza(localzzd);
        if (this.zzQN.equals(localzzd.zzQN))
          break;
        return false;
      }
      return false;
    }

    public int hashCode()
    {
      int i;
      int k;
      label29: int n;
      int i1;
      if (this.zzall)
      {
        i = 1231;
        int j = 31 * (i + 527);
        if (this.zzQN != null)
          break label115;
        k = 0;
        int m = 31 * (k + j) + (int)(this.zzalm ^ this.zzalm >>> 32);
        long l = Double.doubleToLongBits(this.zzaln);
        n = 31 * (m * 31 + (int)(l ^ l >>> 32));
        zzop.zzc localzzc = this.zzalo;
        i1 = 0;
        if (localzzc != null)
          break label126;
      }
      while (true)
      {
        return 31 * (n + i1) + zzvL();
        i = 1237;
        break;
        label115: k = this.zzQN.hashCode();
        break label29;
        label126: i1 = this.zzalo.hashCode();
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (this.zzall)
        paramzzwr.zzb(1, this.zzall);
      if (!this.zzQN.equals(""))
        paramzzwr.zzb(2, this.zzQN);
      if (this.zzalm != 0L)
        paramzzwr.zzb(3, this.zzalm);
      if (Double.doubleToLongBits(this.zzaln) != Double.doubleToLongBits(0.0D))
        paramzzwr.zza(4, this.zzaln);
      if (this.zzalo != null)
        paramzzwr.zza(5, this.zzalo);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if (this.zzall)
        i += zzwr.zzc(1, this.zzall);
      if (!this.zzQN.equals(""))
        i += zzwr.zzj(2, this.zzQN);
      if (this.zzalm != 0L)
        i += zzwr.zzd(3, this.zzalm);
      if (Double.doubleToLongBits(this.zzaln) != Double.doubleToLongBits(0.0D))
        i += zzwr.zzb(4, this.zzaln);
      if (this.zzalo != null)
        i += zzwr.zzc(5, this.zzalo);
      return i;
    }

    public zzd zzpl()
    {
      this.zzall = false;
      this.zzQN = "";
      this.zzalm = 0L;
      this.zzaln = 0.0D;
      this.zzalo = null;
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }

    public zzd zzs(zzwq paramzzwq)
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
          this.zzall = paramzzwq.zzvy();
          break;
        case 18:
          this.zzQN = paramzzwq.readString();
          break;
        case 24:
          this.zzalm = paramzzwq.zzvw();
          break;
        case 33:
          this.zzaln = paramzzwq.readDouble();
          break;
        case 42:
        }
        if (this.zzalo == null)
          this.zzalo = new zzop.zzc();
        paramzzwq.zza(this.zzalo);
      }
    }
  }
}