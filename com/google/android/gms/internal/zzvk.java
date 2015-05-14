package com.google.android.gms.internal;

import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;

public class zzvk
  implements Result
{
  private final zza zzaBZ;

  public zzvk(zza paramzza)
  {
    this.zzaBZ = paramzza;
  }

  public Status getStatus()
  {
    return this.zzaBZ.getStatus();
  }

  public zza zzuo()
  {
    return this.zzaBZ;
  }

  public static class zza
  {
    private final Status zzHb;
    private final zza zzaCa;
    private final byte[] zzaCb;
    private final long zzaCc;
    private final zzve zzaCd;
    private final zzvl.zzc zzaCe;

    public zza(Status paramStatus, zzve paramzzve, zza paramzza)
    {
      this(paramStatus, paramzzve, null, null, paramzza, 0L);
    }

    public zza(Status paramStatus, zzve paramzzve, byte[] paramArrayOfByte, zzvl.zzc paramzzc, zza paramzza, long paramLong)
    {
      this.zzHb = paramStatus;
      this.zzaCd = paramzzve;
      this.zzaCb = paramArrayOfByte;
      this.zzaCe = paramzzc;
      this.zzaCa = paramzza;
      this.zzaCc = paramLong;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }

    public zza zzup()
    {
      return this.zzaCa;
    }

    public byte[] zzuq()
    {
      return this.zzaCb;
    }

    public zzve zzur()
    {
      return this.zzaCd;
    }

    public zzvl.zzc zzus()
    {
      return this.zzaCe;
    }

    public long zzut()
    {
      return this.zzaCc;
    }

    public static enum zza
    {
      static
      {
        zza[] arrayOfzza = new zza[3];
        arrayOfzza[0] = zzaCf;
        arrayOfzza[1] = zzaCg;
        arrayOfzza[2] = zzaCh;
      }
    }
  }
}