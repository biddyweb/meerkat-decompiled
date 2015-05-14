package com.google.android.gms.internal;

import java.io.IOException;

class zzp
  implements zzn
{
  private zzwr zzlb;
  private byte[] zzlc;
  private final int zzld;

  public zzp(int paramInt)
  {
    this.zzld = paramInt;
    reset();
  }

  public void reset()
  {
    this.zzlc = new byte[this.zzld];
    this.zzlb = zzwr.zzu(this.zzlc);
  }

  public byte[] zzD()
    throws IOException
  {
    int i = this.zzlb.zzvJ();
    if (i < 0)
      throw new IOException();
    if (i == 0)
      return this.zzlc;
    byte[] arrayOfByte = new byte[this.zzlc.length - i];
    System.arraycopy(this.zzlc, 0, arrayOfByte, 0, arrayOfByte.length);
    return arrayOfByte;
  }

  public void zzb(int paramInt, long paramLong)
    throws IOException
  {
    this.zzlb.zzb(paramInt, paramLong);
  }

  public void zzb(int paramInt, String paramString)
    throws IOException
  {
    this.zzlb.zzb(paramInt, paramString);
  }
}