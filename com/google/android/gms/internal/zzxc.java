package com.google.android.gms.internal;

import java.io.IOException;

public abstract interface zzxc
{
  public static final class zza extends zzwy
  {
    public String name;
    public String packageName;
    public String version;
    public String zzaHW;
    public long[] zzaHX;

    public zza()
    {
      zzvZ();
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
          if (this.packageName == null)
          {
            if (localzza.packageName != null)
              return false;
          }
          else if (!this.packageName.equals(localzza.packageName))
            return false;
          if (this.version == null)
          {
            if (localzza.version != null)
              return false;
          }
          else if (!this.version.equals(localzza.version))
            return false;
          if (this.zzaHW == null)
          {
            if (localzza.zzaHW != null)
              return false;
          }
          else if (!this.zzaHW.equals(localzza.zzaHW))
            return false;
          if (!zzww.equals(this.zzaHX, localzza.zzaHX))
            return false;
          if (this.name != null)
            break;
        }
        while (localzza.name == null);
        return false;
      }
      while (this.name.equals(localzza.name));
      return false;
    }

    public int hashCode()
    {
      int i;
      int k;
      label27: int n;
      label45: int i1;
      int i2;
      if (this.packageName == null)
      {
        i = 0;
        int j = 31 * (i + 527);
        if (this.version != null)
          break label97;
        k = 0;
        int m = 31 * (k + j);
        if (this.zzaHW != null)
          break label108;
        n = 0;
        i1 = 31 * (31 * (n + m) + zzww.hashCode(this.zzaHX));
        String str = this.name;
        i2 = 0;
        if (str != null)
          break label120;
      }
      while (true)
      {
        return i1 + i2;
        i = this.packageName.hashCode();
        break;
        label97: k = this.version.hashCode();
        break label27;
        label108: n = this.zzaHW.hashCode();
        break label45;
        label120: i2 = this.name.hashCode();
      }
    }

    public zza zzA(zzwq paramzzwq)
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
          this.packageName = paramzzwq.readString();
          break;
        case 18:
          this.version = paramzzwq.readString();
          break;
        case 26:
          this.zzaHW = paramzzwq.readString();
          break;
        case 32:
          int i1 = zzxb.zzc(paramzzwq, 32);
          if (this.zzaHX == null);
          long[] arrayOfLong2;
          for (int i2 = 0; ; i2 = this.zzaHX.length)
          {
            arrayOfLong2 = new long[i1 + i2];
            if (i2 != 0)
              System.arraycopy(this.zzaHX, 0, arrayOfLong2, 0, i2);
            while (i2 < -1 + arrayOfLong2.length)
            {
              arrayOfLong2[i2] = paramzzwq.zzvw();
              paramzzwq.zzvu();
              i2++;
            }
          }
          arrayOfLong2[i2] = paramzzwq.zzvw();
          this.zzaHX = arrayOfLong2;
          break;
        case 34:
          int j = paramzzwq.zzip(paramzzwq.zzvB());
          int k = paramzzwq.getPosition();
          for (int m = 0; paramzzwq.zzvG() > 0; m++)
            paramzzwq.zzvw();
          paramzzwq.zzir(k);
          if (this.zzaHX == null);
          long[] arrayOfLong1;
          for (int n = 0; ; n = this.zzaHX.length)
          {
            arrayOfLong1 = new long[m + n];
            if (n != 0)
              System.arraycopy(this.zzaHX, 0, arrayOfLong1, 0, n);
            while (n < arrayOfLong1.length)
            {
              arrayOfLong1[n] = paramzzwq.zzvw();
              n++;
            }
          }
          this.zzaHX = arrayOfLong1;
          paramzzwq.zziq(j);
          break;
        case 42:
        }
        this.name = paramzzwq.readString();
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (this.packageName != null)
        paramzzwr.zzb(1, this.packageName);
      if (this.version != null)
        paramzzwr.zzb(2, this.version);
      if (this.zzaHW != null)
        paramzzwr.zzb(3, this.zzaHW);
      if ((this.zzaHX != null) && (this.zzaHX.length > 0))
        for (int i = 0; i < this.zzaHX.length; i++)
          paramzzwr.zzb(4, this.zzaHX[i]);
      if (this.name != null)
        paramzzwr.zzb(5, this.name);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = 0;
      int j = super.zzc();
      if (this.packageName != null)
        j += zzwr.zzj(1, this.packageName);
      if (this.version != null)
        j += zzwr.zzj(2, this.version);
      if (this.zzaHW != null)
        j += zzwr.zzj(3, this.zzaHW);
      if ((this.zzaHX != null) && (this.zzaHX.length > 0))
      {
        int k = 0;
        while (i < this.zzaHX.length)
        {
          k += zzwr.zzN(this.zzaHX[i]);
          i++;
        }
        j = j + k + 1 * this.zzaHX.length;
      }
      if (this.name != null)
        j += zzwr.zzj(5, this.name);
      return j;
    }

    public zza zzvZ()
    {
      this.packageName = null;
      this.version = null;
      this.zzaHW = null;
      this.zzaHX = zzxb.zzaHP;
      this.name = null;
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zzb extends zzwy
  {
    private static volatile zzb[] zzaHY;
    public String name;
    public String zzaHZ;
    public String zzaIa;
    public Integer zzaIb;
    public zzxc.zzc zzaIc;
    public zzxc.zze zzaId;
    public zzxc.zza zzaIe;

    public zzb()
    {
      zzwb();
    }

    public static zzb[] zzwa()
    {
      if (zzaHY == null);
      synchronized (zzww.zzaHL)
      {
        if (zzaHY == null)
          zzaHY = new zzb[0];
        return zzaHY;
      }
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      zzb localzzb;
      do
      {
        do
        {
          return true;
          if (!(paramObject instanceof zzb))
            return false;
          localzzb = (zzb)paramObject;
          if (this.zzaHZ == null)
          {
            if (localzzb.zzaHZ != null)
              return false;
          }
          else if (!this.zzaHZ.equals(localzzb.zzaHZ))
            return false;
          if (this.name == null)
          {
            if (localzzb.name != null)
              return false;
          }
          else if (!this.name.equals(localzzb.name))
            return false;
          if (this.zzaIa == null)
          {
            if (localzzb.zzaIa != null)
              return false;
          }
          else if (!this.zzaIa.equals(localzzb.zzaIa))
            return false;
          if (this.zzaIb == null)
          {
            if (localzzb.zzaIb != null)
              return false;
          }
          else if (!this.zzaIb.equals(localzzb.zzaIb))
            return false;
          if (this.zzaIc == null)
          {
            if (localzzb.zzaIc != null)
              return false;
          }
          else if (!this.zzaIc.equals(localzzb.zzaIc))
            return false;
          if (this.zzaId == null)
          {
            if (localzzb.zzaId != null)
              return false;
          }
          else if (!this.zzaId.equals(localzzb.zzaId))
            return false;
          if (this.zzaIe != null)
            break;
        }
        while (localzzb.zzaIe == null);
        return false;
      }
      while (this.zzaIe.equals(localzzb.zzaIe));
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
      label105: int i7;
      int i8;
      if (this.zzaHZ == null)
      {
        i = 0;
        int j = 31 * (i + 527);
        if (this.name != null)
          break label146;
        k = 0;
        int m = 31 * (k + j);
        if (this.zzaIa != null)
          break label157;
        n = 0;
        int i1 = 31 * (n + m);
        if (this.zzaIb != null)
          break label169;
        i2 = 0;
        int i3 = 31 * (i2 + i1);
        if (this.zzaIc != null)
          break label181;
        i4 = 0;
        int i5 = 31 * (i4 + i3);
        if (this.zzaId != null)
          break label193;
        i6 = 0;
        i7 = 31 * (i6 + i5);
        zzxc.zza localzza = this.zzaIe;
        i8 = 0;
        if (localzza != null)
          break label205;
      }
      while (true)
      {
        return i7 + i8;
        i = this.zzaHZ.hashCode();
        break;
        label146: k = this.name.hashCode();
        break label27;
        label157: n = this.zzaIa.hashCode();
        break label45;
        label169: i2 = this.zzaIb.intValue();
        break label65;
        label181: i4 = this.zzaIc.hashCode();
        break label85;
        label193: i6 = this.zzaId.hashCode();
        break label105;
        label205: i8 = this.zzaIe.hashCode();
      }
    }

    public zzb zzB(zzwq paramzzwq)
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
          this.zzaHZ = paramzzwq.readString();
          break;
        case 34:
          this.name = paramzzwq.readString();
          break;
        case 42:
          this.zzaIa = paramzzwq.readString();
          break;
        case 48:
          int j = paramzzwq.zzvx();
          switch (j)
          {
          default:
            break;
          case 0:
          case 1:
          }
          this.zzaIb = Integer.valueOf(j);
          break;
        case 58:
          if (this.zzaIc == null)
            this.zzaIc = new zzxc.zzc();
          paramzzwq.zza(this.zzaIc);
          break;
        case 66:
          if (this.zzaId == null)
            this.zzaId = new zzxc.zze();
          paramzzwq.zza(this.zzaId);
          break;
        case 74:
        }
        if (this.zzaIe == null)
          this.zzaIe = new zzxc.zza();
        paramzzwq.zza(this.zzaIe);
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (this.zzaHZ != null)
        paramzzwr.zzb(1, this.zzaHZ);
      if (this.name != null)
        paramzzwr.zzb(4, this.name);
      if (this.zzaIa != null)
        paramzzwr.zzb(5, this.zzaIa);
      if (this.zzaIb != null)
        paramzzwr.zzy(6, this.zzaIb.intValue());
      if (this.zzaIc != null)
        paramzzwr.zza(7, this.zzaIc);
      if (this.zzaId != null)
        paramzzwr.zza(8, this.zzaId);
      if (this.zzaIe != null)
        paramzzwr.zza(9, this.zzaIe);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if (this.zzaHZ != null)
        i += zzwr.zzj(1, this.zzaHZ);
      if (this.name != null)
        i += zzwr.zzj(4, this.name);
      if (this.zzaIa != null)
        i += zzwr.zzj(5, this.zzaIa);
      if (this.zzaIb != null)
        i += zzwr.zzA(6, this.zzaIb.intValue());
      if (this.zzaIc != null)
        i += zzwr.zzc(7, this.zzaIc);
      if (this.zzaId != null)
        i += zzwr.zzc(8, this.zzaId);
      if (this.zzaIe != null)
        i += zzwr.zzc(9, this.zzaIe);
      return i;
    }

    public zzb zzwb()
    {
      this.zzaHZ = null;
      this.name = null;
      this.zzaIa = null;
      this.zzaIb = null;
      this.zzaIc = null;
      this.zzaId = null;
      this.zzaIe = null;
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zzc extends zzwy
  {
    public String name;
    public zzxc.zzd[] zzaIf;

    public zzc()
    {
      zzwc();
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      zzc localzzc;
      do
      {
        return true;
        if (!(paramObject instanceof zzc))
          return false;
        localzzc = (zzc)paramObject;
        if (this.name == null)
        {
          if (localzzc.name != null)
            return false;
        }
        else if (!this.name.equals(localzzc.name))
          return false;
      }
      while (zzww.equals(this.zzaIf, localzzc.zzaIf));
      return false;
    }

    public int hashCode()
    {
      if (this.name == null);
      for (int i = 0; ; i = this.name.hashCode())
        return 31 * (i + 527) + zzww.hashCode(this.zzaIf);
    }

    public zzc zzC(zzwq paramzzwq)
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
          this.name = paramzzwq.readString();
          break;
        case 18:
        }
        int j = zzxb.zzc(paramzzwq, 18);
        if (this.zzaIf == null);
        zzxc.zzd[] arrayOfzzd;
        for (int k = 0; ; k = this.zzaIf.length)
        {
          arrayOfzzd = new zzxc.zzd[j + k];
          if (k != 0)
            System.arraycopy(this.zzaIf, 0, arrayOfzzd, 0, k);
          while (k < -1 + arrayOfzzd.length)
          {
            arrayOfzzd[k] = new zzxc.zzd();
            paramzzwq.zza(arrayOfzzd[k]);
            paramzzwq.zzvu();
            k++;
          }
        }
        arrayOfzzd[k] = new zzxc.zzd();
        paramzzwq.zza(arrayOfzzd[k]);
        this.zzaIf = arrayOfzzd;
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (this.name != null)
        paramzzwr.zzb(1, this.name);
      if ((this.zzaIf != null) && (this.zzaIf.length > 0))
        for (int i = 0; i < this.zzaIf.length; i++)
        {
          zzxc.zzd localzzd = this.zzaIf[i];
          if (localzzd != null)
            paramzzwr.zza(2, localzzd);
        }
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if (this.name != null)
        i += zzwr.zzj(1, this.name);
      if ((this.zzaIf != null) && (this.zzaIf.length > 0))
      {
        int j = i;
        for (int k = 0; k < this.zzaIf.length; k++)
        {
          zzxc.zzd localzzd = this.zzaIf[k];
          if (localzzd != null)
            j += zzwr.zzc(2, localzzd);
        }
        i = j;
      }
      return i;
    }

    public zzc zzwc()
    {
      this.name = null;
      this.zzaIf = zzxc.zzd.zzwd();
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zzd extends zzwy
  {
    private static volatile zzd[] zzaIg;
    public String name;
    public Integer zzaIh;
    public Boolean zzaIi;

    public zzd()
    {
      zzwe();
    }

    public static zzd[] zzwd()
    {
      if (zzaIg == null);
      synchronized (zzww.zzaHL)
      {
        if (zzaIg == null)
          zzaIg = new zzd[0];
        return zzaIg;
      }
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      zzd localzzd;
      do
      {
        do
        {
          return true;
          if (!(paramObject instanceof zzd))
            return false;
          localzzd = (zzd)paramObject;
          if (this.name == null)
          {
            if (localzzd.name != null)
              return false;
          }
          else if (!this.name.equals(localzzd.name))
            return false;
          if (this.zzaIh == null)
          {
            if (localzzd.zzaIh != null)
              return false;
          }
          else if (!this.zzaIh.equals(localzzd.zzaIh))
            return false;
          if (this.zzaIi != null)
            break;
        }
        while (localzzd.zzaIi == null);
        return false;
      }
      while (this.zzaIi.equals(localzzd.zzaIi));
      return false;
    }

    public int hashCode()
    {
      int i;
      int k;
      label27: int m;
      int n;
      if (this.name == null)
      {
        i = 0;
        int j = 31 * (i + 527);
        if (this.zzaIh != null)
          break label66;
        k = 0;
        m = 31 * (k + j);
        Boolean localBoolean = this.zzaIi;
        n = 0;
        if (localBoolean != null)
          break label77;
      }
      while (true)
      {
        return m + n;
        i = this.name.hashCode();
        break;
        label66: k = this.zzaIh.intValue();
        break label27;
        label77: n = this.zzaIi.hashCode();
      }
    }

    public zzd zzD(zzwq paramzzwq)
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
          this.name = paramzzwq.readString();
          break;
        case 24:
          int j = paramzzwq.zzvx();
          switch (j)
          {
          default:
            break;
          case 1:
          case 2:
          }
          this.zzaIh = Integer.valueOf(j);
          break;
        case 32:
        }
        this.zzaIi = Boolean.valueOf(paramzzwq.zzvy());
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (this.name != null)
        paramzzwr.zzb(1, this.name);
      if (this.zzaIh != null)
        paramzzwr.zzy(3, this.zzaIh.intValue());
      if (this.zzaIi != null)
        paramzzwr.zzb(4, this.zzaIi.booleanValue());
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if (this.name != null)
        i += zzwr.zzj(1, this.name);
      if (this.zzaIh != null)
        i += zzwr.zzA(3, this.zzaIh.intValue());
      if (this.zzaIi != null)
        i += zzwr.zzc(4, this.zzaIi.booleanValue());
      return i;
    }

    public zzd zzwe()
    {
      this.name = null;
      this.zzaIh = null;
      this.zzaIi = null;
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zze extends zzwy
  {
    public String version;
    public Integer zzaIb;
    public String zzaIj;
    public String zzaIk;
    public String zzaIl;
    public Integer zzaIm;

    public zze()
    {
      zzwf();
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      zze localzze;
      do
      {
        do
        {
          return true;
          if (!(paramObject instanceof zze))
            return false;
          localzze = (zze)paramObject;
          if (this.zzaIj == null)
          {
            if (localzze.zzaIj != null)
              return false;
          }
          else if (!this.zzaIj.equals(localzze.zzaIj))
            return false;
          if (this.zzaIb == null)
          {
            if (localzze.zzaIb != null)
              return false;
          }
          else if (!this.zzaIb.equals(localzze.zzaIb))
            return false;
          if (this.version == null)
          {
            if (localzze.version != null)
              return false;
          }
          else if (!this.version.equals(localzze.version))
            return false;
          if (this.zzaIk == null)
          {
            if (localzze.zzaIk != null)
              return false;
          }
          else if (!this.zzaIk.equals(localzze.zzaIk))
            return false;
          if (this.zzaIl == null)
          {
            if (localzze.zzaIl != null)
              return false;
          }
          else if (!this.zzaIl.equals(localzze.zzaIl))
            return false;
          if (this.zzaIm != null)
            break;
        }
        while (localzze.zzaIm == null);
        return false;
      }
      while (this.zzaIm.equals(localzze.zzaIm));
      return false;
    }

    public int hashCode()
    {
      int i;
      int k;
      label27: int n;
      label45: int i2;
      label65: int i4;
      label85: int i5;
      int i6;
      if (this.zzaIj == null)
      {
        i = 0;
        int j = 31 * (i + 527);
        if (this.zzaIb != null)
          break label126;
        k = 0;
        int m = 31 * (k + j);
        if (this.version != null)
          break label137;
        n = 0;
        int i1 = 31 * (n + m);
        if (this.zzaIk != null)
          break label149;
        i2 = 0;
        int i3 = 31 * (i2 + i1);
        if (this.zzaIl != null)
          break label161;
        i4 = 0;
        i5 = 31 * (i4 + i3);
        Integer localInteger = this.zzaIm;
        i6 = 0;
        if (localInteger != null)
          break label173;
      }
      while (true)
      {
        return i5 + i6;
        i = this.zzaIj.hashCode();
        break;
        label126: k = this.zzaIb.intValue();
        break label27;
        label137: n = this.version.hashCode();
        break label45;
        label149: i2 = this.zzaIk.hashCode();
        break label65;
        label161: i4 = this.zzaIl.hashCode();
        break label85;
        label173: i6 = this.zzaIm.intValue();
      }
    }

    public zze zzE(zzwq paramzzwq)
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
          this.zzaIj = paramzzwq.readString();
          break;
        case 16:
          int k = paramzzwq.zzvx();
          switch (k)
          {
          default:
            break;
          case 0:
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          }
          this.zzaIb = Integer.valueOf(k);
          break;
        case 26:
          this.version = paramzzwq.readString();
          break;
        case 34:
          this.zzaIk = paramzzwq.readString();
          break;
        case 42:
          this.zzaIl = paramzzwq.readString();
          break;
        case 48:
        }
        int j = paramzzwq.zzvx();
        switch (j)
        {
        default:
          break;
        case 0:
        case 1:
        case 2:
        }
        this.zzaIm = Integer.valueOf(j);
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (this.zzaIj != null)
        paramzzwr.zzb(1, this.zzaIj);
      if (this.zzaIb != null)
        paramzzwr.zzy(2, this.zzaIb.intValue());
      if (this.version != null)
        paramzzwr.zzb(3, this.version);
      if (this.zzaIk != null)
        paramzzwr.zzb(4, this.zzaIk);
      if (this.zzaIl != null)
        paramzzwr.zzb(5, this.zzaIl);
      if (this.zzaIm != null)
        paramzzwr.zzy(6, this.zzaIm.intValue());
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if (this.zzaIj != null)
        i += zzwr.zzj(1, this.zzaIj);
      if (this.zzaIb != null)
        i += zzwr.zzA(2, this.zzaIb.intValue());
      if (this.version != null)
        i += zzwr.zzj(3, this.version);
      if (this.zzaIk != null)
        i += zzwr.zzj(4, this.zzaIk);
      if (this.zzaIl != null)
        i += zzwr.zzj(5, this.zzaIl);
      if (this.zzaIm != null)
        i += zzwr.zzA(6, this.zzaIm.intValue());
      return i;
    }

    public zze zzwf()
    {
      this.zzaIj = null;
      this.zzaIb = null;
      this.version = null;
      this.zzaIk = null;
      this.zzaIl = null;
      this.zzaIm = null;
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zzf extends zzwy
  {
    private static volatile zzf[] zzaIn;
    public Integer zzaIo;
    public Double zzaIp;

    public zzf()
    {
      zzwh();
    }

    public static zzf[] zzwg()
    {
      if (zzaIn == null);
      synchronized (zzww.zzaHL)
      {
        if (zzaIn == null)
          zzaIn = new zzf[0];
        return zzaIn;
      }
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      zzf localzzf;
      do
      {
        do
        {
          return true;
          if (!(paramObject instanceof zzf))
            return false;
          localzzf = (zzf)paramObject;
          if (this.zzaIo == null)
          {
            if (localzzf.zzaIo != null)
              return false;
          }
          else if (!this.zzaIo.equals(localzzf.zzaIo))
            return false;
          if (this.zzaIp != null)
            break;
        }
        while (localzzf.zzaIp == null);
        return false;
      }
      while (this.zzaIp.equals(localzzf.zzaIp));
      return false;
    }

    public int hashCode()
    {
      int i;
      int j;
      int k;
      if (this.zzaIo == null)
      {
        i = 0;
        j = 31 * (i + 527);
        Double localDouble = this.zzaIp;
        k = 0;
        if (localDouble != null)
          break label46;
      }
      while (true)
      {
        return j + k;
        i = this.zzaIo.hashCode();
        break;
        label46: k = this.zzaIp.hashCode();
      }
    }

    public zzf zzF(zzwq paramzzwq)
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
        case 8:
          this.zzaIo = Integer.valueOf(paramzzwq.zzvx());
          break;
        case 17:
        }
        this.zzaIp = Double.valueOf(paramzzwq.readDouble());
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (this.zzaIo != null)
        paramzzwr.zzy(1, this.zzaIo.intValue());
      if (this.zzaIp != null)
        paramzzwr.zza(2, this.zzaIp.doubleValue());
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if (this.zzaIo != null)
        i += zzwr.zzA(1, this.zzaIo.intValue());
      if (this.zzaIp != null)
        i += zzwr.zzb(2, this.zzaIp.doubleValue());
      return i;
    }

    public zzf zzwh()
    {
      this.zzaIo = null;
      this.zzaIp = null;
      this.zzaHM = -1;
      return this;
    }
  }
}