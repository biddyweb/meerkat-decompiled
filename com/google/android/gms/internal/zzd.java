package com.google.android.gms.internal;

import java.io.IOException;

public abstract interface zzd
{
  public static final class zza extends zzws<zza>
  {
    private static volatile zza[] zzgu;
    public int type;
    public String zzgA;
    public long zzgB;
    public boolean zzgC;
    public zza[] zzgD;
    public int[] zzgE;
    public boolean zzgF;
    public String zzgv;
    public zza[] zzgw;
    public zza[] zzgx;
    public zza[] zzgy;
    public String zzgz;

    public zza()
    {
      zzs();
    }

    public static zza[] zzr()
    {
      if (zzgu == null);
      synchronized (zzww.zzaHL)
      {
        if (zzgu == null)
          zzgu = new zza[0];
        return zzgu;
      }
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zza localzza;
      label69: 
      do
      {
        String str2;
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
                String str3;
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
                  if (this.zzgv != null)
                    break;
                  str3 = localzza.zzgv;
                  bool2 = false;
                }
                while (str3 != null);
                bool3 = zzww.equals(this.zzgw, localzza.zzgw);
                bool2 = false;
              }
              while (!bool3);
              bool4 = zzww.equals(this.zzgx, localzza.zzgx);
              bool2 = false;
            }
            while (!bool4);
            bool5 = zzww.equals(this.zzgy, localzza.zzgy);
            bool2 = false;
          }
          while (!bool5);
          if (this.zzgz != null)
            break label303;
          str2 = localzza.zzgz;
          bool2 = false;
        }
        while (str2 != null);
        if (this.zzgA != null)
          break label320;
        str1 = localzza.zzgA;
        bool2 = false;
      }
      while (str1 != null);
      label153: label303: label320: 
      while (this.zzgA.equals(localzza.zzgA))
      {
        String str1;
        boolean bool6 = this.zzgB < localzza.zzgB;
        bool2 = false;
        if (bool6)
          break;
        boolean bool7 = this.zzgC;
        boolean bool8 = localzza.zzgC;
        bool2 = false;
        if (bool7 != bool8)
          break;
        boolean bool9 = zzww.equals(this.zzgD, localzza.zzgD);
        bool2 = false;
        if (!bool9)
          break;
        boolean bool10 = zzww.equals(this.zzgE, localzza.zzgE);
        bool2 = false;
        if (!bool10)
          break;
        boolean bool11 = this.zzgF;
        boolean bool12 = localzza.zzgF;
        bool2 = false;
        if (bool11 != bool12)
          break;
        return zza(localzza);
        if (this.zzgv.equals(localzza.zzgv))
          break label69;
        return false;
        if (this.zzgz.equals(localzza.zzgz))
          break label153;
        return false;
      }
      return false;
    }

    public int hashCode()
    {
      int i = 1231;
      int j = 31 * (527 + this.type);
      int k;
      int n;
      label76: int i2;
      label100: int i4;
      label137: int i5;
      if (this.zzgv == null)
      {
        k = 0;
        int m = 31 * (31 * (31 * (31 * (k + j) + zzww.hashCode(this.zzgw)) + zzww.hashCode(this.zzgx)) + zzww.hashCode(this.zzgy));
        if (this.zzgz != null)
          break label200;
        n = 0;
        int i1 = 31 * (n + m);
        String str = this.zzgA;
        i2 = 0;
        if (str != null)
          break label212;
        int i3 = 31 * (31 * (i1 + i2) + (int)(this.zzgB ^ this.zzgB >>> 32));
        if (!this.zzgC)
          break label224;
        i4 = i;
        i5 = 31 * (31 * (31 * (i4 + i3) + zzww.hashCode(this.zzgD)) + zzww.hashCode(this.zzgE));
        if (!this.zzgF)
          break label232;
      }
      while (true)
      {
        return 31 * (i5 + i) + zzvL();
        k = this.zzgv.hashCode();
        break;
        label200: n = this.zzgz.hashCode();
        break label76;
        label212: i2 = this.zzgA.hashCode();
        break label100;
        label224: i4 = 1237;
        break label137;
        label232: i = 1237;
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      paramzzwr.zzy(1, this.type);
      if (!this.zzgv.equals(""))
        paramzzwr.zzb(2, this.zzgv);
      if ((this.zzgw != null) && (this.zzgw.length > 0))
        for (int i1 = 0; i1 < this.zzgw.length; i1++)
        {
          zza localzza4 = this.zzgw[i1];
          if (localzza4 != null)
            paramzzwr.zza(3, localzza4);
        }
      if ((this.zzgx != null) && (this.zzgx.length > 0))
        for (int n = 0; n < this.zzgx.length; n++)
        {
          zza localzza3 = this.zzgx[n];
          if (localzza3 != null)
            paramzzwr.zza(4, localzza3);
        }
      if ((this.zzgy != null) && (this.zzgy.length > 0))
        for (int m = 0; m < this.zzgy.length; m++)
        {
          zza localzza2 = this.zzgy[m];
          if (localzza2 != null)
            paramzzwr.zza(5, localzza2);
        }
      if (!this.zzgz.equals(""))
        paramzzwr.zzb(6, this.zzgz);
      if (!this.zzgA.equals(""))
        paramzzwr.zzb(7, this.zzgA);
      if (this.zzgB != 0L)
        paramzzwr.zzb(8, this.zzgB);
      if (this.zzgF)
        paramzzwr.zzb(9, this.zzgF);
      if ((this.zzgE != null) && (this.zzgE.length > 0))
        for (int k = 0; k < this.zzgE.length; k++)
          paramzzwr.zzy(10, this.zzgE[k]);
      if (this.zzgD != null)
      {
        int i = this.zzgD.length;
        int j = 0;
        if (i > 0)
          while (j < this.zzgD.length)
          {
            zza localzza1 = this.zzgD[j];
            if (localzza1 != null)
              paramzzwr.zza(11, localzza1);
            j++;
          }
      }
      if (this.zzgC)
        paramzzwr.zzb(12, this.zzgC);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc() + zzwr.zzA(1, this.type);
      if (!this.zzgv.equals(""))
        i += zzwr.zzj(2, this.zzgv);
      if ((this.zzgw != null) && (this.zzgw.length > 0))
      {
        int i5 = i;
        for (int i6 = 0; i6 < this.zzgw.length; i6++)
        {
          zza localzza4 = this.zzgw[i6];
          if (localzza4 != null)
            i5 += zzwr.zzc(3, localzza4);
        }
        i = i5;
      }
      if ((this.zzgx != null) && (this.zzgx.length > 0))
      {
        int i3 = i;
        for (int i4 = 0; i4 < this.zzgx.length; i4++)
        {
          zza localzza3 = this.zzgx[i4];
          if (localzza3 != null)
            i3 += zzwr.zzc(4, localzza3);
        }
        i = i3;
      }
      if ((this.zzgy != null) && (this.zzgy.length > 0))
      {
        int i1 = i;
        for (int i2 = 0; i2 < this.zzgy.length; i2++)
        {
          zza localzza2 = this.zzgy[i2];
          if (localzza2 != null)
            i1 += zzwr.zzc(5, localzza2);
        }
        i = i1;
      }
      if (!this.zzgz.equals(""))
        i += zzwr.zzj(6, this.zzgz);
      if (!this.zzgA.equals(""))
        i += zzwr.zzj(7, this.zzgA);
      if (this.zzgB != 0L)
        i += zzwr.zzd(8, this.zzgB);
      if (this.zzgF)
        i += zzwr.zzc(9, this.zzgF);
      if ((this.zzgE != null) && (this.zzgE.length > 0))
      {
        int m = 0;
        int n = 0;
        while (m < this.zzgE.length)
        {
          n += zzwr.zziw(this.zzgE[m]);
          m++;
        }
        i = i + n + 1 * this.zzgE.length;
      }
      if (this.zzgD != null)
      {
        int j = this.zzgD.length;
        int k = 0;
        if (j > 0)
          while (k < this.zzgD.length)
          {
            zza localzza1 = this.zzgD[k];
            if (localzza1 != null)
              i += zzwr.zzc(11, localzza1);
            k++;
          }
      }
      if (this.zzgC)
        i += zzwr.zzc(12, this.zzgC);
      return i;
    }

    public zza zzl(zzwq paramzzwq)
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
          int i17 = paramzzwq.zzvx();
          switch (i17)
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
          }
          this.type = i17;
          break;
        case 18:
          this.zzgv = paramzzwq.readString();
          break;
        case 26:
          int i15 = zzxb.zzc(paramzzwq, 26);
          if (this.zzgw == null);
          zza[] arrayOfzza4;
          for (int i16 = 0; ; i16 = this.zzgw.length)
          {
            arrayOfzza4 = new zza[i15 + i16];
            if (i16 != 0)
              System.arraycopy(this.zzgw, 0, arrayOfzza4, 0, i16);
            while (i16 < -1 + arrayOfzza4.length)
            {
              arrayOfzza4[i16] = new zza();
              paramzzwq.zza(arrayOfzza4[i16]);
              paramzzwq.zzvu();
              i16++;
            }
          }
          arrayOfzza4[i16] = new zza();
          paramzzwq.zza(arrayOfzza4[i16]);
          this.zzgw = arrayOfzza4;
          break;
        case 34:
          int i13 = zzxb.zzc(paramzzwq, 34);
          if (this.zzgx == null);
          zza[] arrayOfzza3;
          for (int i14 = 0; ; i14 = this.zzgx.length)
          {
            arrayOfzza3 = new zza[i13 + i14];
            if (i14 != 0)
              System.arraycopy(this.zzgx, 0, arrayOfzza3, 0, i14);
            while (i14 < -1 + arrayOfzza3.length)
            {
              arrayOfzza3[i14] = new zza();
              paramzzwq.zza(arrayOfzza3[i14]);
              paramzzwq.zzvu();
              i14++;
            }
          }
          arrayOfzza3[i14] = new zza();
          paramzzwq.zza(arrayOfzza3[i14]);
          this.zzgx = arrayOfzza3;
          break;
        case 42:
          int i11 = zzxb.zzc(paramzzwq, 42);
          if (this.zzgy == null);
          zza[] arrayOfzza2;
          for (int i12 = 0; ; i12 = this.zzgy.length)
          {
            arrayOfzza2 = new zza[i11 + i12];
            if (i12 != 0)
              System.arraycopy(this.zzgy, 0, arrayOfzza2, 0, i12);
            while (i12 < -1 + arrayOfzza2.length)
            {
              arrayOfzza2[i12] = new zza();
              paramzzwq.zza(arrayOfzza2[i12]);
              paramzzwq.zzvu();
              i12++;
            }
          }
          arrayOfzza2[i12] = new zza();
          paramzzwq.zza(arrayOfzza2[i12]);
          this.zzgy = arrayOfzza2;
          break;
        case 50:
          this.zzgz = paramzzwq.readString();
          break;
        case 58:
          this.zzgA = paramzzwq.readString();
          break;
        case 64:
          this.zzgB = paramzzwq.zzvw();
          break;
        case 72:
          this.zzgF = paramzzwq.zzvy();
          break;
        case 80:
          int i5 = zzxb.zzc(paramzzwq, 80);
          int[] arrayOfInt2 = new int[i5];
          int i6 = 0;
          int i7 = 0;
          if (i6 < i5)
          {
            if (i6 != 0)
              paramzzwq.zzvu();
            int i9 = paramzzwq.zzvx();
            int i10;
            switch (i9)
            {
            default:
              i10 = i7;
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
            case 16:
            case 17:
            }
            while (true)
            {
              i6++;
              i7 = i10;
              break;
              i10 = i7 + 1;
              arrayOfInt2[i7] = i9;
            }
          }
          if (i7 == 0)
            continue;
          if (this.zzgE == null);
          for (int i8 = 0; ; i8 = this.zzgE.length)
          {
            if ((i8 != 0) || (i7 != arrayOfInt2.length))
              break label849;
            this.zzgE = arrayOfInt2;
            break;
          }
          int[] arrayOfInt3 = new int[i8 + i7];
          if (i8 != 0)
            System.arraycopy(this.zzgE, 0, arrayOfInt3, 0, i8);
          System.arraycopy(arrayOfInt2, 0, arrayOfInt3, i8, i7);
          this.zzgE = arrayOfInt3;
          break;
        case 82:
          int m = paramzzwq.zzip(paramzzwq.zzvB());
          int n = paramzzwq.getPosition();
          int i1 = 0;
          while (paramzzwq.zzvG() > 0)
            switch (paramzzwq.zzvx())
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
            case 16:
            case 17:
              i1++;
            }
          if (i1 != 0)
          {
            paramzzwq.zzir(n);
            if (this.zzgE == null);
            int[] arrayOfInt1;
            for (int i2 = 0; ; i2 = this.zzgE.length)
            {
              arrayOfInt1 = new int[i1 + i2];
              if (i2 != 0)
                System.arraycopy(this.zzgE, 0, arrayOfInt1, 0, i2);
              while (paramzzwq.zzvG() > 0)
              {
                int i3 = paramzzwq.zzvx();
                switch (i3)
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
                case 16:
                case 17:
                  int i4 = i2 + 1;
                  arrayOfInt1[i2] = i3;
                  i2 = i4;
                }
              }
            }
            this.zzgE = arrayOfInt1;
          }
          paramzzwq.zziq(m);
          break;
        case 90:
          label849: int j = zzxb.zzc(paramzzwq, 90);
          if (this.zzgD == null);
          zza[] arrayOfzza1;
          for (int k = 0; ; k = this.zzgD.length)
          {
            arrayOfzza1 = new zza[j + k];
            if (k != 0)
              System.arraycopy(this.zzgD, 0, arrayOfzza1, 0, k);
            while (k < -1 + arrayOfzza1.length)
            {
              arrayOfzza1[k] = new zza();
              paramzzwq.zza(arrayOfzza1[k]);
              paramzzwq.zzvu();
              k++;
            }
          }
          arrayOfzza1[k] = new zza();
          paramzzwq.zza(arrayOfzza1[k]);
          this.zzgD = arrayOfzza1;
          break;
        case 96:
        }
        this.zzgC = paramzzwq.zzvy();
      }
    }

    public zza zzs()
    {
      this.type = 1;
      this.zzgv = "";
      this.zzgw = zzr();
      this.zzgx = zzr();
      this.zzgy = zzr();
      this.zzgz = "";
      this.zzgA = "";
      this.zzgB = 0L;
      this.zzgC = false;
      this.zzgD = zzr();
      this.zzgE = zzxb.zzaHO;
      this.zzgF = false;
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }
  }
}