package com.google.android.gms.internal;

import android.text.TextUtils;

public class zzcd
{
  private boolean zzqO = false;

  private zzcc zzb(zzcb paramzzcb, int paramInt)
  {
    zzcc localzzcc = new zzcc(paramzzcb.getContext(), paramzzcb.zzaX(), paramzzcb.zzce(), paramzzcb.zzcf(), paramzzcb.zzcg(), paramzzcb.zzch(), paramzzcb.zzci(), paramzzcb.zzcj(), paramInt);
    this.zzqO = true;
    return localzzcc;
  }

  public zzcc zza(zzcb paramzzcb)
  {
    return zza(paramzzcb, 1);
  }

  public zzcc zza(zzcb paramzzcb, int paramInt)
  {
    if (paramzzcb == null)
      throw new IllegalArgumentException("CSI configuration can't be null. ");
    if (!paramzzcb.zzcd())
    {
      zzhx.zzaa("CsiReporterFactory: CSI is not enabled. No CSI reporter created.");
      return null;
    }
    if (paramzzcb.getContext() == null)
      throw new IllegalArgumentException("Context can't be null. Please set up context in CsiConfiguration.");
    if (TextUtils.isEmpty(paramzzcb.zzaX()))
      throw new IllegalArgumentException("AfmaVersion can't be null or empty. Please set up afmaVersion in CsiConfiguration.");
    return zzb(paramzzcb, paramInt);
  }

  public zzcc zzb(zzcb paramzzcb)
  {
    return zza(paramzzcb, 2);
  }

  public boolean zzcd()
  {
    return this.zzqO;
  }
}