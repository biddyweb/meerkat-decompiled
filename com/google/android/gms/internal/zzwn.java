package com.google.android.gms.internal;

import java.io.IOException;
import java.util.Arrays;

public final class zzwn extends zzws<zzwn>
{
  public zza[] zzaGS;

  public zzwn()
  {
    zzvn();
  }

  public static zzwn zzq(byte[] paramArrayOfByte)
    throws zzwx
  {
    return (zzwn)zzwy.zza(new zzwn(), paramArrayOfByte);
  }

  public boolean equals(Object paramObject)
  {
    boolean bool2;
    if (paramObject == this)
      bool2 = true;
    zzwn localzzwn;
    boolean bool3;
    do
    {
      boolean bool1;
      do
      {
        return bool2;
        bool1 = paramObject instanceof zzwn;
        bool2 = false;
      }
      while (!bool1);
      localzzwn = (zzwn)paramObject;
      bool3 = zzww.equals(this.zzaGS, localzzwn.zzaGS);
      bool2 = false;
    }
    while (!bool3);
    return zza(localzzwn);
  }

  public int hashCode()
  {
    return 31 * (527 + zzww.hashCode(this.zzaGS)) + zzvL();
  }

  public void zza(zzwr paramzzwr)
    throws IOException
  {
    if ((this.zzaGS != null) && (this.zzaGS.length > 0))
      for (int i = 0; i < this.zzaGS.length; i++)
      {
        zza localzza = this.zzaGS[i];
        if (localzza != null)
          paramzzwr.zza(1, localzza);
      }
    super.zza(paramzzwr);
  }

  protected int zzc()
  {
    int i = super.zzc();
    if ((this.zzaGS != null) && (this.zzaGS.length > 0))
      for (int j = 0; j < this.zzaGS.length; j++)
      {
        zza localzza = this.zzaGS[j];
        if (localzza != null)
          i += zzwr.zzc(1, localzza);
      }
    return i;
  }

  public zzwn zzu(zzwq paramzzwq)
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
      if (this.zzaGS == null);
      zza[] arrayOfzza;
      for (int k = 0; ; k = this.zzaGS.length)
      {
        arrayOfzza = new zza[j + k];
        if (k != 0)
          System.arraycopy(this.zzaGS, 0, arrayOfzza, 0, k);
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
      this.zzaGS = arrayOfzza;
    }
  }

  public zzwn zzvn()
  {
    this.zzaGS = zza.zzvo();
    this.zzaHB = null;
    this.zzaHM = -1;
    return this;
  }

  public static final class zza extends zzws<zza>
  {
    private static volatile zza[] zzaGT;
    public String name;
    public zza zzaGU;

    public zza()
    {
      zzvp();
    }

    public static zza[] zzvo()
    {
      if (zzaGT == null);
      synchronized (zzww.zzaHL)
      {
        if (zzaGT == null)
          zzaGT = new zza[0];
        return zzaGT;
      }
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zza localzza;
      do
      {
        String str;
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
          if (this.name != null)
            break;
          str = localzza.name;
          bool2 = false;
        }
        while (str != null);
        if (this.zzaGU != null)
          break label92;
        localzza1 = localzza.zzaGU;
        bool2 = false;
      }
      while (localzza1 != null);
      label92: 
      while (this.zzaGU.equals(localzza.zzaGU))
      {
        zza localzza1;
        return zza(localzza);
        if (this.name.equals(localzza.name))
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
        zza localzza = this.zzaGU;
        k = 0;
        if (localzza != null)
          break label54;
      }
      while (true)
      {
        return 31 * (j + k) + zzvL();
        i = this.name.hashCode();
        break;
        label54: k = this.zzaGU.hashCode();
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      paramzzwr.zzb(1, this.name);
      if (this.zzaGU != null)
        paramzzwr.zza(2, this.zzaGU);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc() + zzwr.zzj(1, this.name);
      if (this.zzaGU != null)
        i += zzwr.zzc(2, this.zzaGU);
      return i;
    }

    public zza zzv(zzwq paramzzwq)
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
        if (this.zzaGU == null)
          this.zzaGU = new zza();
        paramzzwq.zza(this.zzaGU);
      }
    }

    public zza zzvp()
    {
      this.name = "";
      this.zzaGU = null;
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }

    public static final class zza extends zzws<zza>
    {
      private static volatile zza[] zzaGV;
      public int type;
      public zza zzaGW;

      public zza()
      {
        zzvr();
      }

      public static zza[] zzvq()
      {
        if (zzaGV == null);
        synchronized (zzww.zzaHL)
        {
          if (zzaGV == null)
            zzaGV = new zza[0];
          return zzaGV;
        }
      }

      public boolean equals(Object paramObject)
      {
        boolean bool2;
        if (paramObject == this)
          bool2 = true;
        zza localzza;
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
            i = this.type;
            j = localzza.type;
            bool2 = false;
          }
          while (i != j);
          if (this.zzaGW != null)
            break;
          localzza1 = localzza.zzaGW;
          bool2 = false;
        }
        while (localzza1 != null);
        while (this.zzaGW.equals(localzza.zzaGW))
        {
          zza localzza1;
          return zza(localzza);
        }
        return false;
      }

      public int hashCode()
      {
        int i = 31 * (527 + this.type);
        if (this.zzaGW == null);
        for (int j = 0; ; j = this.zzaGW.hashCode())
          return 31 * (j + i) + zzvL();
      }

      public void zza(zzwr paramzzwr)
        throws IOException
      {
        paramzzwr.zzy(1, this.type);
        if (this.zzaGW != null)
          paramzzwr.zza(2, this.zzaGW);
        super.zza(paramzzwr);
      }

      protected int zzc()
      {
        int i = super.zzc() + zzwr.zzA(1, this.type);
        if (this.zzaGW != null)
          i += zzwr.zzc(2, this.zzaGW);
        return i;
      }

      public zza zzvr()
      {
        this.type = 1;
        this.zzaGW = null;
        this.zzaHB = null;
        this.zzaHM = -1;
        return this;
      }

      public zza zzw(zzwq paramzzwq)
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
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
            }
            this.type = j;
            break;
          case 18:
          }
          if (this.zzaGW == null)
            this.zzaGW = new zza();
          paramzzwq.zza(this.zzaGW);
        }
      }

      public static final class zza extends zzws<zza>
      {
        public byte[] zzaGX;
        public String zzaGY;
        public double zzaGZ;
        public float zzaHa;
        public long zzaHb;
        public int zzaHc;
        public int zzaHd;
        public boolean zzaHe;
        public zzwn.zza[] zzaHf;
        public zzwn.zza.zza[] zzaHg;
        public String[] zzaHh;
        public long[] zzaHi;
        public float[] zzaHj;
        public long zzaHk;

        public zza()
        {
          zzvs();
        }

        public boolean equals(Object paramObject)
        {
          boolean bool2;
          if (paramObject == this)
            bool2 = true;
          zza localzza;
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
              bool3 = Arrays.equals(this.zzaGX, localzza.zzaGX);
              bool2 = false;
            }
            while (!bool3);
            if (this.zzaGY != null)
              break;
            str = localzza.zzaGY;
            bool2 = false;
          }
          while (str != null);
          while (this.zzaGY.equals(localzza.zzaGY))
          {
            String str;
            boolean bool4 = Double.doubleToLongBits(this.zzaGZ) < Double.doubleToLongBits(localzza.zzaGZ);
            bool2 = false;
            if (bool4)
              break;
            int i = Float.floatToIntBits(this.zzaHa);
            int j = Float.floatToIntBits(localzza.zzaHa);
            bool2 = false;
            if (i != j)
              break;
            boolean bool5 = this.zzaHb < localzza.zzaHb;
            bool2 = false;
            if (bool5)
              break;
            int k = this.zzaHc;
            int m = localzza.zzaHc;
            bool2 = false;
            if (k != m)
              break;
            int n = this.zzaHd;
            int i1 = localzza.zzaHd;
            bool2 = false;
            if (n != i1)
              break;
            boolean bool6 = this.zzaHe;
            boolean bool7 = localzza.zzaHe;
            bool2 = false;
            if (bool6 != bool7)
              break;
            boolean bool8 = zzww.equals(this.zzaHf, localzza.zzaHf);
            bool2 = false;
            if (!bool8)
              break;
            boolean bool9 = zzww.equals(this.zzaHg, localzza.zzaHg);
            bool2 = false;
            if (!bool9)
              break;
            boolean bool10 = zzww.equals(this.zzaHh, localzza.zzaHh);
            bool2 = false;
            if (!bool10)
              break;
            boolean bool11 = zzww.equals(this.zzaHi, localzza.zzaHi);
            bool2 = false;
            if (!bool11)
              break;
            boolean bool12 = zzww.equals(this.zzaHj, localzza.zzaHj);
            bool2 = false;
            if (!bool12)
              break;
            boolean bool13 = this.zzaHk < localzza.zzaHk;
            bool2 = false;
            if (bool13)
              break;
            return zza(localzza);
          }
          return false;
        }

        public int hashCode()
        {
          int i = 31 * (527 + Arrays.hashCode(this.zzaGX));
          int j;
          int m;
          if (this.zzaGY == null)
          {
            j = 0;
            int k = j + i;
            long l = Double.doubleToLongBits(this.zzaGZ);
            m = 31 * (31 * (31 * (31 * (31 * (k * 31 + (int)(l ^ l >>> 32)) + Float.floatToIntBits(this.zzaHa)) + (int)(this.zzaHb ^ this.zzaHb >>> 32)) + this.zzaHc) + this.zzaHd);
            if (!this.zzaHe)
              break label209;
          }
          label209: for (int n = 1231; ; n = 1237)
          {
            return 31 * (31 * (31 * (31 * (31 * (31 * (31 * (n + m) + zzww.hashCode(this.zzaHf)) + zzww.hashCode(this.zzaHg)) + zzww.hashCode(this.zzaHh)) + zzww.hashCode(this.zzaHi)) + zzww.hashCode(this.zzaHj)) + (int)(this.zzaHk ^ this.zzaHk >>> 32)) + zzvL();
            j = this.zzaGY.hashCode();
            break;
          }
        }

        public void zza(zzwr paramzzwr)
          throws IOException
        {
          if (!Arrays.equals(this.zzaGX, zzxb.zzaHV))
            paramzzwr.zza(1, this.zzaGX);
          if (!this.zzaGY.equals(""))
            paramzzwr.zzb(2, this.zzaGY);
          if (Double.doubleToLongBits(this.zzaGZ) != Double.doubleToLongBits(0.0D))
            paramzzwr.zza(3, this.zzaGZ);
          if (Float.floatToIntBits(this.zzaHa) != Float.floatToIntBits(0.0F))
            paramzzwr.zzb(4, this.zzaHa);
          if (this.zzaHb != 0L)
            paramzzwr.zzb(5, this.zzaHb);
          if (this.zzaHc != 0)
            paramzzwr.zzy(6, this.zzaHc);
          if (this.zzaHd != 0)
            paramzzwr.zzz(7, this.zzaHd);
          if (this.zzaHe)
            paramzzwr.zzb(8, this.zzaHe);
          if ((this.zzaHf != null) && (this.zzaHf.length > 0))
            for (int i1 = 0; i1 < this.zzaHf.length; i1++)
            {
              zzwn.zza localzza1 = this.zzaHf[i1];
              if (localzza1 != null)
                paramzzwr.zza(9, localzza1);
            }
          if ((this.zzaHg != null) && (this.zzaHg.length > 0))
            for (int n = 0; n < this.zzaHg.length; n++)
            {
              zzwn.zza.zza localzza = this.zzaHg[n];
              if (localzza != null)
                paramzzwr.zza(10, localzza);
            }
          if ((this.zzaHh != null) && (this.zzaHh.length > 0))
            for (int m = 0; m < this.zzaHh.length; m++)
            {
              String str = this.zzaHh[m];
              if (str != null)
                paramzzwr.zzb(11, str);
            }
          if ((this.zzaHi != null) && (this.zzaHi.length > 0))
            for (int k = 0; k < this.zzaHi.length; k++)
              paramzzwr.zzb(12, this.zzaHi[k]);
          if (this.zzaHk != 0L)
            paramzzwr.zzb(13, this.zzaHk);
          if (this.zzaHj != null)
          {
            int i = this.zzaHj.length;
            int j = 0;
            if (i > 0)
              while (j < this.zzaHj.length)
              {
                paramzzwr.zzb(14, this.zzaHj[j]);
                j++;
              }
          }
          super.zza(paramzzwr);
        }

        protected int zzc()
        {
          int i = 0;
          int j = super.zzc();
          if (!Arrays.equals(this.zzaGX, zzxb.zzaHV))
            j += zzwr.zzb(1, this.zzaGX);
          if (!this.zzaGY.equals(""))
            j += zzwr.zzj(2, this.zzaGY);
          if (Double.doubleToLongBits(this.zzaGZ) != Double.doubleToLongBits(0.0D))
            j += zzwr.zzb(3, this.zzaGZ);
          if (Float.floatToIntBits(this.zzaHa) != Float.floatToIntBits(0.0F))
            j += zzwr.zzc(4, this.zzaHa);
          if (this.zzaHb != 0L)
            j += zzwr.zzd(5, this.zzaHb);
          if (this.zzaHc != 0)
            j += zzwr.zzA(6, this.zzaHc);
          if (this.zzaHd != 0)
            j += zzwr.zzB(7, this.zzaHd);
          if (this.zzaHe)
            j += zzwr.zzc(8, this.zzaHe);
          if ((this.zzaHf != null) && (this.zzaHf.length > 0))
          {
            int i4 = j;
            for (int i5 = 0; i5 < this.zzaHf.length; i5++)
            {
              zzwn.zza localzza1 = this.zzaHf[i5];
              if (localzza1 != null)
                i4 += zzwr.zzc(9, localzza1);
            }
            j = i4;
          }
          if ((this.zzaHg != null) && (this.zzaHg.length > 0))
          {
            int i2 = j;
            for (int i3 = 0; i3 < this.zzaHg.length; i3++)
            {
              zzwn.zza.zza localzza = this.zzaHg[i3];
              if (localzza != null)
                i2 += zzwr.zzc(10, localzza);
            }
            j = i2;
          }
          if ((this.zzaHh != null) && (this.zzaHh.length > 0))
          {
            int m = 0;
            int n = 0;
            int i1 = 0;
            while (m < this.zzaHh.length)
            {
              String str = this.zzaHh[m];
              if (str != null)
              {
                i1++;
                n += zzwr.zzdM(str);
              }
              m++;
            }
            j = j + n + i1 * 1;
          }
          if ((this.zzaHi != null) && (this.zzaHi.length > 0))
          {
            int k = 0;
            while (i < this.zzaHi.length)
            {
              k += zzwr.zzN(this.zzaHi[i]);
              i++;
            }
            j = j + k + 1 * this.zzaHi.length;
          }
          if (this.zzaHk != 0L)
            j += zzwr.zzd(13, this.zzaHk);
          if ((this.zzaHj != null) && (this.zzaHj.length > 0))
            j = j + 4 * this.zzaHj.length + 1 * this.zzaHj.length;
          return j;
        }

        public zza zzvs()
        {
          this.zzaGX = zzxb.zzaHV;
          this.zzaGY = "";
          this.zzaGZ = 0.0D;
          this.zzaHa = 0.0F;
          this.zzaHb = 0L;
          this.zzaHc = 0;
          this.zzaHd = 0;
          this.zzaHe = false;
          this.zzaHf = zzwn.zza.zzvo();
          this.zzaHg = zzwn.zza.zza.zzvq();
          this.zzaHh = zzxb.zzaHT;
          this.zzaHi = zzxb.zzaHP;
          this.zzaHj = zzxb.zzaHQ;
          this.zzaHk = 0L;
          this.zzaHB = null;
          this.zzaHM = -1;
          return this;
        }

        public zza zzx(zzwq paramzzwq)
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
              this.zzaGX = paramzzwq.readBytes();
              break;
            case 18:
              this.zzaGY = paramzzwq.readString();
              break;
            case 25:
              this.zzaGZ = paramzzwq.readDouble();
              break;
            case 37:
              this.zzaHa = paramzzwq.readFloat();
              break;
            case 40:
              this.zzaHb = paramzzwq.zzvw();
              break;
            case 48:
              this.zzaHc = paramzzwq.zzvx();
              break;
            case 56:
              this.zzaHd = paramzzwq.zzvz();
              break;
            case 64:
              this.zzaHe = paramzzwq.zzvy();
              break;
            case 74:
              int i13 = zzxb.zzc(paramzzwq, 74);
              if (this.zzaHf == null);
              zzwn.zza[] arrayOfzza1;
              for (int i14 = 0; ; i14 = this.zzaHf.length)
              {
                arrayOfzza1 = new zzwn.zza[i13 + i14];
                if (i14 != 0)
                  System.arraycopy(this.zzaHf, 0, arrayOfzza1, 0, i14);
                while (i14 < -1 + arrayOfzza1.length)
                {
                  arrayOfzza1[i14] = new zzwn.zza();
                  paramzzwq.zza(arrayOfzza1[i14]);
                  paramzzwq.zzvu();
                  i14++;
                }
              }
              arrayOfzza1[i14] = new zzwn.zza();
              paramzzwq.zza(arrayOfzza1[i14]);
              this.zzaHf = arrayOfzza1;
              break;
            case 82:
              int i11 = zzxb.zzc(paramzzwq, 82);
              if (this.zzaHg == null);
              zzwn.zza.zza[] arrayOfzza;
              for (int i12 = 0; ; i12 = this.zzaHg.length)
              {
                arrayOfzza = new zzwn.zza.zza[i11 + i12];
                if (i12 != 0)
                  System.arraycopy(this.zzaHg, 0, arrayOfzza, 0, i12);
                while (i12 < -1 + arrayOfzza.length)
                {
                  arrayOfzza[i12] = new zzwn.zza.zza();
                  paramzzwq.zza(arrayOfzza[i12]);
                  paramzzwq.zzvu();
                  i12++;
                }
              }
              arrayOfzza[i12] = new zzwn.zza.zza();
              paramzzwq.zza(arrayOfzza[i12]);
              this.zzaHg = arrayOfzza;
              break;
            case 90:
              int i9 = zzxb.zzc(paramzzwq, 90);
              if (this.zzaHh == null);
              String[] arrayOfString;
              for (int i10 = 0; ; i10 = this.zzaHh.length)
              {
                arrayOfString = new String[i9 + i10];
                if (i10 != 0)
                  System.arraycopy(this.zzaHh, 0, arrayOfString, 0, i10);
                while (i10 < -1 + arrayOfString.length)
                {
                  arrayOfString[i10] = paramzzwq.readString();
                  paramzzwq.zzvu();
                  i10++;
                }
              }
              arrayOfString[i10] = paramzzwq.readString();
              this.zzaHh = arrayOfString;
              break;
            case 96:
              int i7 = zzxb.zzc(paramzzwq, 96);
              if (this.zzaHi == null);
              long[] arrayOfLong2;
              for (int i8 = 0; ; i8 = this.zzaHi.length)
              {
                arrayOfLong2 = new long[i7 + i8];
                if (i8 != 0)
                  System.arraycopy(this.zzaHi, 0, arrayOfLong2, 0, i8);
                while (i8 < -1 + arrayOfLong2.length)
                {
                  arrayOfLong2[i8] = paramzzwq.zzvw();
                  paramzzwq.zzvu();
                  i8++;
                }
              }
              arrayOfLong2[i8] = paramzzwq.zzvw();
              this.zzaHi = arrayOfLong2;
              break;
            case 98:
              int i3 = paramzzwq.zzip(paramzzwq.zzvB());
              int i4 = paramzzwq.getPosition();
              for (int i5 = 0; paramzzwq.zzvG() > 0; i5++)
                paramzzwq.zzvw();
              paramzzwq.zzir(i4);
              if (this.zzaHi == null);
              long[] arrayOfLong1;
              for (int i6 = 0; ; i6 = this.zzaHi.length)
              {
                arrayOfLong1 = new long[i5 + i6];
                if (i6 != 0)
                  System.arraycopy(this.zzaHi, 0, arrayOfLong1, 0, i6);
                while (i6 < arrayOfLong1.length)
                {
                  arrayOfLong1[i6] = paramzzwq.zzvw();
                  i6++;
                }
              }
              this.zzaHi = arrayOfLong1;
              paramzzwq.zziq(i3);
              break;
            case 104:
              this.zzaHk = paramzzwq.zzvw();
              break;
            case 117:
              int i1 = zzxb.zzc(paramzzwq, 117);
              if (this.zzaHj == null);
              float[] arrayOfFloat2;
              for (int i2 = 0; ; i2 = this.zzaHj.length)
              {
                arrayOfFloat2 = new float[i1 + i2];
                if (i2 != 0)
                  System.arraycopy(this.zzaHj, 0, arrayOfFloat2, 0, i2);
                while (i2 < -1 + arrayOfFloat2.length)
                {
                  arrayOfFloat2[i2] = paramzzwq.readFloat();
                  paramzzwq.zzvu();
                  i2++;
                }
              }
              arrayOfFloat2[i2] = paramzzwq.readFloat();
              this.zzaHj = arrayOfFloat2;
              break;
            case 114:
            }
            int j = paramzzwq.zzvB();
            int k = paramzzwq.zzip(j);
            int m = j / 4;
            if (this.zzaHj == null);
            float[] arrayOfFloat1;
            for (int n = 0; ; n = this.zzaHj.length)
            {
              arrayOfFloat1 = new float[m + n];
              if (n != 0)
                System.arraycopy(this.zzaHj, 0, arrayOfFloat1, 0, n);
              while (n < arrayOfFloat1.length)
              {
                arrayOfFloat1[n] = paramzzwq.readFloat();
                n++;
              }
            }
            this.zzaHj = arrayOfFloat1;
            paramzzwq.zziq(k);
          }
        }
      }
    }
  }
}