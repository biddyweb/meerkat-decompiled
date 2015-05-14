package com.google.android.gms.internal;

import java.io.IOException;

public final class zzwq
{
  private final byte[] buffer;
  private int zzaHr;
  private int zzaHs;
  private int zzaHt;
  private int zzaHu;
  private int zzaHv;
  private int zzaHw = 2147483647;
  private int zzaHx;
  private int zzaHy = 64;
  private int zzaHz = 67108864;

  private zzwq(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    this.buffer = paramArrayOfByte;
    this.zzaHr = paramInt1;
    this.zzaHs = (paramInt1 + paramInt2);
    this.zzaHu = paramInt1;
  }

  public static long zzK(long paramLong)
  {
    return paramLong >>> 1 ^ -(1L & paramLong);
  }

  public static zzwq zza(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    return new zzwq(paramArrayOfByte, paramInt1, paramInt2);
  }

  public static int zzio(int paramInt)
  {
    return paramInt >>> 1 ^ -(paramInt & 0x1);
  }

  public static zzwq zzt(byte[] paramArrayOfByte)
  {
    return zza(paramArrayOfByte, 0, paramArrayOfByte.length);
  }

  private void zzvF()
  {
    this.zzaHs += this.zzaHt;
    int i = this.zzaHs;
    if (i > this.zzaHw)
    {
      this.zzaHt = (i - this.zzaHw);
      this.zzaHs -= this.zzaHt;
      return;
    }
    this.zzaHt = 0;
  }

  public int getPosition()
  {
    return this.zzaHu - this.zzaHr;
  }

  public byte[] readBytes()
    throws IOException
  {
    int i = zzvB();
    if ((i <= this.zzaHs - this.zzaHu) && (i > 0))
    {
      byte[] arrayOfByte = new byte[i];
      System.arraycopy(this.buffer, this.zzaHu, arrayOfByte, 0, i);
      this.zzaHu = (i + this.zzaHu);
      return arrayOfByte;
    }
    return zzis(i);
  }

  public double readDouble()
    throws IOException
  {
    return Double.longBitsToDouble(zzvE());
  }

  public float readFloat()
    throws IOException
  {
    return Float.intBitsToFloat(zzvD());
  }

  public String readString()
    throws IOException
  {
    int i = zzvB();
    if ((i <= this.zzaHs - this.zzaHu) && (i > 0))
    {
      String str = new String(this.buffer, this.zzaHu, i, "UTF-8");
      this.zzaHu = (i + this.zzaHu);
      return str;
    }
    return new String(zzis(i), "UTF-8");
  }

  public void zza(zzwy paramzzwy)
    throws IOException
  {
    int i = zzvB();
    if (this.zzaHx >= this.zzaHy)
      throw zzwx.zzvW();
    int j = zzip(i);
    this.zzaHx = (1 + this.zzaHx);
    paramzzwy.zzb(this);
    zzim(0);
    this.zzaHx = (-1 + this.zzaHx);
    zziq(j);
  }

  public void zza(zzwy paramzzwy, int paramInt)
    throws IOException
  {
    if (this.zzaHx >= this.zzaHy)
      throw zzwx.zzvW();
    this.zzaHx = (1 + this.zzaHx);
    paramzzwy.zzb(this);
    zzim(zzxb.zzD(paramInt, 4));
    this.zzaHx = (-1 + this.zzaHx);
  }

  public void zzim(int paramInt)
    throws zzwx
  {
    if (this.zzaHv != paramInt)
      throw zzwx.zzvU();
  }

  public boolean zzin(int paramInt)
    throws IOException
  {
    switch (zzxb.zziH(paramInt))
    {
    default:
      throw zzwx.zzvV();
    case 0:
      zzvx();
      return true;
    case 1:
      zzvE();
      return true;
    case 2:
      zzit(zzvB());
      return true;
    case 3:
      zzvv();
      zzim(zzxb.zzD(zzxb.zziI(paramInt), 4));
      return true;
    case 4:
      return false;
    case 5:
    }
    zzvD();
    return true;
  }

  public int zzip(int paramInt)
    throws zzwx
  {
    if (paramInt < 0)
      throw zzwx.zzvR();
    int i = paramInt + this.zzaHu;
    int j = this.zzaHw;
    if (i > j)
      throw zzwx.zzvQ();
    this.zzaHw = i;
    zzvF();
    return j;
  }

  public void zziq(int paramInt)
  {
    this.zzaHw = paramInt;
    zzvF();
  }

  public void zzir(int paramInt)
  {
    if (paramInt > this.zzaHu - this.zzaHr)
      throw new IllegalArgumentException("Position " + paramInt + " is beyond current " + (this.zzaHu - this.zzaHr));
    if (paramInt < 0)
      throw new IllegalArgumentException("Bad position " + paramInt);
    this.zzaHu = (paramInt + this.zzaHr);
  }

  public byte[] zzis(int paramInt)
    throws IOException
  {
    if (paramInt < 0)
      throw zzwx.zzvR();
    if (paramInt + this.zzaHu > this.zzaHw)
    {
      zzit(this.zzaHw - this.zzaHu);
      throw zzwx.zzvQ();
    }
    if (paramInt <= this.zzaHs - this.zzaHu)
    {
      byte[] arrayOfByte = new byte[paramInt];
      System.arraycopy(this.buffer, this.zzaHu, arrayOfByte, 0, paramInt);
      this.zzaHu = (paramInt + this.zzaHu);
      return arrayOfByte;
    }
    throw zzwx.zzvQ();
  }

  public void zzit(int paramInt)
    throws IOException
  {
    if (paramInt < 0)
      throw zzwx.zzvR();
    if (paramInt + this.zzaHu > this.zzaHw)
    {
      zzit(this.zzaHw - this.zzaHu);
      throw zzwx.zzvQ();
    }
    if (paramInt <= this.zzaHs - this.zzaHu)
    {
      this.zzaHu = (paramInt + this.zzaHu);
      return;
    }
    throw zzwx.zzvQ();
  }

  public long zzvA()
    throws IOException
  {
    return zzK(zzvC());
  }

  public int zzvB()
    throws IOException
  {
    int i = zzvI();
    if (i >= 0);
    int i4;
    do
    {
      return i;
      int j = i & 0x7F;
      int k = zzvI();
      if (k >= 0)
        return j | k << 7;
      int m = j | (k & 0x7F) << 7;
      int n = zzvI();
      if (n >= 0)
        return m | n << 14;
      int i1 = m | (n & 0x7F) << 14;
      int i2 = zzvI();
      if (i2 >= 0)
        return i1 | i2 << 21;
      int i3 = i1 | (i2 & 0x7F) << 21;
      i4 = zzvI();
      i = i3 | i4 << 28;
    }
    while (i4 >= 0);
    for (int i5 = 0; ; i5++)
    {
      if (i5 >= 5)
        break label151;
      if (zzvI() >= 0)
        break;
    }
    label151: throw zzwx.zzvS();
  }

  public long zzvC()
    throws IOException
  {
    int i = 0;
    long l = 0L;
    while (i < 64)
    {
      int j = zzvI();
      l |= (j & 0x7F) << i;
      if ((j & 0x80) == 0)
        return l;
      i += 7;
    }
    throw zzwx.zzvS();
  }

  public int zzvD()
    throws IOException
  {
    int i = zzvI();
    int j = zzvI();
    int k = zzvI();
    int m = zzvI();
    return i & 0xFF | (j & 0xFF) << 8 | (k & 0xFF) << 16 | (m & 0xFF) << 24;
  }

  public long zzvE()
    throws IOException
  {
    int i = zzvI();
    int j = zzvI();
    int k = zzvI();
    int m = zzvI();
    int n = zzvI();
    int i1 = zzvI();
    int i2 = zzvI();
    int i3 = zzvI();
    return 0xFF & i | (0xFF & j) << 8 | (0xFF & k) << 16 | (0xFF & m) << 24 | (0xFF & n) << 32 | (0xFF & i1) << 40 | (0xFF & i2) << 48 | (0xFF & i3) << 56;
  }

  public int zzvG()
  {
    if (this.zzaHw == 2147483647)
      return -1;
    int i = this.zzaHu;
    return this.zzaHw - i;
  }

  public boolean zzvH()
  {
    return this.zzaHu == this.zzaHs;
  }

  public byte zzvI()
    throws IOException
  {
    if (this.zzaHu == this.zzaHs)
      throw zzwx.zzvQ();
    byte[] arrayOfByte = this.buffer;
    int i = this.zzaHu;
    this.zzaHu = (i + 1);
    return arrayOfByte[i];
  }

  public int zzvu()
    throws IOException
  {
    if (zzvH())
    {
      this.zzaHv = 0;
      return 0;
    }
    this.zzaHv = zzvB();
    if (this.zzaHv == 0)
      throw zzwx.zzvT();
    return this.zzaHv;
  }

  public void zzvv()
    throws IOException
  {
    int i;
    do
      i = zzvu();
    while ((i != 0) && (zzin(i)));
  }

  public long zzvw()
    throws IOException
  {
    return zzvC();
  }

  public int zzvx()
    throws IOException
  {
    return zzvB();
  }

  public boolean zzvy()
    throws IOException
  {
    return zzvB() != 0;
  }

  public int zzvz()
    throws IOException
  {
    return zzio(zzvB());
  }

  public byte[] zzx(int paramInt1, int paramInt2)
  {
    if (paramInt2 == 0)
      return zzxb.zzaHV;
    byte[] arrayOfByte = new byte[paramInt2];
    int i = paramInt1 + this.zzaHr;
    System.arraycopy(this.buffer, i, arrayOfByte, 0, paramInt2);
    return arrayOfByte;
  }
}