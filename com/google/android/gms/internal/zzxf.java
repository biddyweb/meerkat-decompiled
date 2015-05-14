package com.google.android.gms.internal;

import java.io.IOException;
import java.util.Arrays;

public abstract interface zzxf
{
  public static final class zza extends zzws<zza>
  {
    public String[] zzaIP;
    public String[] zzaIQ;
    public int[] zzaIR;

    public zza()
    {
      zzwo();
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zza localzza;
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
              bool1 = paramObject instanceof zza;
              bool2 = false;
            }
            while (!bool1);
            localzza = (zza)paramObject;
            bool3 = zzww.equals(this.zzaIP, localzza.zzaIP);
            bool2 = false;
          }
          while (!bool3);
          bool4 = zzww.equals(this.zzaIQ, localzza.zzaIQ);
          bool2 = false;
        }
        while (!bool4);
        bool5 = zzww.equals(this.zzaIR, localzza.zzaIR);
        bool2 = false;
      }
      while (!bool5);
      return zza(localzza);
    }

    public int hashCode()
    {
      return 31 * (31 * (31 * (527 + zzww.hashCode(this.zzaIP)) + zzww.hashCode(this.zzaIQ)) + zzww.hashCode(this.zzaIR)) + zzvL();
    }

    public zza zzK(zzwq paramzzwq)
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
          int i5 = zzxb.zzc(paramzzwq, 10);
          if (this.zzaIP == null);
          String[] arrayOfString2;
          for (int i6 = 0; ; i6 = this.zzaIP.length)
          {
            arrayOfString2 = new String[i5 + i6];
            if (i6 != 0)
              System.arraycopy(this.zzaIP, 0, arrayOfString2, 0, i6);
            while (i6 < -1 + arrayOfString2.length)
            {
              arrayOfString2[i6] = paramzzwq.readString();
              paramzzwq.zzvu();
              i6++;
            }
          }
          arrayOfString2[i6] = paramzzwq.readString();
          this.zzaIP = arrayOfString2;
          break;
        case 18:
          int i3 = zzxb.zzc(paramzzwq, 18);
          if (this.zzaIQ == null);
          String[] arrayOfString1;
          for (int i4 = 0; ; i4 = this.zzaIQ.length)
          {
            arrayOfString1 = new String[i3 + i4];
            if (i4 != 0)
              System.arraycopy(this.zzaIQ, 0, arrayOfString1, 0, i4);
            while (i4 < -1 + arrayOfString1.length)
            {
              arrayOfString1[i4] = paramzzwq.readString();
              paramzzwq.zzvu();
              i4++;
            }
          }
          arrayOfString1[i4] = paramzzwq.readString();
          this.zzaIQ = arrayOfString1;
          break;
        case 24:
          int i1 = zzxb.zzc(paramzzwq, 24);
          if (this.zzaIR == null);
          int[] arrayOfInt2;
          for (int i2 = 0; ; i2 = this.zzaIR.length)
          {
            arrayOfInt2 = new int[i1 + i2];
            if (i2 != 0)
              System.arraycopy(this.zzaIR, 0, arrayOfInt2, 0, i2);
            while (i2 < -1 + arrayOfInt2.length)
            {
              arrayOfInt2[i2] = paramzzwq.zzvx();
              paramzzwq.zzvu();
              i2++;
            }
          }
          arrayOfInt2[i2] = paramzzwq.zzvx();
          this.zzaIR = arrayOfInt2;
          break;
        case 26:
        }
        int j = paramzzwq.zzip(paramzzwq.zzvB());
        int k = paramzzwq.getPosition();
        for (int m = 0; paramzzwq.zzvG() > 0; m++)
          paramzzwq.zzvx();
        paramzzwq.zzir(k);
        if (this.zzaIR == null);
        int[] arrayOfInt1;
        for (int n = 0; ; n = this.zzaIR.length)
        {
          arrayOfInt1 = new int[m + n];
          if (n != 0)
            System.arraycopy(this.zzaIR, 0, arrayOfInt1, 0, n);
          while (n < arrayOfInt1.length)
          {
            arrayOfInt1[n] = paramzzwq.zzvx();
            n++;
          }
        }
        this.zzaIR = arrayOfInt1;
        paramzzwq.zziq(j);
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if ((this.zzaIP != null) && (this.zzaIP.length > 0))
        for (int m = 0; m < this.zzaIP.length; m++)
        {
          String str2 = this.zzaIP[m];
          if (str2 != null)
            paramzzwr.zzb(1, str2);
        }
      if ((this.zzaIQ != null) && (this.zzaIQ.length > 0))
        for (int k = 0; k < this.zzaIQ.length; k++)
        {
          String str1 = this.zzaIQ[k];
          if (str1 != null)
            paramzzwr.zzb(2, str1);
        }
      if (this.zzaIR != null)
      {
        int i = this.zzaIR.length;
        int j = 0;
        if (i > 0)
          while (j < this.zzaIR.length)
          {
            paramzzwr.zzy(3, this.zzaIR[j]);
            j++;
          }
      }
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = 0;
      int j = super.zzc();
      int i4;
      int i5;
      if ((this.zzaIP != null) && (this.zzaIP.length > 0))
      {
        int i3 = 0;
        i4 = 0;
        i5 = 0;
        while (i3 < this.zzaIP.length)
        {
          String str2 = this.zzaIP[i3];
          if (str2 != null)
          {
            i5++;
            i4 += zzwr.zzdM(str2);
          }
          i3++;
        }
      }
      for (int k = j + i4 + i5 * 1; ; k = j)
      {
        if ((this.zzaIQ != null) && (this.zzaIQ.length > 0))
        {
          int n = 0;
          int i1 = 0;
          int i2 = 0;
          while (n < this.zzaIQ.length)
          {
            String str1 = this.zzaIQ[n];
            if (str1 != null)
            {
              i2++;
              i1 += zzwr.zzdM(str1);
            }
            n++;
          }
          k = k + i1 + i2 * 1;
        }
        if ((this.zzaIR != null) && (this.zzaIR.length > 0))
        {
          int m = 0;
          while (i < this.zzaIR.length)
          {
            m += zzwr.zziw(this.zzaIR[i]);
            i++;
          }
          k = k + m + 1 * this.zzaIR.length;
        }
        return k;
      }
    }

    public zza zzwo()
    {
      this.zzaIP = zzxb.zzaHT;
      this.zzaIQ = zzxb.zzaHT;
      this.zzaIR = zzxb.zzaHO;
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zzb extends zzws<zzb>
  {
    public String version;
    public int zzaIS;
    public String zzaIT;

    public zzb()
    {
      zzwp();
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zzb localzzb;
      do
      {
        String str2;
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
              bool1 = paramObject instanceof zzb;
              bool2 = false;
            }
            while (!bool1);
            localzzb = (zzb)paramObject;
            i = this.zzaIS;
            j = localzzb.zzaIS;
            bool2 = false;
          }
          while (i != j);
          if (this.zzaIT != null)
            break;
          str2 = localzzb.zzaIT;
          bool2 = false;
        }
        while (str2 != null);
        if (this.version != null)
          break label114;
        str1 = localzzb.version;
        bool2 = false;
      }
      while (str1 != null);
      label114: 
      while (this.version.equals(localzzb.version))
      {
        String str1;
        return zza(localzzb);
        if (this.zzaIT.equals(localzzb.zzaIT))
          break;
        return false;
      }
      return false;
    }

    public int hashCode()
    {
      int i = 31 * (527 + this.zzaIS);
      int j;
      int k;
      int m;
      if (this.zzaIT == null)
      {
        j = 0;
        k = 31 * (j + i);
        String str = this.version;
        m = 0;
        if (str != null)
          break label66;
      }
      while (true)
      {
        return 31 * (k + m) + zzvL();
        j = this.zzaIT.hashCode();
        break;
        label66: m = this.version.hashCode();
      }
    }

    public zzb zzL(zzwq paramzzwq)
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
          case 0:
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
          case 18:
          case 19:
          case 20:
          case 21:
          case 22:
          case 23:
          case 24:
          case 25:
          }
          this.zzaIS = j;
          break;
        case 18:
          this.zzaIT = paramzzwq.readString();
          break;
        case 26:
        }
        this.version = paramzzwq.readString();
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (this.zzaIS != 0)
        paramzzwr.zzy(1, this.zzaIS);
      if (!this.zzaIT.equals(""))
        paramzzwr.zzb(2, this.zzaIT);
      if (!this.version.equals(""))
        paramzzwr.zzb(3, this.version);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if (this.zzaIS != 0)
        i += zzwr.zzA(1, this.zzaIS);
      if (!this.zzaIT.equals(""))
        i += zzwr.zzj(2, this.zzaIT);
      if (!this.version.equals(""))
        i += zzwr.zzj(3, this.version);
      return i;
    }

    public zzb zzwp()
    {
      this.zzaIS = 0;
      this.zzaIT = "";
      this.version = "";
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zzc extends zzws<zzc>
  {
    public byte[] zzaIU;
    public byte[][] zzaIV;
    public boolean zzaIW;

    public zzc()
    {
      zzwq();
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zzc localzzc;
      boolean bool5;
      boolean bool6;
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
              bool1 = paramObject instanceof zzc;
              bool2 = false;
            }
            while (!bool1);
            localzzc = (zzc)paramObject;
            bool3 = Arrays.equals(this.zzaIU, localzzc.zzaIU);
            bool2 = false;
          }
          while (!bool3);
          bool4 = zzww.zza(this.zzaIV, localzzc.zzaIV);
          bool2 = false;
        }
        while (!bool4);
        bool5 = this.zzaIW;
        bool6 = localzzc.zzaIW;
        bool2 = false;
      }
      while (bool5 != bool6);
      return zza(localzzc);
    }

    public int hashCode()
    {
      int i = 31 * (31 * (527 + Arrays.hashCode(this.zzaIU)) + zzww.zza(this.zzaIV));
      if (this.zzaIW);
      for (int j = 1231; ; j = 1237)
        return 31 * (j + i) + zzvL();
    }

    public zzc zzM(zzwq paramzzwq)
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
          this.zzaIU = paramzzwq.readBytes();
          break;
        case 18:
          int j = zzxb.zzc(paramzzwq, 18);
          if (this.zzaIV == null);
          byte[][] arrayOfByte;
          for (int k = 0; ; k = this.zzaIV.length)
          {
            arrayOfByte = new byte[j + k][];
            if (k != 0)
              System.arraycopy(this.zzaIV, 0, arrayOfByte, 0, k);
            while (k < -1 + arrayOfByte.length)
            {
              arrayOfByte[k] = paramzzwq.readBytes();
              paramzzwq.zzvu();
              k++;
            }
          }
          arrayOfByte[k] = paramzzwq.readBytes();
          this.zzaIV = arrayOfByte;
          break;
        case 24:
        }
        this.zzaIW = paramzzwq.zzvy();
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (!Arrays.equals(this.zzaIU, zzxb.zzaHV))
        paramzzwr.zza(1, this.zzaIU);
      if ((this.zzaIV != null) && (this.zzaIV.length > 0))
        for (int i = 0; i < this.zzaIV.length; i++)
        {
          byte[] arrayOfByte = this.zzaIV[i];
          if (arrayOfByte != null)
            paramzzwr.zza(2, arrayOfByte);
        }
      if (this.zzaIW)
        paramzzwr.zzb(3, this.zzaIW);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = 0;
      int j = super.zzc();
      if (!Arrays.equals(this.zzaIU, zzxb.zzaHV))
        j += zzwr.zzb(1, this.zzaIU);
      if ((this.zzaIV != null) && (this.zzaIV.length > 0))
      {
        int k = 0;
        int m = 0;
        while (i < this.zzaIV.length)
        {
          byte[] arrayOfByte = this.zzaIV[i];
          if (arrayOfByte != null)
          {
            m++;
            k += zzwr.zzw(arrayOfByte);
          }
          i++;
        }
        j = j + k + m * 1;
      }
      if (this.zzaIW)
        j += zzwr.zzc(3, this.zzaIW);
      return j;
    }

    public zzc zzwq()
    {
      this.zzaIU = zzxb.zzaHV;
      this.zzaIV = zzxb.zzaHU;
      this.zzaIW = false;
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zzd extends zzws<zzd>
  {
    public String tag;
    public long zzaIX;
    public int zzaIY;
    public int zzaIZ;
    public boolean zzaJa;
    public zzxf.zze[] zzaJb;
    public zzxf.zzb zzaJc;
    public byte[] zzaJd;
    public byte[] zzaJe;
    public byte[] zzaJf;
    public zzxf.zza zzaJg;
    public String zzaJh;
    public long zzaJi;
    public zzxf.zzc zzaJj;

    public zzd()
    {
      zzwr();
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zzd localzzd;
      label174: 
      do
      {
        boolean bool10;
        do
        {
          String str1;
          do
          {
            zzxf.zza localzza;
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
                    zzxf.zzb localzzb;
                    do
                    {
                      boolean bool6;
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
                              String str2;
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
                                  bool3 = this.zzaIX < localzzd.zzaIX;
                                  bool2 = false;
                                }
                                while (bool3);
                                if (this.tag != null)
                                  break;
                                str2 = localzzd.tag;
                                bool2 = false;
                              }
                              while (str2 != null);
                              i = this.zzaIY;
                              j = localzzd.zzaIY;
                              bool2 = false;
                            }
                            while (i != j);
                            k = this.zzaIZ;
                            m = localzzd.zzaIZ;
                            bool2 = false;
                          }
                          while (k != m);
                          bool4 = this.zzaJa;
                          bool5 = localzzd.zzaJa;
                          bool2 = false;
                        }
                        while (bool4 != bool5);
                        bool6 = zzww.equals(this.zzaJb, localzzd.zzaJb);
                        bool2 = false;
                      }
                      while (!bool6);
                      if (this.zzaJc != null)
                        break label343;
                      localzzb = localzzd.zzaJc;
                      bool2 = false;
                    }
                    while (localzzb != null);
                    bool7 = Arrays.equals(this.zzaJd, localzzd.zzaJd);
                    bool2 = false;
                  }
                  while (!bool7);
                  bool8 = Arrays.equals(this.zzaJe, localzzd.zzaJe);
                  bool2 = false;
                }
                while (!bool8);
                bool9 = Arrays.equals(this.zzaJf, localzzd.zzaJf);
                bool2 = false;
              }
              while (!bool9);
              if (this.zzaJg != null)
                break label360;
              localzza = localzzd.zzaJg;
              bool2 = false;
            }
            while (localzza != null);
            if (this.zzaJh != null)
              break label377;
            str1 = localzzd.zzaJh;
            bool2 = false;
          }
          while (str1 != null);
          bool10 = this.zzaJi < localzzd.zzaJi;
          bool2 = false;
        }
        while (bool10);
        if (this.zzaJj != null)
          break label394;
        localzzc = localzzd.zzaJj;
        bool2 = false;
      }
      while (localzzc != null);
      label258: label279: label343: label360: label377: 
      while (this.zzaJj.equals(localzzd.zzaJj))
      {
        zzxf.zzc localzzc;
        return zza(localzzd);
        if (this.tag.equals(localzzd.tag))
          break;
        return false;
        if (this.zzaJc.equals(localzzd.zzaJc))
          break label174;
        return false;
        if (this.zzaJg.equals(localzzd.zzaJg))
          break label258;
        return false;
        if (this.zzaJh.equals(localzzd.zzaJh))
          break label279;
        return false;
      }
      label394: return false;
    }

    public int hashCode()
    {
      int i = 31 * (527 + (int)(this.zzaIX ^ this.zzaIX >>> 32));
      int j;
      int m;
      label65: int i1;
      label95: int i3;
      label148: int i5;
      label168: int i6;
      int i7;
      if (this.tag == null)
      {
        j = 0;
        int k = 31 * (31 * (31 * (j + i) + this.zzaIY) + this.zzaIZ);
        if (!this.zzaJa)
          break label234;
        m = 1231;
        int n = 31 * (31 * (m + k) + zzww.hashCode(this.zzaJb));
        if (this.zzaJc != null)
          break label242;
        i1 = 0;
        int i2 = 31 * (31 * (31 * (31 * (i1 + n) + Arrays.hashCode(this.zzaJd)) + Arrays.hashCode(this.zzaJe)) + Arrays.hashCode(this.zzaJf));
        if (this.zzaJg != null)
          break label254;
        i3 = 0;
        int i4 = 31 * (i3 + i2);
        if (this.zzaJh != null)
          break label266;
        i5 = 0;
        i6 = 31 * (31 * (i5 + i4) + (int)(this.zzaJi ^ this.zzaJi >>> 32));
        zzxf.zzc localzzc = this.zzaJj;
        i7 = 0;
        if (localzzc != null)
          break label278;
      }
      while (true)
      {
        return 31 * (i6 + i7) + zzvL();
        j = this.tag.hashCode();
        break;
        label234: m = 1237;
        break label65;
        label242: i1 = this.zzaJc.hashCode();
        break label95;
        label254: i3 = this.zzaJg.hashCode();
        break label148;
        label266: i5 = this.zzaJh.hashCode();
        break label168;
        label278: i7 = this.zzaJj.hashCode();
      }
    }

    public zzd zzN(zzwq paramzzwq)
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
          this.zzaIX = paramzzwq.zzvw();
          break;
        case 18:
          this.tag = paramzzwq.readString();
          break;
        case 26:
          int j = zzxb.zzc(paramzzwq, 26);
          if (this.zzaJb == null);
          zzxf.zze[] arrayOfzze;
          for (int k = 0; ; k = this.zzaJb.length)
          {
            arrayOfzze = new zzxf.zze[j + k];
            if (k != 0)
              System.arraycopy(this.zzaJb, 0, arrayOfzze, 0, k);
            while (k < -1 + arrayOfzze.length)
            {
              arrayOfzze[k] = new zzxf.zze();
              paramzzwq.zza(arrayOfzze[k]);
              paramzzwq.zzvu();
              k++;
            }
          }
          arrayOfzze[k] = new zzxf.zze();
          paramzzwq.zza(arrayOfzze[k]);
          this.zzaJb = arrayOfzze;
          break;
        case 50:
          this.zzaJd = paramzzwq.readBytes();
          break;
        case 58:
          if (this.zzaJg == null)
            this.zzaJg = new zzxf.zza();
          paramzzwq.zza(this.zzaJg);
          break;
        case 66:
          this.zzaJe = paramzzwq.readBytes();
          break;
        case 74:
          if (this.zzaJc == null)
            this.zzaJc = new zzxf.zzb();
          paramzzwq.zza(this.zzaJc);
          break;
        case 80:
          this.zzaJa = paramzzwq.zzvy();
          break;
        case 88:
          this.zzaIY = paramzzwq.zzvx();
          break;
        case 96:
          this.zzaIZ = paramzzwq.zzvx();
          break;
        case 106:
          this.zzaJf = paramzzwq.readBytes();
          break;
        case 114:
          this.zzaJh = paramzzwq.readString();
          break;
        case 120:
          this.zzaJi = paramzzwq.zzvA();
          break;
        case 130:
        }
        if (this.zzaJj == null)
          this.zzaJj = new zzxf.zzc();
        paramzzwq.zza(this.zzaJj);
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (this.zzaIX != 0L)
        paramzzwr.zzb(1, this.zzaIX);
      if (!this.tag.equals(""))
        paramzzwr.zzb(2, this.tag);
      if ((this.zzaJb != null) && (this.zzaJb.length > 0))
        for (int i = 0; i < this.zzaJb.length; i++)
        {
          zzxf.zze localzze = this.zzaJb[i];
          if (localzze != null)
            paramzzwr.zza(3, localzze);
        }
      if (!Arrays.equals(this.zzaJd, zzxb.zzaHV))
        paramzzwr.zza(6, this.zzaJd);
      if (this.zzaJg != null)
        paramzzwr.zza(7, this.zzaJg);
      if (!Arrays.equals(this.zzaJe, zzxb.zzaHV))
        paramzzwr.zza(8, this.zzaJe);
      if (this.zzaJc != null)
        paramzzwr.zza(9, this.zzaJc);
      if (this.zzaJa)
        paramzzwr.zzb(10, this.zzaJa);
      if (this.zzaIY != 0)
        paramzzwr.zzy(11, this.zzaIY);
      if (this.zzaIZ != 0)
        paramzzwr.zzy(12, this.zzaIZ);
      if (!Arrays.equals(this.zzaJf, zzxb.zzaHV))
        paramzzwr.zza(13, this.zzaJf);
      if (!this.zzaJh.equals(""))
        paramzzwr.zzb(14, this.zzaJh);
      if (this.zzaJi != 180000L)
        paramzzwr.zzc(15, this.zzaJi);
      if (this.zzaJj != null)
        paramzzwr.zza(16, this.zzaJj);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if (this.zzaIX != 0L)
        i += zzwr.zzd(1, this.zzaIX);
      if (!this.tag.equals(""))
        i += zzwr.zzj(2, this.tag);
      if ((this.zzaJb != null) && (this.zzaJb.length > 0))
      {
        int j = i;
        for (int k = 0; k < this.zzaJb.length; k++)
        {
          zzxf.zze localzze = this.zzaJb[k];
          if (localzze != null)
            j += zzwr.zzc(3, localzze);
        }
        i = j;
      }
      if (!Arrays.equals(this.zzaJd, zzxb.zzaHV))
        i += zzwr.zzb(6, this.zzaJd);
      if (this.zzaJg != null)
        i += zzwr.zzc(7, this.zzaJg);
      if (!Arrays.equals(this.zzaJe, zzxb.zzaHV))
        i += zzwr.zzb(8, this.zzaJe);
      if (this.zzaJc != null)
        i += zzwr.zzc(9, this.zzaJc);
      if (this.zzaJa)
        i += zzwr.zzc(10, this.zzaJa);
      if (this.zzaIY != 0)
        i += zzwr.zzA(11, this.zzaIY);
      if (this.zzaIZ != 0)
        i += zzwr.zzA(12, this.zzaIZ);
      if (!Arrays.equals(this.zzaJf, zzxb.zzaHV))
        i += zzwr.zzb(13, this.zzaJf);
      if (!this.zzaJh.equals(""))
        i += zzwr.zzj(14, this.zzaJh);
      if (this.zzaJi != 180000L)
        i += zzwr.zze(15, this.zzaJi);
      if (this.zzaJj != null)
        i += zzwr.zzc(16, this.zzaJj);
      return i;
    }

    public zzd zzwr()
    {
      this.zzaIX = 0L;
      this.tag = "";
      this.zzaIY = 0;
      this.zzaIZ = 0;
      this.zzaJa = false;
      this.zzaJb = zzxf.zze.zzws();
      this.zzaJc = null;
      this.zzaJd = zzxb.zzaHV;
      this.zzaJe = zzxb.zzaHV;
      this.zzaJf = zzxb.zzaHV;
      this.zzaJg = null;
      this.zzaJh = "";
      this.zzaJi = 180000L;
      this.zzaJj = null;
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zze extends zzws<zze>
  {
    private static volatile zze[] zzaJk;
    public String value;
    public String zzfv;

    public zze()
    {
      zzwt();
    }

    public static zze[] zzws()
    {
      if (zzaJk == null);
      synchronized (zzww.zzaHL)
      {
        if (zzaJk == null)
          zzaJk = new zze[0];
        return zzaJk;
      }
    }

    public boolean equals(Object paramObject)
    {
      boolean bool2;
      if (paramObject == this)
        bool2 = true;
      zze localzze;
      do
      {
        String str2;
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
          if (this.zzfv != null)
            break;
          str2 = localzze.zzfv;
          bool2 = false;
        }
        while (str2 != null);
        if (this.value != null)
          break label92;
        str1 = localzze.value;
        bool2 = false;
      }
      while (str1 != null);
      label92: 
      while (this.value.equals(localzze.value))
      {
        String str1;
        return zza(localzze);
        if (this.zzfv.equals(localzze.zzfv))
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
      if (this.zzfv == null)
      {
        i = 0;
        j = 31 * (i + 527);
        String str = this.value;
        k = 0;
        if (str != null)
          break label54;
      }
      while (true)
      {
        return 31 * (j + k) + zzvL();
        i = this.zzfv.hashCode();
        break;
        label54: k = this.value.hashCode();
      }
    }

    public zze zzO(zzwq paramzzwq)
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
        case 18:
        }
        this.value = paramzzwq.readString();
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (!this.zzfv.equals(""))
        paramzzwr.zzb(1, this.zzfv);
      if (!this.value.equals(""))
        paramzzwr.zzb(2, this.value);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if (!this.zzfv.equals(""))
        i += zzwr.zzj(1, this.zzfv);
      if (!this.value.equals(""))
        i += zzwr.zzj(2, this.value);
      return i;
    }

    public zze zzwt()
    {
      this.zzfv = "";
      this.value = "";
      this.zzaHB = null;
      this.zzaHM = -1;
      return this;
    }
  }
}