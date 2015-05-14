package com.google.android.gms.internal;

import java.io.IOException;

public abstract class zzwy
{
  protected volatile int zzaHM = -1;

  public static final <T extends zzwy> T zza(T paramT, byte[] paramArrayOfByte)
    throws zzwx
  {
    return zzb(paramT, paramArrayOfByte, 0, paramArrayOfByte.length);
  }

  public static final void zza(zzwy paramzzwy, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    try
    {
      zzwr localzzwr = zzwr.zzb(paramArrayOfByte, paramInt1, paramInt2);
      paramzzwy.zza(localzzwr);
      localzzwr.zzvK();
      return;
    }
    catch (IOException localIOException)
    {
      throw new RuntimeException("Serializing to a byte array threw an IOException (should never happen).", localIOException);
    }
  }

  public static final <T extends zzwy> T zzb(T paramT, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws zzwx
  {
    try
    {
      zzwq localzzwq = zzwq.zza(paramArrayOfByte, paramInt1, paramInt2);
      paramT.zzb(localzzwq);
      localzzwq.zzim(0);
      return paramT;
    }
    catch (zzwx localzzwx)
    {
      throw localzzwx;
    }
    catch (IOException localIOException)
    {
    }
    throw new RuntimeException("Reading from a byte array threw an IOException (should never happen).");
  }

  public static final byte[] zzf(zzwy paramzzwy)
  {
    byte[] arrayOfByte = new byte[paramzzwy.zzvY()];
    zza(paramzzwy, arrayOfByte, 0, arrayOfByte.length);
    return arrayOfByte;
  }

  public String toString()
  {
    return zzwz.zzg(this);
  }

  public void zza(zzwr paramzzwr)
    throws IOException
  {
  }

  public abstract zzwy zzb(zzwq paramzzwq)
    throws IOException;

  protected int zzc()
  {
    return 0;
  }

  public zzwy zzvN()
    throws CloneNotSupportedException
  {
    return (zzwy)super.clone();
  }

  public int zzvX()
  {
    if (this.zzaHM < 0)
      zzvY();
    return this.zzaHM;
  }

  public int zzvY()
  {
    int i = zzc();
    this.zzaHM = i;
    return i;
  }
}