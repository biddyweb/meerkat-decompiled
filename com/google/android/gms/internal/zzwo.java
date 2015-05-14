package com.google.android.gms.internal;

import java.io.IOException;

public final class zzwo extends zzws<zzwo>
{
  public String[] zzaHl;
  public int[] zzaHm;
  public byte[][] zzaHn;

  public zzwo()
  {
    zzvt();
  }

  public static zzwo zzr(byte[] paramArrayOfByte)
    throws zzwx
  {
    return (zzwo)zzwy.zza(new zzwo(), paramArrayOfByte);
  }

  public boolean equals(Object paramObject)
  {
    boolean bool2;
    if (paramObject == this)
      bool2 = true;
    zzwo localzzwo;
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
            bool1 = paramObject instanceof zzwo;
            bool2 = false;
          }
          while (!bool1);
          localzzwo = (zzwo)paramObject;
          bool3 = zzww.equals(this.zzaHl, localzzwo.zzaHl);
          bool2 = false;
        }
        while (!bool3);
        bool4 = zzww.equals(this.zzaHm, localzzwo.zzaHm);
        bool2 = false;
      }
      while (!bool4);
      bool5 = zzww.zza(this.zzaHn, localzzwo.zzaHn);
      bool2 = false;
    }
    while (!bool5);
    return zza(localzzwo);
  }

  public int hashCode()
  {
    return 31 * (31 * (31 * (527 + zzww.hashCode(this.zzaHl)) + zzww.hashCode(this.zzaHm)) + zzww.zza(this.zzaHn)) + zzvL();
  }

  public void zza(zzwr paramzzwr)
    throws IOException
  {
    if ((this.zzaHl != null) && (this.zzaHl.length > 0))
      for (int m = 0; m < this.zzaHl.length; m++)
      {
        String str = this.zzaHl[m];
        if (str != null)
          paramzzwr.zzb(1, str);
      }
    if ((this.zzaHm != null) && (this.zzaHm.length > 0))
      for (int k = 0; k < this.zzaHm.length; k++)
        paramzzwr.zzy(2, this.zzaHm[k]);
    if (this.zzaHn != null)
    {
      int i = this.zzaHn.length;
      int j = 0;
      if (i > 0)
        while (j < this.zzaHn.length)
        {
          byte[] arrayOfByte = this.zzaHn[j];
          if (arrayOfByte != null)
            paramzzwr.zza(3, arrayOfByte);
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
    if ((this.zzaHl != null) && (this.zzaHl.length > 0))
    {
      int i3 = 0;
      i4 = 0;
      i5 = 0;
      while (i3 < this.zzaHl.length)
      {
        String str = this.zzaHl[i3];
        if (str != null)
        {
          i5++;
          i4 += zzwr.zzdM(str);
        }
        i3++;
      }
    }
    for (int k = j + i4 + i5 * 1; ; k = j)
    {
      if ((this.zzaHm != null) && (this.zzaHm.length > 0))
      {
        int i1 = 0;
        int i2 = 0;
        while (i1 < this.zzaHm.length)
        {
          i2 += zzwr.zziw(this.zzaHm[i1]);
          i1++;
        }
        k = k + i2 + 1 * this.zzaHm.length;
      }
      if ((this.zzaHn != null) && (this.zzaHn.length > 0))
      {
        int m = 0;
        int n = 0;
        while (i < this.zzaHn.length)
        {
          byte[] arrayOfByte = this.zzaHn[i];
          if (arrayOfByte != null)
          {
            n++;
            m += zzwr.zzw(arrayOfByte);
          }
          i++;
        }
        k = k + m + n * 1;
      }
      return k;
    }
  }

  public zzwo zzvt()
  {
    this.zzaHl = zzxb.zzaHT;
    this.zzaHm = zzxb.zzaHO;
    this.zzaHn = zzxb.zzaHU;
    this.zzaHB = null;
    this.zzaHM = -1;
    return this;
  }

  public zzwo zzy(zzwq paramzzwq)
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
        if (this.zzaHl == null);
        String[] arrayOfString;
        for (int i6 = 0; ; i6 = this.zzaHl.length)
        {
          arrayOfString = new String[i5 + i6];
          if (i6 != 0)
            System.arraycopy(this.zzaHl, 0, arrayOfString, 0, i6);
          while (i6 < -1 + arrayOfString.length)
          {
            arrayOfString[i6] = paramzzwq.readString();
            paramzzwq.zzvu();
            i6++;
          }
        }
        arrayOfString[i6] = paramzzwq.readString();
        this.zzaHl = arrayOfString;
        break;
      case 16:
        int i3 = zzxb.zzc(paramzzwq, 16);
        if (this.zzaHm == null);
        int[] arrayOfInt2;
        for (int i4 = 0; ; i4 = this.zzaHm.length)
        {
          arrayOfInt2 = new int[i3 + i4];
          if (i4 != 0)
            System.arraycopy(this.zzaHm, 0, arrayOfInt2, 0, i4);
          while (i4 < -1 + arrayOfInt2.length)
          {
            arrayOfInt2[i4] = paramzzwq.zzvx();
            paramzzwq.zzvu();
            i4++;
          }
        }
        arrayOfInt2[i4] = paramzzwq.zzvx();
        this.zzaHm = arrayOfInt2;
        break;
      case 18:
        int m = paramzzwq.zzip(paramzzwq.zzvB());
        int n = paramzzwq.getPosition();
        for (int i1 = 0; paramzzwq.zzvG() > 0; i1++)
          paramzzwq.zzvx();
        paramzzwq.zzir(n);
        if (this.zzaHm == null);
        int[] arrayOfInt1;
        for (int i2 = 0; ; i2 = this.zzaHm.length)
        {
          arrayOfInt1 = new int[i1 + i2];
          if (i2 != 0)
            System.arraycopy(this.zzaHm, 0, arrayOfInt1, 0, i2);
          while (i2 < arrayOfInt1.length)
          {
            arrayOfInt1[i2] = paramzzwq.zzvx();
            i2++;
          }
        }
        this.zzaHm = arrayOfInt1;
        paramzzwq.zziq(m);
        break;
      case 26:
      }
      int j = zzxb.zzc(paramzzwq, 26);
      if (this.zzaHn == null);
      byte[][] arrayOfByte;
      for (int k = 0; ; k = this.zzaHn.length)
      {
        arrayOfByte = new byte[j + k][];
        if (k != 0)
          System.arraycopy(this.zzaHn, 0, arrayOfByte, 0, k);
        while (k < -1 + arrayOfByte.length)
        {
          arrayOfByte[k] = paramzzwq.readBytes();
          paramzzwq.zzvu();
          k++;
        }
      }
      arrayOfByte[k] = paramzzwq.readBytes();
      this.zzaHn = arrayOfByte;
    }
  }
}