package com.google.android.gms.internal;

import java.io.IOException;
import java.util.Arrays;

final class zzxa
{
  final int tag;
  final byte[] zzaHN;

  zzxa(int paramInt, byte[] paramArrayOfByte)
  {
    this.tag = paramInt;
    this.zzaHN = paramArrayOfByte;
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    zzxa localzzxa;
    do
    {
      return true;
      if (!(paramObject instanceof zzxa))
        return false;
      localzzxa = (zzxa)paramObject;
    }
    while ((this.tag == localzzxa.tag) && (Arrays.equals(this.zzaHN, localzzxa.zzaHN)));
    return false;
  }

  public int hashCode()
  {
    return 31 * (527 + this.tag) + Arrays.hashCode(this.zzaHN);
  }

  void zza(zzwr paramzzwr)
    throws IOException
  {
    paramzzwr.zziA(this.tag);
    paramzzwr.zzx(this.zzaHN);
  }

  int zzc()
  {
    return 0 + zzwr.zziB(this.tag) + this.zzaHN.length;
  }
}