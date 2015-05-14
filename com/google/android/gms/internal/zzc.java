package com.google.android.gms.internal;

import java.io.IOException;

public abstract interface zzc
{
  public static final class zza extends zzws<zza>
  {
    public int level;
    public int zzfn;
    public int zzfo;

    public zza()
    {
      zzb();
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zza localzza;
      int n;
      int i1;
      do
      {
        int k;
        int m;
        do
        {
          int i;
          int j;
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
            i = this.level;
            j = localzza.level;
            bool2 = false;
          }
          while (i != j);
          k = this.zzfn;
          m = localzza.zzfn;
          bool2 = false;
        }
        while (k != m);
        n = this.zzfo;
        i1 = localzza.zzfo;
        bool2 = false;
      }
      while (n != i1);
      return zza(localzza);
    }

    public int hashCode()
    {
      return 31 * (31 * (31 * (527 + this.level) + this.zzfn) + this.zzfo) + zzvL();
    }

    public zza zza(zzwq paramzzwq)
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
          int j = paramzzwq.zzvx();
          switch (j)
          {
          default:
            break;
          case 1:
          case 2:
          case 3:
          }
          this.level = j;
          break;
        case 16:
          this.zzfn = paramzzwq.zzvx();
          break;
        case 24:
        }
        this.zzfo = paramzzwq.zzvx();
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (this.level != 1)
        paramzzwr.zzy(1, this.level);
      if (this.zzfn != 0)
        paramzzwr.zzy(2, this.zzfn);
      if (this.zzfo != 0)
        paramzzwr.zzy(3, this.zzfo);
      super.zza(paramzzwr);
    }

    public zza zzb()
    {
      this.level = 1;
      this.zzfn = 0;
      this.zzfo = 0;
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }

    protected int zzc()
    {
      int i = super.zzc();
      if (this.level != 1)
        i += zzwr.zzA(1, this.level);
      if (this.zzfn != 0)
        i += zzwr.zzA(2, this.zzfn);
      if (this.zzfo != 0)
        i += zzwr.zzA(3, this.zzfo);
      return i;
    }
  }

  public static final class zzb extends zzws<zzb>
  {
    private static volatile zzb[] zzfp;
    public int name;
    public int[] zzfq;
    public int zzfr;
    public boolean zzfs;
    public boolean zzft;

    public zzb()
    {
      zze();
    }

    public static zzb[] zzd()
    {
      if (zzfp == null);
      synchronized (zzww.zzaHL)
      {
        if (zzfp == null)
          zzfp = new zzb[0];
        return zzfp;
      }
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zzb localzzb;
      boolean bool6;
      boolean bool7;
      do
      {
        boolean bool4;
        boolean bool5;
        do
        {
          int k;
          int m;
          do
          {
            int i;
            int j;
            do
            {
              boolean bool3;
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
                bool3 = zzww.equals(this.zzfq, localzzb.zzfq);
                bool2 = false;
              }
              while (!bool3);
              i = this.zzfr;
              j = localzzb.zzfr;
              bool2 = false;
            }
            while (i != j);
            k = this.name;
            m = localzzb.name;
            bool2 = false;
          }
          while (k != m);
          bool4 = this.zzfs;
          bool5 = localzzb.zzfs;
          bool2 = false;
        }
        while (bool4 != bool5);
        bool6 = this.zzft;
        bool7 = localzzb.zzft;
        bool2 = false;
      }
      while (bool6 != bool7);
      return zza(localzzb);
    }

    public int hashCode()
    {
      int i = 1231;
      int j = 31 * (31 * (31 * (527 + zzww.hashCode(this.zzfq)) + this.zzfr) + this.name);
      int k;
      int m;
      if (this.zzfs)
      {
        k = i;
        m = 31 * (k + j);
        if (!this.zzft)
          break label79;
      }
      while (true)
      {
        return 31 * (m + i) + zzvL();
        k = 1237;
        break;
        label79: i = 1237;
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (this.zzft)
        paramzzwr.zzb(1, this.zzft);
      paramzzwr.zzy(2, this.zzfr);
      if ((this.zzfq != null) && (this.zzfq.length > 0))
        for (int i = 0; i < this.zzfq.length; i++)
          paramzzwr.zzy(3, this.zzfq[i]);
      if (this.name != 0)
        paramzzwr.zzy(4, this.name);
      if (this.zzfs)
        paramzzwr.zzb(6, this.zzfs);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = 0;
      int j = super.zzc();
      if (this.zzft)
        j += zzwr.zzc(1, this.zzft);
      int k = j + zzwr.zzA(2, this.zzfr);
      if ((this.zzfq != null) && (this.zzfq.length > 0))
        for (int n = 0; n < this.zzfq.length; n++)
          i += zzwr.zziw(this.zzfq[n]);
      for (int m = k + i + 1 * this.zzfq.length; ; m = k)
      {
        if (this.name != 0)
          m += zzwr.zzA(4, this.name);
        if (this.zzfs)
          m += zzwr.zzc(6, this.zzfs);
        return m;
      }
    }

    public zzb zzc(zzwq paramzzwq)
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
          this.zzft = paramzzwq.zzvy();
          break;
        case 16:
          this.zzfr = paramzzwq.zzvx();
          break;
        case 24:
          int i1 = zzxb.zzc(paramzzwq, 24);
          if (this.zzfq == null);
          int[] arrayOfInt2;
          for (int i2 = 0; ; i2 = this.zzfq.length)
          {
            arrayOfInt2 = new int[i1 + i2];
            if (i2 != 0)
              System.arraycopy(this.zzfq, 0, arrayOfInt2, 0, i2);
            while (i2 < -1 + arrayOfInt2.length)
            {
              arrayOfInt2[i2] = paramzzwq.zzvx();
              paramzzwq.zzvu();
              i2++;
            }
          }
          arrayOfInt2[i2] = paramzzwq.zzvx();
          this.zzfq = arrayOfInt2;
          break;
        case 26:
          int j = paramzzwq.zzip(paramzzwq.zzvB());
          int k = paramzzwq.getPosition();
          for (int m = 0; paramzzwq.zzvG() > 0; m++)
            paramzzwq.zzvx();
          paramzzwq.zzir(k);
          if (this.zzfq == null);
          int[] arrayOfInt1;
          for (int n = 0; ; n = this.zzfq.length)
          {
            arrayOfInt1 = new int[m + n];
            if (n != 0)
              System.arraycopy(this.zzfq, 0, arrayOfInt1, 0, n);
            while (n < arrayOfInt1.length)
            {
              arrayOfInt1[n] = paramzzwq.zzvx();
              n++;
            }
          }
          this.zzfq = arrayOfInt1;
          paramzzwq.zziq(j);
          break;
        case 32:
          this.name = paramzzwq.zzvx();
          break;
        case 48:
        }
        this.zzfs = paramzzwq.zzvy();
      }
    }

    public zzb zze()
    {
      this.zzfq = zzxb.zzaHO;
      this.zzfr = 0;
      this.name = 0;
      this.zzfs = false;
      this.zzft = false;
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zzc extends zzws<zzc>
  {
    private static volatile zzc[] zzfu;
    public String zzfv;
    public long zzfw;
    public long zzfx;
    public boolean zzfy;
    public long zzfz;

    public zzc()
    {
      zzg();
    }

    public static zzc[] zzf()
    {
      if (zzfu == null);
      synchronized (zzww.zzaHL)
      {
        if (zzfu == null)
          zzfu = new zzc[0];
        return zzfu;
      }
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
        if (this.zzfv != null)
          break;
        str = localzzc.zzfv;
        bool2 = false;
      }
      while (str != null);
      while (this.zzfv.equals(localzzc.zzfv))
      {
        String str;
        boolean bool3 = this.zzfw < localzzc.zzfw;
        bool2 = false;
        if (bool3)
          break;
        boolean bool4 = this.zzfx < localzzc.zzfx;
        bool2 = false;
        if (bool4)
          break;
        boolean bool5 = this.zzfy;
        boolean bool6 = localzzc.zzfy;
        bool2 = false;
        if (bool5 != bool6)
          break;
        boolean bool7 = this.zzfz < localzzc.zzfz;
        bool2 = false;
        if (bool7)
          break;
        return zza(localzzc);
      }
      return false;
    }

    public int hashCode()
    {
      int i;
      int j;
      if (this.zzfv == null)
      {
        i = 0;
        j = 31 * (31 * (31 * (i + 527) + (int)(this.zzfw ^ this.zzfw >>> 32)) + (int)(this.zzfx ^ this.zzfx >>> 32));
        if (!this.zzfy)
          break label103;
      }
      label103: for (int k = 1231; ; k = 1237)
      {
        return 31 * (31 * (k + j) + (int)(this.zzfz ^ this.zzfz >>> 32)) + zzvL();
        i = this.zzfv.hashCode();
        break;
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (!this.zzfv.equals(""))
        paramzzwr.zzb(1, this.zzfv);
      if (this.zzfw != 0L)
        paramzzwr.zzb(2, this.zzfw);
      if (this.zzfx != 2147483647L)
        paramzzwr.zzb(3, this.zzfx);
      if (this.zzfy)
        paramzzwr.zzb(4, this.zzfy);
      if (this.zzfz != 0L)
        paramzzwr.zzb(5, this.zzfz);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if (!this.zzfv.equals(""))
        i += zzwr.zzj(1, this.zzfv);
      if (this.zzfw != 0L)
        i += zzwr.zzd(2, this.zzfw);
      if (this.zzfx != 2147483647L)
        i += zzwr.zzd(3, this.zzfx);
      if (this.zzfy)
        i += zzwr.zzc(4, this.zzfy);
      if (this.zzfz != 0L)
        i += zzwr.zzd(5, this.zzfz);
      return i;
    }

    public zzc zzd(zzwq paramzzwq)
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
          this.zzfv = paramzzwq.readString();
          break;
        case 16:
          this.zzfw = paramzzwq.zzvw();
          break;
        case 24:
          this.zzfx = paramzzwq.zzvw();
          break;
        case 32:
          this.zzfy = paramzzwq.zzvy();
          break;
        case 40:
        }
        this.zzfz = paramzzwq.zzvw();
      }
    }

    public zzc zzg()
    {
      this.zzfv = "";
      this.zzfw = 0L;
      this.zzfx = 2147483647L;
      this.zzfy = false;
      this.zzfz = 0L;
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zzd extends zzws<zzd>
  {
    public zzd.zza[] zzfA;
    public zzd.zza[] zzfB;
    public zzc.zzc[] zzfC;

    public zzd()
    {
      zzh();
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zzd localzzd;
      boolean bool5;
      do
      {
        boolean bool4;
        do
        {
          boolean bool3;
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
            bool3 = zzww.equals(this.zzfA, localzzd.zzfA);
            bool2 = false;
          }
          while (!bool3);
          bool4 = zzww.equals(this.zzfB, localzzd.zzfB);
          bool2 = false;
        }
        while (!bool4);
        bool5 = zzww.equals(this.zzfC, localzzd.zzfC);
        bool2 = false;
      }
      while (!bool5);
      return zza(localzzd);
    }

    public int hashCode()
    {
      return 31 * (31 * (31 * (527 + zzww.hashCode(this.zzfA)) + zzww.hashCode(this.zzfB)) + zzww.hashCode(this.zzfC)) + zzvL();
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if ((this.zzfA != null) && (this.zzfA.length > 0))
        for (int m = 0; m < this.zzfA.length; m++)
        {
          zzd.zza localzza2 = this.zzfA[m];
          if (localzza2 != null)
            paramzzwr.zza(1, localzza2);
        }
      if ((this.zzfB != null) && (this.zzfB.length > 0))
        for (int k = 0; k < this.zzfB.length; k++)
        {
          zzd.zza localzza1 = this.zzfB[k];
          if (localzza1 != null)
            paramzzwr.zza(2, localzza1);
        }
      if (this.zzfC != null)
      {
        int i = this.zzfC.length;
        int j = 0;
        if (i > 0)
          while (j < this.zzfC.length)
          {
            zzc.zzc localzzc = this.zzfC[j];
            if (localzzc != null)
              paramzzwr.zza(3, localzzc);
            j++;
          }
      }
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if ((this.zzfA != null) && (this.zzfA.length > 0))
      {
        int i1 = i;
        for (int i2 = 0; i2 < this.zzfA.length; i2++)
        {
          zzd.zza localzza2 = this.zzfA[i2];
          if (localzza2 != null)
            i1 += zzwr.zzc(1, localzza2);
        }
        i = i1;
      }
      if ((this.zzfB != null) && (this.zzfB.length > 0))
      {
        int m = i;
        for (int n = 0; n < this.zzfB.length; n++)
        {
          zzd.zza localzza1 = this.zzfB[n];
          if (localzza1 != null)
            m += zzwr.zzc(2, localzza1);
        }
        i = m;
      }
      if (this.zzfC != null)
      {
        int j = this.zzfC.length;
        int k = 0;
        if (j > 0)
          while (k < this.zzfC.length)
          {
            zzc.zzc localzzc = this.zzfC[k];
            if (localzzc != null)
              i += zzwr.zzc(3, localzzc);
            k++;
          }
      }
      return i;
    }

    public zzd zze(zzwq paramzzwq)
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
          int i1 = zzxb.zzc(paramzzwq, 10);
          if (this.zzfA == null);
          zzd.zza[] arrayOfzza2;
          for (int i2 = 0; ; i2 = this.zzfA.length)
          {
            arrayOfzza2 = new zzd.zza[i1 + i2];
            if (i2 != 0)
              System.arraycopy(this.zzfA, 0, arrayOfzza2, 0, i2);
            while (i2 < -1 + arrayOfzza2.length)
            {
              arrayOfzza2[i2] = new zzd.zza();
              paramzzwq.zza(arrayOfzza2[i2]);
              paramzzwq.zzvu();
              i2++;
            }
          }
          arrayOfzza2[i2] = new zzd.zza();
          paramzzwq.zza(arrayOfzza2[i2]);
          this.zzfA = arrayOfzza2;
          break;
        case 18:
          int m = zzxb.zzc(paramzzwq, 18);
          if (this.zzfB == null);
          zzd.zza[] arrayOfzza1;
          for (int n = 0; ; n = this.zzfB.length)
          {
            arrayOfzza1 = new zzd.zza[m + n];
            if (n != 0)
              System.arraycopy(this.zzfB, 0, arrayOfzza1, 0, n);
            while (n < -1 + arrayOfzza1.length)
            {
              arrayOfzza1[n] = new zzd.zza();
              paramzzwq.zza(arrayOfzza1[n]);
              paramzzwq.zzvu();
              n++;
            }
          }
          arrayOfzza1[n] = new zzd.zza();
          paramzzwq.zza(arrayOfzza1[n]);
          this.zzfB = arrayOfzza1;
          break;
        case 26:
        }
        int j = zzxb.zzc(paramzzwq, 26);
        if (this.zzfC == null);
        zzc.zzc[] arrayOfzzc;
        for (int k = 0; ; k = this.zzfC.length)
        {
          arrayOfzzc = new zzc.zzc[j + k];
          if (k != 0)
            System.arraycopy(this.zzfC, 0, arrayOfzzc, 0, k);
          while (k < -1 + arrayOfzzc.length)
          {
            arrayOfzzc[k] = new zzc.zzc();
            paramzzwq.zza(arrayOfzzc[k]);
            paramzzwq.zzvu();
            k++;
          }
        }
        arrayOfzzc[k] = new zzc.zzc();
        paramzzwq.zza(arrayOfzzc[k]);
        this.zzfC = arrayOfzzc;
      }
    }

    public zzd zzh()
    {
      this.zzfA = zzd.zza.zzr();
      this.zzfB = zzd.zza.zzr();
      this.zzfC = zzc.zzc.zzf();
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zze extends zzws<zze>
  {
    private static volatile zze[] zzfD;
    public int key;
    public int value;

    public zze()
    {
      zzj();
    }

    public static zze[] zzi()
    {
      if (zzfD == null);
      synchronized (zzww.zzaHL)
      {
        if (zzfD == null)
          zzfD = new zze[0];
        return zzfD;
      }
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zze localzze;
      int k;
      int m;
      do
      {
        int i;
        int j;
        do
        {
          boolean bool1;
          do
          {
            return bool2;
            bool1 = paramObject instanceof zze;
            bool2 = false;
          }
          while (!bool1);
          localzze = (zze)paramObject;
          i = this.key;
          j = localzze.key;
          bool2 = false;
        }
        while (i != j);
        k = this.value;
        m = localzze.value;
        bool2 = false;
      }
      while (k != m);
      return zza(localzze);
    }

    public int hashCode()
    {
      return 31 * (31 * (527 + this.key) + this.value) + zzvL();
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      paramzzwr.zzy(1, this.key);
      paramzzwr.zzy(2, this.value);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      return super.zzc() + zzwr.zzA(1, this.key) + zzwr.zzA(2, this.value);
    }

    public zze zzf(zzwq paramzzwq)
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
          this.key = paramzzwq.zzvx();
          break;
        case 16:
        }
        this.value = paramzzwq.zzvx();
      }
    }

    public zze zzj()
    {
      this.key = 0;
      this.value = 0;
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zzf extends zzws<zzf>
  {
    public String version;
    public String[] zzfE;
    public String[] zzfF;
    public zzd.zza[] zzfG;
    public zzc.zze[] zzfH;
    public zzc.zzb[] zzfI;
    public zzc.zzb[] zzfJ;
    public zzc.zzb[] zzfK;
    public zzc.zzg[] zzfL;
    public String zzfM;
    public String zzfN;
    public String zzfO;
    public zzc.zza zzfP;
    public float zzfQ;
    public boolean zzfR;
    public String[] zzfS;
    public int zzfT;

    public zzf()
    {
      zzk();
    }

    public static zzf zza(byte[] paramArrayOfByte)
      throws zzwx
    {
      return (zzf)zzwy.zza(new zzf(), paramArrayOfByte);
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zzf localzzf;
      label215: label236: 
      do
      {
        String str1;
        do
        {
          String str2;
          do
          {
            String str3;
            do
            {
              String str4;
              do
              {
                boolean bool10;
                do
                {
                  boolean bool9;
                  do
                  {
                    boolean bool8;
                    do
                    {
                      boolean bool7;
                      do
                      {
                        boolean bool6;
                        do
                        {
                          boolean bool5;
                          do
                          {
                            boolean bool4;
                            do
                            {
                              boolean bool3;
                              do
                              {
                                boolean bool1;
                                do
                                {
                                  return bool2;
                                  bool1 = paramObject instanceof zzf;
                                  bool2 = false;
                                }
                                while (!bool1);
                                localzzf = (zzf)paramObject;
                                bool3 = zzww.equals(this.zzfE, localzzf.zzfE);
                                bool2 = false;
                              }
                              while (!bool3);
                              bool4 = zzww.equals(this.zzfF, localzzf.zzfF);
                              bool2 = false;
                            }
                            while (!bool4);
                            bool5 = zzww.equals(this.zzfG, localzzf.zzfG);
                            bool2 = false;
                          }
                          while (!bool5);
                          bool6 = zzww.equals(this.zzfH, localzzf.zzfH);
                          bool2 = false;
                        }
                        while (!bool6);
                        bool7 = zzww.equals(this.zzfI, localzzf.zzfI);
                        bool2 = false;
                      }
                      while (!bool7);
                      bool8 = zzww.equals(this.zzfJ, localzzf.zzfJ);
                      bool2 = false;
                    }
                    while (!bool8);
                    bool9 = zzww.equals(this.zzfK, localzzf.zzfK);
                    bool2 = false;
                  }
                  while (!bool9);
                  bool10 = zzww.equals(this.zzfL, localzzf.zzfL);
                  bool2 = false;
                }
                while (!bool10);
                if (this.zzfM != null)
                  break;
                str4 = localzzf.zzfM;
                bool2 = false;
              }
              while (str4 != null);
              if (this.zzfN != null)
                break label416;
              str3 = localzzf.zzfN;
              bool2 = false;
            }
            while (str3 != null);
            if (this.zzfO != null)
              break label433;
            str2 = localzzf.zzfO;
            bool2 = false;
          }
          while (str2 != null);
          if (this.version != null)
            break label450;
          str1 = localzzf.version;
          bool2 = false;
        }
        while (str1 != null);
        if (this.zzfP != null)
          break label467;
        localzza = localzzf.zzfP;
        bool2 = false;
      }
      while (localzza != null);
      label257: label278: label416: label433: label450: label467: 
      while (this.zzfP.equals(localzzf.zzfP))
      {
        zzc.zza localzza;
        int i = Float.floatToIntBits(this.zzfQ);
        int j = Float.floatToIntBits(localzzf.zzfQ);
        bool2 = false;
        if (i != j)
          break;
        boolean bool11 = this.zzfR;
        boolean bool12 = localzzf.zzfR;
        bool2 = false;
        if (bool11 != bool12)
          break;
        boolean bool13 = zzww.equals(this.zzfS, localzzf.zzfS);
        bool2 = false;
        if (!bool13)
          break;
        int k = this.zzfT;
        int m = localzzf.zzfT;
        bool2 = false;
        if (k != m)
          break;
        return zza(localzzf);
        if (this.zzfM.equals(localzzf.zzfM))
          break label215;
        return false;
        if (this.zzfN.equals(localzzf.zzfN))
          break label236;
        return false;
        if (this.zzfO.equals(localzzf.zzfO))
          break label257;
        return false;
        if (this.version.equals(localzzf.version))
          break label278;
        return false;
      }
      return false;
    }

    public int hashCode()
    {
      int i = 31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (527 + zzww.hashCode(this.zzfE)) + zzww.hashCode(this.zzfF)) + zzww.hashCode(this.zzfG)) + zzww.hashCode(this.zzfH)) + zzww.hashCode(this.zzfI)) + zzww.hashCode(this.zzfJ)) + zzww.hashCode(this.zzfK)) + zzww.hashCode(this.zzfL));
      int j;
      int m;
      label118: int i1;
      label137: int i3;
      label157: int i5;
      label181: int i6;
      if (this.zzfM == null)
      {
        j = 0;
        int k = 31 * (j + i);
        if (this.zzfN != null)
          break label258;
        m = 0;
        int n = 31 * (m + k);
        if (this.zzfO != null)
          break label270;
        i1 = 0;
        int i2 = 31 * (i1 + n);
        if (this.version != null)
          break label282;
        i3 = 0;
        int i4 = 31 * (i3 + i2);
        zzc.zza localzza = this.zzfP;
        i5 = 0;
        if (localzza != null)
          break label294;
        i6 = 31 * (31 * (i4 + i5) + Float.floatToIntBits(this.zzfQ));
        if (!this.zzfR)
          break label306;
      }
      label258: label270: label282: label294: label306: for (int i7 = 1231; ; i7 = 1237)
      {
        return 31 * (31 * (31 * (i7 + i6) + zzww.hashCode(this.zzfS)) + this.zzfT) + zzvL();
        j = this.zzfM.hashCode();
        break;
        m = this.zzfN.hashCode();
        break label118;
        i1 = this.zzfO.hashCode();
        break label137;
        i3 = this.version.hashCode();
        break label157;
        i5 = this.zzfP.hashCode();
        break label181;
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if ((this.zzfF != null) && (this.zzfF.length > 0))
        for (int i5 = 0; i5 < this.zzfF.length; i5++)
        {
          String str3 = this.zzfF[i5];
          if (str3 != null)
            paramzzwr.zzb(1, str3);
        }
      if ((this.zzfG != null) && (this.zzfG.length > 0))
        for (int i4 = 0; i4 < this.zzfG.length; i4++)
        {
          zzd.zza localzza = this.zzfG[i4];
          if (localzza != null)
            paramzzwr.zza(2, localzza);
        }
      if ((this.zzfH != null) && (this.zzfH.length > 0))
        for (int i3 = 0; i3 < this.zzfH.length; i3++)
        {
          zzc.zze localzze = this.zzfH[i3];
          if (localzze != null)
            paramzzwr.zza(3, localzze);
        }
      if ((this.zzfI != null) && (this.zzfI.length > 0))
        for (int i2 = 0; i2 < this.zzfI.length; i2++)
        {
          zzc.zzb localzzb3 = this.zzfI[i2];
          if (localzzb3 != null)
            paramzzwr.zza(4, localzzb3);
        }
      if ((this.zzfJ != null) && (this.zzfJ.length > 0))
        for (int i1 = 0; i1 < this.zzfJ.length; i1++)
        {
          zzc.zzb localzzb2 = this.zzfJ[i1];
          if (localzzb2 != null)
            paramzzwr.zza(5, localzzb2);
        }
      if ((this.zzfK != null) && (this.zzfK.length > 0))
        for (int n = 0; n < this.zzfK.length; n++)
        {
          zzc.zzb localzzb1 = this.zzfK[n];
          if (localzzb1 != null)
            paramzzwr.zza(6, localzzb1);
        }
      if ((this.zzfL != null) && (this.zzfL.length > 0))
        for (int m = 0; m < this.zzfL.length; m++)
        {
          zzc.zzg localzzg = this.zzfL[m];
          if (localzzg != null)
            paramzzwr.zza(7, localzzg);
        }
      if (!this.zzfM.equals(""))
        paramzzwr.zzb(9, this.zzfM);
      if (!this.zzfN.equals(""))
        paramzzwr.zzb(10, this.zzfN);
      if (!this.zzfO.equals("0"))
        paramzzwr.zzb(12, this.zzfO);
      if (!this.version.equals(""))
        paramzzwr.zzb(13, this.version);
      if (this.zzfP != null)
        paramzzwr.zza(14, this.zzfP);
      if (Float.floatToIntBits(this.zzfQ) != Float.floatToIntBits(0.0F))
        paramzzwr.zzb(15, this.zzfQ);
      if ((this.zzfS != null) && (this.zzfS.length > 0))
        for (int k = 0; k < this.zzfS.length; k++)
        {
          String str2 = this.zzfS[k];
          if (str2 != null)
            paramzzwr.zzb(16, str2);
        }
      if (this.zzfT != 0)
        paramzzwr.zzy(17, this.zzfT);
      if (this.zzfR)
        paramzzwr.zzb(18, this.zzfR);
      if (this.zzfE != null)
      {
        int i = this.zzfE.length;
        int j = 0;
        if (i > 0)
          while (j < this.zzfE.length)
          {
            String str1 = this.zzfE[j];
            if (str1 != null)
              paramzzwr.zzb(19, str1);
            j++;
          }
      }
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = 0;
      int j = super.zzc();
      int i17;
      int i18;
      if ((this.zzfF != null) && (this.zzfF.length > 0))
      {
        int i16 = 0;
        i17 = 0;
        i18 = 0;
        while (i16 < this.zzfF.length)
        {
          String str3 = this.zzfF[i16];
          if (str3 != null)
          {
            i18++;
            i17 += zzwr.zzdM(str3);
          }
          i16++;
        }
      }
      for (int k = j + i17 + i18 * 1; ; k = j)
      {
        if ((this.zzfG != null) && (this.zzfG.length > 0))
        {
          int i14 = k;
          for (int i15 = 0; i15 < this.zzfG.length; i15++)
          {
            zzd.zza localzza = this.zzfG[i15];
            if (localzza != null)
              i14 += zzwr.zzc(2, localzza);
          }
          k = i14;
        }
        if ((this.zzfH != null) && (this.zzfH.length > 0))
        {
          int i12 = k;
          for (int i13 = 0; i13 < this.zzfH.length; i13++)
          {
            zzc.zze localzze = this.zzfH[i13];
            if (localzze != null)
              i12 += zzwr.zzc(3, localzze);
          }
          k = i12;
        }
        if ((this.zzfI != null) && (this.zzfI.length > 0))
        {
          int i10 = k;
          for (int i11 = 0; i11 < this.zzfI.length; i11++)
          {
            zzc.zzb localzzb3 = this.zzfI[i11];
            if (localzzb3 != null)
              i10 += zzwr.zzc(4, localzzb3);
          }
          k = i10;
        }
        if ((this.zzfJ != null) && (this.zzfJ.length > 0))
        {
          int i8 = k;
          for (int i9 = 0; i9 < this.zzfJ.length; i9++)
          {
            zzc.zzb localzzb2 = this.zzfJ[i9];
            if (localzzb2 != null)
              i8 += zzwr.zzc(5, localzzb2);
          }
          k = i8;
        }
        if ((this.zzfK != null) && (this.zzfK.length > 0))
        {
          int i6 = k;
          for (int i7 = 0; i7 < this.zzfK.length; i7++)
          {
            zzc.zzb localzzb1 = this.zzfK[i7];
            if (localzzb1 != null)
              i6 += zzwr.zzc(6, localzzb1);
          }
          k = i6;
        }
        if ((this.zzfL != null) && (this.zzfL.length > 0))
        {
          int i4 = k;
          for (int i5 = 0; i5 < this.zzfL.length; i5++)
          {
            zzc.zzg localzzg = this.zzfL[i5];
            if (localzzg != null)
              i4 += zzwr.zzc(7, localzzg);
          }
          k = i4;
        }
        if (!this.zzfM.equals(""))
          k += zzwr.zzj(9, this.zzfM);
        if (!this.zzfN.equals(""))
          k += zzwr.zzj(10, this.zzfN);
        if (!this.zzfO.equals("0"))
          k += zzwr.zzj(12, this.zzfO);
        if (!this.version.equals(""))
          k += zzwr.zzj(13, this.version);
        if (this.zzfP != null)
          k += zzwr.zzc(14, this.zzfP);
        if (Float.floatToIntBits(this.zzfQ) != Float.floatToIntBits(0.0F))
          k += zzwr.zzc(15, this.zzfQ);
        if ((this.zzfS != null) && (this.zzfS.length > 0))
        {
          int i1 = 0;
          int i2 = 0;
          int i3 = 0;
          while (i1 < this.zzfS.length)
          {
            String str2 = this.zzfS[i1];
            if (str2 != null)
            {
              i3++;
              i2 += zzwr.zzdM(str2);
            }
            i1++;
          }
          k = k + i2 + i3 * 2;
        }
        if (this.zzfT != 0)
          k += zzwr.zzA(17, this.zzfT);
        if (this.zzfR)
          k += zzwr.zzc(18, this.zzfR);
        if ((this.zzfE != null) && (this.zzfE.length > 0))
        {
          int m = 0;
          int n = 0;
          while (i < this.zzfE.length)
          {
            String str1 = this.zzfE[i];
            if (str1 != null)
            {
              n++;
              m += zzwr.zzdM(str1);
            }
            i++;
          }
          k = k + m + n * 2;
        }
        return k;
      }
    }

    public zzf zzg(zzwq paramzzwq)
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
          int i13 = zzxb.zzc(paramzzwq, 10);
          if (this.zzfF == null);
          String[] arrayOfString3;
          for (int i14 = 0; ; i14 = this.zzfF.length)
          {
            arrayOfString3 = new String[i13 + i14];
            if (i14 != 0)
              System.arraycopy(this.zzfF, 0, arrayOfString3, 0, i14);
            while (i14 < -1 + arrayOfString3.length)
            {
              arrayOfString3[i14] = paramzzwq.readString();
              paramzzwq.zzvu();
              i14++;
            }
          }
          arrayOfString3[i14] = paramzzwq.readString();
          this.zzfF = arrayOfString3;
          break;
        case 18:
          int i11 = zzxb.zzc(paramzzwq, 18);
          if (this.zzfG == null);
          zzd.zza[] arrayOfzza;
          for (int i12 = 0; ; i12 = this.zzfG.length)
          {
            arrayOfzza = new zzd.zza[i11 + i12];
            if (i12 != 0)
              System.arraycopy(this.zzfG, 0, arrayOfzza, 0, i12);
            while (i12 < -1 + arrayOfzza.length)
            {
              arrayOfzza[i12] = new zzd.zza();
              paramzzwq.zza(arrayOfzza[i12]);
              paramzzwq.zzvu();
              i12++;
            }
          }
          arrayOfzza[i12] = new zzd.zza();
          paramzzwq.zza(arrayOfzza[i12]);
          this.zzfG = arrayOfzza;
          break;
        case 26:
          int i9 = zzxb.zzc(paramzzwq, 26);
          if (this.zzfH == null);
          zzc.zze[] arrayOfzze;
          for (int i10 = 0; ; i10 = this.zzfH.length)
          {
            arrayOfzze = new zzc.zze[i9 + i10];
            if (i10 != 0)
              System.arraycopy(this.zzfH, 0, arrayOfzze, 0, i10);
            while (i10 < -1 + arrayOfzze.length)
            {
              arrayOfzze[i10] = new zzc.zze();
              paramzzwq.zza(arrayOfzze[i10]);
              paramzzwq.zzvu();
              i10++;
            }
          }
          arrayOfzze[i10] = new zzc.zze();
          paramzzwq.zza(arrayOfzze[i10]);
          this.zzfH = arrayOfzze;
          break;
        case 34:
          int i7 = zzxb.zzc(paramzzwq, 34);
          if (this.zzfI == null);
          zzc.zzb[] arrayOfzzb3;
          for (int i8 = 0; ; i8 = this.zzfI.length)
          {
            arrayOfzzb3 = new zzc.zzb[i7 + i8];
            if (i8 != 0)
              System.arraycopy(this.zzfI, 0, arrayOfzzb3, 0, i8);
            while (i8 < -1 + arrayOfzzb3.length)
            {
              arrayOfzzb3[i8] = new zzc.zzb();
              paramzzwq.zza(arrayOfzzb3[i8]);
              paramzzwq.zzvu();
              i8++;
            }
          }
          arrayOfzzb3[i8] = new zzc.zzb();
          paramzzwq.zza(arrayOfzzb3[i8]);
          this.zzfI = arrayOfzzb3;
          break;
        case 42:
          int i5 = zzxb.zzc(paramzzwq, 42);
          if (this.zzfJ == null);
          zzc.zzb[] arrayOfzzb2;
          for (int i6 = 0; ; i6 = this.zzfJ.length)
          {
            arrayOfzzb2 = new zzc.zzb[i5 + i6];
            if (i6 != 0)
              System.arraycopy(this.zzfJ, 0, arrayOfzzb2, 0, i6);
            while (i6 < -1 + arrayOfzzb2.length)
            {
              arrayOfzzb2[i6] = new zzc.zzb();
              paramzzwq.zza(arrayOfzzb2[i6]);
              paramzzwq.zzvu();
              i6++;
            }
          }
          arrayOfzzb2[i6] = new zzc.zzb();
          paramzzwq.zza(arrayOfzzb2[i6]);
          this.zzfJ = arrayOfzzb2;
          break;
        case 50:
          int i3 = zzxb.zzc(paramzzwq, 50);
          if (this.zzfK == null);
          zzc.zzb[] arrayOfzzb1;
          for (int i4 = 0; ; i4 = this.zzfK.length)
          {
            arrayOfzzb1 = new zzc.zzb[i3 + i4];
            if (i4 != 0)
              System.arraycopy(this.zzfK, 0, arrayOfzzb1, 0, i4);
            while (i4 < -1 + arrayOfzzb1.length)
            {
              arrayOfzzb1[i4] = new zzc.zzb();
              paramzzwq.zza(arrayOfzzb1[i4]);
              paramzzwq.zzvu();
              i4++;
            }
          }
          arrayOfzzb1[i4] = new zzc.zzb();
          paramzzwq.zza(arrayOfzzb1[i4]);
          this.zzfK = arrayOfzzb1;
          break;
        case 58:
          int i1 = zzxb.zzc(paramzzwq, 58);
          if (this.zzfL == null);
          zzc.zzg[] arrayOfzzg;
          for (int i2 = 0; ; i2 = this.zzfL.length)
          {
            arrayOfzzg = new zzc.zzg[i1 + i2];
            if (i2 != 0)
              System.arraycopy(this.zzfL, 0, arrayOfzzg, 0, i2);
            while (i2 < -1 + arrayOfzzg.length)
            {
              arrayOfzzg[i2] = new zzc.zzg();
              paramzzwq.zza(arrayOfzzg[i2]);
              paramzzwq.zzvu();
              i2++;
            }
          }
          arrayOfzzg[i2] = new zzc.zzg();
          paramzzwq.zza(arrayOfzzg[i2]);
          this.zzfL = arrayOfzzg;
          break;
        case 74:
          this.zzfM = paramzzwq.readString();
          break;
        case 82:
          this.zzfN = paramzzwq.readString();
          break;
        case 98:
          this.zzfO = paramzzwq.readString();
          break;
        case 106:
          this.version = paramzzwq.readString();
          break;
        case 114:
          if (this.zzfP == null)
            this.zzfP = new zzc.zza();
          paramzzwq.zza(this.zzfP);
          break;
        case 125:
          this.zzfQ = paramzzwq.readFloat();
          break;
        case 130:
          int m = zzxb.zzc(paramzzwq, 130);
          if (this.zzfS == null);
          String[] arrayOfString2;
          for (int n = 0; ; n = this.zzfS.length)
          {
            arrayOfString2 = new String[m + n];
            if (n != 0)
              System.arraycopy(this.zzfS, 0, arrayOfString2, 0, n);
            while (n < -1 + arrayOfString2.length)
            {
              arrayOfString2[n] = paramzzwq.readString();
              paramzzwq.zzvu();
              n++;
            }
          }
          arrayOfString2[n] = paramzzwq.readString();
          this.zzfS = arrayOfString2;
          break;
        case 136:
          this.zzfT = paramzzwq.zzvx();
          break;
        case 144:
          this.zzfR = paramzzwq.zzvy();
          break;
        case 154:
        }
        int j = zzxb.zzc(paramzzwq, 154);
        if (this.zzfE == null);
        String[] arrayOfString1;
        for (int k = 0; ; k = this.zzfE.length)
        {
          arrayOfString1 = new String[j + k];
          if (k != 0)
            System.arraycopy(this.zzfE, 0, arrayOfString1, 0, k);
          while (k < -1 + arrayOfString1.length)
          {
            arrayOfString1[k] = paramzzwq.readString();
            paramzzwq.zzvu();
            k++;
          }
        }
        arrayOfString1[k] = paramzzwq.readString();
        this.zzfE = arrayOfString1;
      }
    }

    public zzf zzk()
    {
      this.zzfE = zzxb.zzaHT;
      this.zzfF = zzxb.zzaHT;
      this.zzfG = zzd.zza.zzr();
      this.zzfH = zzc.zze.zzi();
      this.zzfI = zzc.zzb.zzd();
      this.zzfJ = zzc.zzb.zzd();
      this.zzfK = zzc.zzb.zzd();
      this.zzfL = zzc.zzg.zzl();
      this.zzfM = "";
      this.zzfN = "";
      this.zzfO = "0";
      this.version = "";
      this.zzfP = null;
      this.zzfQ = 0.0F;
      this.zzfR = false;
      this.zzfS = zzxb.zzaHT;
      this.zzfT = 0;
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zzg extends zzws<zzg>
  {
    private static volatile zzg[] zzfU;
    public int[] zzfV;
    public int[] zzfW;
    public int[] zzfX;
    public int[] zzfY;
    public int[] zzfZ;
    public int[] zzga;
    public int[] zzgb;
    public int[] zzgc;
    public int[] zzgd;
    public int[] zzge;

    public zzg()
    {
      zzm();
    }

    public static zzg[] zzl()
    {
      if (zzfU == null);
      synchronized (zzww.zzaHL)
      {
        if (zzfU == null)
          zzfU = new zzg[0];
        return zzfU;
      }
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zzg localzzg;
      boolean bool12;
      do
      {
        boolean bool11;
        do
        {
          boolean bool10;
          do
          {
            boolean bool9;
            do
            {
              boolean bool8;
              do
              {
                boolean bool7;
                do
                {
                  boolean bool6;
                  do
                  {
                    boolean bool5;
                    do
                    {
                      boolean bool4;
                      do
                      {
                        boolean bool3;
                        do
                        {
                          boolean bool1;
                          do
                          {
                            return bool2;
                            bool1 = paramObject instanceof zzg;
                            bool2 = false;
                          }
                          while (!bool1);
                          localzzg = (zzg)paramObject;
                          bool3 = zzww.equals(this.zzfV, localzzg.zzfV);
                          bool2 = false;
                        }
                        while (!bool3);
                        bool4 = zzww.equals(this.zzfW, localzzg.zzfW);
                        bool2 = false;
                      }
                      while (!bool4);
                      bool5 = zzww.equals(this.zzfX, localzzg.zzfX);
                      bool2 = false;
                    }
                    while (!bool5);
                    bool6 = zzww.equals(this.zzfY, localzzg.zzfY);
                    bool2 = false;
                  }
                  while (!bool6);
                  bool7 = zzww.equals(this.zzfZ, localzzg.zzfZ);
                  bool2 = false;
                }
                while (!bool7);
                bool8 = zzww.equals(this.zzga, localzzg.zzga);
                bool2 = false;
              }
              while (!bool8);
              bool9 = zzww.equals(this.zzgb, localzzg.zzgb);
              bool2 = false;
            }
            while (!bool9);
            bool10 = zzww.equals(this.zzgc, localzzg.zzgc);
            bool2 = false;
          }
          while (!bool10);
          bool11 = zzww.equals(this.zzgd, localzzg.zzgd);
          bool2 = false;
        }
        while (!bool11);
        bool12 = zzww.equals(this.zzge, localzzg.zzge);
        bool2 = false;
      }
      while (!bool12);
      return zza(localzzg);
    }

    public int hashCode()
    {
      return 31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (527 + zzww.hashCode(this.zzfV)) + zzww.hashCode(this.zzfW)) + zzww.hashCode(this.zzfX)) + zzww.hashCode(this.zzfY)) + zzww.hashCode(this.zzfZ)) + zzww.hashCode(this.zzga)) + zzww.hashCode(this.zzgb)) + zzww.hashCode(this.zzgc)) + zzww.hashCode(this.zzgd)) + zzww.hashCode(this.zzge)) + zzvL();
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if ((this.zzfV != null) && (this.zzfV.length > 0))
        for (int i6 = 0; i6 < this.zzfV.length; i6++)
          paramzzwr.zzy(1, this.zzfV[i6]);
      if ((this.zzfW != null) && (this.zzfW.length > 0))
        for (int i5 = 0; i5 < this.zzfW.length; i5++)
          paramzzwr.zzy(2, this.zzfW[i5]);
      if ((this.zzfX != null) && (this.zzfX.length > 0))
        for (int i4 = 0; i4 < this.zzfX.length; i4++)
          paramzzwr.zzy(3, this.zzfX[i4]);
      if ((this.zzfY != null) && (this.zzfY.length > 0))
        for (int i3 = 0; i3 < this.zzfY.length; i3++)
          paramzzwr.zzy(4, this.zzfY[i3]);
      if ((this.zzfZ != null) && (this.zzfZ.length > 0))
        for (int i2 = 0; i2 < this.zzfZ.length; i2++)
          paramzzwr.zzy(5, this.zzfZ[i2]);
      if ((this.zzga != null) && (this.zzga.length > 0))
        for (int i1 = 0; i1 < this.zzga.length; i1++)
          paramzzwr.zzy(6, this.zzga[i1]);
      if ((this.zzgb != null) && (this.zzgb.length > 0))
        for (int n = 0; n < this.zzgb.length; n++)
          paramzzwr.zzy(7, this.zzgb[n]);
      if ((this.zzgc != null) && (this.zzgc.length > 0))
        for (int m = 0; m < this.zzgc.length; m++)
          paramzzwr.zzy(8, this.zzgc[m]);
      if ((this.zzgd != null) && (this.zzgd.length > 0))
        for (int k = 0; k < this.zzgd.length; k++)
          paramzzwr.zzy(9, this.zzgd[k]);
      if (this.zzge != null)
      {
        int i = this.zzge.length;
        int j = 0;
        if (i > 0)
          while (j < this.zzge.length)
          {
            paramzzwr.zzy(10, this.zzge[j]);
            j++;
          }
      }
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = 0;
      int j = super.zzc();
      int i17;
      if ((this.zzfV != null) && (this.zzfV.length > 0))
      {
        int i16 = 0;
        i17 = 0;
        while (i16 < this.zzfV.length)
        {
          i17 += zzwr.zziw(this.zzfV[i16]);
          i16++;
        }
      }
      for (int k = j + i17 + 1 * this.zzfV.length; ; k = j)
      {
        if ((this.zzfW != null) && (this.zzfW.length > 0))
        {
          int i14 = 0;
          int i15 = 0;
          while (i14 < this.zzfW.length)
          {
            i15 += zzwr.zziw(this.zzfW[i14]);
            i14++;
          }
          k = k + i15 + 1 * this.zzfW.length;
        }
        if ((this.zzfX != null) && (this.zzfX.length > 0))
        {
          int i12 = 0;
          int i13 = 0;
          while (i12 < this.zzfX.length)
          {
            i13 += zzwr.zziw(this.zzfX[i12]);
            i12++;
          }
          k = k + i13 + 1 * this.zzfX.length;
        }
        if ((this.zzfY != null) && (this.zzfY.length > 0))
        {
          int i10 = 0;
          int i11 = 0;
          while (i10 < this.zzfY.length)
          {
            i11 += zzwr.zziw(this.zzfY[i10]);
            i10++;
          }
          k = k + i11 + 1 * this.zzfY.length;
        }
        if ((this.zzfZ != null) && (this.zzfZ.length > 0))
        {
          int i8 = 0;
          int i9 = 0;
          while (i8 < this.zzfZ.length)
          {
            i9 += zzwr.zziw(this.zzfZ[i8]);
            i8++;
          }
          k = k + i9 + 1 * this.zzfZ.length;
        }
        if ((this.zzga != null) && (this.zzga.length > 0))
        {
          int i6 = 0;
          int i7 = 0;
          while (i6 < this.zzga.length)
          {
            i7 += zzwr.zziw(this.zzga[i6]);
            i6++;
          }
          k = k + i7 + 1 * this.zzga.length;
        }
        if ((this.zzgb != null) && (this.zzgb.length > 0))
        {
          int i4 = 0;
          int i5 = 0;
          while (i4 < this.zzgb.length)
          {
            i5 += zzwr.zziw(this.zzgb[i4]);
            i4++;
          }
          k = k + i5 + 1 * this.zzgb.length;
        }
        if ((this.zzgc != null) && (this.zzgc.length > 0))
        {
          int i2 = 0;
          int i3 = 0;
          while (i2 < this.zzgc.length)
          {
            i3 += zzwr.zziw(this.zzgc[i2]);
            i2++;
          }
          k = k + i3 + 1 * this.zzgc.length;
        }
        if ((this.zzgd != null) && (this.zzgd.length > 0))
        {
          int n = 0;
          int i1 = 0;
          while (n < this.zzgd.length)
          {
            i1 += zzwr.zziw(this.zzgd[n]);
            n++;
          }
          k = k + i1 + 1 * this.zzgd.length;
        }
        if ((this.zzge != null) && (this.zzge.length > 0))
        {
          int m = 0;
          while (i < this.zzge.length)
          {
            m += zzwr.zziw(this.zzge[i]);
            i++;
          }
          k = k + m + 1 * this.zzge.length;
        }
        return k;
      }
    }

    public zzg zzh(zzwq paramzzwq)
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
          int i55 = zzxb.zzc(paramzzwq, 8);
          if (this.zzfV == null);
          int[] arrayOfInt20;
          for (int i56 = 0; ; i56 = this.zzfV.length)
          {
            arrayOfInt20 = new int[i55 + i56];
            if (i56 != 0)
              System.arraycopy(this.zzfV, 0, arrayOfInt20, 0, i56);
            while (i56 < -1 + arrayOfInt20.length)
            {
              arrayOfInt20[i56] = paramzzwq.zzvx();
              paramzzwq.zzvu();
              i56++;
            }
          }
          arrayOfInt20[i56] = paramzzwq.zzvx();
          this.zzfV = arrayOfInt20;
          break;
        case 10:
          int i51 = paramzzwq.zzip(paramzzwq.zzvB());
          int i52 = paramzzwq.getPosition();
          for (int i53 = 0; paramzzwq.zzvG() > 0; i53++)
            paramzzwq.zzvx();
          paramzzwq.zzir(i52);
          if (this.zzfV == null);
          int[] arrayOfInt19;
          for (int i54 = 0; ; i54 = this.zzfV.length)
          {
            arrayOfInt19 = new int[i53 + i54];
            if (i54 != 0)
              System.arraycopy(this.zzfV, 0, arrayOfInt19, 0, i54);
            while (i54 < arrayOfInt19.length)
            {
              arrayOfInt19[i54] = paramzzwq.zzvx();
              i54++;
            }
          }
          this.zzfV = arrayOfInt19;
          paramzzwq.zziq(i51);
          break;
        case 16:
          int i49 = zzxb.zzc(paramzzwq, 16);
          if (this.zzfW == null);
          int[] arrayOfInt18;
          for (int i50 = 0; ; i50 = this.zzfW.length)
          {
            arrayOfInt18 = new int[i49 + i50];
            if (i50 != 0)
              System.arraycopy(this.zzfW, 0, arrayOfInt18, 0, i50);
            while (i50 < -1 + arrayOfInt18.length)
            {
              arrayOfInt18[i50] = paramzzwq.zzvx();
              paramzzwq.zzvu();
              i50++;
            }
          }
          arrayOfInt18[i50] = paramzzwq.zzvx();
          this.zzfW = arrayOfInt18;
          break;
        case 18:
          int i45 = paramzzwq.zzip(paramzzwq.zzvB());
          int i46 = paramzzwq.getPosition();
          for (int i47 = 0; paramzzwq.zzvG() > 0; i47++)
            paramzzwq.zzvx();
          paramzzwq.zzir(i46);
          if (this.zzfW == null);
          int[] arrayOfInt17;
          for (int i48 = 0; ; i48 = this.zzfW.length)
          {
            arrayOfInt17 = new int[i47 + i48];
            if (i48 != 0)
              System.arraycopy(this.zzfW, 0, arrayOfInt17, 0, i48);
            while (i48 < arrayOfInt17.length)
            {
              arrayOfInt17[i48] = paramzzwq.zzvx();
              i48++;
            }
          }
          this.zzfW = arrayOfInt17;
          paramzzwq.zziq(i45);
          break;
        case 24:
          int i43 = zzxb.zzc(paramzzwq, 24);
          if (this.zzfX == null);
          int[] arrayOfInt16;
          for (int i44 = 0; ; i44 = this.zzfX.length)
          {
            arrayOfInt16 = new int[i43 + i44];
            if (i44 != 0)
              System.arraycopy(this.zzfX, 0, arrayOfInt16, 0, i44);
            while (i44 < -1 + arrayOfInt16.length)
            {
              arrayOfInt16[i44] = paramzzwq.zzvx();
              paramzzwq.zzvu();
              i44++;
            }
          }
          arrayOfInt16[i44] = paramzzwq.zzvx();
          this.zzfX = arrayOfInt16;
          break;
        case 26:
          int i39 = paramzzwq.zzip(paramzzwq.zzvB());
          int i40 = paramzzwq.getPosition();
          for (int i41 = 0; paramzzwq.zzvG() > 0; i41++)
            paramzzwq.zzvx();
          paramzzwq.zzir(i40);
          if (this.zzfX == null);
          int[] arrayOfInt15;
          for (int i42 = 0; ; i42 = this.zzfX.length)
          {
            arrayOfInt15 = new int[i41 + i42];
            if (i42 != 0)
              System.arraycopy(this.zzfX, 0, arrayOfInt15, 0, i42);
            while (i42 < arrayOfInt15.length)
            {
              arrayOfInt15[i42] = paramzzwq.zzvx();
              i42++;
            }
          }
          this.zzfX = arrayOfInt15;
          paramzzwq.zziq(i39);
          break;
        case 32:
          int i37 = zzxb.zzc(paramzzwq, 32);
          if (this.zzfY == null);
          int[] arrayOfInt14;
          for (int i38 = 0; ; i38 = this.zzfY.length)
          {
            arrayOfInt14 = new int[i37 + i38];
            if (i38 != 0)
              System.arraycopy(this.zzfY, 0, arrayOfInt14, 0, i38);
            while (i38 < -1 + arrayOfInt14.length)
            {
              arrayOfInt14[i38] = paramzzwq.zzvx();
              paramzzwq.zzvu();
              i38++;
            }
          }
          arrayOfInt14[i38] = paramzzwq.zzvx();
          this.zzfY = arrayOfInt14;
          break;
        case 34:
          int i33 = paramzzwq.zzip(paramzzwq.zzvB());
          int i34 = paramzzwq.getPosition();
          for (int i35 = 0; paramzzwq.zzvG() > 0; i35++)
            paramzzwq.zzvx();
          paramzzwq.zzir(i34);
          if (this.zzfY == null);
          int[] arrayOfInt13;
          for (int i36 = 0; ; i36 = this.zzfY.length)
          {
            arrayOfInt13 = new int[i35 + i36];
            if (i36 != 0)
              System.arraycopy(this.zzfY, 0, arrayOfInt13, 0, i36);
            while (i36 < arrayOfInt13.length)
            {
              arrayOfInt13[i36] = paramzzwq.zzvx();
              i36++;
            }
          }
          this.zzfY = arrayOfInt13;
          paramzzwq.zziq(i33);
          break;
        case 40:
          int i31 = zzxb.zzc(paramzzwq, 40);
          if (this.zzfZ == null);
          int[] arrayOfInt12;
          for (int i32 = 0; ; i32 = this.zzfZ.length)
          {
            arrayOfInt12 = new int[i31 + i32];
            if (i32 != 0)
              System.arraycopy(this.zzfZ, 0, arrayOfInt12, 0, i32);
            while (i32 < -1 + arrayOfInt12.length)
            {
              arrayOfInt12[i32] = paramzzwq.zzvx();
              paramzzwq.zzvu();
              i32++;
            }
          }
          arrayOfInt12[i32] = paramzzwq.zzvx();
          this.zzfZ = arrayOfInt12;
          break;
        case 42:
          int i27 = paramzzwq.zzip(paramzzwq.zzvB());
          int i28 = paramzzwq.getPosition();
          for (int i29 = 0; paramzzwq.zzvG() > 0; i29++)
            paramzzwq.zzvx();
          paramzzwq.zzir(i28);
          if (this.zzfZ == null);
          int[] arrayOfInt11;
          for (int i30 = 0; ; i30 = this.zzfZ.length)
          {
            arrayOfInt11 = new int[i29 + i30];
            if (i30 != 0)
              System.arraycopy(this.zzfZ, 0, arrayOfInt11, 0, i30);
            while (i30 < arrayOfInt11.length)
            {
              arrayOfInt11[i30] = paramzzwq.zzvx();
              i30++;
            }
          }
          this.zzfZ = arrayOfInt11;
          paramzzwq.zziq(i27);
          break;
        case 48:
          int i25 = zzxb.zzc(paramzzwq, 48);
          if (this.zzga == null);
          int[] arrayOfInt10;
          for (int i26 = 0; ; i26 = this.zzga.length)
          {
            arrayOfInt10 = new int[i25 + i26];
            if (i26 != 0)
              System.arraycopy(this.zzga, 0, arrayOfInt10, 0, i26);
            while (i26 < -1 + arrayOfInt10.length)
            {
              arrayOfInt10[i26] = paramzzwq.zzvx();
              paramzzwq.zzvu();
              i26++;
            }
          }
          arrayOfInt10[i26] = paramzzwq.zzvx();
          this.zzga = arrayOfInt10;
          break;
        case 50:
          int i21 = paramzzwq.zzip(paramzzwq.zzvB());
          int i22 = paramzzwq.getPosition();
          for (int i23 = 0; paramzzwq.zzvG() > 0; i23++)
            paramzzwq.zzvx();
          paramzzwq.zzir(i22);
          if (this.zzga == null);
          int[] arrayOfInt9;
          for (int i24 = 0; ; i24 = this.zzga.length)
          {
            arrayOfInt9 = new int[i23 + i24];
            if (i24 != 0)
              System.arraycopy(this.zzga, 0, arrayOfInt9, 0, i24);
            while (i24 < arrayOfInt9.length)
            {
              arrayOfInt9[i24] = paramzzwq.zzvx();
              i24++;
            }
          }
          this.zzga = arrayOfInt9;
          paramzzwq.zziq(i21);
          break;
        case 56:
          int i19 = zzxb.zzc(paramzzwq, 56);
          if (this.zzgb == null);
          int[] arrayOfInt8;
          for (int i20 = 0; ; i20 = this.zzgb.length)
          {
            arrayOfInt8 = new int[i19 + i20];
            if (i20 != 0)
              System.arraycopy(this.zzgb, 0, arrayOfInt8, 0, i20);
            while (i20 < -1 + arrayOfInt8.length)
            {
              arrayOfInt8[i20] = paramzzwq.zzvx();
              paramzzwq.zzvu();
              i20++;
            }
          }
          arrayOfInt8[i20] = paramzzwq.zzvx();
          this.zzgb = arrayOfInt8;
          break;
        case 58:
          int i15 = paramzzwq.zzip(paramzzwq.zzvB());
          int i16 = paramzzwq.getPosition();
          for (int i17 = 0; paramzzwq.zzvG() > 0; i17++)
            paramzzwq.zzvx();
          paramzzwq.zzir(i16);
          if (this.zzgb == null);
          int[] arrayOfInt7;
          for (int i18 = 0; ; i18 = this.zzgb.length)
          {
            arrayOfInt7 = new int[i17 + i18];
            if (i18 != 0)
              System.arraycopy(this.zzgb, 0, arrayOfInt7, 0, i18);
            while (i18 < arrayOfInt7.length)
            {
              arrayOfInt7[i18] = paramzzwq.zzvx();
              i18++;
            }
          }
          this.zzgb = arrayOfInt7;
          paramzzwq.zziq(i15);
          break;
        case 64:
          int i13 = zzxb.zzc(paramzzwq, 64);
          if (this.zzgc == null);
          int[] arrayOfInt6;
          for (int i14 = 0; ; i14 = this.zzgc.length)
          {
            arrayOfInt6 = new int[i13 + i14];
            if (i14 != 0)
              System.arraycopy(this.zzgc, 0, arrayOfInt6, 0, i14);
            while (i14 < -1 + arrayOfInt6.length)
            {
              arrayOfInt6[i14] = paramzzwq.zzvx();
              paramzzwq.zzvu();
              i14++;
            }
          }
          arrayOfInt6[i14] = paramzzwq.zzvx();
          this.zzgc = arrayOfInt6;
          break;
        case 66:
          int i9 = paramzzwq.zzip(paramzzwq.zzvB());
          int i10 = paramzzwq.getPosition();
          for (int i11 = 0; paramzzwq.zzvG() > 0; i11++)
            paramzzwq.zzvx();
          paramzzwq.zzir(i10);
          if (this.zzgc == null);
          int[] arrayOfInt5;
          for (int i12 = 0; ; i12 = this.zzgc.length)
          {
            arrayOfInt5 = new int[i11 + i12];
            if (i12 != 0)
              System.arraycopy(this.zzgc, 0, arrayOfInt5, 0, i12);
            while (i12 < arrayOfInt5.length)
            {
              arrayOfInt5[i12] = paramzzwq.zzvx();
              i12++;
            }
          }
          this.zzgc = arrayOfInt5;
          paramzzwq.zziq(i9);
          break;
        case 72:
          int i7 = zzxb.zzc(paramzzwq, 72);
          if (this.zzgd == null);
          int[] arrayOfInt4;
          for (int i8 = 0; ; i8 = this.zzgd.length)
          {
            arrayOfInt4 = new int[i7 + i8];
            if (i8 != 0)
              System.arraycopy(this.zzgd, 0, arrayOfInt4, 0, i8);
            while (i8 < -1 + arrayOfInt4.length)
            {
              arrayOfInt4[i8] = paramzzwq.zzvx();
              paramzzwq.zzvu();
              i8++;
            }
          }
          arrayOfInt4[i8] = paramzzwq.zzvx();
          this.zzgd = arrayOfInt4;
          break;
        case 74:
          int i3 = paramzzwq.zzip(paramzzwq.zzvB());
          int i4 = paramzzwq.getPosition();
          for (int i5 = 0; paramzzwq.zzvG() > 0; i5++)
            paramzzwq.zzvx();
          paramzzwq.zzir(i4);
          if (this.zzgd == null);
          int[] arrayOfInt3;
          for (int i6 = 0; ; i6 = this.zzgd.length)
          {
            arrayOfInt3 = new int[i5 + i6];
            if (i6 != 0)
              System.arraycopy(this.zzgd, 0, arrayOfInt3, 0, i6);
            while (i6 < arrayOfInt3.length)
            {
              arrayOfInt3[i6] = paramzzwq.zzvx();
              i6++;
            }
          }
          this.zzgd = arrayOfInt3;
          paramzzwq.zziq(i3);
          break;
        case 80:
          int i1 = zzxb.zzc(paramzzwq, 80);
          if (this.zzge == null);
          int[] arrayOfInt2;
          for (int i2 = 0; ; i2 = this.zzge.length)
          {
            arrayOfInt2 = new int[i1 + i2];
            if (i2 != 0)
              System.arraycopy(this.zzge, 0, arrayOfInt2, 0, i2);
            while (i2 < -1 + arrayOfInt2.length)
            {
              arrayOfInt2[i2] = paramzzwq.zzvx();
              paramzzwq.zzvu();
              i2++;
            }
          }
          arrayOfInt2[i2] = paramzzwq.zzvx();
          this.zzge = arrayOfInt2;
          break;
        case 82:
        }
        int j = paramzzwq.zzip(paramzzwq.zzvB());
        int k = paramzzwq.getPosition();
        for (int m = 0; paramzzwq.zzvG() > 0; m++)
          paramzzwq.zzvx();
        paramzzwq.zzir(k);
        if (this.zzge == null);
        int[] arrayOfInt1;
        for (int n = 0; ; n = this.zzge.length)
        {
          arrayOfInt1 = new int[m + n];
          if (n != 0)
            System.arraycopy(this.zzge, 0, arrayOfInt1, 0, n);
          while (n < arrayOfInt1.length)
          {
            arrayOfInt1[n] = paramzzwq.zzvx();
            n++;
          }
        }
        this.zzge = arrayOfInt1;
        paramzzwq.zziq(j);
      }
    }

    public zzg zzm()
    {
      this.zzfV = zzxb.zzaHO;
      this.zzfW = zzxb.zzaHO;
      this.zzfX = zzxb.zzaHO;
      this.zzfY = zzxb.zzaHO;
      this.zzfZ = zzxb.zzaHO;
      this.zzga = zzxb.zzaHO;
      this.zzgb = zzxb.zzaHO;
      this.zzgc = zzxb.zzaHO;
      this.zzgd = zzxb.zzaHO;
      this.zzge = zzxb.zzaHO;
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zzh extends zzws<zzh>
  {
    public static final zzwt<zzd.zza, zzh> zzgf = zzwt.zza(11, zzh.class, 810);
    private static final zzh[] zzgg = new zzh[0];
    public int[] zzgh;
    public int[] zzgi;
    public int[] zzgj;
    public int zzgk;
    public int[] zzgl;
    public int zzgm;
    public int zzgn;

    public zzh()
    {
      zzn();
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zzh localzzh;
      int n;
      int i1;
      do
      {
        int k;
        int m;
        do
        {
          boolean bool6;
          do
          {
            int i;
            int j;
            do
            {
              boolean bool5;
              do
              {
                boolean bool4;
                do
                {
                  boolean bool3;
                  do
                  {
                    boolean bool1;
                    do
                    {
                      return bool2;
                      bool1 = paramObject instanceof zzh;
                      bool2 = false;
                    }
                    while (!bool1);
                    localzzh = (zzh)paramObject;
                    bool3 = zzww.equals(this.zzgh, localzzh.zzgh);
                    bool2 = false;
                  }
                  while (!bool3);
                  bool4 = zzww.equals(this.zzgi, localzzh.zzgi);
                  bool2 = false;
                }
                while (!bool4);
                bool5 = zzww.equals(this.zzgj, localzzh.zzgj);
                bool2 = false;
              }
              while (!bool5);
              i = this.zzgk;
              j = localzzh.zzgk;
              bool2 = false;
            }
            while (i != j);
            bool6 = zzww.equals(this.zzgl, localzzh.zzgl);
            bool2 = false;
          }
          while (!bool6);
          k = this.zzgm;
          m = localzzh.zzgm;
          bool2 = false;
        }
        while (k != m);
        n = this.zzgn;
        i1 = localzzh.zzgn;
        bool2 = false;
      }
      while (n != i1);
      return zza(localzzh);
    }

    public int hashCode()
    {
      return 31 * (31 * (31 * (31 * (31 * (31 * (31 * (527 + zzww.hashCode(this.zzgh)) + zzww.hashCode(this.zzgi)) + zzww.hashCode(this.zzgj)) + this.zzgk) + zzww.hashCode(this.zzgl)) + this.zzgm) + this.zzgn) + zzvL();
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if ((this.zzgh != null) && (this.zzgh.length > 0))
        for (int n = 0; n < this.zzgh.length; n++)
          paramzzwr.zzy(1, this.zzgh[n]);
      if ((this.zzgi != null) && (this.zzgi.length > 0))
        for (int m = 0; m < this.zzgi.length; m++)
          paramzzwr.zzy(2, this.zzgi[m]);
      if ((this.zzgj != null) && (this.zzgj.length > 0))
        for (int k = 0; k < this.zzgj.length; k++)
          paramzzwr.zzy(3, this.zzgj[k]);
      if (this.zzgk != 0)
        paramzzwr.zzy(4, this.zzgk);
      if (this.zzgl != null)
      {
        int i = this.zzgl.length;
        int j = 0;
        if (i > 0)
          while (j < this.zzgl.length)
          {
            paramzzwr.zzy(5, this.zzgl[j]);
            j++;
          }
      }
      if (this.zzgm != 0)
        paramzzwr.zzy(6, this.zzgm);
      if (this.zzgn != 0)
        paramzzwr.zzy(7, this.zzgn);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = 0;
      int j = super.zzc();
      int i5;
      if ((this.zzgh != null) && (this.zzgh.length > 0))
      {
        int i4 = 0;
        i5 = 0;
        while (i4 < this.zzgh.length)
        {
          i5 += zzwr.zziw(this.zzgh[i4]);
          i4++;
        }
      }
      for (int k = j + i5 + 1 * this.zzgh.length; ; k = j)
      {
        if ((this.zzgi != null) && (this.zzgi.length > 0))
        {
          int i2 = 0;
          int i3 = 0;
          while (i2 < this.zzgi.length)
          {
            i3 += zzwr.zziw(this.zzgi[i2]);
            i2++;
          }
          k = k + i3 + 1 * this.zzgi.length;
        }
        if ((this.zzgj != null) && (this.zzgj.length > 0))
        {
          int n = 0;
          int i1 = 0;
          while (n < this.zzgj.length)
          {
            i1 += zzwr.zziw(this.zzgj[n]);
            n++;
          }
          k = k + i1 + 1 * this.zzgj.length;
        }
        if (this.zzgk != 0)
          k += zzwr.zzA(4, this.zzgk);
        if ((this.zzgl != null) && (this.zzgl.length > 0))
        {
          int m = 0;
          while (i < this.zzgl.length)
          {
            m += zzwr.zziw(this.zzgl[i]);
            i++;
          }
          k = k + m + 1 * this.zzgl.length;
        }
        if (this.zzgm != 0)
          k += zzwr.zzA(6, this.zzgm);
        if (this.zzgn != 0)
          k += zzwr.zzA(7, this.zzgn);
        return k;
      }
    }

    public zzh zzi(zzwq paramzzwq)
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
          int i19 = zzxb.zzc(paramzzwq, 8);
          if (this.zzgh == null);
          int[] arrayOfInt8;
          for (int i20 = 0; ; i20 = this.zzgh.length)
          {
            arrayOfInt8 = new int[i19 + i20];
            if (i20 != 0)
              System.arraycopy(this.zzgh, 0, arrayOfInt8, 0, i20);
            while (i20 < -1 + arrayOfInt8.length)
            {
              arrayOfInt8[i20] = paramzzwq.zzvx();
              paramzzwq.zzvu();
              i20++;
            }
          }
          arrayOfInt8[i20] = paramzzwq.zzvx();
          this.zzgh = arrayOfInt8;
          break;
        case 10:
          int i15 = paramzzwq.zzip(paramzzwq.zzvB());
          int i16 = paramzzwq.getPosition();
          for (int i17 = 0; paramzzwq.zzvG() > 0; i17++)
            paramzzwq.zzvx();
          paramzzwq.zzir(i16);
          if (this.zzgh == null);
          int[] arrayOfInt7;
          for (int i18 = 0; ; i18 = this.zzgh.length)
          {
            arrayOfInt7 = new int[i17 + i18];
            if (i18 != 0)
              System.arraycopy(this.zzgh, 0, arrayOfInt7, 0, i18);
            while (i18 < arrayOfInt7.length)
            {
              arrayOfInt7[i18] = paramzzwq.zzvx();
              i18++;
            }
          }
          this.zzgh = arrayOfInt7;
          paramzzwq.zziq(i15);
          break;
        case 16:
          int i13 = zzxb.zzc(paramzzwq, 16);
          if (this.zzgi == null);
          int[] arrayOfInt6;
          for (int i14 = 0; ; i14 = this.zzgi.length)
          {
            arrayOfInt6 = new int[i13 + i14];
            if (i14 != 0)
              System.arraycopy(this.zzgi, 0, arrayOfInt6, 0, i14);
            while (i14 < -1 + arrayOfInt6.length)
            {
              arrayOfInt6[i14] = paramzzwq.zzvx();
              paramzzwq.zzvu();
              i14++;
            }
          }
          arrayOfInt6[i14] = paramzzwq.zzvx();
          this.zzgi = arrayOfInt6;
          break;
        case 18:
          int i9 = paramzzwq.zzip(paramzzwq.zzvB());
          int i10 = paramzzwq.getPosition();
          for (int i11 = 0; paramzzwq.zzvG() > 0; i11++)
            paramzzwq.zzvx();
          paramzzwq.zzir(i10);
          if (this.zzgi == null);
          int[] arrayOfInt5;
          for (int i12 = 0; ; i12 = this.zzgi.length)
          {
            arrayOfInt5 = new int[i11 + i12];
            if (i12 != 0)
              System.arraycopy(this.zzgi, 0, arrayOfInt5, 0, i12);
            while (i12 < arrayOfInt5.length)
            {
              arrayOfInt5[i12] = paramzzwq.zzvx();
              i12++;
            }
          }
          this.zzgi = arrayOfInt5;
          paramzzwq.zziq(i9);
          break;
        case 24:
          int i7 = zzxb.zzc(paramzzwq, 24);
          if (this.zzgj == null);
          int[] arrayOfInt4;
          for (int i8 = 0; ; i8 = this.zzgj.length)
          {
            arrayOfInt4 = new int[i7 + i8];
            if (i8 != 0)
              System.arraycopy(this.zzgj, 0, arrayOfInt4, 0, i8);
            while (i8 < -1 + arrayOfInt4.length)
            {
              arrayOfInt4[i8] = paramzzwq.zzvx();
              paramzzwq.zzvu();
              i8++;
            }
          }
          arrayOfInt4[i8] = paramzzwq.zzvx();
          this.zzgj = arrayOfInt4;
          break;
        case 26:
          int i3 = paramzzwq.zzip(paramzzwq.zzvB());
          int i4 = paramzzwq.getPosition();
          for (int i5 = 0; paramzzwq.zzvG() > 0; i5++)
            paramzzwq.zzvx();
          paramzzwq.zzir(i4);
          if (this.zzgj == null);
          int[] arrayOfInt3;
          for (int i6 = 0; ; i6 = this.zzgj.length)
          {
            arrayOfInt3 = new int[i5 + i6];
            if (i6 != 0)
              System.arraycopy(this.zzgj, 0, arrayOfInt3, 0, i6);
            while (i6 < arrayOfInt3.length)
            {
              arrayOfInt3[i6] = paramzzwq.zzvx();
              i6++;
            }
          }
          this.zzgj = arrayOfInt3;
          paramzzwq.zziq(i3);
          break;
        case 32:
          this.zzgk = paramzzwq.zzvx();
          break;
        case 40:
          int i1 = zzxb.zzc(paramzzwq, 40);
          if (this.zzgl == null);
          int[] arrayOfInt2;
          for (int i2 = 0; ; i2 = this.zzgl.length)
          {
            arrayOfInt2 = new int[i1 + i2];
            if (i2 != 0)
              System.arraycopy(this.zzgl, 0, arrayOfInt2, 0, i2);
            while (i2 < -1 + arrayOfInt2.length)
            {
              arrayOfInt2[i2] = paramzzwq.zzvx();
              paramzzwq.zzvu();
              i2++;
            }
          }
          arrayOfInt2[i2] = paramzzwq.zzvx();
          this.zzgl = arrayOfInt2;
          break;
        case 42:
          int j = paramzzwq.zzip(paramzzwq.zzvB());
          int k = paramzzwq.getPosition();
          for (int m = 0; paramzzwq.zzvG() > 0; m++)
            paramzzwq.zzvx();
          paramzzwq.zzir(k);
          if (this.zzgl == null);
          int[] arrayOfInt1;
          for (int n = 0; ; n = this.zzgl.length)
          {
            arrayOfInt1 = new int[m + n];
            if (n != 0)
              System.arraycopy(this.zzgl, 0, arrayOfInt1, 0, n);
            while (n < arrayOfInt1.length)
            {
              arrayOfInt1[n] = paramzzwq.zzvx();
              n++;
            }
          }
          this.zzgl = arrayOfInt1;
          paramzzwq.zziq(j);
          break;
        case 48:
          this.zzgm = paramzzwq.zzvx();
          break;
        case 56:
        }
        this.zzgn = paramzzwq.zzvx();
      }
    }

    public zzh zzn()
    {
      this.zzgh = zzxb.zzaHO;
      this.zzgi = zzxb.zzaHO;
      this.zzgj = zzxb.zzaHO;
      this.zzgk = 0;
      this.zzgl = zzxb.zzaHO;
      this.zzgm = 0;
      this.zzgn = 0;
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zzi extends zzws<zzi>
  {
    private static volatile zzi[] zzgo;
    public String name;
    public zzd.zza zzgp;
    public zzc.zzd zzgq;

    public zzi()
    {
      zzp();
    }

    public static zzi[] zzo()
    {
      if (zzgo == null);
      synchronized (zzww.zzaHL)
      {
        if (zzgo == null)
          zzgo = new zzi[0];
        return zzgo;
      }
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zzi localzzi;
      label68: 
      do
      {
        zzd.zza localzza;
        do
        {
          String str;
          do
          {
            boolean bool1;
            do
            {
              return bool2;
              bool1 = paramObject instanceof zzi;
              bool2 = false;
            }
            while (!bool1);
            localzzi = (zzi)paramObject;
            if (this.name != null)
              break;
            str = localzzi.name;
            bool2 = false;
          }
          while (str != null);
          if (this.zzgp != null)
            break label113;
          localzza = localzzi.zzgp;
          bool2 = false;
        }
        while (localzza != null);
        if (this.zzgq != null)
          break label130;
        localzzd = localzzi.zzgq;
        bool2 = false;
      }
      while (localzzd != null);
      label113: 
      while (this.zzgq.equals(localzzi.zzgq))
      {
        zzc.zzd localzzd;
        return zza(localzzi);
        if (this.name.equals(localzzi.name))
          break;
        return false;
        if (this.zzgp.equals(localzzi.zzgp))
          break label68;
        return false;
      }
      label130: return false;
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
        if (this.zzgp != null)
          break label74;
        k = 0;
        m = 31 * (k + j);
        zzc.zzd localzzd = this.zzgq;
        n = 0;
        if (localzzd != null)
          break label85;
      }
      while (true)
      {
        return 31 * (m + n) + zzvL();
        i = this.name.hashCode();
        break;
        label74: k = this.zzgp.hashCode();
        break label27;
        label85: n = this.zzgq.hashCode();
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (!this.name.equals(""))
        paramzzwr.zzb(1, this.name);
      if (this.zzgp != null)
        paramzzwr.zza(2, this.zzgp);
      if (this.zzgq != null)
        paramzzwr.zza(3, this.zzgq);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if (!this.name.equals(""))
        i += zzwr.zzj(1, this.name);
      if (this.zzgp != null)
        i += zzwr.zzc(2, this.zzgp);
      if (this.zzgq != null)
        i += zzwr.zzc(3, this.zzgq);
      return i;
    }

    public zzi zzj(zzwq paramzzwq)
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
          if (this.zzgp == null)
            this.zzgp = new zzd.zza();
          paramzzwq.zza(this.zzgp);
          break;
        case 26:
        }
        if (this.zzgq == null)
          this.zzgq = new zzc.zzd();
        paramzzwq.zza(this.zzgq);
      }
    }

    public zzi zzp()
    {
      this.name = "";
      this.zzgp = null;
      this.zzgq = null;
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zzj extends zzws<zzj>
  {
    public zzc.zzi[] zzgr;
    public zzc.zzf zzgs;
    public String zzgt;

    public zzj()
    {
      zzq();
    }

    public static zzj zzb(byte[] paramArrayOfByte)
      throws zzwx
    {
      return (zzj)zzwy.zza(new zzj(), paramArrayOfByte);
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zzj localzzj;
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
              bool1 = paramObject instanceof zzj;
              bool2 = false;
            }
            while (!bool1);
            localzzj = (zzj)paramObject;
            bool3 = zzww.equals(this.zzgr, localzzj.zzgr);
            bool2 = false;
          }
          while (!bool3);
          if (this.zzgs != null)
            break;
          localzzf = localzzj.zzgs;
          bool2 = false;
        }
        while (localzzf != null);
        if (this.zzgt != null)
          break label113;
        str = localzzj.zzgt;
        bool2 = false;
      }
      while (str != null);
      label113: 
      while (this.zzgt.equals(localzzj.zzgt))
      {
        String str;
        return zza(localzzj);
        if (this.zzgs.equals(localzzj.zzgs))
          break;
        return false;
      }
      return false;
    }

    public int hashCode()
    {
      int i = 31 * (527 + zzww.hashCode(this.zzgr));
      int j;
      int k;
      int m;
      if (this.zzgs == null)
      {
        j = 0;
        k = 31 * (j + i);
        String str = this.zzgt;
        m = 0;
        if (str != null)
          break label69;
      }
      while (true)
      {
        return 31 * (k + m) + zzvL();
        j = this.zzgs.hashCode();
        break;
        label69: m = this.zzgt.hashCode();
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if ((this.zzgr != null) && (this.zzgr.length > 0))
        for (int i = 0; i < this.zzgr.length; i++)
        {
          zzc.zzi localzzi = this.zzgr[i];
          if (localzzi != null)
            paramzzwr.zza(1, localzzi);
        }
      if (this.zzgs != null)
        paramzzwr.zza(2, this.zzgs);
      if (!this.zzgt.equals(""))
        paramzzwr.zzb(3, this.zzgt);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if ((this.zzgr != null) && (this.zzgr.length > 0))
        for (int j = 0; j < this.zzgr.length; j++)
        {
          zzc.zzi localzzi = this.zzgr[j];
          if (localzzi != null)
            i += zzwr.zzc(1, localzzi);
        }
      if (this.zzgs != null)
        i += zzwr.zzc(2, this.zzgs);
      if (!this.zzgt.equals(""))
        i += zzwr.zzj(3, this.zzgt);
      return i;
    }

    public zzj zzk(zzwq paramzzwq)
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
          int j = zzxb.zzc(paramzzwq, 10);
          if (this.zzgr == null);
          zzc.zzi[] arrayOfzzi;
          for (int k = 0; ; k = this.zzgr.length)
          {
            arrayOfzzi = new zzc.zzi[j + k];
            if (k != 0)
              System.arraycopy(this.zzgr, 0, arrayOfzzi, 0, k);
            while (k < -1 + arrayOfzzi.length)
            {
              arrayOfzzi[k] = new zzc.zzi();
              paramzzwq.zza(arrayOfzzi[k]);
              paramzzwq.zzvu();
              k++;
            }
          }
          arrayOfzzi[k] = new zzc.zzi();
          paramzzwq.zza(arrayOfzzi[k]);
          this.zzgr = arrayOfzzi;
          break;
        case 18:
          if (this.zzgs == null)
            this.zzgs = new zzc.zzf();
          paramzzwq.zza(this.zzgs);
          break;
        case 26:
        }
        this.zzgt = paramzzwq.readString();
      }
    }

    public zzj zzq()
    {
      this.zzgr = zzc.zzi.zzo();
      this.zzgs = null;
      this.zzgt = "";
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }
  }
}