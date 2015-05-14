package com.google.android.gms.internal;

import android.os.Bundle;

final class zzbx$2 extends zzbx<Integer>
{
  zzbx$2(String paramString, Integer paramInteger)
  {
    super(paramString, paramInteger, null);
  }

  public zzki<Integer> zzbZ()
  {
    return zzki.zza(getKey(), (Integer)zzbY());
  }

  public Integer zzc(Bundle paramBundle)
  {
    return Integer.valueOf(paramBundle.getInt(getKey(), ((Integer)zzbY()).intValue()));
  }
}